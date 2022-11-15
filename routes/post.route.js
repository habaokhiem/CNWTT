const express = require("express");
const verifyToken = require("../validate/authentication");
const router = express.Router();
const {
  get_list_posts,
  get_post,
  add_post,
  edit_post,
  delete_post,
  check_new_item,
} = require("../controller/post.controller");
//VerifyToken = middleware
router.get("/get-list-posts", verifyToken, get_list_posts);

router.get("/get-post/:id", verifyToken, get_post);

router.post("/add-post", verifyToken, add_post);

router.post("/edit-post", verifyToken, edit_post);

router.post("/delete-post", verifyToken, delete_post);

/*-----------------------------------------------CHECK NEW ITEMS-------------------------------------- */
router.get("/check-new-item", verifyToken, check_new_item);

module.exports = router;
