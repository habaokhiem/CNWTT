/*
 Navicat Premium Data Transfer

 Source Server         : Khiem
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : facebook

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 27/11/2022 01:58:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `id_user_comment` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `state` int(1) NULL DEFAULT NULL,
  `date_create` datetime NULL DEFAULT NULL,
  `date_update` datetime NULL DEFAULT NULL,
  `is_blocked` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (12, 3, 30, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);
INSERT INTO `comment` VALUES (13, 3, 30, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);
INSERT INTO `comment` VALUES (14, 34, 28, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);
INSERT INTO `comment` VALUES (15, 34, 28, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);
INSERT INTO `comment` VALUES (17, 2, 29, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);
INSERT INTO `comment` VALUES (18, 2, 29, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);
INSERT INTO `comment` VALUES (19, 34, 29, 'comment test 1', 'abcbcbcb', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01', 0);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NULL DEFAULT NULL,
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_image`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (254, 26, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (255, 26, ' https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (256, 26, ' https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (257, 27, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (258, 27, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (259, 27, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (260, 28, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (261, 28, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (262, 28, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (269, 31, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (270, 31, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (271, 31, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (272, 32, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (273, 32, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (274, 32, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (275, 33, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (276, 33, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (277, 33, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (284, 36, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (285, 36, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (286, 36, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (288, 29, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (289, 29, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (290, 29, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
INSERT INTO `image` VALUES (294, 35, 'a');
INSERT INTO `image` VALUES (295, 35, ' b');
INSERT INTO `image` VALUES (296, 35, ' c');
INSERT INTO `image` VALUES (299, 34, 'a');
INSERT INTO `image` VALUES (300, 34, ' b');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `described` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT NULL,
  `data_create` datetime NULL DEFAULT NULL,
  `date_update` datetime NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_blocked` int(1) NULL DEFAULT NULL,
  `can_edit` int(1) NULL DEFAULT NULL,
  `can_comment` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 2, 'LinhKeooooo', 1, '2022-10-05 16:40:01', '2022-10-31 09:27:33', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (3, 1, 'Hallo niece and nephew', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (5, 1, 'Maox', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (8, 1, 'abc', 1, '2022-10-05 16:40:01', '2022-10-31 19:48:25', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (9, 1, 'Hello my friends', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (11, 4, 'Hello my friendsssssssssssssssssssssss', 1, '2022-10-31 09:15:37', '2022-10-31 09:15:37', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (12, 2, 'Hello my friendsssssssssssssssssssssss', 1, '2022-10-31 09:17:21', '2022-10-31 09:17:21', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (13, 3, 'YoYOYOYOYOOYOYOY', 1, '2022-10-31 09:59:35', '2022-10-31 09:59:35', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (14, 3, 'YoYOYOYOYOOYOYOY', 1, '2022-10-31 10:22:50', '2022-10-31 10:22:50', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (15, 3, 'YoYOYOYOYOOYOYOY', 1, '2022-10-31 19:48:58', '2022-10-31 19:48:58', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (16, 3, 'YoYOYOYOYOOYOYOY', 1, '2022-11-10 14:16:52', '2022-11-10 14:16:52', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (17, 1, 'I want to changed', 1, '2022-11-10 14:17:27', '2022-11-27 06:48:11', 'abcbcbc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (25, 29, 'Test', 1, '2022-11-27 04:58:49', '2022-11-27 04:58:49', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (26, 29, 'Test', 1, '2022-11-27 04:59:29', '2022-11-27 04:59:29', 'abcacascascasc', 'thumbnail 123', 0, 1, 1);
INSERT INTO `post` VALUES (27, 29, 'Test', 1, '2022-11-27 05:08:08', '2022-11-27 05:08:08', 'abcacascascasc', 'thumbnail 123', 0, 1, 0);
INSERT INTO `post` VALUES (29, 29, 'I want to changed', 1, '2022-11-27 05:34:47', '2022-11-27 08:39:11', 'abcbcbc', 'thumbnail 123', 1, 1, 1);
INSERT INTO `post` VALUES (31, 29, 'I want to changed', 1, '2022-11-27 05:35:57', '2022-11-27 07:11:44', 'abcbcbc', 'thumbnail 123', 1, 0, 1);
INSERT INTO `post` VALUES (32, 29, 'Test', 1, '2022-11-27 07:10:40', '2022-11-27 07:10:40', 'abcacascascasc', 'thumbnail 123', 1, 0, 1);
INSERT INTO `post` VALUES (33, 29, 'I want to changed', 1, '2022-11-27 07:19:37', '2022-11-27 07:27:50', 'abcbcbc', 'thumbnail 123', 1, 0, 1);
INSERT INTO `post` VALUES (34, 29, 'I want to changed', 1, '2022-11-27 07:31:10', '2022-11-27 08:44:16', 'abcbcbc', 'thumbnail 123', 1, 1, 1);
INSERT INTO `post` VALUES (35, 29, 'I want to changed', 1, '2022-11-27 07:43:58', '2022-11-27 08:40:59', 'abcbcbc', 'thumbnail 123', 1, 1, 1);

-- ----------------------------
-- Table structure for post_like
-- ----------------------------
DROP TABLE IF EXISTS `post_like`;
CREATE TABLE `post_like`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `isStatus` int(11) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_like` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_like
-- ----------------------------
INSERT INTO `post_like` VALUES (1, 1, 1, '4', 1, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (2, 1, 1, '4', 1, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (3, 1, 1, '4', 1, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (4, 1, 1, '6', 1, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (5, 2, 1, '6', 1, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (6, 3, 1, '7', 1, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (7, 3, 1, '7', 5, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (8, 3, 1, '7', 5, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (9, 3, 1, '5', 5, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (10, 17, 1, '3', 2, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (11, 17, 1, '3', 4, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (12, 17, 1, '2', 29, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (13, 17, 1, '2', 29, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (14, 17, 1, '1', 29, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (15, 17, 1, '1', 29, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (16, 17, 1, '1', 29, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (17, 17, 1, '7', 29, '2022-11-15 23:28:48');
INSERT INTO `post_like` VALUES (18, 17, 1, '4', 29, '2022-11-15 23:44:48');
INSERT INTO `post_like` VALUES (19, 17, 1, '4', 29, '2022-11-15 23:46:36');
INSERT INTO `post_like` VALUES (20, 17, 1, '4', 29, '2022-11-27 08:07:26');
INSERT INTO `post_like` VALUES (21, 17, 1, '4', 29, '2022-11-27 08:30:06');
INSERT INTO `post_like` VALUES (22, 17, 1, '4', 29, '2022-11-27 08:30:10');

-- ----------------------------
-- Table structure for report_post
-- ----------------------------
DROP TABLE IF EXISTS `report_post`;
CREATE TABLE `report_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_user_report` int(11) NOT NULL,
  `date_report` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_post
-- ----------------------------
INSERT INTO `report_post` VALUES (1, 1, 'subject report 1', 'abc', 1, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (2, 1, 'subject report 2', 'i hate you', 2, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (3, 2, 'subject report 3', 'a', 4, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (4, 2, 'subject report 4', 'a', 1, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (5, 2, 'subject report 5', 'a', 6, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (6, 2, 'subject report 6', 'a', 11, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (7, 4, 'subject report 7', 'abc', 10, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (8, 17, 'subject report 8', 'I hate this post', 29, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (9, 17, 'subject report 9', 'I hate this post', 29, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (12, 17, 'subject report 10', 'I hate this post', 29, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (13, 2, 'subject report 11', 'test report', 29, '2022-11-16 00:04:42');
INSERT INTO `report_post` VALUES (14, 2, 'subject report 12', 'test report', 29, '2022-11-27 07:47:59');
INSERT INTO `report_post` VALUES (15, 2, 'subject report 13', 'test report', 29, '2022-11-27 07:48:35');
INSERT INTO `report_post` VALUES (18, 31, 'subject report 13', 'test report', 29, '2022-11-27 08:53:18');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SDT` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `online` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (28, 'Test', 'Test', 'e10adc3949ba59abbe56e057f20f883e', 'admin1@gmail.com', '0202020202', 'avatar1', 0);
INSERT INTO `user` VALUES (29, 'Test1', 'Test1', 'e10adc3949ba59abbe56e057f20f883e', 'test1@gmail.com', '0303030303', 'avatar2', 0);
INSERT INTO `user` VALUES (30, 'Tester', 'Tester', 'e10adc3949ba59abbe56e057f20f883e', 'tester@gmail.com', '0912345678', 'avatar3', 0);
INSERT INTO `user` VALUES (31, 'Tester1', 'Tester1', 'e10adc3949ba59abbe56e057f20f883e', 'tester1@gmail.com', '0912345677', 'avatar4', 0);
INSERT INTO `user` VALUES (32, 'Testerr', 'Tessss', 'e10adc3949ba59abbe56e057f20f883e', 'teste@gmail.com', '0112345674', 'avatar5', 0);
INSERT INTO `user` VALUES (33, 'ABCDD', 'ABC', 'e10adc3949ba59abbe56e057f20f883e', 'tester3@gmail.com', '0112345675', 'avatar1', 0);

SET FOREIGN_KEY_CHECKS = 1;
