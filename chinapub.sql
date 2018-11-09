/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.40
 Source Server Type    : MySQL
 Source Server Version : 50522
 Source Host           : 192.168.3.40:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50522
 File Encoding         : 65001

 Date: 09/11/2018 10:33:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chinapub
-- ----------------------------
DROP TABLE IF EXISTS `chinapub`;
CREATE TABLE `chinapub`  (
  `book_id` int(10) NOT NULL COMMENT '书籍id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '书籍名称',
  `orig_price` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原价',
  `vip_price` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优惠价',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `image_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下载图片文件名',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '网站原图片地址',
  `publishing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出版社',
  `ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ISBN号',
  `publish_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出版时间',
  `sell_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上架时间',
  `category` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '书籍目录',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
