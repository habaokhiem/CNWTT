const express = require("express");
const {
  getLike,
  createLike,
  countLikePost,
} = require("../controller/like.controller");
const verifyToken = require("../validate/authentication");
const router = express.Router();

router.post("/", verifyToken, getLike);

router.post("/createLike", verifyToken, createLike);

router.post("/countLikePost", verifyToken, countLikePost);
module.exports = router;
