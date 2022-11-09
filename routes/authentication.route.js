const express = require("express");
const verifyToken = require("../validate/authentication");
const router = express.Router();
const {
  register,
  login,
  logout,
} = require("../controller/authentication.controller");
require("dotenv").config();

router.post("/register", register);

router.post("/login", login);

router.post("/logout", verifyToken, logout);

module.exports = router;
