const express = require("express");
const {
  set_comment,
  edit_comment,
  deleteComment,
} = require("../controller/comment.controller");
const connection = require("../database");
const verifyToken = require("../validate/authentication");
const router = express.Router();

router.post("/set-comment", verifyToken, set_comment);

router.post("/edit-comment", verifyToken, edit_comment);

router.post("/deleteComment", verifyToken, deleteComment);

module.exports = router;
