/*
 Navicat Premium Data Transfer

 Source Server         : Melody
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 06/05/2019 18:08:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `modify_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, '是吗？', 1, 12, 1556808875493, 1556808875493);
INSERT INTO `comments` VALUES (10, '多发点沙发上', 1, 15, 1556953439302, 1556953439302);
INSERT INTO `comments` VALUES (3, '哈哈', 1, 12, 1556809243993, 1556809243993);
INSERT INTO `comments` VALUES (4, '???', 1, 12, 1556809252691, 1556809956812);
INSERT INTO `comments` VALUES (9, '发嘎嘎', 1, 17, 1556953391566, 1556953391566);
INSERT INTO `comments` VALUES (6, '看下有没有bug', 1, 12, 1556809267406, 1556809267406);
INSERT INTO `comments` VALUES (7, '没有的话就继续下一个', 1, 12, 1556809277995, 1556809277995);
INSERT INTO `comments` VALUES (8, '暂时没有，拜拜呢', 1, 12, 1556809288205, 1556809288205);
INSERT INTO `comments` VALUES (11, '是电话覅水电费', 1, 7, 1556953491361, 1556953491361);
INSERT INTO `comments` VALUES (12, '大法师打发', 1, 7, 1556953582468, 1556953582468);
INSERT INTO `comments` VALUES (13, '大事发生', 1, 7, 1556953648865, 1556953648865);
INSERT INTO `comments` VALUES (14, '不知道是不是这样', 1, 7, 1556953763627, 1556953763627);
INSERT INTO `comments` VALUES (15, '发生的发生的', 1, 7, 1556953824233, 1556953824233);
INSERT INTO `comments` VALUES (16, '是吗', 1, 7, 1556953828216, 1556953828216);
INSERT INTO `comments` VALUES (17, '测试一下', 1, 17, 1556953837169, 1556953837169);
INSERT INTO `comments` VALUES (18, '可以了', 1, 2, 1556953843328, 1556953843328);
INSERT INTO `comments` VALUES (19, '不知道呢', 1, 11, 1556953850266, 1556953850266);
INSERT INTO `comments` VALUES (20, '哈哈哈哈哈', 1, 6, 1556953856210, 1556953856210);
INSERT INTO `comments` VALUES (21, '发收款号', 1, 20, 1556954282602, 1556954282602);
INSERT INTO `comments` VALUES (22, '发生的范围', 1, 20, 1556954285259, 1556954285259);
INSERT INTO `comments` VALUES (23, '范德萨发生大发', 1, 6, 1556954932168, 1556954932168);
INSERT INTO `comments` VALUES (24, 'hdosafkjefkuwehf', 12, 21, 1556959352999, 1556959352999);
INSERT INTO `comments` VALUES (25, 'wogengbfkjaskdfasd', 12, 21, 1556959357904, 1556959357904);
INSERT INTO `comments` VALUES (26, 'hsidfais', 12, 22, 1556959596247, 1556959596247);
INSERT INTO `comments` VALUES (27, '好的嘛', 13, 1, 1557037010071, 1557037010071);
INSERT INTO `comments` VALUES (28, '好像都可以了', 13, 25, 1557048974703, 1557048974703);
INSERT INTO `comments` VALUES (29, '哈哈哈', 13, 6, 1557049007287, 1557049007287);
INSERT INTO `comments` VALUES (30, '大都市', 13, 5, 1557134069813, 1557134069813);

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES (1, 'test', '是不是忘了自己没钱了？', 3, '2019-05-02 03:20:40', '2019-05-02 03:20:40');
INSERT INTO `topics` VALUES (2, 'test', '是不是忘了自己没钱了？', 3, '2019-05-02 03:21:59', '2019-05-02 03:21:59');
INSERT INTO `topics` VALUES (3, '足够强大', '强大到我可以撑起所有', 3, '2019-05-02 03:23:06', '2019-05-02 04:33:39');
INSERT INTO `topics` VALUES (11, '强大1', '我足够强大，强大到我可以撑起所有', 1, '2019-05-02 10:28:39', '2019-05-02 10:28:39');
INSERT INTO `topics` VALUES (5, 'test1', '是不是忘了自己没钱了？', 3, '2019-05-02 03:37:54', '2019-05-02 03:37:54');
INSERT INTO `topics` VALUES (6, '是不是忘了自己没钱了？', '没有', 3, '2019-05-02 03:38:09', '2019-05-02 03:38:09');
INSERT INTO `topics` VALUES (7, '我不累', '我还好', 3, '2019-05-02 03:38:24', '2019-05-02 03:38:24');
INSERT INTO `topics` VALUES (8, '我只能努力', '我还好', 3, '2019-05-02 03:38:35', '2019-05-02 03:38:35');
INSERT INTO `topics` VALUES (9, '没事', '我足够强大', 3, '2019-05-02 03:38:50', '2019-05-02 03:38:50');
INSERT INTO `topics` VALUES (12, '强大2', '我足够强大，强大到我可以撑起所有', 1, '2019-05-02 10:28:44', '2019-05-02 10:28:44');
INSERT INTO `topics` VALUES (13, '足够强大', '强大到我可以撑起所有', 1, '2019-05-02 10:28:47', '2019-05-02 10:33:28');
INSERT INTO `topics` VALUES (15, '我也不知道', '所以也就随便试试', 1, '2019-05-04 12:17:17', '2019-05-04 12:17:17');
INSERT INTO `topics` VALUES (16, '随便写点什么', '随便写点什么', 1, '2019-05-04 02:20:39', '2019-05-04 02:20:39');
INSERT INTO `topics` VALUES (23, '多发的发生', '大额发慰问发', 1, '2019-05-05 12:35:27', '2019-05-05 12:35:27');
INSERT INTO `topics` VALUES (20, '达尔文发违法', '大厦额噶尔噶尔法师打发斯蒂芬发货速度讲课费哈是的法师打发八十第四风机卡上地方开始的疯狂大，你是看见的罚款司法解释单卡介绍的浩丰科技按时地方', 1, '2019-05-04 03:17:57', '2019-05-04 03:28:44');
INSERT INTO `topics` VALUES (22, 'cefasdf1111', 'dfawefawevasfsd', 12, '2019-05-04 04:43:02', '2019-05-04 04:46:31');
INSERT INTO `topics` VALUES (25, '哈哈哈哈哈？？？', '基本功能都实现啦', 13, '2019-05-05 05:36:07', '2019-05-05 05:36:25');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gender` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (13, 'zs@zs.com', '14e1b600b1fd579f47433b88e8d85291', 'zs@zs.com', '张三啊？不知道', 'default_avatar.png', 1, '2019-05-05 12:37:42', '2019-05-06 06:02:42');
INSERT INTO `users` VALUES (2, 'zs1@zs.com', '14e1b600b1fd579f47433b88e8d85291', 'zs1@zs.com', '张三', 'default_avatar.png', 1, '2019-05-02 12:05:04', '2019-05-03 12:18:17');
INSERT INTO `users` VALUES (3, 'zs2@zs.com', '14e1b600b1fd579f47433b88e8d85291', 'zs2@zs.com', '张三1', 'default_avatar.png', 1, '2019-05-02 12:05:29', '2019-05-03 12:18:17');
INSERT INTO `users` VALUES (4, 'zs4@zs.com', '14e1b600b1fd579f47433b88e8d85291', 'zs3@zs.com', '张三2', 'default_avatar.png', 1, '2019-05-02 11:48:24', '2019-05-03 12:18:17');
INSERT INTO `users` VALUES (7, 'zs6@zs.com', '14e1b600b1fd579f47433b88e8d85291', 'zs4@zs.com', '张三？', 'default_avatar.png', 0, '2019-05-02 11:48:51', '2019-05-03 12:39:38');
INSERT INTO `users` VALUES (8, 'lll@qq.com', '14e1b600b1fd579f47433b88e8d85291', 'lll@qq.com', 'lll', 'default_avatar.png', 0, '2019-05-03 11:49:12', '2019-05-03 11:49:12');
INSERT INTO `users` VALUES (9, '1234@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1234@qq.com', 'melody_', 'default_avatar.png', 0, '2019-05-03 11:50:15', '2019-05-03 11:50:15');
INSERT INTO `users` VALUES (10, 'heufahe@126.com', '14e1b600b1fd579f47433b88e8d85291', 'heufahe@126.com', 'klll', 'default_avatar.png', 0, '2019-05-04 10:10:40', '2019-05-04 10:10:40');
INSERT INTO `users` VALUES (11, 'lyx@qq.com', '14e1b600b1fd579f47433b88e8d85291', 'lyx@qq.com', 'lyx666', 'default_avatar.png', 1, '2019-05-04 04:40:02', '2019-05-05 05:23:50');
INSERT INTO `users` VALUES (12, 'lll@125.com', '14e1b600b1fd579f47433b88e8d85291', 'lll@125.com', 'test', 'default_avatar.png', 0, '2019-05-04 04:42:09', '2019-05-04 04:42:09');

SET FOREIGN_KEY_CHECKS = 1;
