const connection = require("../database");
const moment = require("moment");
const { sortBy } = require("lodash");

module.exports.get_list_posts = (req, res) => {
  connection.query(
    "SELECT * from post WHERE is_blocked = 0",
    function (error, results, fields) {
      let mapResult = [...results];
      for (let i = 0; i < results.length; i++) {
        connection.query(
          "SELECT * from image WHERE id_post = ? ",
          [results[i].id],
          function (error, resultImage, fields) {
            let mapImage = resultImage.map((item) => {
              return item.link_image;
            });
            mapResult = mapResult.map((item) => {
              // console.log("item: ", item);
              return item.id === results[i].id
                ? { ...item, image: mapImage }
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
            connection.query(
              "SELECT * from image WHERE id_post = ? ",
              [id],
              function (error, resultImage, fields) {
                let mapImage = resultImage.map((item) => {
                  return item.link_image;
                });
                if (error) throw error;
                connection.query(
                  "SELECT * from user WHERE id_user = ? ",
                  [results[0].id_user],
                  function (error, resultUser, fields) {
                    if (error) throw error;
                    let mapUser = resultUser.map((item) => {
                      return {
                        id: item.id_user,
                        name: item.name,
                        avatar: item.avatar,
                        online: item.online,
                      };
                    });
                    res.send({
                      status: 200,
                      message: "Th??ng tin b??i vi???t:",
                      results: [
                        {
                          ...results[0],
                          listLikes: resultsLike,
                          image: mapImage,
                          author: mapUser,
                        },
                      ],
                    });
                  }
                );
              }
            );
            // res.send({
            //   status: 200,
            //   message: "Th??ng tin b??i vi???t:",
            //   results: [{ ...results[0], listLikes: resultsLike }],
            // });
          }
        );
      } else {
        res.send({
          status: 9992,
          message: "Post kh??ng t???n t???i",
          results: [],
        });
      }
    }
  );
};
module.exports.add_post = (req, res) => {
  const {
    id,
    id_user,
    described,
    image,
    video,
    thumbnail,
    is_blocked,
    can_edit,
    can_comment,
  } = req.query;
  const curTime = new Date(moment().add(7, "hours"));
  connection.query("SELECT * from post", function (error, results, fields) {
    if (error) throw error;
    connection.query(
      "INSERT INTO post VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [
        null,
        id_user,
        described,
        1,
        curTime,
        curTime,
        video,
        thumbnail,
        is_blocked,
        can_edit,
        can_comment,
      ],
      function (error, results, fields) {
        for (let i = 0; i < image.split(",").length; i++) {
          connection.query(
            "INSERT INTO image VALUES (?, ?, ?)",
            [null, results.insertId, image.split(",")[i]],
            function (error, results, fields) {
              if (error) throw error;
            }
          );
        }
        if (error) throw error;
        res.send({
          status: 1000,
          message: "T???o b??i vi???t th??nh c??ng!",
          results: [],
        });
      }
    );
  });
};
module.exports.edit_post = (req, res) => {
  const {
    id,
    described,
    video,
    thumbnail,
    state,
    is_blocked,
    can_comment,
    image,
  } = req.query;
  console.log("req.query: ", req.query);
  const curTime = new Date(moment().add(7, "hours"));
  connection.query(
    "SELECT * from post WHERE id = ?",
    [id],
    function (error, results, fields) {
      if (results[0].can_edit === 1) {
        connection.query(
          "UPDATE post SET described = ?, video = ?, thumbnail = ?, state = ?, is_blocked = ?, can_comment = ?, date_update = ? WHERE id = ? AND can_edit = 1",
          [
            described,
            video,
            thumbnail,
            state,
            is_blocked,
            can_comment,
            curTime,
            id,
          ],
          function (error, results, fields) {
            connection.query(
              "DELETE from image WHERE id_post = ?",
              [id],
              function (error, results, fields) {
                for (let i = 0; i < image.split(",").length; i++) {
                  connection.query(
                    "INSERT INTO image VALUES (?, ?, ?)",
                    [null, id, image.split(",")[i]],
                    function (error, results, fields) {
                      if (error) throw error;
                    }
                  );
                }
                if (error) throw error;
              }
            );

            if (error) throw error;
            res.send({
              status: 1000,
              message: "S???a b??i vi???t th??nh c??ng!",
              results: [],
            });
          }
        );
      } else {
        res.send({
          status: 9996,
          message: "Kh??ng th??? s???a b??i post n??y!",
          results: [],
        });
      }
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
        status: 1000,
        message: "Xo?? b??i vi???t th??nh c??ng!",
        results: [],
      });
    }
  );
  connection.query(
    "DELETE from comment WHERE id_post = ?",
    [id],
    function (error, results, fields) {
      if (error) throw error;
    }
  );
  connection.query(
    "DELETE from image WHERE id_post = ?",
    [id],
    function (error, results, fields) {
      if (error) throw error;
    }
  );
  connection.query(
    "DELETE from report_post WHERE id_post = ?",
    [id],
    function (error, results, fields) {
      if (error) throw error;
    }
  );
};
module.exports.check_new_item = (req, res) => {
  connection.query("SELECT * from post", function (error, results, fields) {
    sortListPost = sortBy(results, "date_update").reverse();
    if (error) throw error;
    res.send({
      status: 1000,
      message: "Danh s??ch b??i vi???t g???n nh???t",
      results: sortListPost,
    });
  });
};
