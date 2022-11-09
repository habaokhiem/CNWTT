const express = require("express");
const verifyToken = require("../validate/authentication");
const router = express.Router();
const {
  getListPost,
  getPost,
  createPost,
  editPost,
  deletePost,
  checkNewItem,
} = require("../controller/post.controller");
//VerifyToken = middleware
router.get("/listPost", verifyToken, getListPost);

router.get("/getPost/:id", verifyToken, getPost);

router.post("/createPost", verifyToken, createPost);

router.post("/editPost", verifyToken, editPost);

router.post("/deletePost", verifyToken, deletePost);

/*-----------------------------------------------CHECK NEW ITEMS-------------------------------------- */
router.get("/checkNewItem", verifyToken, checkNewItem);

module.exports = router;
