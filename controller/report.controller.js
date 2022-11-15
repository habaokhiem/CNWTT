const connection = require("../database");
const moment = require("moment/moment");

module.exports.list_report_post = (req, res) => {
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
module.exports.report_post = (req, res) => {
  const { id_post, report_body, id_user_report } = req.query;
  console.log("req.query: ", req.query);
  const curTime = new Date(moment().add(7, "hours"));
  connection.query(
    "INSERT INTO report_post VALUES (?, ?, ?, ?, ?)",
    [null, id_post, report_body, id_user_report, curTime],
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
