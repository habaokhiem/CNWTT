const connection = require("../database");
const md5 = require("md5");
const jwt = require("jsonwebtoken");
module.exports.signUp = (req, res) => {
  const { username, name, password, email, SDT, avatar } = req.query;
  console.log("SDT: ", SDT);
  console.log("req: ", req.query);
  connection.query("SELECT * from user", function (error, results, fields) {
    if (error) throw error;
    for (let i = 0; i < results.length; i++) {
      if (
        username === results[i].username ||
        email === results[i].email ||
        SDT === results[i].SDT
      ) {
        res.send({
          status: 1000,
          message: "TK đã tồn tại",
          results: [],
        });
        return;
      }
    }
    const hashPassword = md5(password);
    connection.query(
      "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [null, username, name, hashPassword, email, SDT, avatar, 0],
      function (error, results, fields) {
        if (error) throw error;
        res.send({
          status: 1000,
          message: "Tạo thành công!",
          results: [],
        });
      }
    );
  });
};
module.exports.login = (req, res) => {
  const { username, password } = req.query;
  console.log("req: ", req.query);
  const hashPassword = md5(password);
  connection.query("SELECT * from user", function (error, results, fields) {
    if (error) throw error;
    for (let i = 0; i < results.length; i++) {
      if (
        (username === results[i].username ||
          username === results[i].email ||
          username === results[i].SDT) &&
        hashPassword === results[i].password
      ) {
        const payload = {
          username: results[i].username,
          name: results[i].name,
          email: results[i].email,
          SDT: results[i].SDT,
          avatar: results[i].avatar,
        };
        const payloadToken = {
          username: results[i].username,
          email: results[i].email,
          SDT: results[i].SDT,
        };
        const token = jwt.sign(payloadToken, process.env.ACCESS_TOKEN, {
          expiresIn: 60 * 60 * 24,
        });
        const userResponse = {
          userInfo: payload,
          token,
        };
        connection.query(
          "UPDATE user SET online = ? WHERE username = ? OR SDT = ?",
          [1, username, username],
          function (error, results, fields) {
            if (error) throw error;
          }
        );
        connection.query(
          "INSERT INTO token VALUES (?)",
          [token],
          function (error, results, fields) {
            if (error) throw error;
          }
        );
        res.send({
          status: 1000,
          message: "Đăng nhập thành công",
          results: userResponse,
        });
        return;
      }
    }
    res.send({
      status: 9996,
      message: "Sai TK hoặc MK",
      results: [],
    });
  });
};
module.exports.logout = (req, res) => {
  // const { token } = req.query;
  const token = req.header("token");
  const { username } = req.query;
  connection.query(
    "UPDATE user SET online = ? WHERE username = ? OR SDT = ?",
    [0, username, username],
    function (error, results, fields) {
      if (error) throw error;
    }
  );
  connection.query(
    "DELETE from token WHERE token = ?",
    [token],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 1000,
        message: "Đăng xuất thành công!",
        results: [],
      });
    }
  );
};
