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

 Date: 09/11/2022 21:01:56
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
  `status` int(11) NULL DEFAULT NULL,
  `date_create` datetime NULL DEFAULT NULL,
  `date_update` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, 'MaozzzzzWWW', 'bbbbbbbbb', 1, '2022-10-23 17:44:46', '2022-10-25 17:44:50');
INSERT INTO `comment` VALUES (3, 1, 1, 'qưeqwewqeqweqw', 'YOYOYOYO', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01');
INSERT INTO `comment` VALUES (4, 4, 2, 'qưeqwewqeqweqw', 'abcacbabcabca', 1, '2022-10-05 16:40:01', '2022-11-05 16:40:01');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` int(1) NULL DEFAULT NULL,
  `data_create` datetime NULL DEFAULT NULL,
  `date_update` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 2, 'LinhKeooooo', 'abcavcx', 1, '2022-10-05 16:40:01', '2022-10-31 09:27:33');
INSERT INTO `post` VALUES (2, 2, 'Khiemmmmm', 'abcavcx', 1, '2022-10-10 16:40:34', '2022-10-07 16:40:37');
INSERT INTO `post` VALUES (3, 1, 'Hallo niece and nephew', 'abcavcx', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01');
INSERT INTO `post` VALUES (5, 1, 'Maox', 'abcavcx', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01');
INSERT INTO `post` VALUES (8, 1, 'abc', 'abcavcx', 1, '2022-10-05 16:40:01', '2022-10-31 19:48:25');
INSERT INTO `post` VALUES (9, 1, 'Hello my friends', 'abcavcx', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01');
INSERT INTO `post` VALUES (10, 2, 'Hello my friends', 'abcavcx', 1, '2022-10-05 16:40:01', '2022-10-02 16:40:01');
INSERT INTO `post` VALUES (11, 4, 'Hello my friendsssssssssssssssssssssss', 'abcavcx', 1, '2022-10-31 09:15:37', '2022-10-31 09:15:37');
INSERT INTO `post` VALUES (12, 2, 'Hello my friendsssssssssssssssssssssss', 'abcavcx', 1, '2022-10-31 09:17:21', '2022-10-31 09:17:21');
INSERT INTO `post` VALUES (13, 3, 'YoYOYOYOYOOYOYOY', 'abcavcx', 1, '2022-10-31 09:59:35', '2022-10-31 09:59:35');
INSERT INTO `post` VALUES (14, 3, 'YoYOYOYOYOOYOYOY', 'abcavcx', 1, '2022-10-31 10:22:50', '2022-10-31 10:22:50');
INSERT INTO `post` VALUES (15, 3, 'YoYOYOYOYOOYOYOY', 'abcavcx', 1, '2022-10-31 19:48:58', '2022-10-31 19:48:58');

-- ----------------------------
-- Table structure for post_like
-- ----------------------------
DROP TABLE IF EXISTS `post_like`;
CREATE TABLE `post_like`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `emotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_like
-- ----------------------------
INSERT INTO `post_like` VALUES (1, 1, 1, 'haha', 1);
INSERT INTO `post_like` VALUES (2, 1, 1, 'haha', 1);
INSERT INTO `post_like` VALUES (3, 1, 1, 'haha', 1);
INSERT INTO `post_like` VALUES (4, 1, 1, 'sad', 1);
INSERT INTO `post_like` VALUES (5, 2, 1, 'sad', 1);
INSERT INTO `post_like` VALUES (6, 3, 1, 'angry', 1);
INSERT INTO `post_like` VALUES (7, 3, 1, 'angry', 5);
INSERT INTO `post_like` VALUES (8, 3, 1, 'angry', 5);
INSERT INTO `post_like` VALUES (9, 3, 1, 'wow', 5);

-- ----------------------------
-- Table structure for report_post
-- ----------------------------
DROP TABLE IF EXISTS `report_post`;
CREATE TABLE `report_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `report` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_user_report` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_post
-- ----------------------------
INSERT INTO `report_post` VALUES (1, 1, 'abc', 0, 0);
INSERT INTO `report_post` VALUES (2, 1, 'i hate you', 0, 0);
INSERT INTO `report_post` VALUES (3, 2, 'a', 0, 0);
INSERT INTO `report_post` VALUES (4, 2, 'a', 1, 0);
INSERT INTO `report_post` VALUES (5, 2, 'a', 3, 0);
INSERT INTO `report_post` VALUES (6, 2, 'a', 3, 2);
INSERT INTO `report_post` VALUES (7, 4, 'abc', 2, 2);

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
INSERT INTO `token` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkdpYW5nTXVwIiwiZW1haWwiOiJnaWFuZ211cEBnbWFpbC5jb20iLCJTRFQiOiIwMTAxMDEwMTAxIiwiaWF0IjoxNjY3MTk0MjQyLCJleHAiOjE2NjcyODA2NDJ9.lY1GlZxIwcURVYB6VJr7i81hBlF8Z0nqN4QGO9LOwkk');
INSERT INTO `token` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkdpYW5nTXVwIiwiZW1haWwiOiJnaWFuZ211cEBnbWFpbC5jb20iLCJTRFQiOiIwMTAxMDEwMTAxIiwiaWF0IjoxNjY3MTk0MzQ2LCJleHAiOjE2NjcyODA3NDZ9.Mnitkhab_vPJUK-iCmRrVV0QK2qf6hPlN2lRVbfzYWc');
INSERT INTO `token` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkdpYW5nTXVwTXVwIiwiZW1haWwiOiJnaWFuZ211cEBnbWFpbC5jb20iLCJTRFQiOiIwMjAyMDIwMjAyIiwiaWF0IjoxNjY3MTk0NTY3LCJleHAiOjE2NjcyODA5Njd9.B12LFu3nL7ayBRCiTjsoxXM74Hz6j851_r65ImCFGR0');
INSERT INTO `token` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlRlc3QiLCJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiU0RUIjoiMDMwMzAzMDMwMyIsImlhdCI6MTY2NzQzNjY4MSwiZXhwIjoxNjY3NTIzMDgxfQ.QcQRQs82UgkkRjFJB4cAoo3VtXym7lzUvp9IfFQI_PY');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SDT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
