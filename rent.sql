/*
 Navicat Premium Data Transfer

 Source Server         : default
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 127.0.0.1:3306
 Source Schema         : rent

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 23/06/2023 19:23:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `area` double DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of house
-- ----------------------------
BEGIN;
INSERT INTO `house` (`id`, `title`, `position`, `details`, `cover`, `price`, `area`, `update_time`, `create_time`) VALUES (5, 'asdqwe', 'zxzxc', 'asqe', 'upload/Screenshot from 2023-05-19 17-26-22.png', 132, 123, '2023-06-22 10:11:47', '2023-06-22 10:11:47');
INSERT INTO `house` (`id`, `title`, `position`, `details`, `cover`, `price`, `area`, `update_time`, `create_time`) VALUES (6, '12312', 'adsas', 'zczx', 'upload/Screenshot from 2023-05-19 17-26-22.png', 112, 333, '2023-06-22 10:12:52', '2023-06-22 10:12:52');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int DEFAULT '0',
  `deleted` int DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `phone`, `role`, `deleted`, `create_time`) VALUES (1, 'admin', '21232F297A57A5A743894A0E4A801FC3', '', 99, 0, '2023-06-20 07:22:08');
INSERT INTO `user` (`id`, `username`, `password`, `phone`, `role`, `deleted`, `create_time`) VALUES (2, 'admin1', '21232F297A57A5A743894A0E4A801FC3', '', 99, 0, '2023-06-20 07:22:17');
INSERT INTO `user` (`id`, `username`, `password`, `phone`, `role`, `deleted`, `create_time`) VALUES (3, 'admind', '21232F297A57A5A743894A0E4A801FC3', NULL, 0, 1, '2023-06-21 01:15:28');
INSERT INTO `user` (`id`, `username`, `password`, `phone`, `role`, `deleted`, `create_time`) VALUES (5, 'admindd', '21232F297A57A5A743894A0E4A801FC3', '18436086520', 0, 0, '2023-06-22 01:32:46');
INSERT INTO `user` (`id`, `username`, `password`, `phone`, `role`, `deleted`, `create_time`) VALUES (6, 'adminddd', '21232F297A57A5A743894A0E4A801FC3', '18436086520', 0, 0, '2023-06-22 01:34:28');
INSERT INTO `user` (`id`, `username`, `password`, `phone`, `role`, `deleted`, `create_time`) VALUES (7, 'admind', 'BFF149A0B87F5B0E00D9DD364E9DDAA0', '17638198421', 99, 0, '2023-06-23 08:44:21');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
