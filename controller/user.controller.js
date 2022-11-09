const connection = require("../database");
module.exports.update_info = (req, res) => {
  const { username, password, email, SDT } = req.body;

  if (SDT.length === 10) {
    connection.query(
      "SELECT * from user  WHERE username != ?",
      [username],
      function (error, results, fields) {
        if (error) throw error;
        for (let i = 0; i < results.length; i++) {
          if (email === results[i].email || SDT === results[i].SDT) {
            res.send({
              status: 409,
              message: "TK đã tồn tại",
              results: [],
            });
            return;
          }
        }
        connection.query(
          "UPDATE user SET password = ?, email = ?, SDT = ? WHERE username = ?",
          [password, email, SDT, username],
          function (error, results, fields) {
            if (error) throw error;
            res.send({
              status: 200,
              message: "Sửa thành công!",
              results: [],
            });
          }
        );
      }
    );
  } else {
    res.send({
      status: 400,
      message: "Yêu cầu nhập lại SDT",
      results: [],
    });
  }
};
