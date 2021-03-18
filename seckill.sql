/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : seckill

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-03-18 09:27:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sk_goods
-- ----------------------------
DROP TABLE IF EXISTS `sk_goods`;
CREATE TABLE `sk_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(30) DEFAULT NULL COMMENT '商品名称',
  `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(64) DEFAULT NULL COMMENT '商品图片',
  `goods_detail` longtext COMMENT '商品详情',
  `goods_price` decimal(10,2) DEFAULT NULL,
  `goods_stock` int DEFAULT '0' COMMENT '商品库存，-1表示没有限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_goods
-- ----------------------------
INSERT INTO `sk_goods` VALUES ('1', 'iphoneX', 'Apple/苹果iPhone X 全网通4G手机苹果X 10', '/img/iphonex.png', 'Apple/苹果iPhone X 全网通4G手机苹果X 10', '7788.00', '100');
INSERT INTO `sk_goods` VALUES ('2', '华为 Mate 10', 'Huawei/华为 Mate 10 6G+128G 全网通4G智能手机', '/img/meta10.png', 'Huawei/华为 Mate 10 6G+128G 全网通4G智能手机', '4199.00', '50');

-- ----------------------------
-- Table structure for sk_goods_seckill
-- ----------------------------
DROP TABLE IF EXISTS `sk_goods_seckill`;
CREATE TABLE `sk_goods_seckill` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀商品id',
  `goods_id` bigint DEFAULT NULL COMMENT '商品id',
  `seckill_price` decimal(10,2) DEFAULT '0.00' COMMENT '秒杀价',
  `stock_count` int DEFAULT NULL COMMENT '库存数量',
  `start_date` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  `version` int DEFAULT NULL COMMENT '并发版本控制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_goods_seckill
-- ----------------------------
INSERT INTO `sk_goods_seckill` VALUES ('1', '1', '0.01', '3', '2018-05-22 17:22:52', '2018-05-22 18:23:00', '8');
INSERT INTO `sk_goods_seckill` VALUES ('2', '2', '0.01', '3', '2018-04-29 22:56:10', '2018-05-01 22:56:15', '5');

-- ----------------------------
-- Table structure for sk_order
-- ----------------------------
DROP TABLE IF EXISTS `sk_order`;
CREATE TABLE `sk_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `goods_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_uid_gid` (`user_id`,`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1502 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_order
-- ----------------------------
INSERT INTO `sk_order` VALUES ('10', '18718185897', '1', '1');
INSERT INTO `sk_order` VALUES ('16', '13652707142', '258978', '1');
INSERT INTO `sk_order` VALUES ('17', '13652707142', '258980', '2');
INSERT INTO `sk_order` VALUES ('1496', '18181818181', '263473', '1');
INSERT INTO `sk_order` VALUES ('1497', '18181818181', '263474', '2');
INSERT INTO `sk_order` VALUES ('1498', '13652707145', '263475', '1');
INSERT INTO `sk_order` VALUES ('1499', '13652707145', '263476', '2');
INSERT INTO `sk_order` VALUES ('1500', '18217272828', '263477', '1');
INSERT INTO `sk_order` VALUES ('1501', '18217272828', '263478', '2');

-- ----------------------------
-- Table structure for sk_order_info
-- ----------------------------
DROP TABLE IF EXISTS `sk_order_info`;
CREATE TABLE `sk_order_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `goods_id` bigint DEFAULT NULL,
  `delivery_addr_id` bigint DEFAULT NULL,
  `goods_name` varchar(30) DEFAULT NULL,
  `goods_count` int DEFAULT NULL,
  `goods_price` decimal(10,2) DEFAULT NULL,
  `order_channel` tinyint DEFAULT NULL COMMENT '订单渠道，1在线，2android，3ios',
  `status` tinyint DEFAULT NULL COMMENT '订单状态，0新建未支付，1已支付，2已发货，3已收货，4已退款，5已完成',
  `create_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263479 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_order_info
