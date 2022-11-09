const express = require("express");
const {
  setComment,
  editComment,
  deleteComment,
} = require("../controller/comment.controller");
const connection = require("../database");
const verifyToken = require("../validate/authentication");
const router = express.Router();

router.post("/setComment", verifyToken, setComment);

router.post("/editComment", verifyToken, editComment);

router.post("/deleteComment", verifyToken, deleteComment);

module.exports = router;
