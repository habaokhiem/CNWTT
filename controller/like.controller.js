const moment = require("moment/moment");
const connection = require("../database");

module.exports.like = (req, res) => {
  const { id_post, type, status, id_user } = req.query;
  console.log("req.query: ", req.query);
  if (type == 1) {
    const curTime = new Date(moment().add(7, "hours"));
    connection.query(
      "INSERT INTO post_like VALUES (?, ?, ?, ?, ?, ?)",
      [null, id_post, 1, status, id_user, curTime],
      function (error, results, fields) {
        if (error) throw error;
        connection.query(
          "SELECT * from post_like WHERE id_post = ?",
          [id_post],
          function (error, results, fields) {
            if (error) throw error;
            res.send({
              status: 200,
              notification: "Bạn đã tương tác bài post",
              message: "Số like của bài viết",
              results: results.length,
            });
          }
        );
      }
    );
  } else if (type == 0) {
    connection.query(
      "UPDATE post_like SET status = ? WHERE id_user = ? AND id_post = ?",
      [0, id_user, id_post],
      function (error, results, fields) {
        if (error) throw error;
        connection.query(
          "SELECT * from post_like WHERE id_post = ?",
          [id_post],
          function (error, results, fields) {
            if (error) throw error;
            res.send({
              status: 200,
              notification: "Bạn đã bỏ like",
              message: "Số like của bài viết",
              results: results.length,
            });
          }
        );
      }
    );
  }
};
module.exports.get_list_posts_like = (req, res) => {
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

// module.exports.createLike = (req, res) => {
//   const { id_post, status, emotion, id_user } = req.body;
//   connection.query(
//     "INSERT INTO post_like VALUES (?, ?, ?, ?, ?)",
//     [null, id_post, status, emotion, id_user],
//     function (error, results, fields) {
//       if (error) throw error;
//       res.send({
//         status: 200,
//         message: "Bạn đã tương tác bài post",
//         results: [],
//       });
//     }
//   );
// };
// module.exports.unlikePost = (req, res) => {
//   const { id_post } = req.body;
//   connection.query(
//     "DELETE from post_like WHERE id = ?",
//     [id],
//     function (error, results, fields) {
//       if (error) throw error;
//       res.send({
//         status: 204,
//         message: "Bạn đã bỏ tương tác bài viết này",
//         results: [],
//       });
//     }
//   );
// };
// module.exports.countLikePost = (req, res) => {
//   const { id_post } = req.body;
//   connection.query(
//     "SELECT * from post_like WHERE id_post = ?",
//     [id_post],
//     function (error, results, fields) {
//       if (error) throw error;
//       res.send({
//         status: 200,
//         message: "Số like bài viết:",
//         results: results.length,
//       });
//     }
//   );
// };
