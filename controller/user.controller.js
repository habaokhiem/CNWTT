const md5 = require("md5");
const connection = require("../database");
module.exports.update_info = (req, res) => {
  const { username, name, password, email, SDT, avatar, online } = req.query;
  console.log("req.query: ", req.query);

  if (SDT.length === 10) {
    connection.query(
      "SELECT * from user  WHERE username != ?",
      [username],
      function (error, results, fields) {
        if (error) throw error;
        for (let i = 0; i < results.length; i++) {
          if (email === results[i].email || SDT === results[i].SDT) {
            res.send({
              status: 9996,
              message: "TK đã tồn tại",
              results: [],
            });
            return;
          }
        }
        const hashPassword = md5(password);
        connection.query(
          "UPDATE user SET name = ?, password = ?, email = ?, SDT = ?, avatar = ?, online = ? WHERE username = ?",
          [name, hashPassword, email, SDT, avatar, online, username],
          function (error, results, fields) {
            if (error) throw error;
            res.send({
              status: 1000,
              message: "Sửa thành công!",
              results: [],
            });
          }
        );
      }
    );
  } else {
    res.send({
      status: 9996,
      message: "Yêu cầu nhập lại SDT",
      results: [],
    });
  }
};
