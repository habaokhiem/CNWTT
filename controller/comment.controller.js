const connection = require("../database");

module.exports.get_comment = (req, res) => {
  const { id_post } = req.query;
  console.log("req.query: ", req.query);
  connection.query(
    "SELECT * from comment WHERE id_post = ?",
    [id_post],
    function (error, results, fields) {
      let mapResult = [...results];
      for (let i = 0; i < results.length; i++) {
        connection.query(
          "SELECT * from user WHERE id_user = ? ",
          [results[i].id_user_comment],
          function (error, resultUser, fields) {
            let mapUser = resultUser.map((item) => {
              return {
                id: item.id_user,
                name: item.name,
                avatar: item.avatar,
              };
            });
            mapResult = mapResult.map((item) => {
              // console.log("item: ", item);
              return item.id === results[i].id
                ? { ...item, poster: mapUser }
                : item;
            });
            // console.log("mapResult: ", mapResult);
            if (i === results.length - 1) {
              res.send(mapResult);
            }

            if (error) throw error;
          }
        );
      }
      // console.log("mapResult: ", mapResult);

      if (error) throw error;
    }
  );
};

module.exports.set_comment = (req, res) => {
  const {
    id_post,
    id_user_comment,
    comment,
    image,
    state,
    date_create,
    date_update,
    is_blocked,
  } = req.query;
  console.log("req: ", req.query);
  connection.query(
    "INSERT INTO comment VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [
      null,
      id_post,
      id_user_comment,
      comment,
      image,
      state,
      date_create,
      date_update,
      is_blocked,
    ],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 1000,
        message: "Comment thành công!",
        results: [],
      });
    }
  );
};
module.exports.edit_comment = (req, res) => {
  const { id, comment, image, state, is_blocked } = req.query;
  console.log("req.query: ", req.query);
  connection.query(
    "UPDATE comment SET comment = ?, image = ?, state = ?, is_blocked = ? WHERE id = ?",
    [comment, image, state, is_blocked, id],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 1000,
        message: "Sửa comment thành công!",
        results: [],
      });
    }
  );
};
module.exports.delete_comment = (req, res) => {
  const { id } = req.query;
  connection.query(
    "DELETE from comment WHERE id = ?",
    [id],
    function (error, results, fields) {
      console.log("results: ", results);
      if (error) throw error;
      res.send({
        status: 1000,
        message: "Xoá thành công!",
        results: [],
      });
    }
  );
};
