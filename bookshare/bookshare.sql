/*
 Navicat Premium Data Transfer

 Source Server         : BookShare
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : bookshare

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 31/03/2023 13:14:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_profile` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_number` int(11) NULL DEFAULT NULL,
  `b_score` int(11) NULL DEFAULT NULL,
  `b_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '《哈利·波特与魔法石》', 'J.K.罗琳', '名著', '讲述了自幼父母双亡的孤儿哈利·波特收到魔法学校霍格沃茨的邀请，前去学习魔法，之后遭遇的一系列历险。', 3, 5, 'http://localhost:8080/book_share/img/book1.jpg');
INSERT INTO `books` VALUES (2, '《哈利·波特与密室》', 'J.K.罗琳', '小说', '讲述了哈利回到学院，发现同学们接二连三的变成石头，为解救同学，战胜伏地魔的少年化身——里德尔的故事。\r\n', 2, 5, 'http://localhost:8080/book_share/img/book2.jpg');
INSERT INTO `books` VALUES (3, '《哈利·波特与阿兹卡班的囚徒》', 'J.K.罗琳', '名著', '讲述了哈利·波特在学校已经度过了不平凡的两年，传言布莱克是“黑魔法”高手伏地魔的忠实信徒，曾经用一句魔咒接连结束了13条性命。哈利的生活因此发生了极大的变化。', 4, 5, 'http://localhost:8080/book_share/img/book3.jpg');
INSERT INTO `books` VALUES (4, '《哈利·波特与火焰杯》', 'J.K.罗琳', '小说', '讲述了哈利·波特在霍格沃茨魔法学校经过三年的学习和磨炼，逐渐成长为一个出色的巫师的故事。', 4, 5, 'http://localhost:8080/book_share/img/book4.jpg');
INSERT INTO `books` VALUES (5, '《哈利·波特与凤凰社》', 'J.K.罗琳', '童话', '讲述在又一个暑假中，哈利·波特被困在女贞路4号，遭到摄魂怪的突然袭击之后发生的事情。', 5, 7, 'http://localhost:8080/book_share/img/book5.jpg');
INSERT INTO `books` VALUES (6, '《哈利·波特与混血王子》', 'J.K.罗琳', '小说', '讲述了主人公哈利·波特在霍格沃茨魔法学校第六年学习时（1996年—1997年）发生的故事。', 4, 6, 'http://localhost:8080/book_share/img/book6.jpg');
INSERT INTO `books` VALUES (7, '《修行之路》', '成仙', '童话', '讲述了主人公进行修行的故事', 5, 5, 'http://localhost:8080/book_share/img/noimg.jpg');
INSERT INTO `books` VALUES (12, 'asd', 'zs', '小说', 'fewefdsafwf', 1, 5, 'http://localhost:8080/book_share/img/noimg.jpg');
INSERT INTO `books` VALUES (13, 'dont know', 'space', '小说', 'bgfbgb', 1, 4, 'http://localhost:8080/book_share/img/noimg.jpg');
INSERT INTO `books` VALUES (14, 'ghhj', 'gh', '杂志', NULL, 1, 5, 'http://localhost:8080/book_share/img/1Xpogvx9zSFrd8e9c622a13f644a370a332c0e6c9083.jpg');
INSERT INTO `books` VALUES (15, 'yhtyht', 'bsb', '小说', NULL, 1, 5, 'http://localhost:8080/book_share/img/noimg.jpg');

-- ----------------------------
-- Table structure for borrows
-- ----------------------------
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE `borrows`  (
  `br_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_score` int(11) NULL DEFAULT NULL,
  `br_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`br_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrows
-- ----------------------------
INSERT INTO `borrows` VALUES (2, '《哈利·波特与密室》', 'J.K.罗琳', 'u003', 5, '30天');
INSERT INTO `borrows` VALUES (4, '《哈利·波特与密室》', 'J.K.罗琳', 'u002', 5, '30天');
INSERT INTO `borrows` VALUES (6, '《哈利·波特与混血王子》', 'J.K.罗琳', 'u002', 6, '30天');
INSERT INTO `borrows` VALUES (8, '《哈利·波特与密室》', 'J.K.罗琳', 'u002', 5, '30天');
INSERT INTO `borrows` VALUES (9, '《哈利·波特与凤凰社》', 'J.K.罗琳', 'u003', 7, '30天');
INSERT INTO `borrows` VALUES (10, '《哈利·波特与凤凰社》', 'J.K.罗琳', 'u003', 7, '30天');
INSERT INTO `borrows` VALUES (11, '《哈利·波特与密室》', 'J.K.罗琳', 'u001', 5, '30天');
INSERT INTO `borrows` VALUES (18, '《修行之路》', '成仙', 'u002', 5, '30天');
INSERT INTO `borrows` VALUES (19, '《修行之路》', '成仙', 'u001', 5, '30天');
INSERT INTO `borrows` VALUES (21, '《修行之路》', '成仙', 'u005', 5, '30天');
INSERT INTO `borrows` VALUES (22, '《修行之路》', '成仙', 'u004', 5, '30天');
INSERT INTO `borrows` VALUES (23, '《哈利·波特与混血王子》', 'J.K.罗琳', 'u001', 6, '30天');
INSERT INTO `borrows` VALUES (24, '《哈利·波特与魔法石》', 'J.K.罗琳', 'u001', 5, '30天');

-- ----------------------------
-- Table structure for checks
-- ----------------------------
DROP TABLE IF EXISTS `checks`;
CREATE TABLE `checks`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_profile` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_score` int(11) NULL DEFAULT NULL,
  `b_image` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_pass` int(11) NULL DEFAULT NULL COMMENT '0:未审核，1：通过，2：未通过',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checks
-- ----------------------------
INSERT INTO `checks` VALUES (1, 'u002', 'abc', 'zrw', 'ascasdcasc', '小说', 5, 'http://localhost:8080/book_share/img/noimg.jpg', 2);
INSERT INTO `checks` VALUES (2, 'u003', 'asd', 'zs', 'fewefdsafwf', '小说', 5, 'http://localhost:8080/book_share/img/noimg.jpg', 1);
INSERT INTO `checks` VALUES (3, 'u002', 'qeqwe', 'ls', 'fefrgetget', '小说', 5, 'http://localhost:8080/book_share/img/noimg.jpg', 0);
INSERT INTO `checks` VALUES (4, 'u005', 'dont know', 'space', 'bgfbgb', '小说', 4, 'http://localhost:8080/book_share/img/noimg.jpg', 1);
INSERT INTO `checks` VALUES (5, 'u001', 'yhtyht', 'bsb', NULL, '小说', 5, 'http://localhost:8080/book_share/img/noimg.jpg', 1);
INSERT INTO `checks` VALUES (8, 'u001', 'ghhj', 'gh', NULL, '杂志', 5, 'http://localhost:8080/book_share/img/1Xpogvx9zSFrd8e9c622a13f644a370a332c0e6c9083.jpg', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_pass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_score` int(11) NULL DEFAULT NULL,
  `u_class` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'u001', '123', 209, 1);
INSERT INTO `users` VALUES (2, 'u002', '123', 270, 2);
INSERT INTO `users` VALUES (3, 'u003', '123', 206, 2);
INSERT INTO `users` VALUES (4, 'u004', '123', 45, 2);
INSERT INTO `users` VALUES (5, 'u005', '123', 85, 2);
INSERT INTO `users` VALUES (6, 'u006', '123', 50, 2);
INSERT INTO `users` VALUES (7, 'u007', '123', 50, 2);
INSERT INTO `users` VALUES (8, 'u008', '123', 50, 2);

-- ----------------------------
-- Triggers structure for table borrows
-- ----------------------------
DROP TRIGGER IF EXISTS `boroow_update_score`;
delimiter ;;
CREATE TRIGGER `boroow_update_score` AFTER INSERT ON `borrows` FOR EACH ROW BEGIN IF EXISTS(select * from users where users.u_name = new.u_name)
then  
UPDATE users set u_score=u_score-new.b_score
where  users.u_name=new.u_name;
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrows
-- ----------------------------
DROP TRIGGER IF EXISTS `borrow_update_number`;
delimiter ;;
CREATE TRIGGER `borrow_update_number` AFTER INSERT ON `borrows` FOR EACH ROW BEGIN IF EXISTS(select * from books where books.b_name = new.b_name)
then  
UPDATE books set b_number=b_number-1
where  books.b_name=new.b_name;
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table checks
-- ----------------------------
DROP TRIGGER IF EXISTS `score_increase`;
delimiter ;;
CREATE TRIGGER `score_increase` AFTER UPDATE ON `checks` FOR EACH ROW begin 
if(new.c_pass=1)
then update users set users.u_score=users.u_score+20  where users.u_name=new.u_name;
end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
