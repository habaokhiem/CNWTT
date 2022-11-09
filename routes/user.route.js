const express = require("express");
const { update_info } = require("../controller/user.controller");
const verifyToken = require("../validate/authentication");
const router = express.Router();

/*-----------------------------------------------USER-------------------------------------- */
router.post("/update_info", verifyToken, update_info);

module.exports = router;
