/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.40
 Source Server Type    : MySQL
 Source Server Version : 50522
 Source Host           : 192.168.3.40:3306
 Source Schema         : chinapub

 Target Server Type    : MySQL
 Target Server Version : 50522
 File Encoding         : 65001

 Date: 02/01/2019 16:24:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `chinapub`.`auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `chinapub`.`auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `chinapub`.`django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add books', 7, 'add_books');
INSERT INTO `auth_permission` VALUES (20, 'Can change books', 7, 'change_books');
INSERT INTO `auth_permission` VALUES (21, 'Can delete books', 7, 'delete_books');
INSERT INTO `auth_permission` VALUES (22, 'Can add auth group', 10, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (23, 'Can change auth group', 10, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (24, 'Can delete auth group', 10, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (25, 'Can add auth group permissions', 11, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (26, 'Can change auth group permissions', 11, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (27, 'Can delete auth group permissions', 11, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (28, 'Can add auth permission', 12, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (29, 'Can change auth permission', 12, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (30, 'Can delete auth permission', 12, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (31, 'Can add auth user', 13, 'add_authuser');
INSERT INTO `auth_permission` VALUES (32, 'Can change auth user', 13, 'change_authuser');
INSERT INTO `auth_permission` VALUES (33, 'Can delete auth user', 13, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (34, 'Can add auth user groups', 14, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (35, 'Can change auth user groups', 14, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (36, 'Can delete auth user groups', 14, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (37, 'Can add auth user user permissions', 15, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (38, 'Can change auth user user permissions', 15, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (39, 'Can delete auth user user permissions', 15, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (40, 'Can add django admin log', 16, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (41, 'Can change django admin log', 16, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (42, 'Can delete django admin log', 16, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (43, 'Can add django content type', 17, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (44, 'Can change django content type', 17, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (45, 'Can delete django content type', 17, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (46, 'Can add django migrations', 18, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (47, 'Can change django migrations', 18, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (48, 'Can delete django migrations', 18, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (49, 'Can add django session', 19, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (50, 'Can change django session', 19, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (51, 'Can delete django session', 19, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (52, 'Can add auth group', 20, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (53, 'Can change auth group', 20, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (54, 'Can delete auth group', 20, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (55, 'Can add auth group permissions', 21, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (56, 'Can change auth group permissions', 21, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (57, 'Can delete auth group permissions', 21, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (58, 'Can add auth permission', 22, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (59, 'Can change auth permission', 22, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (60, 'Can delete auth permission', 22, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (61, 'Can add auth user', 23, 'add_authuser');
INSERT INTO `auth_permission` VALUES (62, 'Can change auth user', 23, 'change_authuser');
INSERT INTO `auth_permission` VALUES (63, 'Can delete auth user', 23, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (64, 'Can add auth user groups', 24, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (65, 'Can change auth user groups', 24, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (66, 'Can delete auth user groups', 24, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (67, 'Can add auth user user permissions', 25, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (68, 'Can change auth user user permissions', 25, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (69, 'Can delete auth user user permissions', 25, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (70, 'Can add books', 26, 'add_books');
INSERT INTO `auth_permission` VALUES (71, 'Can change books', 26, 'change_books');
INSERT INTO `auth_permission` VALUES (72, 'Can delete books', 26, 'delete_books');
INSERT INTO `auth_permission` VALUES (73, 'Can add django admin log', 27, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (74, 'Can change django admin log', 27, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (75, 'Can delete django admin log', 27, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (76, 'Can add django content type', 28, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (77, 'Can change django content type', 28, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (78, 'Can delete django content type', 28, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (79, 'Can add django migrations', 29, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (80, 'Can change django migrations', 29, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (81, 'Can delete django migrations', 29, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (82, 'Can add django session', 30, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (83, 'Can change django session', 30, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (84, 'Can delete django session', 30, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (85, 'Can add proxies ip', 8, 'add_proxiesip');
INSERT INTO `auth_permission` VALUES (86, 'Can change proxies ip', 8, 'change_proxiesip');
INSERT INTO `auth_permission` VALUES (87, 'Can delete proxies ip', 8, 'delete_proxiesip');
INSERT INTO `auth_permission` VALUES (88, 'Can add spider', 9, 'add_spider');
INSERT INTO `auth_permission` VALUES (89, 'Can change spider', 9, 'change_spider');
INSERT INTO `auth_permission` VALUES (90, 'Can delete spider', 9, 'delete_spider');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$36000$JQhDX3SEkvS6$iWjjBrAyE9ogx76f0Y8QDrSrpjOcQIJixgOaoIA8BpA=', '2018-12-10 10:31:59', 1, 'admin', '', '', 'admin@qq.com', 1, 1, '2018-12-08 05:45:56');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `chinapub`.`auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `chinapub`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `chinapub`.`auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `chinapub`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (214, 5038005, 'PHP7从入门到精通：视频教学版', '￥79.00', '￥63.20 (80折)', '刘增杰', '5038005.jpg', 'http://images.china-pub.com/ebook5035001-5040000/5038005/shupi.jpg', '清华大学出版社', '9787302456254', '2017 年1月', '2016-12-7', '第1章 初识PHP 1\n1.1 PHP的来龙去脉 1\n1.1.1 PHP的概念 1\n1.1.2 PHP的发展历程 2\n1.1.3 PHP的优势 2\n1.2 PHP能干什么 3\n1.3 PHP 7的新特点 4\n1.4 PHP常用开发工具 6\n1.4.1 PHP代码开发工具 6\n1.4.2 网页设计工具 7\n1.4.3 文本编辑工具 7\n1.5 高手甜点 8\n第2章 PHP 7服务器环境配置 9\n2.1 PHP服务器概述 9\n2.2 安装PHP 7前的准备工作 10\n2.2.1 软硬件环境 10\n2.2.2 获取PHP 7安装资源包 10\n2.3 PHP 7+IIS服务器安装配置 12\n2.3.1 IIS简介及其安装 12');
INSERT INTO `books` VALUES (215, 63394, 'PHP网络编程技术详解', '￥69.80', '￥61.42 (88折)', '葛丽萍', '63394.jpg', 'http://images.china-pub.com/ebook60001-65000/63394/shupi.jpg', '清华大学出版社', '9787302343189', '2014 年1月', '2014-3-3', '从1995年发布PHP 1.0以来，已经有18年了。在这期间，PHP以其简单易学而且高性能的特点在网页后台开发中经久不衰，成为目前最流行的网站后台技术之一，可以完成任何规模的站点开发。因此，现在许多知名网站，如百度、腾讯、新浪以及雅虎，都在使用PHP技术。现在流行的论坛系统，如Discuz！，就是完全用PHP编写的。\n笔者结合自己多年的PHP开发经验和心得体会，花费了一年多的时间编写本书，希望读者能在本书的引领下跨入PHP开发大门，并成为一名开发高手。本书结合多媒体教学视频，全面、系统、深入地介绍了PHP开发技术，并在全书的讲解中贯穿了大量实例，最后还详细介绍了多个实例的开发。学习完本书，读者可以具备独立进行项目开发的能力。\n本书特色\n1．配套大量多媒体语音教学视频，学习效果好\n笔者专门录制了大量的配套多媒体语音教学视频，以便读者更加轻松、直观地学习本书内容，提高学习效率。这些视频和书中实例源代码一起收录于配书光盘中。\n2．内容全面、系统、深入\n本书介绍了PHP开发的基础知识、界面开发、数据库开发、网络编程、系统功能编程、多媒体开发等内容，最后还详细介绍了两个项目案例的开发。\n3．讲解由浅入深、循序渐进，适合各个层次的读者阅读\n本书从PHP的基础知识开始讲解，逐步深入到PHP的高级开发技术及应用，内容梯度从易到难，讲解由浅入深、循序渐进，适合各个层次的读者阅读。\n4．贯穿大量的开发实例和技巧，可迅速提升开发水平\n本书在讲解知识点时贯穿了大量短小精悍的典型实例，并给出了大量的开发技巧，以便读者更好地理解各种概念和开发技术，体验实际编程，迅速提高开发水平。\n5．详解典型项目案例开发，提高实战水平\n本书详细介绍了6个不同复杂程度的案例。通过这些案例，可以提高读者的软件项目开发水平，从而具备独立进行项目开发的能力。\n本书内容及体系结构\n第1篇 PHP准备篇（第1～2章）\n本篇主要内容包括：初识PHP和PHP的开发环境及安装。通过本篇的学习，读者可以了解什么是PHP以及PHP的优势，而且为以后的学习打好基础。\n第2篇 PHP基础篇（第3～6章）\n本篇主要内容包括：PHP中的常量与变量、PHP中的运算符与表达式、PHP中的流程控制以及PHP中的函数。通过本篇的学习，读者可以掌握PHP的基础技术，为以后的提升打下基础。\n第3篇 PHP进阶篇（第7～14章）\n本篇主要内容包括：PHP的数据处理、PHP文件应用、用PHP获取主机信息、PHP中的图像处理、PHP中的Session与Cookie、PHP中正则表达式的使用、PHP面向对象编程以及使用MySQL数据库。通过本篇的学习，读者可以掌握PHP中的高级技术，为开发高级应用打下基础。');
INSERT INTO `books` VALUES (216, 4052311, 'PHP项目开发全程实录（第3版）', '￥69.80', '￥55.84 (80折)', '辛洪郁', '4052311.jpg', 'http://images.china-pub.com/ebook4050001-4055000/4052311/shupi.jpg', '清华大学出版社', '9787302337430', '2013 年11月', '2013-11-14', '《PHP项目开发全程实录（第3版）》\n第1章 九九度供求信息网（Apache+PHP+phpMyAdmin+MySQL 5.0实现） 1\n视频讲解：1小时50分钟\n1.1 开发背景 2\n1.2 系统分析 2\n1.2.1 需求分析 2\n1.2.2 可行性分析 2\n1.2.3 编写项目计划书 3\n1.3 系统设计 5\n1.3.1 系统目标 5\n1.3.2 系统功能结构 6\n1.3.3 系统流程图 6\n1.3.4 系统预览 6\n1.3.5 开发环境 8\n1.3.6 文件夹组织结构 8\n1.4 在Windows操作系统下搭建PHP开发环境 9\n1.4.1 在Windows下应用AppServ快速配置PHP开发环境 9\n1.4.2 Windows下Apache的安装配置 11\n1.4.3 Windows下MySQL的安装配置 14\n1.4.4 Windows下PHP的安装配置 15');
INSERT INTO `books` VALUES (217, 195312, 'PHP实例精通', '￥49.00', '￥28.91 (59折)', '宫垂刚', '195312.jpg', 'http://images.china-pub.com/ebook195001-200000/195312/shupi.jpg', '机械工业出版社', '9787111259817', '2009 年3月', '2009-3-20', '书籍\n    计算机书籍\nPHP作为一门开放的网关语言，已经发展到了5.0版本。在PHP5.0版本及后续的版本中，推出了很多激动人心的功能。\n本书从易读性、实用性方面出发，帮助读者在整个过程中，建立一种对问题进行思考、解决的方法。文中的实例，先帮助读者从理念方面加强认识，再从实际出发，通过简单的代码帮助读者理解理念上比较抽象的概念。并且书中实现的代码，完全可以在实际应用中直接使用，达到了实战的目的。\n从内容方面讲，书中介绍的内容比较全面，从PHP语法知识的细致实例，到常用函数的应用实例，到最后通过大型实例的形式，对学习过的函数，进行统一的实例讲解。\n在PHP高级应用方面，介绍了搜索引擎中与web爬虫相关的内容，以及怎样使用PHP实现Wb Service。从技术方面讲，本书不仅对PHP基础知识进行了讲解，还通过实现通用表格类、购物车类、文件上传与缩略图类、图片显示类、视频播放类等实例，介绍PHP开发过程中的一些技巧。并在介绍这些类的过程中，引导读者按照提出问题、解决问题的思路，来面对PHP开发过程中出现的问题。\n本书适用于PHP初、中级用户，相关专业及培训教材与参考。');
INSERT INTO `books` VALUES (218, 8054323, '创新模式十二宫：后互联网时代企业创新升级路线图', '￥99.00', '￥67.32 (68折)', '张雷', '8054323.jpg', 'http://images.china-pub.com/ebook8050001-8055000/8054323/shupi.jpg', '机械工业出版社', '9787111613794', '2018 年11月', '2018-11-28', '书籍\n    经济管理学书籍\n本书是一整套方法论，以商业画布的形式展现后互联网时代企业创新转型升级的路线图，帮助读者理清：产业价值链是如何展开的、中国商业模式的定位和本质、产业创新的需求来源、产业创新的主要驱动力（科技与市场进步）、产业创新的五步法、产业创新所需要的资本方法。');
INSERT INTO `books` VALUES (219, 8004733, '码农翻身', '￥69.00', '￥55.20 (80折)', '刘欣', '8004733.jpg', 'http://images.china-pub.com/ebook8000001-8005000/8004733/shupi.jpg', '电子工业出版社', '9787121341175', '2018 年5月', '2018-5-23', '书籍\n    计算机书籍\n《码农翻身》用故事的方式讲解了软件编程的若干重要领域，侧重于基础性、原理性的知识。\n《码农翻身》分为6章。第1章讲述计算机的基础知识；第2章侧重讲解Java的基础知识；第3章偏重Web后端编程；第4章讲解代码管理的本质；第5章讲述了JavaScript的历史、Node.js的原理、程序的链接、命令式和声明式编程的区别，以及作者十多年来使用各种编程语言的感受；第6章是作者的经验总结和心得体会，包括职场发展的注意事项、作为架构师的感想、写作的好处等。\n《码农翻身》不是一本编程的入门书，对编程一窍不通的\"纯小白\"可能看不明白，可能会失望。但稍有编程基础的读者读起来会非常畅快，读后会有一种\"原来如此\"的感觉。');
INSERT INTO `books` VALUES (220, 8052829, 'Python 3标准库', '￥199.00', '￥139.30 (70折)', '[美] 道格·赫尔曼（Doug Hellmann）', '8052829.jpg', 'http://images.china-pub.com/ebook8050001-8055000/8052829/shupi.jpg', '机械工业出版社', '9787111608950', '2018 年9月', '2018-10-9', '[美] 道格·赫尔曼（Doug Hellmann）著：');
INSERT INTO `books` VALUES (221, 5067203, '认知计算与大数据分析', '￥69.00', '￥55.20 (80折)', '【美】Judith S. Hurwitz Marcia A. Kaufman Adrian Bowles', '5067203.jpg', 'http://images.china-pub.com/ebook5065001-5070000/5067203/shupi.jpg', '人民邮电出版社', '9787115436931', '2017 年1月', '2017-1-9', '第 1 章　认知计算的基础 001\n1.1　新一代的认知计算　002\n1.2　认知系统的使用　002\n1.3　系统认知的组成　003\n1.4　从数据中获取信息　004\n1.5　作为认知计算基础的人工智能　006\n1.6　理解认知　010\n1.7　关于判断和选择的两个系统　012\n1.7.1　系统1——自动思考：直觉和偏向　013\n1.7.2　系统2——被控制的，以规则为中心且专注的努力　014\n1.8　理解系统间的复杂关系　015\n1.9　认知系统的元素　017\n1.9.1　基础设施和部署模式　018\n1.9.2　数据访问、元数据和管理服务　018\n1.9.3　语料库、分类系统和数据分类　018\n1.9.4　数据分析服务　019\n1.9.5　持续机器学习　019\n1.9.6　学习的过程　019\n1.9.7　呈现与可视化服务　020\n1.9.8　认知应用　020');
INSERT INTO `books` VALUES (222, 195392, '神经网络与机器学习(英文版.第3版)', '￥69.00', '￥44.85 (65折)', '(加)Simon Haykin', '195392.jpg', 'http://images.china-pub.com/ebook195001-200000/195392/shupi.jpg', 'Prentice Hall', '9787111265283', '2009 年3月', '2009-4-15', '书籍\n    计算机书籍\n神经网络是计算智能和机器学习的重要分支，在诸多领域都取得了很大的成功。在众多神经网络著作中，影响最为广泛的是Simon Haykin的《神经网络原理》(第4版更名为《神经网络与机器学习》)。在本书中，作者结合近年来神经网络和机器学习的最新进展，从理论和实际应用出发，全面。系统地介绍了神经网络的基本模型、方法和技术，并将神经网络和机器学习有机地结合在一起。.\n本书不但注重对数学分析方法和理论的探讨，而且也非常关注神经网络在模式识别、信号处理以及控制系统等实际工程问题中的应用。本书的可读性非常强，作者举重若轻地对神经网络的基本模型和主要学习理论进行了深入探讨和分析，通过大量的试验报告、例题和习题来帮助读者更好地学习神经网络。\n本版在前一版的基础上进行了广泛修订，提供了神经网络和机器学习这两个越来越重要的学科的最新分析。\n本书特色\n基于随机梯度下降的在线学习算法；小规模和大规模学习问题。..\n核方法，包括支持向量机和表达定理。\n信息论学习模型，包括连接、独立分量分析(ICA)，一致独立分量分析和信息瓶颈。\n随机动态规划，包括逼近和神经动态规划。\n逐次状态估计算法，包括Kalman和粒子滤波器。\n利用逐次状态估计算法训练递归神经网络。\n富有洞察力的面向计算机的试验。...');
INSERT INTO `books` VALUES (223, 5591590, '大象无形：虚幻引擎程序设计浅析', '￥65.00', '￥52.00 (80折)', '罗丁力 张三', '5591590.jpg', 'http://images.china-pub.com/ebook5590001-5595000/5591590/shupi.jpg', '电子工业出版社', '9787121313493', '2017 年4月', '2017-4-20', '罗丁力：电子科技大学在读学生、腾讯课堂三巫教育课程作者。自UDK开始使用虚幻引擎，有多年的虚幻引擎使用经验。\n张三：多年游戏开发经验，资深UE4开发者，三巫社区创始人。');
INSERT INTO `books` VALUES (224, 8052829, 'Python 3标准库', '￥199.00', '￥139.30 (70折)', '[美] 道格·赫尔曼（Doug Hellmann）', '8052829.jpg', 'http://images.china-pub.com/ebook8050001-8055000/8052829/shupi.jpg', '机械工业出版社', '9787111608950', '2018 年9月', '2018-10-9', '[美] 道格·赫尔曼（Doug Hellmann）著：');
INSERT INTO `books` VALUES (225, 5731354, 'Netty实战', '￥69.00', '￥55.20 (80折)', '[美] 诺曼？毛瑞尔（Norman Maurer）马文？艾伦？沃尔夫泰尔（Marvin Allen Wolfthal）', '5731354.jpg', 'http://images.china-pub.com/ebook5730001-5735000/5731354/shupi.jpg', '人民邮电出版社', '9787115453686', '2017 年6月', '2017-5-9', '作者简介\nNorman Maurer是苹果公司的zishen软件工程师，同时也是Netty的核心开发人员。\nMarvin Allen Wolfthal是Dell Services的顾问，他使用Netty实现了多个任务关键型的企业系统。\n译者简介\n何品，目前是淘宝的一名zishen软件工程师，热爱网络、并发、异步相关的主题以及函数式编程，同时也是Netty、Akka等项目的贡献者，活跃于Scala社区，目前也在从事GraphQL相关的开发工作。');
INSERT INTO `books` VALUES (226, 64654, 'Python机器学习实践：测试驱动的开发方法', '￥59.00', '￥38.35 (65折)', 'Matthew Kirk', '64654.jpg', 'http://images.china-pub.com/ebook60001-65000/64654/shupi.jpg', '机械工业出版社', '9787111581666', '2017 年10月', '2017-11-22', 'Matthew Kirk是一名软件咨询师、作者和国际演讲者，擅长机器学习和数据科学，使用Ruby和Python编程。现居于西雅图，他喜欢帮助软件工程师将数据科学融入到他们的技术栈中。');
INSERT INTO `books` VALUES (227, 7536040, '软件架构：Python语言实现', '￥79.00', '￥55.30 (70折)', '（印）阿南德·巴拉钱德拉·皮莱', '7536040.jpg', 'http://images.china-pub.com/ebook7535001-7540000/7536040/shupi.jpg', '机械工业出版社', '9787111590941', '2018 年3月', '2018-3-7', 'Anand Balachandran Pillai是一名工程技术专家，在软件企业有18年以上的工作经历，在产品工程、软件设计、架构设计和相关研究方面具有非常丰富的经验。\n他曾获得印度理工学院机械工程专业的学士学位。曾在Yahoo!、McAfee和Infosys等公司任职，担任产品开发团队的首席工程师。\n他的主要兴趣在于软件性能工程、高可扩展性架构、安全和开源社区等方面。他也经常在Startups工作，担任首席技术专家或顾问。\n他还是班加罗尔Python用户联盟的奠基人和Python软件协会（PSF）的会士。Anand现在是Yegii公司的首席架构师。\n关于评审人\nMike Driscoll从2006年开始使用Python。他喜欢写一些关于Python的博客，见\nhttp://www.blog.pythonlibrary.org/。他曾合著了《the Core Python refcard for DZone》一书，并参与了《Python 3 Object Oriented Programming》 《Python 2.6 Graphics Cookbook》\n《Tkinter GUI Application Development Hotshot》的评审工作和其他几本书的撰写工作。他最近刚完成《Python 101》的编写，目前正在写作他的下一本书。\n感谢我的妻子Evangeline一如既往的支持，感谢我的朋友和家人对我的无私帮助。');
INSERT INTO `books` VALUES (228, 63394, 'PHP网络编程技术详解', '￥69.80', '￥61.42 (88折)', '葛丽萍', '63394.jpg', 'http://images.china-pub.com/ebook60001-65000/63394/shupi.jpg', '清华大学出版社', '9787302343189', '2014 年1月', '2014-3-3', '从1995年发布PHP 1.0以来，已经有18年了。在这期间，PHP以其简单易学而且高性能的特点在网页后台开发中经久不衰，成为目前最流行的网站后台技术之一，可以完成任何规模的站点开发。因此，现在许多知名网站，如百度、腾讯、新浪以及雅虎，都在使用PHP技术。现在流行的论坛系统，如Discuz！，就是完全用PHP编写的。\n笔者结合自己多年的PHP开发经验和心得体会，花费了一年多的时间编写本书，希望读者能在本书的引领下跨入PHP开发大门，并成为一名开发高手。本书结合多媒体教学视频，全面、系统、深入地介绍了PHP开发技术，并在全书的讲解中贯穿了大量实例，最后还详细介绍了多个实例的开发。学习完本书，读者可以具备独立进行项目开发的能力。\n本书特色\n1．配套大量多媒体语音教学视频，学习效果好\n笔者专门录制了大量的配套多媒体语音教学视频，以便读者更加轻松、直观地学习本书内容，提高学习效率。这些视频和书中实例源代码一起收录于配书光盘中。\n2．内容全面、系统、深入\n本书介绍了PHP开发的基础知识、界面开发、数据库开发、网络编程、系统功能编程、多媒体开发等内容，最后还详细介绍了两个项目案例的开发。\n3．讲解由浅入深、循序渐进，适合各个层次的读者阅读\n本书从PHP的基础知识开始讲解，逐步深入到PHP的高级开发技术及应用，内容梯度从易到难，讲解由浅入深、循序渐进，适合各个层次的读者阅读。\n4．贯穿大量的开发实例和技巧，可迅速提升开发水平\n本书在讲解知识点时贯穿了大量短小精悍的典型实例，并给出了大量的开发技巧，以便读者更好地理解各种概念和开发技术，体验实际编程，迅速提高开发水平。\n5．详解典型项目案例开发，提高实战水平\n本书详细介绍了6个不同复杂程度的案例。通过这些案例，可以提高读者的软件项目开发水平，从而具备独立进行项目开发的能力。\n本书内容及体系结构\n第1篇 PHP准备篇（第1～2章）\n本篇主要内容包括：初识PHP和PHP的开发环境及安装。通过本篇的学习，读者可以了解什么是PHP以及PHP的优势，而且为以后的学习打好基础。\n第2篇 PHP基础篇（第3～6章）\n本篇主要内容包括：PHP中的常量与变量、PHP中的运算符与表达式、PHP中的流程控制以及PHP中的函数。通过本篇的学习，读者可以掌握PHP的基础技术，为以后的提升打下基础。\n第3篇 PHP进阶篇（第7～14章）\n本篇主要内容包括：PHP的数据处理、PHP文件应用、用PHP获取主机信息、PHP中的图像处理、PHP中的Session与Cookie、PHP中正则表达式的使用、PHP面向对象编程以及使用MySQL数据库。通过本篇的学习，读者可以掌握PHP中的高级技术，为开发高级应用打下基础。');
INSERT INTO `books` VALUES (229, 8052097, 'PHP核心技术与最佳实践（第2版）', '￥129.00', '￥90.30 (70折)', '列旭松 陈文', '8052097.jpg', 'http://images.china-pub.com/ebook8050001-8055000/8052097/shupi.jpg', '机械工业出版社', '9787111608417', '2018 年9月', '2018-9-14', '书籍\n    计算机书籍\n内容简介\nPHP领域公认的标杆之作，被誉为“PHP开发工程师能力进阶的必读书”，致力于为希望成为中高级PHP程序员的读者提供全面、高效的指导。\n本书第1版出版于2012年，累计印刷超过10次，6年后全新升级，一方面根据PHP技术最新的发展删除和更新了一些过时的内容，另一方面对原来的部分内容作了深度优化。\n全书共13章，逻辑上分为5个部分：\n第一部分（1～2章）：从不同的角度阐述了面向对象软件设计思想的核心概念、技术和原则，分析了面向对象的特性、设计模式的理念，指出了如何设计低耦合、高可扩展性的软件，等等。\n第二部分（3～6章）：详细讲解了PHP网络编程的原理、方法、技巧和一些重要的操作，PDO、数据库应用优化，数据库设计和MySQL的高级应用，PHP框架的实现原理。\n第三部分（第7章）：围绕PHP扩展开发进行了细致而深入的探讨，解析了PHP的底层实现和Zend虚拟机API，并用PHP扩展开发的实例带领读者走进PHP的底层世界，旨在让读者对PHP性能优化、底层原理进行深入的理解。\n第四部分（8～10章）：重点讨论了缓存的设计、Memcached的原理与实践、NoSQL数据库Redis源码分析与应用实践等内容。\n第五部分（12～13章）详细讲解了PHP代码的调试和测试、Hash算法和数据库的实现。');
INSERT INTO `books` VALUES (230, 3770828, '正则表达式必知必会(第2版)(修订版)', '￥29.00', '￥26.10 (90折)', '(美)Ben Forta', '3770828.jpg', 'http://images.china-pub.com/ebook3770001-3775000/3770828/shupi.jpg', '人民邮电出版社', '9787115377999', '2015 年1月', '2014-12-18', 'Ben Forta\n拥有三十多年的计算机领域从业经验，是世界知名的技术作家，也是Adobe技术界知名专家，目前担任Adobe公司的客户培训部高级主管。他撰写的《SQL必知必会》《MySQL必知必会》等因短小精悍、可快速入手而受到读者好评，已被翻译为十几种文字，成为世界级畅销书。');
INSERT INTO `books` VALUES (231, 6596008, 'Ceph设计原理与实现', '￥69.00', '￥48.30 (70折)', '谢型果', '6596008.jpg', 'http://images.china-pub.com/ebook6595001-6600000/6596008/shupi.jpg', '机械工业出版社', '9787111578420', '2017 年9月', '2017-9-12', '中兴通讯股份有限公司（英语：ZTE Corporation，全称：Zhongxing Telecommunication Equipment Corporation），简称中兴通讯（ZTE）。全球领先的综合通信解决方案提供商，中国大的通信设备上市公司。主要产品包括：2G/3G/4G/5G无线基站与核心网、IMS、固网接入与承载、光网络、芯片、高端路由器、智能交换机、政企网、大数据、云计算、数据中心、手机及家庭终端、智慧城市、ICT业务，以及航空、铁路与城市轨道交通信号传输设备。\n中兴通讯在香港和深圳两地上市。2015年，中兴通讯营业收入超过1000亿。2016年8月25日，中兴通讯发布2016年半年财报，在集团整体营业收入、经营活动现金净流、净利润等方面均表现亮眼。[1] 2016年8月，中兴通讯在\"2016中国企业500强\"中排名第150位。');
INSERT INTO `books` VALUES (232, 7275776, '京东数据中心构建实战', '￥109.00', '￥76.30 (70折)', '吕科', '7275776.jpg', 'http://images.china-pub.com/ebook7275001-7280000/7275776/shupi.jpg', '机械工业出版社', '9787111589570', '2018 年1月', '2018-1-15', '编委会成员\n推荐序\n前言\n第1章　数据中心概述1\n1.1　数据中心的分级1\n1.1.1　国标GB 50174—20171\n1.1.2　Uptime Tier等级认证2\n1.1.3　TIA-9423\n1.2　数据中心的选址3\n1.3　数据中心的组成4\n1.3.1　功能区划分4\n1.3.2　功能区面积5\n1.4　数据中心的规划布局5\n第2章　数据中心供配电系统8\n2.1　数据中心对供配电系统的要求8\n2.1.1　数据中心对市电供电电源的要求8\n2.1.2　数据中心的供电等级11\n2.2　数据中心中压电源系统12\n2.2.1　电源选择与供电能力13\n2.2.2　中压电力系统中性点的运行方式13');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `chinapub`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `chinapub`.`django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-12-11 06:55:02', '1', 'Spider object', 1, '[{\"added\": {}}]', 9, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (10, 'books', 'authgroup');
INSERT INTO `django_content_type` VALUES (11, 'books', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (12, 'books', 'authpermission');
INSERT INTO `django_content_type` VALUES (13, 'books', 'authuser');
INSERT INTO `django_content_type` VALUES (14, 'books', 'authusergroups');
INSERT INTO `django_content_type` VALUES (15, 'books', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (7, 'books', 'books');
INSERT INTO `django_content_type` VALUES (16, 'books', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (17, 'books', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (18, 'books', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (19, 'books', 'djangosession');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (20, 'proxies_ip', 'authgroup');
INSERT INTO `django_content_type` VALUES (21, 'proxies_ip', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (22, 'proxies_ip', 'authpermission');
INSERT INTO `django_content_type` VALUES (23, 'proxies_ip', 'authuser');
INSERT INTO `django_content_type` VALUES (24, 'proxies_ip', 'authusergroups');
INSERT INTO `django_content_type` VALUES (25, 'proxies_ip', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (26, 'proxies_ip', 'books');
INSERT INTO `django_content_type` VALUES (27, 'proxies_ip', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (28, 'proxies_ip', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (29, 'proxies_ip', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (30, 'proxies_ip', 'djangosession');
INSERT INTO `django_content_type` VALUES (8, 'proxies_ip', 'proxiesip');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'spider', 'spider');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (15, 'contenttypes', '0001_initial', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0001_initial', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0001_initial', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0002_logentry_remove_auto_add', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (19, 'contenttypes', '0002_remove_content_type_name', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (20, 'auth', '0002_alter_permission_name_max_length', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (21, 'auth', '0003_alter_user_email_max_length', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (22, 'auth', '0004_alter_user_username_opts', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (23, 'auth', '0005_alter_user_last_login_null', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (24, 'auth', '0006_require_contenttypes_0002', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (25, 'auth', '0007_alter_validators_add_error_messages', '2018-12-10 10:27:13');
INSERT INTO `django_migrations` VALUES (26, 'auth', '0008_alter_user_username_max_length', '2018-12-10 10:27:14');
INSERT INTO `django_migrations` VALUES (27, 'sessions', '0001_initial', '2018-12-10 10:27:14');
INSERT INTO `django_migrations` VALUES (28, 'books', '0001_initial', '2018-12-11 06:54:46');
INSERT INTO `django_migrations` VALUES (29, 'proxies_ip', '0001_initial', '2018-12-11 06:54:47');
INSERT INTO `django_migrations` VALUES (30, 'spider', '0001_initial', '2018-12-11 06:54:47');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('gss8pmgscqjegt1xpl5yqwgzujc650mg', 'ODRiNDIyNDNjZjMzYWM2OGYyMDVkZDBmODc3ZTY3YjNmY2I5Y2JlYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiZDZmNmQxNjU0ZTUzZTNiNGI2YjQ4OTExZDYxNzAwZjMyMWQyMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-12-24 10:32:00');

-- ----------------------------
-- Table structure for proxies_ip
-- ----------------------------
DROP TABLE IF EXISTS `proxies_ip`;
CREATE TABLE `proxies_ip`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `http_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `speed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `connect_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1259 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proxies_ip
-- ----------------------------
INSERT INTO `proxies_ip` VALUES (401, '61.135.217.7', '80', '北京', 'HTTP', '0.324秒', '0.064秒');
INSERT INTO `proxies_ip` VALUES (823, '125.46.0.62', '53281', '河南济源', 'HTTP', '0.1秒', '0.02秒');
INSERT INTO `proxies_ip` VALUES (862, '203.86.26.9', '3128', '广东深圳', 'HTTPS', '0.177秒', '0.035秒');
INSERT INTO `proxies_ip` VALUES (864, '124.250.70.76', '8123', '北京', 'HTTPS', '0.457秒', '0.091秒');
INSERT INTO `proxies_ip` VALUES (871, '115.182.212.169', '8080', '北京', 'HTTPS', '0.032秒', '0.006秒');
INSERT INTO `proxies_ip` VALUES (878, '61.128.208.94', '3128', '重庆', 'HTTPS', '0.301秒', '0.06秒');
INSERT INTO `proxies_ip` VALUES (886, '218.241.219.226', '9999', '北京', 'HTTPS', '0.762秒', '0.152秒');
INSERT INTO `proxies_ip` VALUES (928, '124.237.83.14', '53281', '河北秦皇岛', 'HTTPS', '0.093秒', '0.018秒');
INSERT INTO `proxies_ip` VALUES (932, '58.118.228.7', '1080', '北京', 'HTTPS', '0.034秒', '0.006秒');
INSERT INTO `proxies_ip` VALUES (935, '139.159.7.150', '52908', NULL, 'HTTPS', '0.04秒', '0.008秒');
INSERT INTO `proxies_ip` VALUES (936, '101.37.79.125', '3128', NULL, 'HTTPS', '0.356秒', '0.071秒');
INSERT INTO `proxies_ip` VALUES (940, '112.117.49.119', '9999', '云南昆明', 'HTTPS', '0.367秒', '0.073秒');
INSERT INTO `proxies_ip` VALUES (943, '211.83.77.51', '3128', '四川达州', 'HTTPS', '0.25秒', '0.05秒');
INSERT INTO `proxies_ip` VALUES (962, '218.86.87.171', '53281', '福建龙岩', 'HTTPS', '0.205秒', '0.041秒');
INSERT INTO `proxies_ip` VALUES (992, '60.191.201.38', '45461', '浙江金华', 'HTTPS', '0.284秒', '0.056秒');
INSERT INTO `proxies_ip` VALUES (1003, '125.40.79.66', '8118', '河南郑州', 'HTTP', '0.064秒', '0.012秒');
INSERT INTO `proxies_ip` VALUES (1010, '180.102.135.42', '80', '江苏苏州', 'HTTP', '0.144秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1012, '122.227.139.170', '3128', '浙江宁波', 'HTTP', '0.155秒', '0.031秒');
INSERT INTO `proxies_ip` VALUES (1022, '220.180.5.167', '8118', '安徽六安', 'HTTP', '0.168秒', '0.033秒');
INSERT INTO `proxies_ip` VALUES (1024, '182.88.213.206', '8123', '广西南宁', 'HTTP', '0.478秒', '0.095秒');
INSERT INTO `proxies_ip` VALUES (1030, '113.103.12.2', '3128', '广东广州', 'HTTP', '0.587秒', '0.117秒');
INSERT INTO `proxies_ip` VALUES (1032, '222.221.11.119', '3128', '云南昆明', 'HTTP', '0.265秒', '0.053秒');
INSERT INTO `proxies_ip` VALUES (1034, '114.223.163.70', '8118', '江苏无锡', 'HTTP', '0.635秒', '0.127秒');
INSERT INTO `proxies_ip` VALUES (1036, '14.117.178.159', '808', '广东江门', 'HTTP', '0.282秒', '0.056秒');
INSERT INTO `proxies_ip` VALUES (1047, '1.196.160.165', '9999', '河南商丘', 'HTTP', '0.122秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1048, '219.246.90.204', '3128', '甘肃兰州', 'HTTP', '0.215秒', '0.043秒');
INSERT INTO `proxies_ip` VALUES (1052, '124.16.110.68', '1080', '北京', 'HTTP', '0.887秒', '0.177秒');
INSERT INTO `proxies_ip` VALUES (1057, '218.17.21.138', '808', '广东深圳', 'HTTP', '0.186秒', '0.037秒');
INSERT INTO `proxies_ip` VALUES (1058, '119.139.198.145', '3128', '广东深圳', 'HTTP', '0.16秒', '0.032秒');
INSERT INTO `proxies_ip` VALUES (1059, '112.102.62.113', '8888', '黑龙江哈尔滨', 'HTTP', '0.142秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1060, '113.128.140.177', '8118', '山东济南', 'HTTP', '0.106秒', '0.021秒');
INSERT INTO `proxies_ip` VALUES (1074, '180.110.6.10', '3128', '江苏南京', 'HTTP', '0.756秒', '0.151秒');
INSERT INTO `proxies_ip` VALUES (1077, '163.125.157.44', '8888', '广东深圳', 'HTTP', '0.227秒', '0.045秒');
INSERT INTO `proxies_ip` VALUES (1078, '219.245.3.4', '3128', '陕西西安', 'HTTP', '0.184秒', '0.036秒');
INSERT INTO `proxies_ip` VALUES (1079, '113.116.178.58', '808', '广东深圳', 'HTTP', '0.175秒', '0.035秒');
INSERT INTO `proxies_ip` VALUES (1089, '183.15.120.15', '3128', '广东深圳', 'HTTP', '0.819秒', '0.163秒');
INSERT INTO `proxies_ip` VALUES (1090, '120.83.49.194', '9000', '广东清远', 'HTTP', '0.239秒', '0.047秒');
INSERT INTO `proxies_ip` VALUES (1100, '180.142.255.147', '53281', '广西玉林', 'HTTP', '0.276秒', '0.055秒');
INSERT INTO `proxies_ip` VALUES (1114, '114.106.135.194', '9999', '安徽池州', 'HTTP', '0.208秒', '0.041秒');
INSERT INTO `proxies_ip` VALUES (1115, '121.61.30.68', '9999', '湖北咸宁', 'HTTP', '0.133秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1116, '222.184.7.206', '40908', '江苏淮安', 'HTTP', '0.159秒', '0.031秒');
INSERT INTO `proxies_ip` VALUES (1117, '119.101.117.68', '9999', '湖北潜江', 'HTTP', '0.147秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1118, '119.101.116.114', '9999', '湖北潜江', 'HTTP', '0.155秒', '0.031秒');
INSERT INTO `proxies_ip` VALUES (1123, '222.95.174.181', '9999', '江苏南京', 'HTTP', '0.143秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1124, '121.61.44.57', '9999', '湖北咸宁', 'HTTP', '0.161秒', '0.032秒');
INSERT INTO `proxies_ip` VALUES (1125, '119.101.117.131', '9999', '湖北潜江', 'HTTP', '0.471秒', '0.094秒');
INSERT INTO `proxies_ip` VALUES (1126, '111.181.64.4', '9999', '湖北鄂州', 'HTTP', '0.122秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1127, '119.101.114.37', '9999', '湖北十堰', 'HTTP', '0.131秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1129, '119.101.116.179', '9999', '湖北潜江', 'HTTP', '0.141秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1131, '119.101.117.95', '9999', '湖北潜江', 'HTTP', '0.129秒', '0.025秒');
INSERT INTO `proxies_ip` VALUES (1133, '60.168.206.165', '808', '安徽合肥', 'HTTP', '0.298秒', '0.059秒');
INSERT INTO `proxies_ip` VALUES (1134, '119.101.117.148', '9999', '湖北潜江', 'HTTP', '0.127秒', '0.025秒');
INSERT INTO `proxies_ip` VALUES (1135, '119.101.116.140', '9999', '湖北潜江', 'HTTP', '0.146秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1136, '110.52.235.5', '9999', '湖南岳阳', 'HTTP', '0.553秒', '0.11秒');
INSERT INTO `proxies_ip` VALUES (1137, '125.123.142.93', '9999', '浙江嘉兴', 'HTTP', '0.79秒', '0.158秒');
INSERT INTO `proxies_ip` VALUES (1139, '111.181.54.31', '9999', '湖北鄂州', 'HTTP', '0.131秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1140, '113.120.61.107', '9999', '山东济南', 'HTTP', '0.085秒', '0.017秒');
INSERT INTO `proxies_ip` VALUES (1142, '119.101.112.126', '9999', '湖北十堰', 'HTTP', '0.384秒', '0.076秒');
INSERT INTO `proxies_ip` VALUES (1143, '112.87.69.191', '9999', '江苏宿迁', 'HTTP', '0.163秒', '0.032秒');
INSERT INTO `proxies_ip` VALUES (1144, '121.61.0.99', '9999', '湖北咸宁', 'HTTP', '0.588秒', '0.117秒');
INSERT INTO `proxies_ip` VALUES (1145, '119.101.114.53', '9999', '湖北十堰', 'HTTP', '0.124秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1146, '119.101.116.168', '9999', '湖北潜江', 'HTTP', '0.135秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1147, '119.101.115.176', '9999', '湖北仙桃', 'HTTP', '0.141秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1149, '119.101.115.109', '9999', '湖北仙桃', 'HTTP', '0.129秒', '0.025秒');
INSERT INTO `proxies_ip` VALUES (1150, '119.101.113.109', '9999', '湖北十堰', 'HTTP', '0.15秒', '0.03秒');
INSERT INTO `proxies_ip` VALUES (1152, '183.148.138.90', '9999', '浙江台州', 'HTTP', '0.174秒', '0.034秒');
INSERT INTO `proxies_ip` VALUES (1153, '110.52.235.83', '9999', '湖南岳阳', 'HTTP', '0.927秒', '0.185秒');
INSERT INTO `proxies_ip` VALUES (1154, '222.95.174.121', '9999', '江苏南京', 'HTTP', '0.145秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1155, '110.52.235.58', '9999', '湖南岳阳', 'HTTP', '0.448秒', '0.089秒');
INSERT INTO `proxies_ip` VALUES (1156, '202.199.159.130', '40670', '辽宁大连', 'HTTP', '0.24秒', '0.048秒');
INSERT INTO `proxies_ip` VALUES (1157, '110.52.235.227', '9999', '湖南岳阳', 'HTTP', '0.303秒', '0.06秒');
INSERT INTO `proxies_ip` VALUES (1158, '121.61.0.124', '9999', '湖北咸宁', 'HTTP', '0.129秒', '0.025秒');
INSERT INTO `proxies_ip` VALUES (1160, '111.181.68.191', '9999', '湖北鄂州', 'HTTP', '0.126秒', '0.025秒');
INSERT INTO `proxies_ip` VALUES (1161, '121.61.2.75', '9999', '湖北咸宁', 'HTTP', '0.132秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1163, '210.77.23.114', '1080', '北京', 'HTTP', '0.879秒', '0.175秒');
INSERT INTO `proxies_ip` VALUES (1164, '119.101.114.158', '9999', '湖北十堰', 'HTTP', '0.147秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1165, '119.101.112.74', '9999', '湖北十堰', 'HTTP', '0.409秒', '0.081秒');
INSERT INTO `proxies_ip` VALUES (1167, '119.101.114.106', '9999', '湖北十堰', 'HTTP', '0.123秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1169, '119.101.112.216', '9999', '湖北十堰', 'HTTP', '0.14秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1170, '119.101.116.113', '9999', '湖北潜江', 'HTTP', '0.14秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1171, '119.101.116.202', '9999', '湖北潜江', 'HTTP', '0.12秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1172, '119.101.117.166', '9999', '湖北潜江', 'HTTP', '0.147秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1173, '119.101.115.106', '9999', '湖北仙桃', 'HTTP', '0.13秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1175, '183.15.121.107', '808', '广东深圳', 'HTTP', '0.198秒', '0.039秒');
INSERT INTO `proxies_ip` VALUES (1176, '119.101.114.59', '9999', '湖北十堰', 'HTTP', '0.14秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1177, '119.101.112.245', '9999', '湖北十堰', 'HTTP', '0.166秒', '0.033秒');
INSERT INTO `proxies_ip` VALUES (1178, '219.139.175.155', '9999', '湖北咸宁', 'HTTP', '0.139秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1179, '119.101.117.98', '9999', '湖北潜江', 'HTTP', '0.222秒', '0.044秒');
INSERT INTO `proxies_ip` VALUES (1180, '119.101.117.186', '9999', '湖北潜江', 'HTTP', '0.137秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1182, '117.88.49.23', '9999', '江苏南京', 'HTTP', '0.141秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1183, '119.101.117.34', '9999', '湖北潜江', 'HTTP', '0.152秒', '0.03秒');
INSERT INTO `proxies_ip` VALUES (1185, '118.81.69.8', '9797', '山西太原', 'HTTP', '0.06秒', '0.012秒');
INSERT INTO `proxies_ip` VALUES (1186, '121.61.30.129', '9999', '湖北咸宁', 'HTTP', '0.149秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1187, '119.101.112.252', '9999', '湖北十堰', 'HTTP', '0.143秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1190, '119.101.114.92', '9999', '湖北十堰', 'HTTP', '0.131秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1191, '119.101.118.3', '9999', '湖北潜江', 'HTTP', '0.135秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1192, '121.61.29.37', '9999', '湖北咸宁', 'HTTP', '0.145秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1194, '119.101.112.165', '9999', '湖北十堰', 'HTTP', '0.144秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1196, '119.101.114.220', '9999', '湖北十堰', 'HTTP', '0.439秒', '0.087秒');
INSERT INTO `proxies_ip` VALUES (1198, '117.62.233.74', '9999', '江苏', 'HTTP', '0.133秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1199, '119.101.113.251', '9999', '湖北十堰', 'HTTP', '0.138秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1200, '119.101.117.192', '9999', '湖北潜江', 'HTTP', '0.096秒', '0.019秒');
INSERT INTO `proxies_ip` VALUES (1201, '119.39.238.66', '9999', '湖南岳阳', 'HTTP', '0.453秒', '0.09秒');
INSERT INTO `proxies_ip` VALUES (1204, '121.61.24.151', '9999', '湖北咸宁', 'HTTP', '0.141秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1205, '115.221.121.255', '9999', '浙江温州', 'HTTP', '0.345秒', '0.069秒');
INSERT INTO `proxies_ip` VALUES (1208, '117.62.233.55', '9999', '江苏', 'HTTP', '0.132秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1209, '125.123.137.177', '9999', '浙江嘉兴', 'HTTP', '0.15秒', '0.03秒');
INSERT INTO `proxies_ip` VALUES (1210, '144.123.71.41', '9999', '山东', 'HTTP', '0.086秒', '0.017秒');
INSERT INTO `proxies_ip` VALUES (1211, '122.235.141.226', '8118', '浙江杭州', 'HTTP', '0.32秒', '0.064秒');
INSERT INTO `proxies_ip` VALUES (1213, '180.118.77.16', '9999', '江苏镇江', 'HTTP', '0.143秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1216, '119.101.113.173', '9999', '湖北十堰', 'HTTP', '0.158秒', '0.031秒');
INSERT INTO `proxies_ip` VALUES (1217, '119.101.114.74', '9999', '湖北十堰', 'HTTP', '0.151秒', '0.03秒');
INSERT INTO `proxies_ip` VALUES (1218, '119.101.113.50', '9999', '湖北十堰', 'HTTP', '0.406秒', '0.081秒');
INSERT INTO `proxies_ip` VALUES (1220, '119.101.115.36', '9999', '湖北仙桃', 'HTTP', '0.165秒', '0.033秒');
INSERT INTO `proxies_ip` VALUES (1221, '113.116.6.103', '9000', '广东深圳', 'HTTP', '0.193秒', '0.038秒');
INSERT INTO `proxies_ip` VALUES (1222, '27.24.165.95', '9999', '江苏常州', 'HTTP', '0.393秒', '0.078秒');
INSERT INTO `proxies_ip` VALUES (1223, '58.50.1.115', '9999', '湖北荆州', 'HTTP', '0.368秒', '0.073秒');
INSERT INTO `proxies_ip` VALUES (1224, '119.101.113.237', '9999', '湖北十堰', 'HTTP', '0.151秒', '0.03秒');
INSERT INTO `proxies_ip` VALUES (1225, '119.101.117.163', '9999', '湖北潜江', 'HTTP', '0.146秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1226, '119.101.116.124', '9999', '湖北潜江', 'HTTP', '0.205秒', '0.041秒');
INSERT INTO `proxies_ip` VALUES (1229, '121.61.25.99', '9999', '湖北咸宁', 'HTTP', '0.135秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1230, '183.148.148.189', '9999', '浙江台州', 'HTTP', '0.181秒', '0.036秒');
INSERT INTO `proxies_ip` VALUES (1231, '119.101.117.100', '9999', '湖北潜江', 'HTTP', '0.183秒', '0.036秒');
INSERT INTO `proxies_ip` VALUES (1232, '171.41.81.250', '9999', '湖北', 'HTTP', '0.122秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1233, '60.216.101.46', '59351', '山东济南', 'HTTP', '0.11秒', '0.022秒');
INSERT INTO `proxies_ip` VALUES (1234, '116.225.67.6', '63000', '上海', 'HTTP', '0.183秒', '0.036秒');
INSERT INTO `proxies_ip` VALUES (1235, '111.181.64.35', '9999', '湖北鄂州', 'HTTP', '0.111秒', '0.022秒');
INSERT INTO `proxies_ip` VALUES (1239, '14.115.104.16', '808', '广东珠海', 'HTTP', '0.46秒', '0.092秒');
INSERT INTO `proxies_ip` VALUES (1240, '171.41.81.113', '9999', '湖北', 'HTTP', '0.118秒', '0.023秒');
INSERT INTO `proxies_ip` VALUES (1241, '119.101.112.39', '9999', '湖北十堰', 'HTTP', '0.144秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1242, '119.101.117.13', '9999', '湖北潜江', 'HTTP', '0.16秒', '0.032秒');
INSERT INTO `proxies_ip` VALUES (1244, '121.61.122.53', '9999', '湖北咸宁', 'HTTP', '0.147秒', '0.029秒');
INSERT INTO `proxies_ip` VALUES (1245, '112.85.168.127', '9999', '江苏南通', 'HTTP', '0.189秒', '0.037秒');
INSERT INTO `proxies_ip` VALUES (1246, '119.101.117.185', '9999', '湖北潜江', 'HTTP', '0.396秒', '0.079秒');
INSERT INTO `proxies_ip` VALUES (1247, '119.101.113.202', '9999', '湖北十堰', 'HTTP', '0.133秒', '0.026秒');
INSERT INTO `proxies_ip` VALUES (1248, '121.61.44.149', '9999', '湖北咸宁', 'HTTP', '0.178秒', '0.035秒');
INSERT INTO `proxies_ip` VALUES (1249, '121.237.88.223', '9999', '江苏南京', 'HTTP', '0.137秒', '0.027秒');
INSERT INTO `proxies_ip` VALUES (1250, '58.55.155.125', '9999', '湖北鄂州', 'HTTP', '0.935秒', '0.187秒');
INSERT INTO `proxies_ip` VALUES (1252, '119.101.114.43', '9999', '湖北十堰', 'HTTP', '0.14秒', '0.028秒');
INSERT INTO `proxies_ip` VALUES (1253, '144.255.13.201', '9999', '山东', 'HTTP', '0.085秒', '0.017秒');
INSERT INTO `proxies_ip` VALUES (1254, '27.24.166.141', '9999', '江苏常州', 'HTTP', '0.12秒', '0.024秒');
INSERT INTO `proxies_ip` VALUES (1255, '113.120.61.201', '9999', '山东济南', 'HTTP', '0.74秒', '0.148秒');

-- ----------------------------
-- Table structure for spider
-- ----------------------------
DROP TABLE IF EXISTS `spider`;
CREATE TABLE `spider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_urls` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of spider
-- ----------------------------
INSERT INTO `spider` VALUES (1, 'http://www.china-pub.net');

SET FOREIGN_KEY_CHECKS = 1;
