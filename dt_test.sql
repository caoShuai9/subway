/*
 Navicat MySQL Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : dt_test

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 31/03/2021 17:12:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `article_user_id` int unsigned DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  `article_content` mediumtext,
  `article_view_count` int DEFAULT '0',
  `article_comment_count` int DEFAULT '0',
  `article_like_count` int DEFAULT '0',
  `article_is_comment` int unsigned DEFAULT NULL,
  `article_status` int unsigned DEFAULT '1',
  `article_type` int DEFAULT NULL COMMENT '文章类别（1，普通新闻，2热点新闻，3失物招领）',
  `article_order` int unsigned DEFAULT NULL,
  `article_update_time` datetime DEFAULT NULL,
  `article_create_time` datetime DEFAULT NULL,
  `article_summary` text,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_user_id` (`article_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='已使用';

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (40, 2, '文章测试文章测试', '<p>文章测试文章测试</p>', 16, 0, 0, 1, 1, 2, 1, '2021-02-25 07:03:15', '2021-02-25 07:03:15', '文章测试文章测试');
INSERT INTO `article` VALUES (47, 1, '大连地铁新规划', '<p><img src=\"/uploads/2021/3/src=http___hbimg(1).jpeg\" alt=\"src=http___hbimg.b0.upaiyun.com_2ea69a618189aa4281d0a7ff807c951ed96b228881641-EJ4SQm_fw658&amp;refer=http___hbimg.b0.upaiyun.jpeg\"></p><p><p>规划1233333333</p></p>', 8, 0, 0, 1, 1, 3, 1, '2021-03-21 10:24:22', '2021-03-21 10:24:22', '规划1233333333');
INSERT INTO `article` VALUES (48, 1, '大连市轨道交通乘客守则', '<p><span>第一条</span>&nbsp;为维护轨道交通乘车秩序，保障轨道交通运营安全，保护乘客和轨道交通运营单位的合法权益，依据《大连市轨道交通条例》等有关法律法规，制定本守则。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第二条</span>&nbsp;凡进入轨道交通出入口通道、站台、站厅、列车车厢等轨道交通设施者均须遵守本守则。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第三条</span>&nbsp;乘客应当遵守以下有关票务管理的规定：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（一）乘客应当持有效车票或者有效证件乘车，一人一票，并接受轨道交通运营单位的票务查验，不得无票、持无效车票、冒用他人乘车证件或者持伪造证件乘车。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（二）乘客应当按照自助机所示步骤购买单程票或者办理储值卡充值业务；需要单程票购票、储值卡充值报销凭证的，应当在办理时一并索取。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（三）单程票仅限一人使用，进站验票，出站收回，当日有效，不予挂失；如逾期使用视为无效车票，如因车票遗失、污染、损坏等情形致使出站时闸机无法收回的，应当按照出闸站线网单程最高票价补交票款。持储值卡乘车，其车费由出站闸机自动扣除。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（四）乘客自本站进出时在付费区内停留时限为30分钟；非本站进出采用分段计时，即2元票价80分钟、3元票价90分钟、4元票价100分钟、5元票价110分钟、6元票价120分钟。超时出站，应当按照出闸站线网单程最高票价补交超时车费，但因轨道交通不能正常运营的除外。超程出站的，即乘客所用车票不足以支付所到达车站的实际车费，应当按照出闸站线网单程最高票价补交超程车费。既超时又超程，应当按照出闸站线网单程最高票价补交车费。乘客因身体健康等自身原因超时超程的，应当向轨道交通运营单位提供相关证据加以证明。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（五）伤残军人、因公致残的人民警察、离休干部可以凭有效证件在车站乘客服务中心办理登记后免费乘车；60周岁以上老人可以持老年优待证办理老年人乘车优惠卡免费或者优惠乘车；残疾人可以持市残疾人联合会统一核发的残疾证办理乘车优待卡免费乘车；市内中小学在校生（含中专、技校），可以办理学生乘车优惠卡优惠乘车。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（六）成年人可以免费携带身高不超过1.3米的儿童乘车；免费携带2名以上身高不超过1.3米儿童乘车的，由车站工作人员帮助乘车。每名乘客可以免费携带重量不超过20公斤、体积不超过0.125立方米、长度不超过1米的物品乘车；携带重量在20公斤以上30公斤以下、体积在0.125立方米以上0.25立方米以下、长度在1米以上1.6米以下的物品乘车，应当再购买一张等额车票，并乘坐升降梯进站乘车；不得携带重量超过30公斤、体积超过0.25立方米、长度超过1.6米的物品乘车。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（七）轨道交通不能正常运营时，乘客可以在当日持单程票到任一车站办理退票或者持储值卡到乘客服务中心免费更正。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>第四条</span>&nbsp;乘客应当遵守以下安全文明进站乘车的规定：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（一）应当配合轨道交通运营单位对其携带的物品进行安全检查；对拒绝接受安全检查的乘客，由轨道交通运营单位报告公安机关依法处理。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（二）禁止携带市公安机关制定的《大连市轨道交通禁止携带物品目录》规定的物品进站乘车。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（三）搭乘自动扶梯应当注意：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.按照自动扶梯运行方向标志步入扶梯，紧握扶手，靠右侧站立，一人站一级扶梯，并将双脚踏在同一梯级上的黄色安全线内；不得在电梯入口范围站立逗留，不得多人挤站同一级扶梯。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.系好鞋带；穿软底凉鞋、高跟鞋、长裙、宽松衣服或者携带物品时，应当避免贴近扶梯边缘。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.携带轮椅、婴儿车的乘客应当使用升降梯，不得使用自动扶梯。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（四）应当按照地面标识在站台安全线内排队候车，禁止在安全区域外行走、坐卧、放置物品、倚靠屏蔽门等不安全行为。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（五）上、下列车时，应当注意列车与站台间的空隙，列车关门提示警铃鸣响时或者警示灯闪烁时，禁止上下车。进出车厢时，不得相互推挤。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（六） 进入列车车厢后，应当坐在座位上或者手扶把手，禁止手扶或者挤靠车门。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（七）主动给老、幼、病、残、孕或者抱小孩的乘客让座。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（八）列车到达终点站，应当全部下车。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（九）精神障碍患者、智力障碍者、行动不便者、学龄前儿童应当在健康成年人的陪护下乘车。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第五条</span>&nbsp;在轨道交通设施范围内禁止下列行为：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（一）在车站、车厢内吸烟，随地吐痰、便溺、吐口香糖，乱扔果皮核、纸屑等废弃物；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（二）在车站、站台、站厅、出入口、通道停放车辆、堆放杂物或者擅自摆摊设点；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（三）擅自进入轨道、隧道或者其他有禁止进入标志的区域；&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（四）攀爬、跨越围墙、护栏、轨道、栏杆、闸机等设施；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（五）阻碍安全门、车门关闭，强行上下车；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（六）在车厢或者轨道交通设施上乱写、乱刻画、乱张贴和悬挂物品；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（七）携带活禽和猫、狗（导盲犬除外）等宠物以及其他可能妨碍轨道交通运营的动物乘车；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（八）在车厢内饮食；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（九）在车站、站台、站厅、出入口、通道等乞讨、捡拾垃圾、卖艺、躺卧、打闹嬉戏，擅自弹奏乐器、播放音乐、散发宣传品；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（十）踩踏车站、车厢内的坐席；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（十一）携带充气气球、运货平板推车、自行车（含折叠式自行车）进站乘车，操控移动、滑翔、飞行的玩具模型及其他物品，施放风筝；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（十二）携带易污损、有严重异味、无包装易碎和尖锐的物品；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（十三）穿着污浊衣物、穿溜冰鞋、踏滑板进站乘车；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（十四）违反法律、法规规定的其他行为。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第六条</span>&nbsp;禁止下列危害轨道交通设施的行为：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（一）非紧急状态下动用紧急装置；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（二）损坏车辆、隧道、轨道、线网、路基、车站、桥梁等设施设备；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（三）损坏和干扰机电设备、电缆和通信信号系统；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（四）污损安全、消防、疏散导向、站牌等标志，防护监视等设备；&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;（五）危害轨道交通设施的其他行为。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第七条</span>&nbsp;轨道交通遭遇突发事件或者因故不能正常运行时，乘客应当保持冷静，服从轨道交通运营单位工作人员的指挥或者按照广播提示有序疏散。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第八条</span>&nbsp;乘客应当自觉遵守本守则，轨道交通运营单位有权对违反本守则的行为予以劝阻和制止，并责令其改正；拒不改正的，依照《大连市轨道交通条例》的相关规定进行处罚或者移交有关机关依法处理。因乘客原因造成轨道交通设施设备损坏的，乘客应当依法承担相应的民事责任。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第九条</span>&nbsp;乘客可以对轨道交通运营服务行为向轨道交通运营单位投诉，但不得影响轨道交通的正常运营；对轨道交通运营单位答复有异议的，可以向轨道交通运营管理机构投诉。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span>第十条</span>&nbsp;本守则自2016年2月1日起施行。</p>', 13, 1, 0, 1, 1, 4, 1, '2021-03-22 14:34:30', '2021-03-22 14:34:30', '第一条&nbsp;为维护轨道交通乘车秩序，保障轨道交通运营安全，保护乘客和轨道交通运营单位的合法权益，依据《大连市轨道交通条例》等有关法律法规，制定本守则。&nbsp;&nbsp;&nbsp;&nbsp;第二条&nbsp;凡进入轨道交通出入口通道、站台、站厅、列车车厢等轨道交通设施者均须遵守本守则。');
INSERT INTO `article` VALUES (67, 1, '124321', 'asfdsa', 1, 0, 0, 1, 1, 3, 1, '2021-03-24 06:14:04', '2021-03-24 06:14:04', 'asfdsa');
INSERT INTO `article` VALUES (49, 1, '测试招领信息', '11223', 0, 0, 0, 1, 1, 3, 1, '2021-03-23 14:31:45', '2021-03-23 14:31:45', '11223');
INSERT INTO `article` VALUES (50, 1, '123456', '123', 0, 0, 0, 1, 1, 3, 1, '2021-03-23 14:33:53', '2021-03-23 14:33:53', '123');
INSERT INTO `article` VALUES (51, 1, '测试文章123', '1234567890', 0, 0, 0, 1, 1, 1, 1, '2021-03-23 16:34:36', '2021-03-23 16:05:32', '1234567890');
INSERT INTO `article` VALUES (52, 1, '测试文章123', '1234567890', 0, 0, 0, 1, 1, NULL, 1, '2021-03-23 16:05:32', '2021-03-23 16:05:32', '1234567890');
INSERT INTO `article` VALUES (53, 1, '测试文章123', '1234567890', 0, 0, 0, 1, 1, NULL, 1, '2021-03-23 16:05:32', '2021-03-23 16:05:32', '1234567890');
INSERT INTO `article` VALUES (66, 1, 'sssssd', 'asas', 0, 0, 0, 1, 1, 3, 1, '2021-03-24 05:39:20', '2021-03-24 05:39:20', 'asas');
INSERT INTO `article` VALUES (63, 1, 'aaaaaaaaaaa', 'sgagfsgfd', 0, 0, 0, 1, 1, 2, 1, '2021-03-24 12:29:54', '2021-03-23 16:44:31', 'sgagfsgfd');
INSERT INTO `article` VALUES (64, 1, 'sssssss', '3263yfsfds', 9, 1, 0, 1, 1, 1, 1, '2021-03-23 16:44:52', '2021-03-23 16:44:52', '3263yfsfds');
INSERT INTO `article` VALUES (65, 1, '12413231', '124312341432', 0, 0, 0, 1, 1, 3, 1, '2021-03-24 05:39:10', '2021-03-24 05:17:26', '124312341432');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment_pid` int unsigned DEFAULT '0',
  `comment_pname` varchar(255) DEFAULT NULL,
  `comment_article_id` int unsigned DEFAULT NULL,
  `comment_author_name` varchar(50) DEFAULT NULL,
  `comment_author_email` varchar(50) DEFAULT NULL,
  `comment_author_url` varchar(50) DEFAULT NULL,
  `comment_author_avatar` varchar(100) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_agent` varchar(200) DEFAULT NULL,
  `comment_ip` varchar(50) DEFAULT NULL,
  `comment_create_time` datetime DEFAULT NULL,
  `comment_role` int DEFAULT NULL,
  `comment_user_id` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, 0, '', 0, '言曌', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', '评论测试', NULL, '0:0:0:0:0:0:0:1', '2017-10-07 16:06:34', 1, 1);
INSERT INTO `comment` VALUES (2, 1, '你好', 0, '言曌', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', '再次测试22', NULL, '0:0:0:0:0:0:0:1', '2017-10-07 16:06:43', 1, 1);
INSERT INTO `comment` VALUES (3, 0, '', 0, '游客', 'youke@aa.com', '', '/img/avatar/avatar3.jpeg', '评论测试', NULL, '0:0:0:0:0:0:0:1', '2017-10-07 16:08:06', 0, 3);
INSERT INTO `comment` VALUES (4, 0, '', 8, '游客', 'youke@aa.com', '', '/img/avatar/avatar3.jpeg', 'Tom来测试', NULL, '0:0:0:0:0:0:0:1', '2017-10-07 16:08:46', 0, 3);
INSERT INTO `comment` VALUES (5, 0, '', 14, '游客', 'youke@aa.com', '', '/img/avatar/avatar3.jpeg', 'Jack来此一游', NULL, '0:0:0:0:0:0:0:1', '2017-10-07 16:09:27', 0, 3);
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '员工id自增主键',
  `user_id` int unsigned NOT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '用户名' COMMENT '用户名',
  `wage` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工资',
  `leader` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '直属领导',
  `begin_time` datetime DEFAULT NULL COMMENT '开始上班时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束上班时间',
  `department` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '员工部门',
  PRIMARY KEY (`employee_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工信息表';

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES (22, 1, 'admin', '3', '2', '1970-01-01 01:50:00', '1970-01-01 07:50:00', '1');
COMMIT;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id自增主键',
  `user_id` int unsigned DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `user_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工资',
  `login_time` datetime DEFAULT NULL COMMENT '开始上班时间',
  PRIMARY KEY (`id`),
  KEY `kf_user_id` (`user_id`),
  CONSTRAINT `kf_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户登录日志表';

-- ----------------------------
-- Records of login_log
-- ----------------------------
BEGIN;
INSERT INTO `login_log` VALUES (1, 1, 'admin', '0:0:0:0:0:0:0:1', '2021-03-31 03:59:49');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_level` int DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_order` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='已使用';

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, '留言板', '/message', 2, 'fa fa-comment', 1);
INSERT INTO `menu` VALUES (2, '乘车须知', '/article/48', 2, 'fa fa-tags', 2);
INSERT INTO `menu` VALUES (3, '关于本站', '/aboutSite', 1, 'fa fa-info', 1);
INSERT INTO `menu` VALUES (6, '线路以及票价查询', '/queSubway', 2, 'fa fa-search', 3);
COMMIT;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_content` varchar(10000) DEFAULT NULL,
  `notice_create_time` datetime DEFAULT NULL,
  `notice_update_time` datetime DEFAULT NULL,
  `notice_status` int unsigned DEFAULT '1',
  `notice_order` int DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
BEGIN;
INSERT INTO `notice` VALUES (4, '地铁停运通知sssssss', '<p>地铁一号线早八点开始停运</p>', '2018-05-26 20:40:50', '2021-03-24 05:39:27', 1, 1);
INSERT INTO `notice` VALUES (6, 'qweqw', 'qweqweqwe', '2021-03-24 05:39:38', '2021-03-24 05:39:38', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` int NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
BEGIN;
INSERT INTO `options` VALUES (1, '大连城市地铁', '您的地铁出行小管家', '为您提供大连地铁出行新动态', '测试', '', '', '', '', '', '', '', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for subway_info
-- ----------------------------
DROP TABLE IF EXISTS `subway_info`;
CREATE TABLE `subway_info` (
  `subway_id` bigint NOT NULL AUTO_INCREMENT COMMENT '地铁线路id',
  `subway_name` varchar(64) NOT NULL COMMENT '地铁线路名称',
  `subway_remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地铁线路备注',
  `starting_time` datetime DEFAULT NULL COMMENT '地铁始发时间',
  `end_time` datetime DEFAULT NULL COMMENT '地铁末班时间',
  PRIMARY KEY (`subway_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='地铁线路信息表';

-- ----------------------------
-- Records of subway_info
-- ----------------------------
BEGIN;
INSERT INTO `subway_info` VALUES (1, '地铁1号线', '一号线介绍信息', '1969-12-31 22:44:00', '1969-12-31 22:44:00');
INSERT INTO `subway_info` VALUES (2, '地铁2号线', '地铁二号线介绍', '1969-12-31 22:44:00', '1969-12-31 22:44:00');
INSERT INTO `subway_info` VALUES (3, '地铁3号线', '地铁二号线介绍', '1969-12-31 22:44:00', '1969-12-31 22:44:00');
INSERT INTO `subway_info` VALUES (4, '地铁3号线支线', '地铁二号线介绍', '1969-12-31 22:44:00', '1969-12-31 22:44:00');
INSERT INTO `subway_info` VALUES (12, '地铁12号线', '地铁二号线介绍', '1969-12-31 22:44:00', '1969-12-31 22:44:00');
COMMIT;

-- ----------------------------
-- Table structure for subway_station_info
-- ----------------------------
DROP TABLE IF EXISTS `subway_station_info`;
CREATE TABLE `subway_station_info` (
  `subway_station_id` bigint NOT NULL AUTO_INCREMENT COMMENT '地铁站点id',
  `subway_station_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地铁站点名称',
  `subway_id` bigint NOT NULL COMMENT '地铁线路id',
  `subway_name` varchar(64) NOT NULL COMMENT '地铁线路名称',
  `if_transfer` varchar(64) NOT NULL COMMENT '是否换乘站',
  `transfer_subway_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '换乘线路id',
  `transfer_subway_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '换乘线路名称',
  `district_name` varchar(255) DEFAULT NULL COMMENT '所在区名称',
  `starting_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '介绍备注',
  `weights` varchar(32) NOT NULL DEFAULT '0' COMMENT '站点权重',
  PRIMARY KEY (`subway_station_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='地铁站点信息表';

-- ----------------------------
-- Records of subway_station_info
-- ----------------------------
BEGIN;
INSERT INTO `subway_station_info` VALUES (1, '姚家', 1, '地铁1号线', '否', '', NULL, '123432334', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '29');
INSERT INTO `subway_station_info` VALUES (2, '大连北站', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '28');
INSERT INTO `subway_station_info` VALUES (3, '华北路', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '27');
INSERT INTO `subway_station_info` VALUES (4, '华南北', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '26');
INSERT INTO `subway_station_info` VALUES (5, '华南广场', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '25');
INSERT INTO `subway_station_info` VALUES (6, '千山路', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '24');
INSERT INTO `subway_station_info` VALUES (8, '松江路', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '23');
INSERT INTO `subway_station_info` VALUES (9, '东纬路', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '22');
INSERT INTO `subway_station_info` VALUES (10, '春柳', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '21');
INSERT INTO `subway_station_info` VALUES (11, '香工街', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '20');
INSERT INTO `subway_station_info` VALUES (12, '中厂街', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '19');
INSERT INTO `subway_station_info` VALUES (14, '兴工街', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '18');
INSERT INTO `subway_station_info` VALUES (15, '西安路', 1, '地铁1号线', '是', '2', '地铁2号线', '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '17');
INSERT INTO `subway_station_info` VALUES (16, '富国街', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '16');
INSERT INTO `subway_station_info` VALUES (17, '会展中心', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '15');
INSERT INTO `subway_station_info` VALUES (18, '星海广场', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '14');
INSERT INTO `subway_station_info` VALUES (19, '大医二院', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '13');
INSERT INTO `subway_station_info` VALUES (20, '黑石礁', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '12');
INSERT INTO `subway_station_info` VALUES (21, '学苑广场', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '11');
INSERT INTO `subway_station_info` VALUES (22, '海事大学', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '10');
INSERT INTO `subway_station_info` VALUES (23, '七贤岭', 1, '地铁1号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '9');
INSERT INTO `subway_station_info` VALUES (24, '河口', 1, '地铁1号线', '是', '12', '地铁12号线', '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '8');
INSERT INTO `subway_station_info` VALUES (25, '辛寨子', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '8');
INSERT INTO `subway_station_info` VALUES (26, '机场', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '9');
INSERT INTO `subway_station_info` VALUES (27, '红港路', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '10');
INSERT INTO `subway_station_info` VALUES (28, '虹锦路', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '11');
INSERT INTO `subway_station_info` VALUES (29, '红旗西路', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '12');
INSERT INTO `subway_station_info` VALUES (30, '湾家', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '13');
INSERT INTO `subway_station_info` VALUES (31, '马栏广场', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '14');
INSERT INTO `subway_station_info` VALUES (32, '辽师大', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '15');
INSERT INTO `subway_station_info` VALUES (33, '交通大学', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '16');
INSERT INTO `subway_station_info` VALUES (34, '西安路', 2, '地铁2号线', '是', '1', '地铁1号线', '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '17');
INSERT INTO `subway_station_info` VALUES (35, '联合路', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '18');
INSERT INTO `subway_station_info` VALUES (36, '人民广场', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '19');
INSERT INTO `subway_station_info` VALUES (37, '一二九街', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '20');
INSERT INTO `subway_station_info` VALUES (38, '青泥洼桥', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '21');
INSERT INTO `subway_station_info` VALUES (39, '友好广场', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '22');
INSERT INTO `subway_station_info` VALUES (40, '中山广场', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '23');
INSERT INTO `subway_station_info` VALUES (41, '港湾广场', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '24');
INSERT INTO `subway_station_info` VALUES (42, '会议中心', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '25');
INSERT INTO `subway_station_info` VALUES (43, '东港', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '26');
INSERT INTO `subway_station_info` VALUES (44, '东海', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '27');
INSERT INTO `subway_station_info` VALUES (45, '海之韵', 2, '地铁2号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '28');
INSERT INTO `subway_station_info` VALUES (46, '旅顺新港', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '1');
INSERT INTO `subway_station_info` VALUES (47, '铁山', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '2');
INSERT INTO `subway_station_info` VALUES (48, '旅顺', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '3');
INSERT INTO `subway_station_info` VALUES (49, '塔河湾', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '4');
INSERT INTO `subway_station_info` VALUES (50, '龙王塘', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '5');
INSERT INTO `subway_station_info` VALUES (51, '黄泥川', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '6');
INSERT INTO `subway_station_info` VALUES (52, '蔡大岭', 12, '地铁12号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '7');
INSERT INTO `subway_station_info` VALUES (53, '河口', 12, '地铁12号线', '是', '1', '地铁1号线', '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '8');
INSERT INTO `subway_station_info` VALUES (54, '九里', 4, '地铁3号线支线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '14');
INSERT INTO `subway_station_info` VALUES (55, '十九局', 4, '地铁3号线支线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '13');
INSERT INTO `subway_station_info` VALUES (56, '和平路', 4, '地铁3号线支线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '12');
INSERT INTO `subway_station_info` VALUES (57, '东山路', 4, '地铁3号线支线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '11');
INSERT INTO `subway_station_info` VALUES (58, '鸿玮阑珊', 4, '地铁3号线支线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '10');
INSERT INTO `subway_station_info` VALUES (59, '通世泰', 4, '地铁3号线支线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '9');
INSERT INTO `subway_station_info` VALUES (60, '开发区', 4, '地铁3号线支线', '是', '3', '地铁3号线', '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '8');
INSERT INTO `subway_station_info` VALUES (61, '大连火车站', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '1');
INSERT INTO `subway_station_info` VALUES (62, '香炉礁', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '2');
INSERT INTO `subway_station_info` VALUES (63, '金家街', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '3');
INSERT INTO `subway_station_info` VALUES (64, '泉水', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '4');
INSERT INTO `subway_station_info` VALUES (65, '后盐', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '5');
INSERT INTO `subway_station_info` VALUES (66, '大连湾', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '6');
INSERT INTO `subway_station_info` VALUES (67, '金马路', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '7');
INSERT INTO `subway_station_info` VALUES (68, '开发区', 3, '地铁3号线', '是', '4', '地铁3号线支线', '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '8');
INSERT INTO `subway_station_info` VALUES (69, '保税区', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '9');
INSERT INTO `subway_station_info` VALUES (70, '双D港', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '10');
INSERT INTO `subway_station_info` VALUES (71, '小窑湾', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '11');
INSERT INTO `subway_station_info` VALUES (72, '金石滩', 3, '地铁3号线', '否', '', NULL, '甘井子区', '1970-01-01 08:46:00', '1970-01-01 08:46:00', '', '12');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `user_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1，普通用户，2管理员用户',
  `user_last_login_ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_register_time` datetime DEFAULT NULL,
  `user_last_login_time` datetime DEFAULT NULL,
  `user_status` int unsigned DEFAULT '1',
  `user_role` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'user',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已使用';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', '123456a', '柯南1', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '2', '0:0:0:0:0:0:0:1', '2017-10-06 21:56:33', '2021-03-31 03:59:49', 1, 'admin');
INSERT INTO `user` VALUES (2, 'zhangsan', '123456', '张三', 'zhangsan@china.com', '', '1', '0:0:0:0:0:0:0:1', '2018-11-25 14:45:08', '2021-02-25 10:19:30', 1, 'user');
INSERT INTO `user` VALUES (3, 'youke', '123456', '游客', 'youke1@aa.com', '', '2', '0:0:0:0:0:0:0:1', '2018-11-25 14:45:08', '2021-03-24 12:32:43', 1, 'user');
INSERT INTO `user` VALUES (5, 'wangwu', '123456', '王五', 'wangwu@qq.com', '', '2', '0:0:0:0:0:0:0:1', '1970-01-01 08:26:00', '2021-03-24 09:37:15', 1, 'user');
INSERT INTO `user` VALUES (7, 'admin123', '123456a123', '11213', '10975284@qq.com', '', '1', NULL, '2021-03-24 08:11:53', NULL, 1, 'user');
INSERT INTO `user` VALUES (8, 'admin1234', '123456a123', '12413', 'youke12@aa.com', '', '1', NULL, '2021-03-24 08:18:54', NULL, 1, 'user');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
