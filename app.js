const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const userRoute = require("./routes/user.route");
const postRoute = require("./routes/post.route");
const commentRoute = require("./routes/comment.route");
const likeRoute = require("./routes/like.route");
const reportRoute = require("./routes/report.route");
const authenticationRoute = require("./routes/authentication.route");
const connection = require("./database");

const port = 3000;

// app.use(bodyParser.json({ type: "application/json" }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

/*-----------------------------------------------AUTHENTICATION-------------------------------------- */
app.use("/authentication", authenticationRoute);
/*-----------------------------------------------USER-------------------------------------- */
app.use("/user", userRoute);
/*-----------------------------------------------POST-------------------------------------- */
app.use("/post", postRoute);
/*-----------------------------------------------COMMENT-------------------------------------- */
app.use("/comment", commentRoute);
/*-----------------------------------------------LIKE-------------------------------------- */
app.use("/like", likeRoute);
/*-----------------------------------------------REPORT-------------------------------------- */
app.use("/report", reportRoute);

connection.connect();

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
