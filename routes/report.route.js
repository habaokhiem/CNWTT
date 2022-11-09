const express = require("express");
const { reportPost, createReport } = require("../controller/report.controller");
const verifyToken = require("../validate/authentication");
const router = express.Router();

router.get("/reportPost", verifyToken, reportPost);

router.post("/createReport", verifyToken, createReport);

module.exports = router;