-- ----------------------------
INSERT INTO `sk_order_info` VALUES ('10', '18718185897', '1', null, 'iphoneX', '1', '7788.00', '1', '0', '2018-05-29 17:02:00', null);
INSERT INTO `sk_order_info` VALUES ('258978', '13652707142', '1', null, 'iphoneX', '1', '7788.00', '1', '0', '2021-03-08 11:40:01', null);
INSERT INTO `sk_order_info` VALUES ('258979', '1', '1', '1', '1', '1', '1.00', '1', '1', '2021-03-08 19:44:45', null);
INSERT INTO `sk_order_info` VALUES ('258980', '13652707142', '2', null, '华为 Mate 10', '1', '4199.00', '1', '0', '2021-03-08 11:48:58', null);
INSERT INTO `sk_order_info` VALUES ('263473', '18181818181', '1', null, 'iphoneX', '1', '7788.00', '1', '0', '2021-03-08 11:50:49', null);
INSERT INTO `sk_order_info` VALUES ('263474', '18181818181', '2', null, '华为 Mate 10', '1', '4199.00', '1', '0', '2021-03-08 11:51:59', null);
INSERT INTO `sk_order_info` VALUES ('263475', '13652707145', '1', null, 'iphoneX', '1', '7788.00', '1', '0', '2021-03-08 13:32:48', null);
INSERT INTO `sk_order_info` VALUES ('263476', '13652707145', '2', null, '华为 Mate 10', '1', '4199.00', '1', '0', '2021-03-08 13:33:07', null);
INSERT INTO `sk_order_info` VALUES ('263477', '18217272828', '1', null, 'iphoneX', '1', '7788.00', '1', '0', '2021-03-17 18:02:07', null);
INSERT INTO `sk_order_info` VALUES ('263478', '18217272828', '2', null, '华为 Mate 10', '1', '4199.00', '1', '0', '2021-03-17 18:02:25', null);

-- ----------------------------
-- Table structure for sk_user
-- ----------------------------
DROP TABLE IF EXISTS `sk_user`;
CREATE TABLE `sk_user` (
  `id` bigint unsigned NOT NULL COMMENT '用户id',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `password` varchar(32) DEFAULT NULL COMMENT 'MD5(MD5(pass明文+固定salt)+salt',
  `salt` varchar(10) DEFAULT NULL COMMENT '混淆盐',
  `head` varchar(128) DEFAULT NULL COMMENT '头像，云存储的ID',
  `register_date` datetime DEFAULT NULL COMMENT '注册时间',
  `last_login_date` datetime DEFAULT NULL COMMENT '上次登录时间',
  `login_count` int DEFAULT NULL COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_user
-- ----------------------------
INSERT INTO `sk_user` VALUES ('13652707142', 'mzl', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', null, '2021-03-08 17:17:24', '2021-03-08 17:17:27', '1');
INSERT INTO `sk_user` VALUES ('13652707143', 'mzl', 'a69eead8138f909fe5b79e9f95971a82', '1a2b3c4d', null, '2021-03-08 13:30:47', '2021-03-08 13:30:47', '1');
INSERT INTO `sk_user` VALUES ('13652707145', '18181818181', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', null, '2021-03-08 13:32:24', '2021-03-08 13:32:24', '1');
INSERT INTO `sk_user` VALUES ('13652707146', 'lisi', 'a69eead8138f909fe5b79e9f95971a82', '1a2b3c4d', null, '2021-03-08 13:29:17', '2021-03-08 13:29:17', '1');
INSERT INTO `sk_user` VALUES ('18181818181', 'jesper', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', null, '2018-05-21 21:10:21', '2018-05-21 21:10:25', '1');
INSERT INTO `sk_user` VALUES ('18217272828', 'jesper', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', null, '2018-05-21 21:10:21', '2018-05-21 21:10:25', '1');
