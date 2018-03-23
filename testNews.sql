/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-29 15:52:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `so_administrator`
-- ----------------------------
DROP TABLE IF EXISTS `so_administrator`;
CREATE TABLE `so_administrator` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员的id',
  `admin_name` varchar(26) NOT NULL COMMENT '管理员的名字',
  `admin_password` varchar(32) NOT NULL COMMENT '管理员的密码',
  `admin_real_name` varchar(26) DEFAULT NULL COMMENT '管理员的真实姓名',
  `admin_sex` int(2) DEFAULT NULL COMMENT '管理员性别',
  `admin_work_number` varchar(18) NOT NULL COMMENT '工作编号',
  `admin_api` varchar(26) DEFAULT NULL COMMENT '是否绑定有api',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `phone` char(15) NOT NULL COMMENT '手机',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_ip` varchar(32) DEFAULT NULL COMMENT '最近登录用的IP',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `work_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工作状态',
  `log_frequency` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `time_add` int(11) unsigned NOT NULL,
  `remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of so_administrator
-- ----------------------------
INSERT INTO `so_administrator` VALUES ('1', '瓜呱呱', '7ca715328de9113c290a3ff0af1077fd', '吴书宁', '1', '01', null, null, '15777156510', '', null, '', '0', '64', '0', null, '0');
INSERT INTO `so_administrator` VALUES ('2', '晚发费', '96a3be3cf272e017046d1b2674a52bd3', null, '1', '001', null, null, '032', null, null, '156132', '0', '0', '1514274107', '165564156', '0');
INSERT INTO `so_administrator` VALUES ('3', '吴书宁', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '01', null, null, '15777156510', null, null, '1397331617@qq.com', '0', '12', '1514362305', '阿达大厦大', '0');

-- ----------------------------
-- Table structure for `so_api`
-- ----------------------------
DROP TABLE IF EXISTS `so_api`;
CREATE TABLE `so_api` (
  `api_id` int(10) NOT NULL AUTO_INCREMENT,
  `api_type` varchar(20) NOT NULL COMMENT 'API的类型',
  `openid` varchar(64) NOT NULL COMMENT '第三方登录的open_id',
  `nickname` varchar(300) NOT NULL COMMENT '第三方用户昵称',
  `json` text NOT NULL COMMENT '用户信息',
  `admin_id` int(10) NOT NULL COMMENT '管理员账号ID',
  `token` varchar(100) NOT NULL COMMENT '钥匙',
  `sign` varchar(10) NOT NULL COMMENT '第三方登录标记',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of so_api
-- ----------------------------

-- ----------------------------
-- Table structure for `so_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `so_auth_access`;
CREATE TABLE `so_auth_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限分配表';

-- ----------------------------
-- Records of so_auth_access
-- ----------------------------
INSERT INTO `so_auth_access` VALUES ('1', '1', '1');
INSERT INTO `so_auth_access` VALUES ('3', '2', '1');
INSERT INTO `so_auth_access` VALUES ('2', '3', '2');

-- ----------------------------
-- Table structure for `so_auth_category`
-- ----------------------------
DROP TABLE IF EXISTS `so_auth_category`;
CREATE TABLE `so_auth_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) NOT NULL,
  `states` tinyint(1) NOT NULL DEFAULT '1',
  `categorys` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of so_auth_category
-- ----------------------------

-- ----------------------------
-- Table structure for `so_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `so_auth_group`;
CREATE TABLE `so_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限分组表';

-- ----------------------------
-- Records of so_auth_group
-- ----------------------------
INSERT INTO `so_auth_group` VALUES ('1', 'admin', '1', '1,2,4');
INSERT INTO `so_auth_group` VALUES ('2', 'wsn', '1', '');
INSERT INTO `so_auth_group` VALUES ('3', '超级管理员', '1', '1,2,4,3');

