/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : ssm_fruitshop

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 17/06/2023 17:27:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (7, 3, 35, '真的很不错', '2018-03-20 19:23:03');
INSERT INTO `comment` VALUES (8, 3, 28, '真好吃', '2018-03-20 19:32:31');
INSERT INTO `comment` VALUES (9, 10, 57, '烂了好多', '2023-06-04 17:18:58');
INSERT INTO `comment` VALUES (10, 10, 58, '好得很', '2023-06-08 16:26:43');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scNum` int NULL DEFAULT NULL COMMENT '收藏数',
  `gmNum` int NULL DEFAULT NULL COMMENT '购买数',
  `url1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pam1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数1',
  `pam2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数2',
  `pam3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数3',
  `val3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值3',
  `val2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值2',
  `val1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值1',
  `type` int NULL DEFAULT NULL,
  `zk` int NULL DEFAULT NULL COMMENT '折扣',
  `category_id_one` int NULL DEFAULT NULL COMMENT '类别id',
  `category_id_two` int NULL DEFAULT NULL COMMENT '类别2级',
  `isDelete` int NULL DEFAULT NULL COMMENT '0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (32, '现货突尼斯软籽石榴2个超大果软子甜酸石榴新鲜水果非蒙自石榴', '99', 0, 10, '\\test1_war_exploded\\resource\\ueditor\\upload\\92cc7a902c2011e865b6dc2da7582a7aTB1a7xUdUR1BeNjy0FmXXb0wVXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92ccefc02c2011e865b6dc2da7582a7aTB2GV6ld7fb_uJjSsD4XXaqiFXa_!!3206065077.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92cd8c002c2011e865b6dc2da7582a7aTB2J81_nf2H8KJjy0FcXXaDlFXa_!!3206065077.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92ce01302c2011e865b6dc2da7582a7aTB2oM1InmYH8KJjSspdXXcRgVXa_!!3206065077.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92ce76602c2011e865b6dc2da7582a7aTB29bjrngLD8KJjSszeXXaGRpXa_!!3206065077.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/8bbe4bc02c2011e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/><img src=\"/test1_war_exploded/resource/ueditor/upload/8d8947c02c2011e865b6dc2da7582a7a2.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/8fd310b02c2011e865b6dc2da7582a7a77.jpg\" title=\"\" alt=\"77.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 71, 72, 1);
INSERT INTO `item` VALUES (33, '荥阳突尼斯陈氏河阴软籽石榴软子新鲜水果非会理蒙自临潼甜新鲜', '80', 1, 0, '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb3b2e02c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb6e7302c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb75c602c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb7d1902c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb86dd02c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/dbbc33802c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 71, 72, 1);
INSERT INTO `item` VALUES (34, '正宗陕西红心石榴水果新鲜', '85', 0, 4, '\\test1_war_exploded\\resource\\ueditor\\upload\\012eb0202c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\012f25502c2111e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\012fc1902c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\013036c02c2111e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\0130abf02c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/004f73b02c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg\" title=\"\" alt=\"TB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 71, 72, 1);
INSERT INTO `item` VALUES (35, '新鲜油桃5斤 新鲜孕妇水果非水蜜桃黄桃毛桃子樱桃当季时令鲜果', '25', 0, 8, '\\test1_war_exploded\\resource\\ueditor\\upload\\4152abc02c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\41536f102c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\41540b502c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\415459702c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\4154cea02c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/407173802c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 73, 74, 1);
INSERT INTO `item` VALUES (36, '现摘3斤 桃子水蜜桃 新鲜水果包邮脆桃硬桃现货新摘桃子非油桃黄', '120', 0, 3, '\\test1_war_exploded\\resource\\ueditor\\upload\\88b583202c2111e865b6dc2da7582a7aTB2faFrcFGWBuNjy0FbXXb4sXXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b5f8502c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b66d802c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b6e2b02c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b77ef02c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/87d387902c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 73, 74, 1);
INSERT INTO `item` VALUES (42, '西瓜', '10', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\023d83f0f7c411ed8f64fb17bb2b05cd1ade94711e1211e9936ad30551702ca89615d3a9ac145959.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\023dd210f7c411ed8f64fb17bb2b05cd1ade94721e1211e9936ad30551702ca8ca499b14e199ba03.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\023dd211f7c411ed8f64fb17bb2b05cd1ade94701e1211e9936ad30551702ca8b35d4700847e4c85.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\02401c00f7c411ed8f64fb17bb2b05cd1ae23df01e1211e9936ad30551702ca8d9b93d2080783650.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\024c5100f7c411ed8f64fb17bb2b05cd1ad67e201e1211e9936ad30551702ca82cee0cedcfaec62a (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 75, 76, 1);
INSERT INTO `item` VALUES (52, '爆甜】黄心大油桃5斤3斤新鲜孕妇水果当季黄肉油桃子整箱油桃批发', '13.99', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\93470f60fa0d11ed35aef9ca57d98bbd1684917054622.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\93473670fa0d11ed35aef9ca57d98bbd1684917048118.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\93473671fa0d11ed35aef9ca57d98bbd1684917043511.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\9354f210fa0d11ed35aef9ca57d98bbd1684917039322.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\9358e9b0fa0d11ed35aef9ca57d98bbd1684917036035.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\917f6ec0fa0d11ed35aef9ca57d98bbd1684917033351.jpg\" title=\"\" alt=\"1684917033351.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 73, 91, 1);
INSERT INTO `item` VALUES (53, '山东普罗旺斯西红柿新鲜自然熟水果柿子沙瓤番茄农家蔬菜1/5斤装', '13.5', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\2b4c72f0fa0e11ed35aef9ca57d98bbd1684917340627.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\2b4c9a00fa0e11ed35aef9ca57d98bbd1684917342556.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\2b4cc110fa0e11ed35aef9ca57d98bbd1684917344477.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\2b4cc111fa0e11ed35aef9ca57d98bbd1684917346489.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\2b4ce820fa0e11ed35aef9ca57d98bbd1684917348462.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\297234b0fa0e11ed35aef9ca57d98bbd1684917366357.jpg\" title=\"\" alt=\"1684917366357.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 92, 93, 1);
INSERT INTO `item` VALUES (54, '【活动中】正宗当季非妃子笑荔枝新鲜现摘黑叶一整箱6斤装大果', '28.8', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\c2b6b270fad311ed6e27c54fd6989f531685002180478.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\c2b6d980fad311ed6e27c54fd6989f531685002182407.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\c2b70090fad311ed6e27c54fd6989f531685002185420.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\c2c3f8e0fad311ed6e27c54fd6989f531685002187453.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\c2c41ff0fad311ed6e27c54fd6989f531685002189456.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\c0fb1fc0fad311ed6e27c54fd6989f531685002191608.jpg\" title=\"\" alt=\"1685002191608.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 94, 95, 1);
INSERT INTO `item` VALUES (56, '【精品】现摘沃柑广西武鸣新鲜水果超甜薄皮桔子非丑橘耙耙柑批发九到十斤装', '21.8', 1, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\ff3d5550ffb011ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ff3d7c60ffb011ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ff3dca80ffb011ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ff3df190ffb011ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ff3df191ffb011ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\fcfbf0d0ffb011ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 101, 104, 0);
INSERT INTO `item` VALUES (57, '【正宗】麻阳冰糖橙10斤特级大果当季超甜橙子包邮批发新鲜水果', '34.5', 1, 2, '/test1_war_exploded\\resource\\ueditor\\upload\\5392bae0ffb211ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\5392e1f0ffb211ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\5392e1f1ffb211ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\53930900ffb211ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\53930901ffb211ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\4fb92a30ffb211ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\5183d810ffb211ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 101, 105, 0);
INSERT INTO `item` VALUES (58, '【精品】9-10斤装四川正宗爱媛38号晚熟果冻橙新鲜孕妇水果当季橙子甜柑橘', '46.9', 0, 1, '/test1_war_exploded\\resource\\ueditor\\upload\\1f3b4400ffb311ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1f3b4401ffb311ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1f3b6b10ffb311ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1f3b9220ffb311ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1f3b9221ffb311ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\19fbbab0ffb311ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\1b8a22e0ffb311ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 101, 107, 0);
INSERT INTO `item` VALUES (59, '【现摘现发】买3斤送3斤共发6斤烟台大樱桃车厘子新鲜水果山东国产孕妇大果整箱批发', '86', 1, 1, '/test1_war_exploded\\resource\\ueditor\\upload\\82a08460ffb311ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\82a08461ffb311ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\82a0ab70ffb311ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\82a0d280ffb311ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\82a0d281ffb311ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\7f3e94b0ffb311ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\817a2cd0ffb311ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 102, 106, 0);
INSERT INTO `item` VALUES (60, '【精品4斤装】茉莉香非玫瑰香葡萄郁金香着色香东北新鲜现摘水果产地直发非提子', '62.1', 1, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\f9b5e630ffb311ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\f9b60d40ffb311ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\f9b60d41ffb311ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\f9b63450ffb311ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\f9b65b60ffb311ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\f71068b0ffb311ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\f8986840ffb311ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 103, 108, 0);
INSERT INTO `item` VALUES (61, '【特惠5-6斤】特小凤黄心西瓜新鲜现摘现发富硒黄瓤西瓜水果当季整箱非4k麒麟瓜', '26.78', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\720cefc0ffb411ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\720cefc1ffb411ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\720d16d0ffb411ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\720d3de0ffb411ede8de6d1d205588ed6.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\720d3de1ffb411ede8de6d1d205588ed7.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\6be8d2d0ffb411ede8de6d1d205588ed4.jpg\" title=\"\" alt=\"4.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\6dc13c50ffb411ede8de6d1d205588ed5.jpg\" title=\"\" alt=\"5.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 98, 99, 0);
INSERT INTO `item` VALUES (62, '【超值5斤装】羊角蜜甜瓜新鲜应季水果薄皮蜜瓜脆甜香瓜羊角脆整箱', '35.9', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\ee2ee400ffb411ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ee2f0b10ffb411ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ee2f3220ffb411ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ee2f3221ffb411ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\ee2f5930ffb411ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\e97af8e0ffb411ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\eb1f0bf0ffb411ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 98, 100, 0);
INSERT INTO `item` VALUES (63, '【10斤超值】山东烟台红富士栖霞苹果水果吃的新鲜现摘脆甜一级当季整箱批发', '62.21', 1, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\5a67a9e0ffb511ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\5a67d0f0ffb511ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\5a67d0f1ffb511ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\5a67f800ffb511ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\5a67f801ffb511ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\51f1d4c0ffb511ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\53a1a7a0ffb511ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 102, 109, 0);
INSERT INTO `item` VALUES (64, '【超爆甜10斤】黄河蜜瓜新鲜民勤沙漠冰糖黄金甜瓜现摘应季水果香瓜', '33.91', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\1c8bad00ffb611ede8de6d1d205588ed1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1c8bad01ffb611ede8de6d1d205588ed2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1c8bd410ffb611ede8de6d1d205588ed3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1c8bfb20ffb611ede8de6d1d205588ed4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1c8bfb21ffb611ede8de6d1d205588ed5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\19341d90ffb611ede8de6d1d205588ed6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\1a5ebae0ffb611ede8de6d1d205588ed7.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 98, 110, 0);
INSERT INTO `item` VALUES (65, '【超值】新鲜芒果大青芒新鲜水果10斤包邮当季整箱应季特大甜心芒青皮整箱', '32.15', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\465248c0013b11ee0e5248e8ad71cccf1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\465248c1013b11ee0e5248e8ad71cccf2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\46526fd0013b11ee0e5248e8ad71cccf3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\46607990013b11ee0e5248e8ad71cccf4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\46607991013b11ee0e5248e8ad71cccf5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\43d49e90013b11ee0e5248e8ad71cccf6.jpg\" title=\"\" alt=\"6.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 111, 112, 0);
INSERT INTO `item` VALUES (66, '【沙漠种植5斤装】新鲜人参果甘肃民勤人生果长寿果新鲜孕妇清甜水果', '43.92', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\02723a10013c11ee0e5248e8ad71cccf1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\02726120013c11ee0e5248e8ad71cccf2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\02726121013c11ee0e5248e8ad71cccf3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\02728830013c11ee0e5248e8ad71cccf5.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0272d650013c11ee0e5248e8ad71cccf6.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\ebe0f1b0013b11ee0e5248e8ad71cccf4.jpg\" title=\"\" alt=\"4.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\fc340570013b11ee0e5248e8ad71cccf7.jpg\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 102, 113, 0);
INSERT INTO `item` VALUES (67, '【精选10斤大果】特价海南金煌芒果水仙芒甜心芒应季新鲜热带水果', '48.81', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\94a6a9c0013c11ee0e5248e8ad71cccf1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\94a6f7e0013c11ee0e5248e8ad71cccf2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\94a71ef0013c11ee0e5248e8ad71cccf3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\94a71ef1013c11ee0e5248e8ad71cccf4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\94a74600013c11ee0e5248e8ad71cccf5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\8ab16090013c11ee0e5248e8ad71cccf6.jpg\"/></p><p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\8ab2c020013c11ee0e5248e8ad71cccf7.jpg\"/></p><p><br/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 111, 114, 0);
INSERT INTO `item` VALUES (68, '【秒杀价10斤装】新西兰阳光金果黄金奇异果水果进口黄心猕猴桃佳沛金奇异果全球购', '85.9', 2, 1, '/test1_war_exploded\\resource\\ueditor\\upload\\0f9de430013e11ee0e5248e8ad71cccf1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0f9de431013e11ee0e5248e8ad71cccf2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0f9e3250013e11ee0e5248e8ad71cccf3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0f9e5960013e11ee0e5248e8ad71cccf4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0f9e5961013e11ee0e5248e8ad71cccf5.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\05100480013e11ee0e5248e8ad71cccf6.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\08632720013e11ee0e5248e8ad71cccf7.jpg\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 103, 115, 0);
INSERT INTO `item` VALUES (69, '【特卖】云南土豆新鲜现挖红皮黄心土豆10斤小土豆种子洋芋农家自种批发', '31.59', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\037a493002c611eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\037a493102c611eeac67a1c69149d0475.png', '/test1_war_exploded\\resource\\ueditor\\upload\\037da49002c611eeac67a1c69149d0476.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\037dcba002c611eeac67a1c69149d0477.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\037df2b002c611eeac67a1c69149d0474.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\007f7fc002c611eeac67a1c69149d0472.jpg\" title=\"\" alt=\"2.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\023c991002c611eeac67a1c69149d0473.jpg\" title=\"\" alt=\"3.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 116, 117, 0);
INSERT INTO `item` VALUES (70, '【9斤精选大果】甘肃2023定西新土豆白皮白心沙面粉糯爆皮土豆现挖马铃薯洋芋蔬菜', '72.52', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\6cba8f9002c611eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\6cbab6a002c611eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\6cbab6a102c611eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\6cc3693002c611eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\6cc69d8002c611eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\698d1d6002c611eeac67a1c69149d0476.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\6b28a4f002c611eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 116, 118, 0);
INSERT INTO `item` VALUES (71, '【6斤】上海青菜小油菜小青菜新鲜蔬菜农家自种小白菜火锅青菜现摘现发', '26.82', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\da3e4c0002c611eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\da3e4c0102c611eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\da3e731002c611eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\da40e41002c611eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\da410b2002c611eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\d6dcf89002c611eeac67a1c69149d0476.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\d90d461002c611eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 119, 120, 0);
INSERT INTO `item` VALUES (72, '【顺丰包邮】5斤新鲜西芹大棵半叶西洋芹菜绿色香芹蔬菜榨汁嫩心香芹', '33.06', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\40fe502002c711eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\40fe9e4002c711eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\41015d6002c711eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\4101847002c711eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\4101847102c711eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\3cdf791002c711eeac67a1c69149d0476.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\3e95dba002c711eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 119, 121, 0);
INSERT INTO `item` VALUES (73, '【爆脆】小黄瓜新鲜现摘5斤水果黄瓜生吃清脆无刺荷兰小青瓜5斤当季蔬菜', '27.11', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\b2f1268002c711eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b2f14d9002c711eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b2f174a002c711eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b2f19bb002c711eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b2f19bb102c711eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\afed5c6002c711eeac67a1c69149d0476.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\b16b70e002c711eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 122, 123, 0);
INSERT INTO `item` VALUES (74, '【超值5斤】山东普罗旺斯生吃西红柿 新鲜沙瓤大番茄自燃熟水果粉柿子', '26.62', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\0c5b2a4002c811eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0c5b515002c811eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0c5b515102c811eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0c5b786002c811eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\0c5e5e9002c811eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\0838f7d002c811eeac67a1c69149d0476.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\09cb309002c811eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 122, 124, 0);
INSERT INTO `item` VALUES (75, '【10斤超爽】云南西红柿新鲜生吃现摘自然熟小番茄时令水果蔬菜沙瓤特价批发', '27.72', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\74b0746002c811eeac67a1c69149d0471.png', '/test1_war_exploded\\resource\\ueditor\\upload\\74b09b7002c811eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\74b0c28002c811eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\74b0c28102c811eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\74b0e99002c811eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\7014cc3002c811eeac67a1c69149d0476.png\" title=\"\" alt=\"6.png\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\7200e4c002c811eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 122, 125, 0);
INSERT INTO `item` VALUES (76, '【超级补贴10斤】云南红心木瓜新鲜水果冰糖心木瓜批发熟果超甜大果', '48.42', 0, 0, '/test1_war_exploded\\resource\\ueditor\\upload\\06c267f002c911eeac67a1c69149d0471.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\06c28f0002c911eeac67a1c69149d0472.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\06c2b61002c911eeac67a1c69149d0473.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\06c59c4002c911eeac67a1c69149d0474.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\06c686a002c911eeac67a1c69149d0475.jpg', '<p><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\04627ef002c911eeac67a1c69149d0476.jpg\" title=\"\" alt=\"6.jpg\"/><img src=\"/test1_war_exploded\\resource\\ueditor\\upload\\05cbd2f002c911eeac67a1c69149d0477.jpg\" title=\"\" alt=\"7.jpg\"/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 122, 126, 0);

-- ----------------------------
-- Table structure for item_category
-- ----------------------------
DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int NULL DEFAULT NULL,
  `isDelete` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_category
-- ----------------------------
INSERT INTO `item_category` VALUES (69, '梨', NULL, 1);
INSERT INTO `item_category` VALUES (70, '湾里酥梨', 69, 1);
INSERT INTO `item_category` VALUES (71, '石榴', NULL, 1);
INSERT INTO `item_category` VALUES (72, '肖山御石榴', 71, 1);
INSERT INTO `item_category` VALUES (73, '桃子', NULL, 1);
INSERT INTO `item_category` VALUES (74, '史德镇御桃', 73, 1);
INSERT INTO `item_category` VALUES (80, '菠菜', NULL, 1);
INSERT INTO `item_category` VALUES (82, '香蕉', NULL, 1);
INSERT INTO `item_category` VALUES (83, '菠萝', NULL, 1);
INSERT INTO `item_category` VALUES (84, '橙子', NULL, 1);
INSERT INTO `item_category` VALUES (86, '西瓜', NULL, 1);
INSERT INTO `item_category` VALUES (88, '芭蕉', 82, 1);
INSERT INTO `item_category` VALUES (90, '黄心西瓜', 86, 1);
INSERT INTO `item_category` VALUES (91, '黄心大油桃', 73, 1);
INSERT INTO `item_category` VALUES (92, '西红柿', NULL, 1);
INSERT INTO `item_category` VALUES (93, '山东普罗旺斯西红柿', 92, 1);
INSERT INTO `item_category` VALUES (94, '荔枝', NULL, 1);
INSERT INTO `item_category` VALUES (95, '妃子笑荔枝', 94, 1);
INSERT INTO `item_category` VALUES (96, '甜瓜', NULL, 1);
INSERT INTO `item_category` VALUES (97, '羊角蜜甜瓜', 96, 1);
INSERT INTO `item_category` VALUES (98, '瓜果类', NULL, 0);
INSERT INTO `item_category` VALUES (99, '黄心西瓜', 98, 0);
INSERT INTO `item_category` VALUES (100, '羊角蜜甜瓜', 98, 0);
INSERT INTO `item_category` VALUES (101, '柑橘类', NULL, 0);
INSERT INTO `item_category` VALUES (102, '核果类', NULL, 0);
INSERT INTO `item_category` VALUES (103, '浆果类', NULL, 0);
INSERT INTO `item_category` VALUES (104, '广西沃柑', 101, 0);
INSERT INTO `item_category` VALUES (105, '麻阳冰糖橙', 101, 0);
INSERT INTO `item_category` VALUES (106, '山东烟台大樱桃', 102, 0);
INSERT INTO `item_category` VALUES (107, '四川正宗爱媛38号晚熟果冻橙', 101, 0);
INSERT INTO `item_category` VALUES (108, '茉莉香葡萄', 103, 0);
INSERT INTO `item_category` VALUES (109, '山东烟台红富士苹果', 102, 0);
INSERT INTO `item_category` VALUES (110, '黄河蜜瓜', 98, 0);
INSERT INTO `item_category` VALUES (111, '热带水果', NULL, 0);
INSERT INTO `item_category` VALUES (112, '芒果大青芒', 111, 0);
INSERT INTO `item_category` VALUES (113, '人参果', 102, 0);
INSERT INTO `item_category` VALUES (114, '水仙芒', 111, 0);
INSERT INTO `item_category` VALUES (115, '进口黄心猕猴桃', 103, 0);
INSERT INTO `item_category` VALUES (116, '茎菜类', NULL, 0);
INSERT INTO `item_category` VALUES (117, '云南土豆', 116, 0);
INSERT INTO `item_category` VALUES (118, '甘肃2023定西新土豆', 116, 0);
INSERT INTO `item_category` VALUES (119, '叶菜类', NULL, 0);
INSERT INTO `item_category` VALUES (120, '上海青', 119, 0);
INSERT INTO `item_category` VALUES (121, '山东西芹', 119, 0);
INSERT INTO `item_category` VALUES (122, '果菜类', NULL, 0);
INSERT INTO `item_category` VALUES (123, '小黄瓜', 122, 0);
INSERT INTO `item_category` VALUES (124, '山东普罗旺斯西红柿', 122, 0);
INSERT INTO `item_category` VALUES (125, '云南西红柿', 122, 0);
INSERT INTO `item_category` VALUES (126, '云南红心木瓜', 122, 0);

-- ----------------------------
-- Table structure for item_order
-- ----------------------------
DROP TABLE IF EXISTS `item_order`;
CREATE TABLE `item_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addTime` datetime NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isDelete` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '0.新建代发货1.已取消 2已已发货3.到收货4已评价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_order
-- ----------------------------
INSERT INTO `item_order` VALUES (27, NULL, 3, '2018032017080001', '2018-03-20 17:08:56', '54.9', 0, 3);
INSERT INTO `item_order` VALUES (28, NULL, 3, '2018032017380001', '2018-03-20 17:38:52', '653.59', 0, 3);
INSERT INTO `item_order` VALUES (29, NULL, 3, '2018032017390001', '2018-03-20 17:39:28', '976.5', 0, 3);
INSERT INTO `item_order` VALUES (30, NULL, 3, '2018032019220001', '2018-03-20 19:22:25', '364.5', 0, 3);
INSERT INTO `item_order` VALUES (31, NULL, 3, '2018032019310001', '2018-03-20 19:31:23', '359.15999999999997', 0, 1);
INSERT INTO `item_order` VALUES (32, NULL, 3, '2018032019310002', '2018-03-20 19:31:50', '59.86', 0, 3);
INSERT INTO `item_order` VALUES (33, NULL, 9, '2023052014160001', '2023-05-20 14:16:19', '25.20', 0, 2);
INSERT INTO `item_order` VALUES (34, 63, 10, '2023052014160002', '2023-06-04 14:50:43', '63.21', 0, 1);
INSERT INTO `item_order` VALUES (35, NULL, 10, '2023060415440001', '2023-06-04 15:44:26', '150.68', 0, 1);
INSERT INTO `item_order` VALUES (36, NULL, 10, '2023060415440002', '2023-06-04 15:44:46', '150.68', 0, 1);
INSERT INTO `item_order` VALUES (37, NULL, 10, '2023060415440003', '2023-06-04 15:44:53', '150.68', 0, 1);
INSERT INTO `item_order` VALUES (38, NULL, 10, '2023060415460001', '2023-06-04 15:46:26', '150.68', 0, 1);
INSERT INTO `item_order` VALUES (39, NULL, 10, '2023060415580001', '2023-06-04 15:58:12', '77.41', 0, 1);
INSERT INTO `item_order` VALUES (40, NULL, 10, '2023060415590001', '2023-06-04 15:59:43', '77.41', 0, 1);
INSERT INTO `item_order` VALUES (41, NULL, 10, '2023060416150001', '2023-06-04 16:15:43', '77.41', 0, 1);
INSERT INTO `item_order` VALUES (42, NULL, 10, '2023060416330001', '2023-06-04 16:33:35', '104.33', 0, 3);
INSERT INTO `item_order` VALUES (43, NULL, 10, '2023060816110001', '2023-06-08 16:11:40', '68.72', 0, 3);

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES (1, 'admin', '111111', '管理员');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (2, '1', '1', '                    \n             1       ');
INSERT INTO `message` VALUES (3, '2', '2', '                    \n             2       ');
INSERT INTO `message` VALUES (4, '陈涛', '114514', '太垃圾了');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `addTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (7, '湖人4换1交易将达成，佩林卡拿首轮签报价顶级射手，堵住漏洞！', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在西决中，湖人已经0-3落后掘金，很多人好奇，此前所向披靡的湖人在掘金这里怎么就一泻千里了呢？美媒将责任推给詹姆斯，认为他过多且低命中率的3分拖累了湖人。其实，詹姆斯也很无奈，湖人在季后赛3分命中率和3分命中率都是16支季后赛球队中倒数的存在。湖人这个阵容里除了里夫斯、八寸再算上沃克，也就只有詹姆斯敢义无反顾的投3分。拉塞尔的低迷，以及哈姆雪藏比斯利，让湖人缺少3分投射点，外线打不开，掘金就果断收缩防线，加上约基奇在内线的威胁力，湖人很难打开局面。毒舌认为，哈姆斯应该尝试让比斯利多打打，即便他的防守糟糕，但在这个联盟，犀利的进攻往往能攻击破顶级的防守，湖人在季后赛的防守效率可以是第一，但是面对进攻第一的掘金，依旧是防不胜防。而如果湖人在西决出局，休赛期引进一名3分神射手将是重中之重。</p><p><img class=\"\" alt=\"湖人4换1交易将达成，佩林卡拿首轮签报价顶级射手，堵住漏洞！\" width=\"660\" height=\"362\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230522/1684769435020025592.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">近日，美媒露天看台爆料了湖人的一则交易传闻。据悉，湖人有意用比斯利、班巴和2027年首轮选秀权为筹码，向印第安纳步行者报价希尔德。其实，本赛季的湖人打出了让球迷惊喜的表现，他们从赛季初的联盟垫底，一路打到了如今的西部决赛。湖人之所以完成了咸鱼翻身，最大的原因就是他们在交易截止日那天完成了4换3交易。湖人用威少以及一个首轮外加两名轮换外的球员，换来了三名即战力，让全联盟刮目相看，补强过后的湖人队仿佛脱胎换骨，一跃成为了争冠级别强队。新加盟的球员在常规赛都打出优异的表现。</p><p><img class=\"\" alt=\"湖人4换1交易将达成，佩林卡拿首轮签报价顶级射手，堵住漏洞！\" width=\"660\" height=\"362\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230522/1684769435074095475.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">但是，来到季后赛后，湖人的问题渐渐暴露，球队阵容远没有到完美的地步，特别是在拉塞尔低迷、比斯利得不到机会后，湖人缺少一个稳定的3分射手。不过，现在湖人拥有不少可以交易的筹码，他们在休赛期的交易市场上依旧可以通过运作，为球队堵住漏洞。而对于接下来球队即将引进的球员，总经理佩林卡也早就有了自己心仪的人选。尽管在威少被交易后，关于湖人和希尔德、特纳之间的交易流言并不多，但是从目前传出的可靠消息来看，佩林卡还是与步行者保持着频繁的联系，湖人希望得到步行者的顶级射手希尔德。</p><p><img class=\"\" alt=\"湖人4换1交易将达成，佩林卡拿首轮签报价顶级射手，堵住漏洞！\" width=\"660\" height=\"367\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230522/1684769435110086185.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">事实上，湖人目前的首发阵容已经足够强大，与掘金的比赛，也是棋差一招，像G3战，湖人在末节一度有赢球的希望，但掘金连中3个3分，但是湖人却没有作出回应的能力，这也直接浇灭了湖人赢球的欲望。希尔德是一位出色的即战力球员，也是联盟顶级的射手，上赛季希尔德在保持42.5%的3分命中率基础上，场均能命中3.6个3分，排在联盟第五个，他的3分极其出色。这对于湖人增强球队阵容深度、丰富战术选择来说有着不少利好。此外，希尔德还有着个人持球突破造杀伤以及串联队友的能力。他与特纳之间的配合，让人们看到了希尔德在组织串联以及和中锋挡拆上的天赋，这也是湖人追逐希尔德的原因之一，在引进希尔德后，湖人内外线的联动将变得更加流畅自然。</p><p><img class=\"\" alt=\"湖人4换1交易将达成，佩林卡拿首轮签报价顶级射手，堵住漏洞！\" width=\"660\" height=\"381\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230522/1684769435172065121.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">对于步行者来说，他们需要尽快完成重建任务。在保罗-乔治离队后，步行者一直没有打出多出色的表现，球队也没有培养出太多优秀的球员。特纳和希尔德是这支球队为数不多的亮点，而之后加盟的哈里伯顿，才是步行者未来的真正核心。不过，在如今强队林立的联盟，步行者在各个位置上的实力都稍显薄弱，因此对于步行者来说，用队内这些有交易价值的即战力去尽可能多地交换重建筹码，才是让球队重新崛起的方法。未来等到哈里伯顿成长起来，配合上手中的选秀权，步行者重回季后赛应该问题不大。比斯利的投射能力同样给球迷们留下了比较深刻的印象，他在三分线外有着出色且稳定的表现。此外，与比斯利一同到来的班巴，可以解决步行者交易特纳后，球队内线缺人的问题，班巴本赛季获得的出场机会不多，</p><p><br/></p>', '2023-05-22 23:31:42');
INSERT INTO `news` VALUES (8, 'NBA今日三大要闻，湖人输得冤，哈登回火箭坐实，纳什要上岗', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">文/水清清</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">北京时间5月24日，在热火与凯尔特人G4开战前，NBA有三大要闻，湖人的G4输得冤，哈登回火箭之事可能要从实，纳什可能要上岗了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">一、湖人G4输得冤。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">詹姆斯的上篮未果，湖人昨天111-113惜败掘金，球队被横扫出局，而今天NBA裁判报告显示，最后两分钟里的三次判罚对湖人均不利，而我想说的是并非本场比赛的判罚问题，而是主教练哈姆。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">哈姆将挑战留到下赛季</p><p><img class=\"\" alt=\"NBA今日三大要闻，湖人输得冤，哈登回火箭坐实，纳什要上岗\" width=\"660\" height=\"452\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230524/1684916853310044942.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">裁判报告显示，比赛还有1分36秒，湖人109-111落后，八村垒防守时干扰约基奇传球，并且是詹姆斯拿到球权，此时，裁判吹罚八村垒脚踢球违例；比赛还有57秒，掘金进攻的乱战之中皮球出界，裁判判罚里夫斯碰球出界，球权归掘金，后续故事球迷皆知，约老师命中关键上篮；28秒处詹姆斯中距离未果，掘金直接进攻，实际为24秒违例应该发边线球。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">至少里夫斯碰球出界，哈姆教练可以挑战，如果挑战成功，很可能改写本场比赛结局，结果他却将挑战一直留到下赛季，如此关键比赛、如此关键回合，他没有选择挑战，这球输得实在太冤了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">二、哈登回火箭坐实。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">不止是76人被淘汰以来，甚至在季后赛还在进行时，坊间就传出过哈登重回火箭之事，而今天贝弗利在接受采访时被问及是否会重回火箭与哈登聚首，贝弗利直言，“我有非常大的可能性在下赛季重回休斯顿”，虽然对于问题本身（哈登回火箭之事）没有正面回答，不过这也是间接的答案了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">哈登与贝弗利齐回火箭？</p><p><img class=\"\" alt=\"NBA今日三大要闻，湖人输得冤，哈登回火箭坐实，纳什要上岗\" width=\"660\" height=\"438\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230524/1684916853498061066.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">需要重点说明一下，贝弗利整个职业生涯以防守见长，如果他要重回休斯顿，说明火箭将在休赛期大有作为，试图重新回归豪强模式，而能够让球队如此决绝，客观预示，哈登回归的可能性愈来愈大。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">三、纳什要上岗了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">风之子纳什，自赛季初离开篮网主帅席位，他已经渐渐淡出球迷视野，而今天，据美媒报道他很可能要上岗了，有望执掌的新球队，猛龙。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">纳斯教练离开猛龙后，主帅之职空缺，而球队目前的现实：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">纳什可能要上岗了</p><p><img class=\"\" alt=\"NBA今日三大要闻，湖人输得冤，哈登回火箭坐实，纳什要上岗\" width=\"660\" height=\"428\" src=\"/test1_war_exploded/ueditor/jsp/upload/image/20230524/1684916853524001593.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1.西亚卡姆和范弗里特等人，休赛期将被诸多球队追逐，巴恩斯们还处于成长期，猛龙很可能进入彻底重建模式。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2.由于半个赛季要在多伦多，就如大多数球星一样，很多主帅从个人意愿上，也不太愿意去异国他乡，所以，猛龙主帅的人选实际有限。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3.最重要的一点，纳什，加拿大的篮球的传奇，如果他能够执掌猛龙，堪称完美之作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; outline: 0px; text-indent: 2em; font-size: 18px; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">好了，不多说，看东决G4吧。</p><p><br/></p>', '2023-05-24 16:27:39');
INSERT INTO `news` VALUES (10, '保罗优先选择联手詹姆斯 愿600万中产签约湖人 也考虑底薪回太阳', '<p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, arial, sans-serif; font-size: 18px; text-indent: 36px; text-wrap: wrap; background-color: rgb(255, 255, 255);\">《亚利桑那体育》记者杜安-兰金最新报道，太阳队已经通知克里斯-保罗，球队管理层会很快做出裁掉他的决定，让他成为自由球员。如果勒布朗-詹姆斯确定留在湖人队，预计会招募保罗到湖人队一起打球，双方很快会见面商谈。</span></p>', '2023-06-08 10:17:08');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '0.未退货 1已退货',
  `num` int NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (54, 27, 27, 0, 1, '1');
INSERT INTO `order_detail` VALUES (55, 32, 28, 0, 5, '25');
INSERT INTO `order_detail` VALUES (56, 27, 28, 0, 3, '9');
INSERT INTO `order_detail` VALUES (57, 28, 28, 0, 1, '1');
INSERT INTO `order_detail` VALUES (58, 35, 29, 0, 2, '4');
INSERT INTO `order_detail` VALUES (59, 34, 29, 0, 4, '16');
INSERT INTO `order_detail` VALUES (60, 32, 29, 0, 3, '9');
INSERT INTO `order_detail` VALUES (61, 36, 29, 0, 3, '9');
INSERT INTO `order_detail` VALUES (62, 32, 29, 0, 2, '4');
INSERT INTO `order_detail` VALUES (63, 35, 30, 0, 6, '36');
INSERT INTO `order_detail` VALUES (64, 30, 30, 0, 3, '9');
INSERT INTO `order_detail` VALUES (65, 28, 31, 0, 4, '16');
INSERT INTO `order_detail` VALUES (66, 28, 31, 0, 2, '4');
INSERT INTO `order_detail` VALUES (67, 28, 32, 0, 1, '1');
INSERT INTO `order_detail` VALUES (68, 31, 33, 0, 1, '25.2');
INSERT INTO `order_detail` VALUES (69, 63, 34, 0, 1, '63.21');
INSERT INTO `order_detail` VALUES (70, 59, 41, 0, 1, '77.41');
INSERT INTO `order_detail` VALUES (71, 58, 42, 0, 1, '42.21');
INSERT INTO `order_detail` VALUES (72, 57, 42, 0, 2, '62.12');
INSERT INTO `order_detail` VALUES (73, 68, 43, 0, 1, '68.72');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (17, 27, 3);
INSERT INTO `sc` VALUES (18, 28, 3);
INSERT INTO `sc` VALUES (21, 68, 10);
INSERT INTO `sc` VALUES (22, 56, 10);
INSERT INTO `sc` VALUES (23, 57, 10);
INSERT INTO `sc` VALUES (24, 60, 10);
INSERT INTO `sc` VALUES (25, 68, 10);

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES (28, 59, 10, 1, 77.41, '77.41');
INSERT INTO `shopcar` VALUES (29, 58, 10, 1, 42.21, '42.22');
INSERT INTO `shopcar` VALUES (30, 65, 10, 1, 32.15, '32.15');
INSERT INTO `shopcar` VALUES (31, 68, 10, 1, 68.72, '68.72');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '2', '3', '4', '1', '3', '22@gmail');
INSERT INTO `user` VALUES (3, 'zs', '111111', '12345678933', '陈涛111', '女', '蔗农林', '123456');
INSERT INTO `user` VALUES (6, 'huang1', '123456', '18888888', '李四', '男', '浙江杭州萧山', '1111@163.com');
INSERT INTO `user` VALUES (9, 'young', '123456', '110', '张三', '男', '浙江农林大学', '123@qq.com');
INSERT INTO `user` VALUES (10, 'zhangsan', '114514', '114514', '张三', '男', '浙江农林大学aa', '114514@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
