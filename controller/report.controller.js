const connection = require("../database");

module.exports.reportPost = (req, res) => {
  connection.query(
    "SELECT * from report_post",
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Danh sách báo cáo",
        results: results,
      });
    }
  );
};
module.exports.createReport = (req, res) => {
  const { id_post, report, id_user, id_user_report } = req.body;
  connection.query(
    "INSERT INTO report_post VALUES (?, ?, ?, ?, ?)",
    [null, id_post, report, id_user, id_user_report],
    function (error, results, fields) {
      if (error) throw error;
      res.send({
        status: 200,
        message: "Bạn đã tố cáo thành công!",
        results: [],
      });
    }
  );
};
