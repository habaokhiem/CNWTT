const connection = require("../database");
module.exports.set_comment = (req, res) => {
  const {
    id_post,
    id_user_comment,
    comment,
    image,
    status,
    date_create,
    date_update,
  } = req.query;
  console.log("req: ", req.query);
  connection.query(
    "INSERT INTO comment VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
    [
      null,
      id_post,
      id_user_comment,
      comment,
      image,
      status,
      date_create,
      date_update,
    ],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Comment thành công!",
        results: [],
      });
    }
  );
};
module.exports.edit_comment = (req, res) => {
  const { id, comment, image, status } = req.query;
  console.log("req.query: ", req.query);
  connection.query(
    "UPDATE comment SET comment = ?, image = ?, status = ? WHERE id = ?",
    [comment, image, status, id],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Sửa comment thành công!",
        results: [],
      });
    }
  );
};
module.exports.deleteComment = (req, res) => {
  const { id } = req.body;
  connection.query(
    "DELETE from comment WHERE id = ?",
    [id],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 204,
        message: "Xoá thành công!",
        results: [],
      });
    }
  );
};