-- ----------------------------
-- Table structure for `so_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `so_auth_rule`;
CREATE TABLE `so_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `direct_jump` tinyint(1) unsigned NOT NULL,
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '100',
  `condition` char(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of so_auth_rule
-- ----------------------------
INSERT INTO `so_auth_rule` VALUES ('1', '登录-登录', 'Login-login', '1', '1', '100', 'Login', '1');
INSERT INTO `so_auth_rule` VALUES ('2', '首页-首页', 'Index-index', '1', '0', '100', 'Index', '1');
INSERT INTO `so_auth_rule` VALUES ('3', '用户管理-用户中心', 'User-userinfo', '1', '0', '100', '2', '1');
INSERT INTO `so_auth_rule` VALUES ('4', '首页-我的桌面', 'Index-mycore', '1', '0', '100', '', '1');

-- ----------------------------
-- Table structure for `so_config`
-- ----------------------------
DROP TABLE IF EXISTS `so_config`;
CREATE TABLE `so_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `config_sign` char(30) NOT NULL COMMENT '配置标识',
  `config_name` char(50) NOT NULL COMMENT '配置名称',
  `config_value` text NOT NULL COMMENT '配置值',
  `explain` varchar(300) NOT NULL COMMENT '注释',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of so_config
-- ----------------------------

-- ----------------------------
-- Table structure for `so_controller_power`
-- ----------------------------
DROP TABLE IF EXISTS `so_controller_power`;
CREATE TABLE `so_controller_power` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controller_name` varchar(50) NOT NULL COMMENT '控制器名称',
  `controller_function` varchar(50) NOT NULL COMMENT '方法名称',
  `need_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
  `need_cached` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要缓存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='方法是否需要登录表';

-- ----------------------------
-- Records of so_controller_power
-- ----------------------------

-- ----------------------------
-- Table structure for `so_user_ip`
-- ----------------------------
DROP TABLE IF EXISTS `so_user_ip`;
CREATE TABLE `so_user_ip` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ip_address` varchar(30) NOT NULL COMMENT 'IP地址',
  `user_id` int(11) NOT NULL COMMENT '用户ID·',
  `address` varchar(255) NOT NULL COMMENT '物理地址',
  `Browser` varchar(30) NOT NULL COMMENT '浏览器名称',
  `Os` varchar(255) NOT NULL COMMENT '操作系统',
  `start_time` int(11) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '结束时间',
  `visited` int(10) unsigned NOT NULL COMMENT '时间',
  `Country` varchar(100) NOT NULL COMMENT '国家',
  `Province` varchar(100) NOT NULL COMMENT '省份',
  `City` varchar(100) NOT NULL COMMENT '城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='用户IP表';

-- ----------------------------
-- Records of so_user_ip
-- ----------------------------
INSERT INTO `so_user_ip` VALUES ('46', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('47', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('48', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('49', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('50', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('51', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('52', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('53', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('54', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('55', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('56', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('57', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('58', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('59', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('60', '127.0.0.1', '127', '127.0.0.1', '127.0.0.1', '', '127', '0', '127', '127.0.0.1', '127.0.0.1', '127.0.0.1');
INSERT INTO `so_user_ip` VALUES ('61', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496795216', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('62', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496795356', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('63', '127.0.0.1', '66', '', 'Chrome', 'Windows', '1496795452', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('64', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496795491', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('65', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496795537', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('66', '127.0.0.1', '66', '', 'Chrome', 'Windows', '1496795587', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('67', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496795603', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('68', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496795755', '0', '66', '', '', '');
INSERT INTO `so_user_ip` VALUES ('69', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496796760', '0', '66', '$Country', '$Province', '$City');
INSERT INTO `so_user_ip` VALUES ('70', '127.0.0.1', '66', '', 'Chrome', 'Windows', '1496796760', '0', '66', '$Country', '$Province', '$City');
INSERT INTO `so_user_ip` VALUES ('71', '127.0.0.1', '66', '中国-广西-南宁', 'Chrome', 'Windows', '1496796795', '0', '66', '$Country', '$Province', '$City');
INSERT INTO `so_user_ip` VALUES ('72', '127.0.0.1', '1', '中国-广西-南宁', 'Other', 'Windows', '1510906560', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('73', '127.0.0.1', '1', '中国-广西-南宁', 'Other', 'Windows', '1510907274', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('74', '127.0.0.1', '1', '中国-广西-南宁', 'Other', 'Windows', '1510907365', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('75', '127.0.0.1', '1', '中国-广西-南宁', 'Other', 'Windows', '1510907485', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('76', '127.0.0.1', '1', '中国-广西-南宁', 'Other', 'Windows', '1510907970', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('77', '127.0.0.1', '1', '中国-广西-南宁', 'Other', 'Windows', '1510908066', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('78', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1510994115', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('79', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1511372954', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('80', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1511456298', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('81', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1511483373', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('82', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1511557314', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('83', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1511717917', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('84', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1511754618', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('85', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1512551205', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('86', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1512609462', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('87', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1512696923', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('88', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1512784758', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('89', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1512979297', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('90', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513041248', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('91', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513127918', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('92', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513147494', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('93', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513213805', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('94', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513234414', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('95', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513561018', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('96', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513753579', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('97', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513825280', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('98', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513904816', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('99', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1513930878', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('100', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514167024', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('101', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514257585', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('102', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514271579', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('103', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514271687', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('104', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514271746', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('105', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514271825', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('106', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514272164', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('107', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514272188', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('108', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514272259', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('109', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514272461', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('110', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514273519', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('111', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514336955', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('112', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514337113', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('113', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514337273', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('114', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514337339', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('115', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514337385', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('116', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514337928', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('117', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514339398', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('118', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514343765', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('119', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514343950', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('120', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514344084', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('121', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514344169', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('122', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514344300', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('123', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514344643', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('124', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514360682', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('125', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514361771', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('126', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514361988', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('127', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514362010', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('128', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514362200', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('129', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514362254', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('130', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514363652', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('131', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514363755', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('132', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514363930', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('133', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514363949', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('134', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514364014', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('135', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514364074', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('136', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514365849', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('137', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514365898', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('138', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514422882', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('139', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514422939', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('140', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514423146', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('141', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514423175', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('142', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514423347', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('143', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514423366', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('144', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514426410', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('145', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514426735', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('146', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514428199', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('147', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514432713', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('148', '127.0.0.1', '3', '中国-广西-南宁', 'Chrome', 'Windows', '1514443526', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('149', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514444100', '0', '0', '中国', '广西', '南宁');
INSERT INTO `so_user_ip` VALUES ('150', '127.0.0.1', '1', '中国-广西-南宁', 'Chrome', 'Windows', '1514509817', '0', '0', '中国', '广西', '南宁');

-- ----------------------------
-- Table structure for `so_verify_code`
-- ----------------------------
DROP TABLE IF EXISTS `so_verify_code`;
CREATE TABLE `so_verify_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id (未login默认0)',
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT '验证邮箱',
  `verify` char(10) NOT NULL,
  `type` smallint(5) NOT NULL COMMENT '验证码类型（0注册 1忘记密码 2修改 3绑定 4重置密码）',
  `is_abate` tinyint(1) unsigned NOT NULL COMMENT '是否失效',
  `sort_date` varchar(8) NOT NULL,
  `add_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机验证码';

-- ----------------------------
-- Records of so_verify_code
-- ----------------------------
