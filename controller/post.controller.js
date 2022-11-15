const connection = require("../database");
const moment = require("moment");
const { sortBy } = require("lodash");

module.exports.get_list_posts = (req, res) => {
  connection.query("SELECT * from post", function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
};
module.exports.get_post = (req, res) => {
  const { id } = req.params;
  connection.query(
    "SELECT * from post WHERE id = ? ",
    [id],
    function (error, results, fields) {
      if (error) throw error;
      if (results.length > 0) {
        connection.query(
          "SELECT * from post_like WHERE id_post = ? ",
          [id],
          function (error, resultsLike, fields) {
            if (error) throw error;
            res.send({
              status: 200,
              message: "Thông tin bài viểt:",
              results: [{ ...results[0], listLikes: resultsLike }],
            });
          }
        );
      } else {
        res.send({
          status: 400,
          message: "Post không tồn tại",
          results: [],
        });
      }
    }
  );
};
module.exports.add_post = (req, res) => {
  const { id, id_user, body, status, image } = req.query;
  console.log("req.query: ", req.query);
  const curTime = new Date(moment().add(7, "hours"));
  connection.query("SELECT * from post", function (error, results, fields) {
    if (error) throw error;
    connection.query(
      "INSERT INTO post VALUES (?, ?, ?, ?, ?, ?, ?)",
      [null, id_user, body, image, status, curTime, curTime],
      function (error, results, fields) {
        if (error) throw error;
        res.send({
          status: 201,
          message: "Tạo bài viết thành công!",
          results: [],
        });
      }
    );
  });
};
module.exports.edit_post = (req, res) => {
  const { id, body, status, image } = req.query;
  console.log("req.query: ", req.query);
  const curTime = new Date(moment().add(7, "hours"));
  connection.query(
    "UPDATE post SET body = ?, image = ?, status = ?, date_update = ? WHERE id = ?",
    [body, image, status, curTime, id],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Sửa bài viết thành công!",
        results: [],
      });
    }
  );
};
module.exports.delete_post = (req, res) => {
  const { id } = req.query;
  console.log("req.query: ", req.query);
  connection.query(
    "DELETE from post WHERE id = ?",
    [id],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 204,
        message: "Xoá bài viết thành công!",
        results: [],
      });
    }
  );
};
module.exports.check_new_item = (req, res) => {
  connection.query("SELECT * from post", function (error, results, fields) {
    sortListPost = sortBy(results, "date_update").reverse();
    if (error) throw error;
    res.send({
      status: 200,
      message: "Danh sách bài viết gần nhất",
      results: sortListPost,
    });
  });
};
