const connection = require("../database");

module.exports.getLike = (req, res) => {
  const { id_post } = req.body;
  connection.query(
    "SELECT * from post_like WHERE id_post = ?",
    [id_post],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Danh sách like bài viết:",
        results: results,
      });
    }
  );
};
module.exports.createLike = (req, res) => {
  const { id_post, status, emotion, id_user } = req.body;
  connection.query(
    "INSERT INTO post_like VALUES (?, ?, ?, ?, ?)",
    [null, id_post, status, emotion, id_user],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Bạn đã tương tác bài post",
        results: [],
      });
    }
  );
};
module.exports.countLikePost = (req, res) => {
  const { id_post } = req.body;
  connection.query(
    "SELECT * from post_like WHERE id_post = ?",
    [id_post],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Số like bài viết:",
        results: results.length,
      });
    }
  );
};
