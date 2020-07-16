/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50728
Source Host           : 100.168.1.232:3306
Source Database       : init

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-05-20 17:37:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for e_r_aim_major
-- ----------------------------
DROP TABLE IF EXISTS `e_r_aim_major`;
CREATE TABLE `e_r_aim_major` (
  `aim_major_id` bigint(20) NOT NULL COMMENT '选择专业ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `major_id` bigint(20) DEFAULT NULL COMMENT '招生专业ID',
  `level` tinyint(4) DEFAULT NULL COMMENT '志愿等级',
  `is_adjust` tinyint(4) DEFAULT '0' COMMENT '是否接受调剂（0：不接受，1：接受）',
  PRIMARY KEY (`aim_major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='选择专业表';

-- ----------------------------
-- Records of e_r_aim_major
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_aim_student
-- ----------------------------
DROP TABLE IF EXISTS `e_r_aim_student`;
CREATE TABLE `e_r_aim_student` (
  `aim_student_id` bigint(20) NOT NULL COMMENT '目标生ID',
  `class_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  `student_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `student_telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生联系方式',
  `father_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父亲姓名',
  `father_telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父亲联系方式',
  `mother_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '母亲姓名',
  `mother_telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '母亲联系方式',
  `level` tinyint(4) DEFAULT NULL COMMENT '公关等级（0：高，1：中，2：低）',
  `reason` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '意向原因',
  `direction` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公关方向',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态（0：已报名，1：跟进中）',
  PRIMARY KEY (`aim_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='目标生表';

-- ----------------------------
-- Records of e_r_aim_student
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_charger
-- ----------------------------
DROP TABLE IF EXISTS `e_r_charger`;
CREATE TABLE `e_r_charger` (
  `charger_id` bigint(20) NOT NULL COMMENT '负责人ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '招生组ID',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `account` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `telephone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0：删除，1：正常）',
  `is_leader` tinyint(4) DEFAULT '0' COMMENT '是否是组长（0：否，1：是）',
  `api_id` bigint(20) DEFAULT NULL COMMENT '接口ID',
  PRIMARY KEY (`charger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生负责人';

-- ----------------------------
-- Records of e_r_charger
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_class
-- ----------------------------
DROP TABLE IF EXISTS `e_r_class`;
CREATE TABLE `e_r_class` (
  `class_id` bigint(20) NOT NULL COMMENT '班级ID',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校ID',
  `class_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '公关等级（0：高，1：中，2：低）',
  `adviser` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班主任',
  `telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `amount` int(11) DEFAULT NULL COMMENT '学生人数',
  `willing_amount` int(11) DEFAULT NULL COMMENT '意向生',
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='班级表';

-- ----------------------------
-- Records of e_r_class
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_college
-- ----------------------------
DROP TABLE IF EXISTS `e_r_college`;
CREATE TABLE `e_r_college` (
  `college_id` bigint(20) NOT NULL COMMENT '院系ID',
  `api_id` bigint(20) DEFAULT NULL COMMENT '接口ID',
  `college_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '院系名称',
  `college_manager` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '院系负责人',
  `recruit_amount` int(11) DEFAULT NULL COMMENT '招生人数',
  `recruit_target` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生对象',
  `cultivate_aim` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '培养目标',
  `main_course` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主要课程',
  `career_forward` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '就业方向',
  `comment` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '院系简介',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '计划ID',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `api_college_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口院系名称',
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生院系表';

-- ----------------------------
-- Records of e_r_college
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_communication_record
-- ----------------------------
DROP TABLE IF EXISTS `e_r_communication_record`;
CREATE TABLE `e_r_communication_record` (
  `communication_record_id` bigint(20) NOT NULL COMMENT '沟通记录ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `communication_date` date DEFAULT NULL COMMENT '沟通日期',
  `communication_way` tinyint(4) DEFAULT NULL COMMENT '沟通方式（0：电话，1：微信，2：见面）',
  `communication_result` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '沟通结果',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`communication_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='沟通记录';

-- ----------------------------
-- Records of e_r_communication_record
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_consultation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_consultation`;
CREATE TABLE `e_r_consultation` (
  `consultation_id` bigint(20) NOT NULL COMMENT '到校咨询ID',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `semester` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `daily_receptionist_id` bigint(20) DEFAULT NULL COMMENT '日常接待人ID',
  `daily_receptionist_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日常接待人名称',
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `schedule` longtext COLLATE utf8mb4_unicode_ci COMMENT '接待行程',
  `address` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接待地址',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  PRIMARY KEY (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='到校咨询表';

-- ----------------------------
-- Records of e_r_consultation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_consultation_feedback
-- ----------------------------
DROP TABLE IF EXISTS `e_r_consultation_feedback`;
CREATE TABLE `e_r_consultation_feedback` (
  `consultation_feedback_id` bigint(20) NOT NULL COMMENT '咨询反馈ID',
  `consultation_id` bigint(20) DEFAULT NULL COMMENT '到校咨询ID',
  `consultation_date` date DEFAULT NULL COMMENT '咨询日期',
  `consultation_content` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反馈内容',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `summary` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总结',
  PRIMARY KEY (`consultation_feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='咨询反馈表';

-- ----------------------------
-- Records of e_r_consultation_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_consultation_register
-- ----------------------------
DROP TABLE IF EXISTS `e_r_consultation_register`;
CREATE TABLE `e_r_consultation_register` (
  `consultation_register_id` bigint(20) NOT NULL COMMENT '招生咨询登记ID',
  `consultation_id` bigint(20) DEFAULT NULL COMMENT '到校咨询ID',
  `consultation_type` tinyint(4) DEFAULT NULL COMMENT '咨询类型（0：个人，1：学校）',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校ID',
  `is_openday` tinyint(4) DEFAULT NULL COMMENT '是否接待日（0：是，1：否）',
  `class_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `consultation_date` date DEFAULT NULL COMMENT '咨询日期',
  `attend_time` datetime DEFAULT NULL COMMENT '到校时间',
  `is_lunch` tinyint(4) DEFAULT NULL COMMENT '是否用餐（0：是，1：否）',
  `comment` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `teacher` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '带队老师',
  `amount` int(11) DEFAULT NULL COMMENT '人数',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人（负责人）',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称（负责人名称）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `student_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `is_attend` tinyint(4) DEFAULT '0' COMMENT '是否签到（0：否，1：是）',
  PRIMARY KEY (`consultation_register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生咨询登记表';

-- ----------------------------
-- Records of e_r_consultation_register
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `e_r_exception_log`;
CREATE TABLE `e_r_exception_log` (
  `exc_id` varchar(64) NOT NULL COMMENT '异常记录主键id',
  `exc_requ_param_type` varchar(10) DEFAULT NULL COMMENT '操作方法',
  `exc_requ_param` text COMMENT '请求参数',
  `exc_name` varchar(500) DEFAULT NULL COMMENT '异常名称',
  `exc_message` text COMMENT '异常信息',
  `oper_user_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `oper_user_name` varchar(50) DEFAULT NULL COMMENT '操作人名称',
  `oper_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `oper_ip` varchar(64) DEFAULT NULL COMMENT '请求IP',
  `oper_ver` varchar(64) DEFAULT NULL COMMENT '操作版本号',
  `oper_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`exc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_r_exception_log
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_family_member
-- ----------------------------
DROP TABLE IF EXISTS `e_r_family_member`;
CREATE TABLE `e_r_family_member` (
  `family_member_id` bigint(20) NOT NULL COMMENT '家庭成员ID',
  `student_info` bigint(20) DEFAULT NULL COMMENT '学生基本信息ID',
  `relation` tinyint(4) DEFAULT NULL COMMENT '关系（0：父亲，1：母亲）',
  `name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家长姓名',
  `company` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工作单位',
  `position` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职务',
  `telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `location` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '户籍所在地',
  PRIMARY KEY (`family_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='家庭成员表';

-- ----------------------------
-- Records of e_r_family_member
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_group
-- ----------------------------
DROP TABLE IF EXISTS `e_r_group`;
CREATE TABLE `e_r_group` (
  `group_id` bigint(20) NOT NULL COMMENT '招生组ID',
  `group_info_id` bigint(20) NOT NULL COMMENT '招生组信息ID',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组别名称',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `comment` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门（来着api组织结构）',
  `dept_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `area_id` bigint(20) DEFAULT NULL COMMENT '所在区域（来着数据字典）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态（0：删除，1：正常）',
  `target_amount` int(11) DEFAULT NULL COMMENT '招生目标数量',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生组表';

-- ----------------------------
-- Records of e_r_group
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_group_info
-- ----------------------------
DROP TABLE IF EXISTS `e_r_group_info`;
CREATE TABLE `e_r_group_info` (
  `group_info_id` bigint(20) NOT NULL COMMENT '招生组信息ID',
  `semester` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  PRIMARY KEY (`group_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生组信息表';

-- ----------------------------
-- Records of e_r_group_info
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_group_source_relation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_group_source_relation`;
CREATE TABLE `e_r_group_source_relation` (
  `group_source_relation_id` bigint(20) NOT NULL COMMENT '招生组生源学校关联ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '招生组ID',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校ID',
  PRIMARY KEY (`group_source_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生组生源学校关联表';

-- ----------------------------
-- Records of e_r_group_source_relation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_in_school
-- ----------------------------
DROP TABLE IF EXISTS `e_r_in_school`;
CREATE TABLE `e_r_in_school` (
  `in_school_id` bigint(20) NOT NULL COMMENT '学生在校信息ID',
  `school_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原学籍号',
  `talent` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '特长',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `student_info` bigint(20) DEFAULT NULL COMMENT '学生基本信息ID',
  PRIMARY KEY (`in_school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生在校信息表';

-- ----------------------------
-- Records of e_r_in_school
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_login
-- ----------------------------
DROP TABLE IF EXISTS `e_r_login`;
CREATE TABLE `e_r_login` (
  `login` bigint(20) NOT NULL COMMENT '登录ID',
  `openid` varchar(128) DEFAULT NULL COMMENT 'openid',
  `login_type` tinyint(4) DEFAULT NULL COMMENT '登录类型（0：学生，1：家长）',
  `create_time` datetime DEFAULT NULL COMMENT '第一次登录时间',
  `mobile` varchar(32) DEFAULT NULL COMMENT '联系方式',
  `last_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='登录表';

-- ----------------------------
-- Records of e_r_login
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_login_relation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_login_relation`;
CREATE TABLE `e_r_login_relation` (
  `login_relation_id` bigint(20) NOT NULL,
  `student_info` bigint(20) DEFAULT NULL COMMENT '学生基本信息ID',
  `login` bigint(20) DEFAULT NULL COMMENT '登录ID',
  PRIMARY KEY (`login_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='登录信息关联表';

-- ----------------------------
-- Records of e_r_login_relation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_major
-- ----------------------------
DROP TABLE IF EXISTS `e_r_major`;
CREATE TABLE `e_r_major` (
  `major_id` bigint(20) NOT NULL COMMENT '招生专业ID',
  `college_id` bigint(20) DEFAULT NULL COMMENT '院系ID',
  `api_id` bigint(20) DEFAULT NULL COMMENT '接口ID',
  `major_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业名称',
  `api_major_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业名称',
  `recruit_amount` int(11) DEFAULT NULL COMMENT '招生人数',
  `fee` decimal(10,0) DEFAULT NULL COMMENT '学费（元/学期）',
  `major_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学制',
  `cultivate_aim` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '培养目标',
  `main_course` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主要课程',
  `career_forward` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '就业方向',
  `comment` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业简介',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生专业表';

-- ----------------------------
-- Records of e_r_major
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_news
-- ----------------------------
DROP TABLE IF EXISTS `e_r_news`;
CREATE TABLE `e_r_news` (
  `news_id` bigint(20) NOT NULL COMMENT '新闻ID',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `message_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '信息类型',
  `recevier` tinyint(4) DEFAULT NULL COMMENT '接收端（0：全部，1：学生，2：家长）',
  `belong_plan` tinyint(4) DEFAULT NULL COMMENT '所属计划（0：不限，1：已发布计划）',
  `message_content` longtext COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '招生计划ID',
  `news_status` tinyint(4) DEFAULT '0' COMMENT '新闻状态（0：草稿，1：已发布）',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新闻表';

-- ----------------------------
-- Records of e_r_news
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_openday
-- ----------------------------
DROP TABLE IF EXISTS `e_r_openday`;
CREATE TABLE `e_r_openday` (
  `openday_id` bigint(20) NOT NULL COMMENT '接待日信息ID',
  `consultation_id` bigint(20) DEFAULT NULL COMMENT '到校咨询ID',
  `receptionist_id` bigint(20) DEFAULT NULL COMMENT '接待人ID',
  `receptionist_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接待人名称',
  `amount` int(11) DEFAULT NULL COMMENT '接待人数',
  `openday_date` date DEFAULT NULL COMMENT '接待日期',
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `schedule` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接待行程',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_openday` tinyint(4) DEFAULT NULL COMMENT '是否是接待日（0：否，1：是）',
  PRIMARY KEY (`openday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='接待日信息表';

-- ----------------------------
-- Records of e_r_openday
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_plan
-- ----------------------------
DROP TABLE IF EXISTS `e_r_plan`;
CREATE TABLE `e_r_plan` (
  `plan_id` bigint(20) NOT NULL COMMENT '招生计划ID',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `season` int(11) DEFAULT NULL COMMENT '季度',
  `semester` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `title` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `start_time` datetime DEFAULT NULL COMMENT '招生开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '招生结束时间',
  `charger_id` bigint(20) DEFAULT NULL COMMENT '招生负责人ID',
  `charger_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生负责人名称',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '发布人',
  `publisher_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人名称',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0：删除，1：未发布，2：已发布，3：已完成）',
  `is_defaulted` tinyint(4) DEFAULT '0' COMMENT '是否默认（0：否，1：是）',
  `comment` text COLLATE utf8mb4_unicode_ci COMMENT '说明',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `telephone_number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `modifier_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `copy_id` bigint(20) DEFAULT NULL COMMENT '拷贝ID',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生计划表 ';

-- ----------------------------
-- Records of e_r_plan
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_plan_recruit_info
-- ----------------------------
DROP TABLE IF EXISTS `e_r_plan_recruit_info`;
CREATE TABLE `e_r_plan_recruit_info` (
  `plan_recruit_info_id` bigint(20) NOT NULL COMMENT '招生简介ID',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '招生计划ID',
  `recruit_target` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生对象',
  `attention` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注意事项',
  `register` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报到和录取',
  `plan_description` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生计划',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否删除（0：删除，1：正常）',
  `recruitment_image` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生简章',
  PRIMARY KEY (`plan_recruit_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生简介表';

-- ----------------------------
-- Records of e_r_plan_recruit_info
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_plan_school_introduction
-- ----------------------------
DROP TABLE IF EXISTS `e_r_plan_school_introduction`;
CREATE TABLE `e_r_plan_school_introduction` (
  `plan_school_introduction_id` bigint(20) NOT NULL COMMENT '招生计划学校简介ID',
  `recruit_school_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生学校名称',
  `recruit_school_logo` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生学校logo',
  `is_deleted` tinyint(4) DEFAULT '1' COMMENT '是否删除（0：删除，1：正常）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `principal` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '校长名称',
  `telephone_number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校地址',
  `description` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `api_id` bigint(20) DEFAULT NULL COMMENT '接口ID',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '招生计划ID',
  PRIMARY KEY (`plan_school_introduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生计划学校简介';

-- ----------------------------
-- Records of e_r_plan_school_introduction
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_preach_assistant_relation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_preach_assistant_relation`;
CREATE TABLE `e_r_preach_assistant_relation` (
  `preach_assistant_relationt_id` bigint(20) NOT NULL COMMENT '宣讲协助人关联ID',
  `preach_plan_id` bigint(20) DEFAULT NULL COMMENT '招生宣讲计划ID',
  `charger_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `charger_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人名称',
  PRIMARY KEY (`preach_assistant_relationt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宣讲协助人关联表';

-- ----------------------------
-- Records of e_r_preach_assistant_relation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_preach_feedback
-- ----------------------------
DROP TABLE IF EXISTS `e_r_preach_feedback`;
CREATE TABLE `e_r_preach_feedback` (
  `preach_feedback_id` bigint(20) NOT NULL COMMENT '宣讲反馈ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `preach_plan_id` bigint(20) DEFAULT NULL COMMENT '招生宣讲计划ID',
  `performance` tinyint(4) DEFAULT NULL COMMENT '宣讲效果（0：好，1：一般，2：差）',
  `feedback_content` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反馈内容',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`preach_feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宣讲反馈表';

-- ----------------------------
-- Records of e_r_preach_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_preach_plan
-- ----------------------------
DROP TABLE IF EXISTS `e_r_preach_plan`;
CREATE TABLE `e_r_preach_plan` (
  `preach_plan_id` bigint(20) NOT NULL COMMENT '招生宣讲计划ID',
  `semester` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `preach_time` datetime DEFAULT NULL COMMENT '宣讲时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `speaker_id` bigint(20) DEFAULT NULL COMMENT '主讲人ID',
  `speaker_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主讲人名称',
  `plan_amount` int(11) DEFAULT NULL COMMENT '计划人数',
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主题',
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '宣讲地点',
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0：删除，1：草稿，2：已发布）',
  PRIMARY KEY (`preach_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生宣讲计划';

-- ----------------------------
-- Records of e_r_preach_plan
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_preach_register
-- ----------------------------
DROP TABLE IF EXISTS `e_r_preach_register`;
CREATE TABLE `e_r_preach_register` (
  `preach_register_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣讲计划报名ID',
  `preach_plan_id` bigint(20) DEFAULT NULL COMMENT '招生宣讲计划ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0：报名，1：签到）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator_id` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  PRIMARY KEY (`preach_register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宣讲计划报名表';

-- ----------------------------
-- Records of e_r_preach_register
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_preach_school_relation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_preach_school_relation`;
CREATE TABLE `e_r_preach_school_relation` (
  `preach_school_relation_id` bigint(20) NOT NULL COMMENT '宣讲学校关联ID',
  `preach_plan_id` bigint(20) DEFAULT NULL COMMENT '招生宣讲计划ID',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校',
  PRIMARY KEY (`preach_school_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宣讲生源学校关联表';

-- ----------------------------
-- Records of e_r_preach_school_relation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_preach_summary
-- ----------------------------
DROP TABLE IF EXISTS `e_r_preach_summary`;
CREATE TABLE `e_r_preach_summary` (
  `preach_summary_id` bigint(20) NOT NULL COMMENT '宣讲总结ID',
  `preach_plan_id` bigint(20) DEFAULT NULL COMMENT '招生宣讲计划ID',
  `performance` tinyint(4) DEFAULT NULL COMMENT '宣讲效果（0：好，1：一般，2：差）',
  `feedback_content` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反馈内容',
  `summery` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '宣讲总结',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`preach_summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宣讲总结表 ';

-- ----------------------------
-- Records of e_r_preach_summary
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_progress
-- ----------------------------
DROP TABLE IF EXISTS `e_r_progress`;
CREATE TABLE `e_r_progress` (
  `progress_id` bigint(20) NOT NULL COMMENT '学生报名进度ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `progress_type` tinyint(4) DEFAULT NULL COMMENT '进度类型（0：报名登记，1：交费定位，2：接收通知，3：入学报名）',
  `progress_content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '进度内容',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生报名进度表';

-- ----------------------------
-- Records of e_r_progress
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_public_relation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_public_relation`;
CREATE TABLE `e_r_public_relation` (
  `public_relation` bigint(20) NOT NULL COMMENT '学校公关ID',
  `group_source_relation_id` bigint(20) DEFAULT NULL COMMENT '招生组生源学校关联ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '招生组ID',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `contacter` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '沟通人',
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校拜访内容',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人（负责人）',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称（负责人名称）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`public_relation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学校公关表';

-- ----------------------------
-- Records of e_r_public_relation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_recruit_school
-- ----------------------------
DROP TABLE IF EXISTS `e_r_recruit_school`;
CREATE TABLE `e_r_recruit_school` (
  `recruit_school_id` bigint(20) NOT NULL COMMENT '招生学校ID',
  `recruit_school_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生学校名称',
  `recruit_school_logo` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生学校logo',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否删除（0：删除，1：正常）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `principal` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '校长名称',
  `telephone_number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校地址',
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `api_id` bigint(20) DEFAULT NULL COMMENT '接口ID',
  PRIMARY KEY (`recruit_school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生学校';

-- ----------------------------
-- Records of e_r_recruit_school
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_recruit_way
-- ----------------------------
DROP TABLE IF EXISTS `e_r_recruit_way`;
CREATE TABLE `e_r_recruit_way` (
  `recruit_way_id` bigint(20) NOT NULL COMMENT '学生招生渠道ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `recruit_type` tinyint(4) DEFAULT NULL COMMENT '渠道类型（0：线上，1：线下）',
  `online_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '线上渠道方式（0：网站招生，1：广告招生，2：朋友介绍）',
  `recommend_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人名称',
  `telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`recruit_way_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生招生渠道表';

-- ----------------------------
-- Records of e_r_recruit_way
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_register_status_log
-- ----------------------------
DROP TABLE IF EXISTS `e_r_register_status_log`;
CREATE TABLE `e_r_register_status_log` (
  `register_status_log_id` bigint(20) NOT NULL COMMENT '报名状态修改日志ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `status_result` tinyint(4) DEFAULT NULL COMMENT '状态结果（0：已交订金，1：已交全款，2：已退款，3：强意向生，4：已报名）',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_id` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `modify_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人名称',
  PRIMARY KEY (`register_status_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='报名状态修改日志表';

-- ----------------------------
-- Records of e_r_register_status_log
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_request
-- ----------------------------
DROP TABLE IF EXISTS `e_r_request`;
CREATE TABLE `e_r_request` (
  `request_id` bigint(20) NOT NULL COMMENT '诉求ID',
  `student_public_relation_id` bigint(20) DEFAULT NULL COMMENT '学生公关ID',
  `request_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '诉求类型',
  `request_content` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '诉求内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '回复人ID',
  `reply_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复人名称',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `reply_content` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复内容',
  `status` tinyint(4) DEFAULT NULL COMMENT '诉求处理状态(0已处理，1未处理)',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='诉求表';

-- ----------------------------
-- Records of e_r_request
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_score
-- ----------------------------
DROP TABLE IF EXISTS `e_r_score`;
CREATE TABLE `e_r_score` (
  `score_id` bigint(20) NOT NULL COMMENT '成绩ID',
  `in_school_id` bigint(20) DEFAULT NULL COMMENT '学生在校信息ID',
  `course` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目',
  `score` double DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成绩表';

-- ----------------------------
-- Records of e_r_score
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_semester
-- ----------------------------
DROP TABLE IF EXISTS `e_r_semester`;
CREATE TABLE `e_r_semester` (
  `semester_id` bigint(20) NOT NULL COMMENT '学期ID',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `semester_api_id` bigint(20) DEFAULT NULL COMMENT '学期接口ID',
  `semester_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期名称',
  `sync_time` datetime DEFAULT NULL COMMENT '同步时间',
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学期表';

-- ----------------------------
-- Records of e_r_semester
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_source_school
-- ----------------------------
DROP TABLE IF EXISTS `e_r_source_school`;
CREATE TABLE `e_r_source_school` (
  `source_school_id` bigint(20) NOT NULL COMMENT '生源学校ID',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `source_school_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生源学校名称',
  `province` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在省份',
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在城市',
  `district` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在区域',
  `is_relation` tinyint(4) DEFAULT NULL COMMENT '是否公关（0：公关，1：不公关）',
  `relation_level` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公关等级（1：重点公关 2：普通公关 3：重新公关）',
  `relation_type` tinyint(4) DEFAULT NULL COMMENT '学校性质（0 公立，1 民营）',
  `source_scale` int(11) DEFAULT NULL COMMENT '生源规模',
  `qualification` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校资质',
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校地址',
  `superior_dept` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上级主管部门',
  `school_case_comment` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校情况说明',
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `recruit_amount` int(11) DEFAULT NULL COMMENT '中招人数',
  `recruit_way` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '中招方式',
  `grade_director_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年级主任',
  `grade_director_tel` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年级主任电话',
  `class_amount` int(11) DEFAULT NULL COMMENT '班级数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态（0：删除，1：正常）',
  PRIMARY KEY (`source_school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生源学校';

-- ----------------------------
-- Records of e_r_source_school
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_source_school_type
-- ----------------------------
DROP TABLE IF EXISTS `e_r_source_school_type`;
CREATE TABLE `e_r_source_school_type` (
  `source_school_type_id` bigint(20) NOT NULL COMMENT '生源学校类型ID',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校ID',
  `type_id` bigint(20) DEFAULT NULL COMMENT '数据字典ID',
  PRIMARY KEY (`source_school_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生源学校类型';

-- ----------------------------
-- Records of e_r_source_school_type
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_student_info
-- ----------------------------
DROP TABLE IF EXISTS `e_r_student_info`;
CREATE TABLE `e_r_student_info` (
  `student_info` bigint(20) NOT NULL COMMENT '学生基本信息ID',
  `student_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别（0：男，1：女）',
  `image_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '照片url',
  `nation` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '民族',
  `doa` date DEFAULT NULL COMMENT '出生年月',
  `id_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `health_status` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身体状况',
  `province` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '户籍省份',
  `city` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '户籍城市',
  `district` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '户籍区域',
  `wechat` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生微信',
  `parent_telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家长联系方式',
  `student_telephone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生联系方式',
  `family_province` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家庭省份',
  `family_city` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家庭城市',
  `family_district` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家庭区域',
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `qq_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'qq号',
  PRIMARY KEY (`student_info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生基本信息表';

-- ----------------------------
-- Records of e_r_student_info
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_student_public_relation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_student_public_relation`;
CREATE TABLE `e_r_student_public_relation` (
  `student_public_relation_id` bigint(20) NOT NULL COMMENT '学生公关ID',
  `student_info` bigint(20) DEFAULT NULL COMMENT '学生基本信息ID',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  `source_school_id` bigint(20) DEFAULT NULL COMMENT '生源学校ID',
  `class_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0：删除，1：正常）',
  `level` tinyint(4) DEFAULT NULL COMMENT '公关等级（0：高，1：中，2：低）',
  `reason` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '意向原因',
  `direction` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公关方向',
  `relation_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跟进类型',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '负责人',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人名称',
  `register_status` tinyint(4) DEFAULT '3' COMMENT '报名状态（0：已交订金，1：已交全款，2：已退款，3：强意向生，4：已报名）',
  `semester` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `group_id` bigint(20) DEFAULT NULL COMMENT '招生组ID',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  `student_no` int(11) DEFAULT '1' COMMENT '登记编号',
  `status_change_time` datetime DEFAULT NULL COMMENT '状态改变时间',
  PRIMARY KEY (`student_public_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生公关表';

-- ----------------------------
-- Records of e_r_student_public_relation
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `e_r_sys_dictionary`;
CREATE TABLE `e_r_sys_dictionary` (
  `dictionary_id` bigint(20) NOT NULL COMMENT '数字字典id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `data_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据编码',
  `data_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据类型（1：文本，2：布尔值，3：数值，4：日期）',
  `data_value` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据名称/数据值',
  `data_english_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据英文名称',
  `data_desc` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据说明',
  `data_order` int(11) DEFAULT NULL COMMENT '数据顺序',
  `is_read_only` tinyint(4) DEFAULT '0' COMMENT '是否只读（0：否，1：只读）',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '状态（0：正常，1：删除）',
  `modify_id` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `modify_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  PRIMARY KEY (`dictionary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统数字字典';

-- ----------------------------
-- Records of e_r_sys_dictionary
-- ----------------------------
INSERT INTO `e_r_sys_dictionary` VALUES ('1', '0', 'online_target', '1', '线上招生目标', 'online_target', '线上招生目标', '1', '0', '0', '1', 'admin', '2020-04-15 12:24:28', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('2', '1', 'web', '1', '网站招生', 'web', '网站招生', '1', '0', '0', '1', 'admin', '2020-04-15 12:25:08', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('3', '1', 'ads', '1', '广告招生', 'ads', '广告招生', '2', '0', '0', '1', 'admin', '2020-04-15 12:25:08', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('4', '1', 'friend', '1', '朋友介绍', 'friend', '朋友介绍', '3', '0', '0', '1', 'admin', '2020-04-15 12:25:08', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('5', '0', 'recruit_zone', '1', '招生区域', 'recruit_zone', '招生区域', '1', '1', '0', '1', 'admin', '2020-04-16 13:45:31', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('6', '5', 'east_zone', '1', '东部', 'east_zone', '东部', '1', '0', '0', '1', 'admin', '2020-04-16 13:45:34', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('7', '5', 'west_zone', '1', '西部', 'west_zone', '西部', '2', '0', '0', '1', 'admin', '2020-04-16 13:45:36', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('8', '5', 'mid_zone', '1', '中部', 'mid_zone', '中部', '3', '0', '0', '1', 'admin', '2020-04-16 13:45:39', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('9', '0', 'school_tag', '1', '学校标签', 'school_tag', '学校标签', '1', '1', '0', '1', 'admin', '2020-04-16 13:46:26', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('10', '9', 'head_school', '1', '重点学校', 'head_school', '重点学校', '1', '0', '0', '1', 'admin', '2020-04-16 13:47:07', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('11', '9', 'public_school', '1', '公关学校', 'public_school', '公关学校', '2', '0', '0', '1', 'admin', '2020-04-16 13:47:42', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('12', '9', 'recruit_school', '1', '招生学校', 'recruit_school', '招生学校', '3', '0', '0', '1', 'admin', '2020-04-16 13:48:23', '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('13', '0', 'news_message_type', '1', '新闻信息类型', null, null, null, '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('14', '13', 'school_info', '1', '学校信息', null, null, null, '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('15', '13', 'major_info', '1', '专业信息', null, null, null, '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('16', '0', 'task_type', '1', '任务类型', 'task_type', '任务类型', '1', '1', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('17', '16', 'maintain_school', '1', '计划发布，维护学校信息', 'maintain_school', '维护学校信息', '1', '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('18', '16', 'maintain_preach', '1', '计划发布，维护宣讲计划', 'maintain_preach', '维护宣讲计划', '1', '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('19', '16', 'preach_schdule', '1', '明天有宣讲任务', 'preach_schdule', '宣讲任务', '1', '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('20', '16', 'request_deal', '1', '有新的诉求请处理', 'request_deal', '诉求处理', '1', '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('21', '16', 'consultation_deal', '1', '有新的到校咨询请处理', 'consultation_deal', '到校咨询处理', '1', '0', '0', null, null, null, '1252559728180355074');
INSERT INTO `e_r_sys_dictionary` VALUES ('22', '16', 'admission', '1', '亲爱的{0}同学： 经学校招生委员会审查合格，同意你报读我校{1}科班专业{2}专业。请确认到校就读，并于2020年8月29日。按《入学须知》到校报到注册。', 'admission', '入学通知', '1', '1', '0', null, '', '2020-05-20 17:35:58', '1261234366813380610');

-- ----------------------------
-- Table structure for e_r_sys_nation
-- ----------------------------
DROP TABLE IF EXISTS `e_r_sys_nation`;
CREATE TABLE `e_r_sys_nation` (
  `id` varchar(32) NOT NULL COMMENT '民族ID',
  `nation` varchar(64) DEFAULT NULL COMMENT '民族',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统民族表';

-- ----------------------------
-- Records of e_r_sys_nation
-- ----------------------------
INSERT INTO `e_r_sys_nation` VALUES ('1', '汉族');
INSERT INTO `e_r_sys_nation` VALUES ('10', '朝鲜族');
INSERT INTO `e_r_sys_nation` VALUES ('11', '满族');
INSERT INTO `e_r_sys_nation` VALUES ('12', '侗族');
INSERT INTO `e_r_sys_nation` VALUES ('13', '瑶族');
INSERT INTO `e_r_sys_nation` VALUES ('14', '白族');
INSERT INTO `e_r_sys_nation` VALUES ('15', '土家族');
INSERT INTO `e_r_sys_nation` VALUES ('16', '哈尼族');
INSERT INTO `e_r_sys_nation` VALUES ('17', '哈萨克族');
INSERT INTO `e_r_sys_nation` VALUES ('18', '傣族');
INSERT INTO `e_r_sys_nation` VALUES ('19', '黎族');
INSERT INTO `e_r_sys_nation` VALUES ('2', '蒙古族');
INSERT INTO `e_r_sys_nation` VALUES ('20', '傈僳族');
INSERT INTO `e_r_sys_nation` VALUES ('21', '佤族');
INSERT INTO `e_r_sys_nation` VALUES ('22', '畲族');
INSERT INTO `e_r_sys_nation` VALUES ('23', '高山族');
INSERT INTO `e_r_sys_nation` VALUES ('24', '拉祜族');
INSERT INTO `e_r_sys_nation` VALUES ('25', '水族');
INSERT INTO `e_r_sys_nation` VALUES ('26', '东乡族');
INSERT INTO `e_r_sys_nation` VALUES ('27', '纳西族');
INSERT INTO `e_r_sys_nation` VALUES ('28', '景颇族');
INSERT INTO `e_r_sys_nation` VALUES ('29', '柯尔克孜族');
INSERT INTO `e_r_sys_nation` VALUES ('3', '回族');
INSERT INTO `e_r_sys_nation` VALUES ('30', '土族');
INSERT INTO `e_r_sys_nation` VALUES ('31', '达翰尔族');
INSERT INTO `e_r_sys_nation` VALUES ('32', '么佬族');
INSERT INTO `e_r_sys_nation` VALUES ('33', '羌族');
INSERT INTO `e_r_sys_nation` VALUES ('34', '布朗族');
INSERT INTO `e_r_sys_nation` VALUES ('35', '撒拉族');
INSERT INTO `e_r_sys_nation` VALUES ('36', '毛南族');
INSERT INTO `e_r_sys_nation` VALUES ('37', '仡佬族');
INSERT INTO `e_r_sys_nation` VALUES ('38', '锡伯族');
INSERT INTO `e_r_sys_nation` VALUES ('39', '阿昌族');
INSERT INTO `e_r_sys_nation` VALUES ('4', '藏族');
INSERT INTO `e_r_sys_nation` VALUES ('40', '普米族');
INSERT INTO `e_r_sys_nation` VALUES ('41', '塔吉克族');
INSERT INTO `e_r_sys_nation` VALUES ('42', '怒族');
INSERT INTO `e_r_sys_nation` VALUES ('43', '乌孜别克族');
INSERT INTO `e_r_sys_nation` VALUES ('44', '俄罗斯族');
INSERT INTO `e_r_sys_nation` VALUES ('45', '鄂温克族');
INSERT INTO `e_r_sys_nation` VALUES ('46', '德昂族');
INSERT INTO `e_r_sys_nation` VALUES ('47', '保安族');
INSERT INTO `e_r_sys_nation` VALUES ('48', '裕固族');
INSERT INTO `e_r_sys_nation` VALUES ('49', '京族');
INSERT INTO `e_r_sys_nation` VALUES ('5', '维吾尔族');
INSERT INTO `e_r_sys_nation` VALUES ('50', '塔塔尔族');
INSERT INTO `e_r_sys_nation` VALUES ('51', '独龙族');
INSERT INTO `e_r_sys_nation` VALUES ('52', '鄂伦春族');
INSERT INTO `e_r_sys_nation` VALUES ('53', '赫哲族');
INSERT INTO `e_r_sys_nation` VALUES ('54', '门巴族');
INSERT INTO `e_r_sys_nation` VALUES ('55', '珞巴族');
INSERT INTO `e_r_sys_nation` VALUES ('56', '基诺族');
INSERT INTO `e_r_sys_nation` VALUES ('6', '苗族');
INSERT INTO `e_r_sys_nation` VALUES ('7', '彝族');
INSERT INTO `e_r_sys_nation` VALUES ('8', '壮族');
INSERT INTO `e_r_sys_nation` VALUES ('9', '布依族');

-- ----------------------------
-- Table structure for e_r_sys_region
-- ----------------------------
DROP TABLE IF EXISTS `e_r_sys_region`;
CREATE TABLE `e_r_sys_region` (
  `region_id` bigint(20) NOT NULL COMMENT '地区ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `short_name` varchar(128) DEFAULT NULL COMMENT '简称',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `merger_name` varchar(256) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级（1：省，2：市，3：区县）',
  `pinyin` varchar(128) DEFAULT NULL COMMENT '拼音',
  `code` varchar(128) DEFAULT NULL COMMENT '长途区号',
  `zip_code` varchar(16) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统地区表';

-- ----------------------------
-- Records of e_r_sys_region
-- ----------------------------
INSERT INTO `e_r_sys_region` VALUES ('100000', '0', '中国', '中国', '中国', '0', 'China', '', '');
INSERT INTO `e_r_sys_region` VALUES ('110000', '100000', '北京', '北京', '中国,北京', '1', 'Beijing', '', '');
INSERT INTO `e_r_sys_region` VALUES ('110100', '110000', '北京', '北京市', '中国,北京,北京市', '2', 'Beijing', '010', '100000');
INSERT INTO `e_r_sys_region` VALUES ('110101', '110100', '东城', '东城区', '中国,北京,北京市,东城区', '3', 'Dongcheng', '010', '100010');
INSERT INTO `e_r_sys_region` VALUES ('110102', '110100', '西城', '西城区', '中国,北京,北京市,西城区', '3', 'Xicheng', '010', '100032');
INSERT INTO `e_r_sys_region` VALUES ('110105', '110100', '朝阳', '朝阳区', '中国,北京,北京市,朝阳区', '3', 'Chaoyang', '010', '100020');
INSERT INTO `e_r_sys_region` VALUES ('110106', '110100', '丰台', '丰台区', '中国,北京,北京市,丰台区', '3', 'Fengtai', '010', '100071');
INSERT INTO `e_r_sys_region` VALUES ('110107', '110100', '石景山', '石景山区', '中国,北京,北京市,石景山区', '3', 'Shijingshan', '010', '100043');
INSERT INTO `e_r_sys_region` VALUES ('110108', '110100', '海淀', '海淀区', '中国,北京,北京市,海淀区', '3', 'Haidian', '010', '100089');
INSERT INTO `e_r_sys_region` VALUES ('110109', '110100', '门头沟', '门头沟区', '中国,北京,北京市,门头沟区', '3', 'Mentougou', '010', '102300');
INSERT INTO `e_r_sys_region` VALUES ('110111', '110100', '房山', '房山区', '中国,北京,北京市,房山区', '3', 'Fangshan', '010', '102488');
INSERT INTO `e_r_sys_region` VALUES ('110112', '110100', '通州', '通州区', '中国,北京,北京市,通州区', '3', 'Tongzhou', '010', '101149');
INSERT INTO `e_r_sys_region` VALUES ('110113', '110100', '顺义', '顺义区', '中国,北京,北京市,顺义区', '3', 'Shunyi', '010', '101300');
INSERT INTO `e_r_sys_region` VALUES ('110114', '110100', '昌平', '昌平区', '中国,北京,北京市,昌平区', '3', 'Changping', '010', '102200');
INSERT INTO `e_r_sys_region` VALUES ('110115', '110100', '大兴', '大兴区', '中国,北京,北京市,大兴区', '3', 'Daxing', '010', '102600');
INSERT INTO `e_r_sys_region` VALUES ('110116', '110100', '怀柔', '怀柔区', '中国,北京,北京市,怀柔区', '3', 'Huairou', '010', '101400');
INSERT INTO `e_r_sys_region` VALUES ('110117', '110100', '平谷', '平谷区', '中国,北京,北京市,平谷区', '3', 'Pinggu', '010', '101200');
INSERT INTO `e_r_sys_region` VALUES ('110228', '110100', '密云', '密云县', '中国,北京,北京市,密云县', '3', 'Miyun', '010', '101500');
INSERT INTO `e_r_sys_region` VALUES ('110229', '110100', '延庆', '延庆县', '中国,北京,北京市,延庆县', '3', 'Yanqing', '010', '102100');
INSERT INTO `e_r_sys_region` VALUES ('120000', '100000', '天津', '天津', '中国,天津', '1', 'Tianjin', '', '');
INSERT INTO `e_r_sys_region` VALUES ('120100', '120000', '天津', '天津市', '中国,天津,天津市', '2', 'Tianjin', '022', '300000');
INSERT INTO `e_r_sys_region` VALUES ('120101', '120100', '和平', '和平区', '中国,天津,天津市,和平区', '3', 'Heping', '022', '300041');
INSERT INTO `e_r_sys_region` VALUES ('120102', '120100', '河东', '河东区', '中国,天津,天津市,河东区', '3', 'Hedong', '022', '300171');
INSERT INTO `e_r_sys_region` VALUES ('120103', '120100', '河西', '河西区', '中国,天津,天津市,河西区', '3', 'Hexi', '022', '300202');
INSERT INTO `e_r_sys_region` VALUES ('120104', '120100', '南开', '南开区', '中国,天津,天津市,南开区', '3', 'Nankai', '022', '300110');
INSERT INTO `e_r_sys_region` VALUES ('120105', '120100', '河北', '河北区', '中国,天津,天津市,河北区', '3', 'Hebei', '022', '300143');
INSERT INTO `e_r_sys_region` VALUES ('120106', '120100', '红桥', '红桥区', '中国,天津,天津市,红桥区', '3', 'Hongqiao', '022', '300131');
INSERT INTO `e_r_sys_region` VALUES ('120110', '120100', '东丽', '东丽区', '中国,天津,天津市,东丽区', '3', 'Dongli', '022', '300300');
INSERT INTO `e_r_sys_region` VALUES ('120111', '120100', '西青', '西青区', '中国,天津,天津市,西青区', '3', 'Xiqing', '022', '300380');
INSERT INTO `e_r_sys_region` VALUES ('120112', '120100', '津南', '津南区', '中国,天津,天津市,津南区', '3', 'Jinnan', '022', '300350');
INSERT INTO `e_r_sys_region` VALUES ('120113', '120100', '北辰', '北辰区', '中国,天津,天津市,北辰区', '3', 'Beichen', '022', '300400');
INSERT INTO `e_r_sys_region` VALUES ('120114', '120100', '武清', '武清区', '中国,天津,天津市,武清区', '3', 'Wuqing', '022', '301700');
INSERT INTO `e_r_sys_region` VALUES ('120115', '120100', '宝坻', '宝坻区', '中国,天津,天津市,宝坻区', '3', 'Baodi', '022', '301800');
INSERT INTO `e_r_sys_region` VALUES ('120116', '120100', '滨海新区', '滨海新区', '中国,天津,天津市,滨海新区', '3', 'Binhaixinqu', '022', '300451');
INSERT INTO `e_r_sys_region` VALUES ('120221', '120100', '宁河', '宁河县', '中国,天津,天津市,宁河县', '3', 'Ninghe', '022', '301500');
INSERT INTO `e_r_sys_region` VALUES ('120223', '120100', '静海', '静海县', '中国,天津,天津市,静海县', '3', 'Jinghai', '022', '301600');
INSERT INTO `e_r_sys_region` VALUES ('120225', '120100', '蓟县', '蓟县', '中国,天津,天津市,蓟县', '3', 'Jixian', '022', '301900');
INSERT INTO `e_r_sys_region` VALUES ('130000', '100000', '河北', '河北省', '中国,河北省', '1', 'Hebei', '', '');
INSERT INTO `e_r_sys_region` VALUES ('130100', '130000', '石家庄', '石家庄市', '中国,河北省,石家庄市', '2', 'Shijiazhuang', '0311', '050011');
INSERT INTO `e_r_sys_region` VALUES ('130102', '130100', '长安', '长安区', '中国,河北省,石家庄市,长安区', '3', 'Chang\'an', '0311', '050011');
INSERT INTO `e_r_sys_region` VALUES ('130104', '130100', '桥西', '桥西区', '中国,河北省,石家庄市,桥西区', '3', 'Qiaoxi', '0311', '050091');
INSERT INTO `e_r_sys_region` VALUES ('130105', '130100', '新华', '新华区', '中国,河北省,石家庄市,新华区', '3', 'Xinhua', '0311', '050051');
INSERT INTO `e_r_sys_region` VALUES ('130107', '130100', '井陉矿区', '井陉矿区', '中国,河北省,石家庄市,井陉矿区', '3', 'Jingxingkuangqu', '0311', '050100');
INSERT INTO `e_r_sys_region` VALUES ('130108', '130100', '裕华', '裕华区', '中国,河北省,石家庄市,裕华区', '3', 'Yuhua', '0311', '050031');
INSERT INTO `e_r_sys_region` VALUES ('130109', '130100', '藁城', '藁城区', '中国,河北省,石家庄市,藁城区', '3', 'Gaocheng', '0311', '052160');
INSERT INTO `e_r_sys_region` VALUES ('130110', '130100', '鹿泉', '鹿泉区', '中国,河北省,石家庄市,鹿泉区', '3', 'Luquan', '0311', '050200');
INSERT INTO `e_r_sys_region` VALUES ('130111', '130100', '栾城', '栾城区', '中国,河北省,石家庄市,栾城区', '3', 'Luancheng', '0311', '051430');
INSERT INTO `e_r_sys_region` VALUES ('130121', '130100', '井陉', '井陉县', '中国,河北省,石家庄市,井陉县', '3', 'Jingxing', '0311', '050300');
INSERT INTO `e_r_sys_region` VALUES ('130123', '130100', '正定', '正定县', '中国,河北省,石家庄市,正定县', '3', 'Zhengding', '0311', '050800');
INSERT INTO `e_r_sys_region` VALUES ('130125', '130100', '行唐', '行唐县', '中国,河北省,石家庄市,行唐县', '3', 'Xingtang', '0311', '050600');
INSERT INTO `e_r_sys_region` VALUES ('130126', '130100', '灵寿', '灵寿县', '中国,河北省,石家庄市,灵寿县', '3', 'Lingshou', '0311', '050500');
INSERT INTO `e_r_sys_region` VALUES ('130127', '130100', '高邑', '高邑县', '中国,河北省,石家庄市,高邑县', '3', 'Gaoyi', '0311', '051330');
INSERT INTO `e_r_sys_region` VALUES ('130128', '130100', '深泽', '深泽县', '中国,河北省,石家庄市,深泽县', '3', 'Shenze', '0311', '052560');
INSERT INTO `e_r_sys_region` VALUES ('130129', '130100', '赞皇', '赞皇县', '中国,河北省,石家庄市,赞皇县', '3', 'Zanhuang', '0311', '051230');
INSERT INTO `e_r_sys_region` VALUES ('130130', '130100', '无极', '无极县', '中国,河北省,石家庄市,无极县', '3', 'Wuji', '0311', '052460');
INSERT INTO `e_r_sys_region` VALUES ('130131', '130100', '平山', '平山县', '中国,河北省,石家庄市,平山县', '3', 'Pingshan', '0311', '050400');
INSERT INTO `e_r_sys_region` VALUES ('130132', '130100', '元氏', '元氏县', '中国,河北省,石家庄市,元氏县', '3', 'Yuanshi', '0311', '051130');
INSERT INTO `e_r_sys_region` VALUES ('130133', '130100', '赵县', '赵县', '中国,河北省,石家庄市,赵县', '3', 'Zhaoxian', '0311', '051530');
INSERT INTO `e_r_sys_region` VALUES ('130181', '130100', '辛集', '辛集市', '中国,河北省,石家庄市,辛集市', '3', 'Xinji', '0311', '052360');
INSERT INTO `e_r_sys_region` VALUES ('130183', '130100', '晋州', '晋州市', '中国,河北省,石家庄市,晋州市', '3', 'Jinzhou', '0311', '052260');
INSERT INTO `e_r_sys_region` VALUES ('130184', '130100', '新乐', '新乐市', '中国,河北省,石家庄市,新乐市', '3', 'Xinle', '0311', '050700');
INSERT INTO `e_r_sys_region` VALUES ('130200', '130000', '唐山', '唐山市', '中国,河北省,唐山市', '2', 'Tangshan', '0315', '063000');
INSERT INTO `e_r_sys_region` VALUES ('130202', '130200', '路南', '路南区', '中国,河北省,唐山市,路南区', '3', 'Lunan', '0315', '063000');
INSERT INTO `e_r_sys_region` VALUES ('130203', '130200', '路北', '路北区', '中国,河北省,唐山市,路北区', '3', 'Lubei', '0315', '063000');
INSERT INTO `e_r_sys_region` VALUES ('130204', '130200', '古冶', '古冶区', '中国,河北省,唐山市,古冶区', '3', 'Guye', '0315', '063100');
INSERT INTO `e_r_sys_region` VALUES ('130205', '130200', '开平', '开平区', '中国,河北省,唐山市,开平区', '3', 'Kaiping', '0315', '063021');
INSERT INTO `e_r_sys_region` VALUES ('130207', '130200', '丰南', '丰南区', '中国,河北省,唐山市,丰南区', '3', 'Fengnan', '0315', '063300');
INSERT INTO `e_r_sys_region` VALUES ('130208', '130200', '丰润', '丰润区', '中国,河北省,唐山市,丰润区', '3', 'Fengrun', '0315', '064000');
INSERT INTO `e_r_sys_region` VALUES ('130209', '130200', '曹妃甸', '曹妃甸区', '中国,河北省,唐山市,曹妃甸区', '3', 'Caofeidian', '0315', '063200');
INSERT INTO `e_r_sys_region` VALUES ('130223', '130200', '滦县', '滦县', '中国,河北省,唐山市,滦县', '3', 'Luanxian', '0315', '063700');
INSERT INTO `e_r_sys_region` VALUES ('130224', '130200', '滦南', '滦南县', '中国,河北省,唐山市,滦南县', '3', 'Luannan', '0315', '063500');
INSERT INTO `e_r_sys_region` VALUES ('130225', '130200', '乐亭', '乐亭县', '中国,河北省,唐山市,乐亭县', '3', 'Laoting', '0315', '063600');
INSERT INTO `e_r_sys_region` VALUES ('130227', '130200', '迁西', '迁西县', '中国,河北省,唐山市,迁西县', '3', 'Qianxi', '0315', '064300');
INSERT INTO `e_r_sys_region` VALUES ('130229', '130200', '玉田', '玉田县', '中国,河北省,唐山市,玉田县', '3', 'Yutian', '0315', '064100');
INSERT INTO `e_r_sys_region` VALUES ('130281', '130200', '遵化', '遵化市', '中国,河北省,唐山市,遵化市', '3', 'Zunhua', '0315', '064200');
INSERT INTO `e_r_sys_region` VALUES ('130283', '130200', '迁安', '迁安市', '中国,河北省,唐山市,迁安市', '3', 'Qian\'an', '0315', '064400');
INSERT INTO `e_r_sys_region` VALUES ('130300', '130000', '秦皇岛', '秦皇岛市', '中国,河北省,秦皇岛市', '2', 'Qinhuangdao', '0335', '066000');
INSERT INTO `e_r_sys_region` VALUES ('130302', '130300', '海港', '海港区', '中国,河北省,秦皇岛市,海港区', '3', 'Haigang', '0335', '066000');
INSERT INTO `e_r_sys_region` VALUES ('130303', '130300', '山海关', '山海关区', '中国,河北省,秦皇岛市,山海关区', '3', 'Shanhaiguan', '0335', '066200');
INSERT INTO `e_r_sys_region` VALUES ('130304', '130300', '北戴河', '北戴河区', '中国,河北省,秦皇岛市,北戴河区', '3', 'Beidaihe', '0335', '066100');
INSERT INTO `e_r_sys_region` VALUES ('130321', '130300', '青龙', '青龙满族自治县', '中国,河北省,秦皇岛市,青龙满族自治县', '3', 'Qinglong', '0335', '066500');
INSERT INTO `e_r_sys_region` VALUES ('130322', '130300', '昌黎', '昌黎县', '中国,河北省,秦皇岛市,昌黎县', '3', 'Changli', '0335', '066600');
INSERT INTO `e_r_sys_region` VALUES ('130323', '130300', '抚宁', '抚宁县', '中国,河北省,秦皇岛市,抚宁县', '3', 'Funing', '0335', '066300');
INSERT INTO `e_r_sys_region` VALUES ('130324', '130300', '卢龙', '卢龙县', '中国,河北省,秦皇岛市,卢龙县', '3', 'Lulong', '0335', '066400');
INSERT INTO `e_r_sys_region` VALUES ('130400', '130000', '邯郸', '邯郸市', '中国,河北省,邯郸市', '2', 'Handan', '0310', '056002');
INSERT INTO `e_r_sys_region` VALUES ('130402', '130400', '邯山', '邯山区', '中国,河北省,邯郸市,邯山区', '3', 'Hanshan', '0310', '056001');
INSERT INTO `e_r_sys_region` VALUES ('130403', '130400', '丛台', '丛台区', '中国,河北省,邯郸市,丛台区', '3', 'Congtai', '0310', '056002');
INSERT INTO `e_r_sys_region` VALUES ('130404', '130400', '复兴', '复兴区', '中国,河北省,邯郸市,复兴区', '3', 'Fuxing', '0310', '056003');
INSERT INTO `e_r_sys_region` VALUES ('130406', '130400', '峰峰矿区', '峰峰矿区', '中国,河北省,邯郸市,峰峰矿区', '3', 'Fengfengkuangqu', '0310', '056200');
INSERT INTO `e_r_sys_region` VALUES ('130421', '130400', '邯郸', '邯郸县', '中国,河北省,邯郸市,邯郸县', '3', 'Handan', '0310', '056101');
INSERT INTO `e_r_sys_region` VALUES ('130423', '130400', '临漳', '临漳县', '中国,河北省,邯郸市,临漳县', '3', 'Linzhang', '0310', '056600');
INSERT INTO `e_r_sys_region` VALUES ('130424', '130400', '成安', '成安县', '中国,河北省,邯郸市,成安县', '3', 'Cheng\'an', '0310', '056700');
INSERT INTO `e_r_sys_region` VALUES ('130425', '130400', '大名', '大名县', '中国,河北省,邯郸市,大名县', '3', 'Daming', '0310', '056900');
INSERT INTO `e_r_sys_region` VALUES ('130426', '130400', '涉县', '涉县', '中国,河北省,邯郸市,涉县', '3', 'Shexian', '0310', '056400');
INSERT INTO `e_r_sys_region` VALUES ('130427', '130400', '磁县', '磁县', '中国,河北省,邯郸市,磁县', '3', 'Cixian', '0310', '056500');
INSERT INTO `e_r_sys_region` VALUES ('130428', '130400', '肥乡', '肥乡县', '中国,河北省,邯郸市,肥乡县', '3', 'Feixiang', '0310', '057550');
INSERT INTO `e_r_sys_region` VALUES ('130429', '130400', '永年', '永年县', '中国,河北省,邯郸市,永年县', '3', 'Yongnian', '0310', '057150');
INSERT INTO `e_r_sys_region` VALUES ('130430', '130400', '邱县', '邱县', '中国,河北省,邯郸市,邱县', '3', 'Qiuxian', '0310', '057450');
INSERT INTO `e_r_sys_region` VALUES ('130431', '130400', '鸡泽', '鸡泽县', '中国,河北省,邯郸市,鸡泽县', '3', 'Jize', '0310', '057350');
INSERT INTO `e_r_sys_region` VALUES ('130432', '130400', '广平', '广平县', '中国,河北省,邯郸市,广平县', '3', 'Guangping', '0310', '057650');
INSERT INTO `e_r_sys_region` VALUES ('130433', '130400', '馆陶', '馆陶县', '中国,河北省,邯郸市,馆陶县', '3', 'Guantao', '0310', '057750');
INSERT INTO `e_r_sys_region` VALUES ('130434', '130400', '魏县', '魏县', '中国,河北省,邯郸市,魏县', '3', 'Weixian', '0310', '056800');
INSERT INTO `e_r_sys_region` VALUES ('130435', '130400', '曲周', '曲周县', '中国,河北省,邯郸市,曲周县', '3', 'Quzhou', '0310', '057250');
INSERT INTO `e_r_sys_region` VALUES ('130481', '130400', '武安', '武安市', '中国,河北省,邯郸市,武安市', '3', 'Wu\'an', '0310', '056300');
INSERT INTO `e_r_sys_region` VALUES ('130500', '130000', '邢台', '邢台市', '中国,河北省,邢台市', '2', 'Xingtai', '0319', '054001');
INSERT INTO `e_r_sys_region` VALUES ('130502', '130500', '桥东', '桥东区', '中国,河北省,邢台市,桥东区', '3', 'Qiaodong', '0319', '054001');
INSERT INTO `e_r_sys_region` VALUES ('130503', '130500', '桥西', '桥西区', '中国,河北省,邢台市,桥西区', '3', 'Qiaoxi', '0319', '054000');
INSERT INTO `e_r_sys_region` VALUES ('130521', '130500', '邢台', '邢台县', '中国,河北省,邢台市,邢台县', '3', 'Xingtai', '0319', '054001');
INSERT INTO `e_r_sys_region` VALUES ('130522', '130500', '临城', '临城县', '中国,河北省,邢台市,临城县', '3', 'Lincheng', '0319', '054300');
INSERT INTO `e_r_sys_region` VALUES ('130523', '130500', '内丘', '内丘县', '中国,河北省,邢台市,内丘县', '3', 'Neiqiu', '0319', '054200');
INSERT INTO `e_r_sys_region` VALUES ('130524', '130500', '柏乡', '柏乡县', '中国,河北省,邢台市,柏乡县', '3', 'Baixiang', '0319', '055450');
INSERT INTO `e_r_sys_region` VALUES ('130525', '130500', '隆尧', '隆尧县', '中国,河北省,邢台市,隆尧县', '3', 'Longyao', '0319', '055350');
INSERT INTO `e_r_sys_region` VALUES ('130526', '130500', '任县', '任县', '中国,河北省,邢台市,任县', '3', 'Renxian', '0319', '055150');
INSERT INTO `e_r_sys_region` VALUES ('130527', '130500', '南和', '南和县', '中国,河北省,邢台市,南和县', '3', 'Nanhe', '0319', '054400');
INSERT INTO `e_r_sys_region` VALUES ('130528', '130500', '宁晋', '宁晋县', '中国,河北省,邢台市,宁晋县', '3', 'Ningjin', '0319', '055550');
INSERT INTO `e_r_sys_region` VALUES ('130529', '130500', '巨鹿', '巨鹿县', '中国,河北省,邢台市,巨鹿县', '3', 'Julu', '0319', '055250');
INSERT INTO `e_r_sys_region` VALUES ('130530', '130500', '新河', '新河县', '中国,河北省,邢台市,新河县', '3', 'Xinhe', '0319', '055650');
INSERT INTO `e_r_sys_region` VALUES ('130531', '130500', '广宗', '广宗县', '中国,河北省,邢台市,广宗县', '3', 'Guangzong', '0319', '054600');
INSERT INTO `e_r_sys_region` VALUES ('130532', '130500', '平乡', '平乡县', '中国,河北省,邢台市,平乡县', '3', 'Pingxiang', '0319', '054500');
INSERT INTO `e_r_sys_region` VALUES ('130533', '130500', '威县', '威县', '中国,河北省,邢台市,威县', '3', 'Weixian', '0319', '054700');
INSERT INTO `e_r_sys_region` VALUES ('130534', '130500', '清河', '清河县', '中国,河北省,邢台市,清河县', '3', 'Qinghe', '0319', '054800');
INSERT INTO `e_r_sys_region` VALUES ('130535', '130500', '临西', '临西县', '中国,河北省,邢台市,临西县', '3', 'Linxi', '0319', '054900');
INSERT INTO `e_r_sys_region` VALUES ('130581', '130500', '南宫', '南宫市', '中国,河北省,邢台市,南宫市', '3', 'Nangong', '0319', '055750');
INSERT INTO `e_r_sys_region` VALUES ('130582', '130500', '沙河', '沙河市', '中国,河北省,邢台市,沙河市', '3', 'Shahe', '0319', '054100');
INSERT INTO `e_r_sys_region` VALUES ('130600', '130000', '保定', '保定市', '中国,河北省,保定市', '2', 'Baoding', '0312', '071052');
INSERT INTO `e_r_sys_region` VALUES ('130602', '130600', '新市', '新市区', '中国,河北省,保定市,新市区', '3', 'Xinshi', '0312', '071051');
INSERT INTO `e_r_sys_region` VALUES ('130603', '130600', '北市', '北市区', '中国,河北省,保定市,北市区', '3', 'Beishi', '0312', '071000');
INSERT INTO `e_r_sys_region` VALUES ('130604', '130600', '南市', '南市区', '中国,河北省,保定市,南市区', '3', 'Nanshi', '0312', '071001');
INSERT INTO `e_r_sys_region` VALUES ('130621', '130600', '满城', '满城县', '中国,河北省,保定市,满城县', '3', 'Mancheng', '0312', '072150');
INSERT INTO `e_r_sys_region` VALUES ('130622', '130600', '清苑', '清苑县', '中国,河北省,保定市,清苑县', '3', 'Qingyuan', '0312', '071100');
INSERT INTO `e_r_sys_region` VALUES ('130623', '130600', '涞水', '涞水县', '中国,河北省,保定市,涞水县', '3', 'Laishui', '0312', '074100');
INSERT INTO `e_r_sys_region` VALUES ('130624', '130600', '阜平', '阜平县', '中国,河北省,保定市,阜平县', '3', 'Fuping', '0312', '073200');
INSERT INTO `e_r_sys_region` VALUES ('130625', '130600', '徐水', '徐水县', '中国,河北省,保定市,徐水县', '3', 'Xushui', '0312', '072550');
INSERT INTO `e_r_sys_region` VALUES ('130626', '130600', '定兴', '定兴县', '中国,河北省,保定市,定兴县', '3', 'Dingxing', '0312', '072650');
INSERT INTO `e_r_sys_region` VALUES ('130627', '130600', '唐县', '唐县', '中国,河北省,保定市,唐县', '3', 'Tangxian', '0312', '072350');
INSERT INTO `e_r_sys_region` VALUES ('130628', '130600', '高阳', '高阳县', '中国,河北省,保定市,高阳县', '3', 'Gaoyang', '0312', '071500');
INSERT INTO `e_r_sys_region` VALUES ('130629', '130600', '容城', '容城县', '中国,河北省,保定市,容城县', '3', 'Rongcheng', '0312', '071700');
INSERT INTO `e_r_sys_region` VALUES ('130630', '130600', '涞源', '涞源县', '中国,河北省,保定市,涞源县', '3', 'Laiyuan', '0312', '074300');
INSERT INTO `e_r_sys_region` VALUES ('130631', '130600', '望都', '望都县', '中国,河北省,保定市,望都县', '3', 'Wangdu', '0312', '072450');
INSERT INTO `e_r_sys_region` VALUES ('130632', '130600', '安新', '安新县', '中国,河北省,保定市,安新县', '3', 'Anxin', '0312', '071600');
INSERT INTO `e_r_sys_region` VALUES ('130633', '130600', '易县', '易县', '中国,河北省,保定市,易县', '3', 'Yixian', '0312', '074200');
INSERT INTO `e_r_sys_region` VALUES ('130634', '130600', '曲阳', '曲阳县', '中国,河北省,保定市,曲阳县', '3', 'Quyang', '0312', '073100');
INSERT INTO `e_r_sys_region` VALUES ('130635', '130600', '蠡县', '蠡县', '中国,河北省,保定市,蠡县', '3', 'Lixian', '0312', '071400');
INSERT INTO `e_r_sys_region` VALUES ('130636', '130600', '顺平', '顺平县', '中国,河北省,保定市,顺平县', '3', 'Shunping', '0312', '072250');
INSERT INTO `e_r_sys_region` VALUES ('130637', '130600', '博野', '博野县', '中国,河北省,保定市,博野县', '3', 'Boye', '0312', '071300');
INSERT INTO `e_r_sys_region` VALUES ('130638', '130600', '雄县', '雄县', '中国,河北省,保定市,雄县', '3', 'Xiongxian', '0312', '071800');
INSERT INTO `e_r_sys_region` VALUES ('130681', '130600', '涿州', '涿州市', '中国,河北省,保定市,涿州市', '3', 'Zhuozhou', '0312', '072750');
INSERT INTO `e_r_sys_region` VALUES ('130682', '130600', '定州', '定州市', '中国,河北省,保定市,定州市', '3', 'Dingzhou', '0312', '073000');
INSERT INTO `e_r_sys_region` VALUES ('130683', '130600', '安国', '安国市', '中国,河北省,保定市,安国市', '3', 'Anguo', '0312', '071200');
INSERT INTO `e_r_sys_region` VALUES ('130684', '130600', '高碑店', '高碑店市', '中国,河北省,保定市,高碑店市', '3', 'Gaobeidian', '0312', '074000');
INSERT INTO `e_r_sys_region` VALUES ('130700', '130000', '张家口', '张家口市', '中国,河北省,张家口市', '2', 'Zhangjiakou', '0313', '075000');
INSERT INTO `e_r_sys_region` VALUES ('130702', '130700', '桥东', '桥东区', '中国,河北省,张家口市,桥东区', '3', 'Qiaodong', '0313', '075000');
INSERT INTO `e_r_sys_region` VALUES ('130703', '130700', '桥西', '桥西区', '中国,河北省,张家口市,桥西区', '3', 'Qiaoxi', '0313', '075061');
INSERT INTO `e_r_sys_region` VALUES ('130705', '130700', '宣化', '宣化区', '中国,河北省,张家口市,宣化区', '3', 'Xuanhua', '0313', '075100');
INSERT INTO `e_r_sys_region` VALUES ('130706', '130700', '下花园', '下花园区', '中国,河北省,张家口市,下花园区', '3', 'Xiahuayuan', '0313', '075300');
INSERT INTO `e_r_sys_region` VALUES ('130721', '130700', '宣化', '宣化县', '中国,河北省,张家口市,宣化县', '3', 'Xuanhua', '0313', '075100');
INSERT INTO `e_r_sys_region` VALUES ('130722', '130700', '张北', '张北县', '中国,河北省,张家口市,张北县', '3', 'Zhangbei', '0313', '076450');
INSERT INTO `e_r_sys_region` VALUES ('130723', '130700', '康保', '康保县', '中国,河北省,张家口市,康保县', '3', 'Kangbao', '0313', '076650');
INSERT INTO `e_r_sys_region` VALUES ('130724', '130700', '沽源', '沽源县', '中国,河北省,张家口市,沽源县', '3', 'Guyuan', '0313', '076550');
INSERT INTO `e_r_sys_region` VALUES ('130725', '130700', '尚义', '尚义县', '中国,河北省,张家口市,尚义县', '3', 'Shangyi', '0313', '076750');
INSERT INTO `e_r_sys_region` VALUES ('130726', '130700', '蔚县', '蔚县', '中国,河北省,张家口市,蔚县', '3', 'Yuxian', '0313', '075700');
INSERT INTO `e_r_sys_region` VALUES ('130727', '130700', '阳原', '阳原县', '中国,河北省,张家口市,阳原县', '3', 'Yangyuan', '0313', '075800');
INSERT INTO `e_r_sys_region` VALUES ('130728', '130700', '怀安', '怀安县', '中国,河北省,张家口市,怀安县', '3', 'Huai\'an', '0313', '076150');
INSERT INTO `e_r_sys_region` VALUES ('130729', '130700', '万全', '万全县', '中国,河北省,张家口市,万全县', '3', 'Wanquan', '0313', '076250');
INSERT INTO `e_r_sys_region` VALUES ('130730', '130700', '怀来', '怀来县', '中国,河北省,张家口市,怀来县', '3', 'Huailai', '0313', '075400');
INSERT INTO `e_r_sys_region` VALUES ('130731', '130700', '涿鹿', '涿鹿县', '中国,河北省,张家口市,涿鹿县', '3', 'Zhuolu', '0313', '075600');
INSERT INTO `e_r_sys_region` VALUES ('130732', '130700', '赤城', '赤城县', '中国,河北省,张家口市,赤城县', '3', 'Chicheng', '0313', '075500');
INSERT INTO `e_r_sys_region` VALUES ('130733', '130700', '崇礼', '崇礼县', '中国,河北省,张家口市,崇礼县', '3', 'Chongli', '0313', '076350');
INSERT INTO `e_r_sys_region` VALUES ('130800', '130000', '承德', '承德市', '中国,河北省,承德市', '2', 'Chengde', '0314', '067000');
INSERT INTO `e_r_sys_region` VALUES ('130802', '130800', '双桥', '双桥区', '中国,河北省,承德市,双桥区', '3', 'Shuangqiao', '0314', '067000');
INSERT INTO `e_r_sys_region` VALUES ('130803', '130800', '双滦', '双滦区', '中国,河北省,承德市,双滦区', '3', 'Shuangluan', '0314', '067001');
INSERT INTO `e_r_sys_region` VALUES ('130804', '130800', '鹰手营子矿区', '鹰手营子矿区', '中国,河北省,承德市,鹰手营子矿区', '3', 'Yingshouyingzikuangqu', '0314', '067200');
INSERT INTO `e_r_sys_region` VALUES ('130821', '130800', '承德', '承德县', '中国,河北省,承德市,承德县', '3', 'Chengde', '0314', '067400');
INSERT INTO `e_r_sys_region` VALUES ('130822', '130800', '兴隆', '兴隆县', '中国,河北省,承德市,兴隆县', '3', 'Xinglong', '0314', '067300');
INSERT INTO `e_r_sys_region` VALUES ('130823', '130800', '平泉', '平泉县', '中国,河北省,承德市,平泉县', '3', 'Pingquan', '0314', '067500');
INSERT INTO `e_r_sys_region` VALUES ('130824', '130800', '滦平', '滦平县', '中国,河北省,承德市,滦平县', '3', 'Luanping', '0314', '068250');
INSERT INTO `e_r_sys_region` VALUES ('130825', '130800', '隆化', '隆化县', '中国,河北省,承德市,隆化县', '3', 'Longhua', '0314', '068150');
INSERT INTO `e_r_sys_region` VALUES ('130826', '130800', '丰宁', '丰宁满族自治县', '中国,河北省,承德市,丰宁满族自治县', '3', 'Fengning', '0314', '068350');
INSERT INTO `e_r_sys_region` VALUES ('130827', '130800', '宽城', '宽城满族自治县', '中国,河北省,承德市,宽城满族自治县', '3', 'Kuancheng', '0314', '067600');
INSERT INTO `e_r_sys_region` VALUES ('130828', '130800', '围场', '围场满族蒙古族自治县', '中国,河北省,承德市,围场满族蒙古族自治县', '3', 'Weichang', '0314', '068450');
INSERT INTO `e_r_sys_region` VALUES ('130900', '130000', '沧州', '沧州市', '中国,河北省,沧州市', '2', 'Cangzhou', '0317', '061001');
INSERT INTO `e_r_sys_region` VALUES ('130902', '130900', '新华', '新华区', '中国,河北省,沧州市,新华区', '3', 'Xinhua', '0317', '061000');
INSERT INTO `e_r_sys_region` VALUES ('130903', '130900', '运河', '运河区', '中国,河北省,沧州市,运河区', '3', 'Yunhe', '0317', '061001');
INSERT INTO `e_r_sys_region` VALUES ('130921', '130900', '沧县', '沧县', '中国,河北省,沧州市,沧县', '3', 'Cangxian', '0317', '061000');
INSERT INTO `e_r_sys_region` VALUES ('130922', '130900', '青县', '青县', '中国,河北省,沧州市,青县', '3', 'Qingxian', '0317', '062650');
INSERT INTO `e_r_sys_region` VALUES ('130923', '130900', '东光', '东光县', '中国,河北省,沧州市,东光县', '3', 'Dongguang', '0317', '061600');
INSERT INTO `e_r_sys_region` VALUES ('130924', '130900', '海兴', '海兴县', '中国,河北省,沧州市,海兴县', '3', 'Haixing', '0317', '061200');
INSERT INTO `e_r_sys_region` VALUES ('130925', '130900', '盐山', '盐山县', '中国,河北省,沧州市,盐山县', '3', 'Yanshan', '0317', '061300');
INSERT INTO `e_r_sys_region` VALUES ('130926', '130900', '肃宁', '肃宁县', '中国,河北省,沧州市,肃宁县', '3', 'Suning', '0317', '062350');
INSERT INTO `e_r_sys_region` VALUES ('130927', '130900', '南皮', '南皮县', '中国,河北省,沧州市,南皮县', '3', 'Nanpi', '0317', '061500');
INSERT INTO `e_r_sys_region` VALUES ('130928', '130900', '吴桥', '吴桥县', '中国,河北省,沧州市,吴桥县', '3', 'Wuqiao', '0317', '061800');
INSERT INTO `e_r_sys_region` VALUES ('130929', '130900', '献县', '献县', '中国,河北省,沧州市,献县', '3', 'Xianxian', '0317', '062250');
INSERT INTO `e_r_sys_region` VALUES ('130930', '130900', '孟村', '孟村回族自治县', '中国,河北省,沧州市,孟村回族自治县', '3', 'Mengcun', '0317', '061400');
INSERT INTO `e_r_sys_region` VALUES ('130981', '130900', '泊头', '泊头市', '中国,河北省,沧州市,泊头市', '3', 'Botou', '0317', '062150');
INSERT INTO `e_r_sys_region` VALUES ('130982', '130900', '任丘', '任丘市', '中国,河北省,沧州市,任丘市', '3', 'Renqiu', '0317', '062550');
INSERT INTO `e_r_sys_region` VALUES ('130983', '130900', '黄骅', '黄骅市', '中国,河北省,沧州市,黄骅市', '3', 'Huanghua', '0317', '061100');
INSERT INTO `e_r_sys_region` VALUES ('130984', '130900', '河间', '河间市', '中国,河北省,沧州市,河间市', '3', 'Hejian', '0317', '062450');
INSERT INTO `e_r_sys_region` VALUES ('131000', '130000', '廊坊', '廊坊市', '中国,河北省,廊坊市', '2', 'Langfang', '0316', '065000');
INSERT INTO `e_r_sys_region` VALUES ('131002', '131000', '安次', '安次区', '中国,河北省,廊坊市,安次区', '3', 'Anci', '0316', '065000');
INSERT INTO `e_r_sys_region` VALUES ('131003', '131000', '广阳', '广阳区', '中国,河北省,廊坊市,广阳区', '3', 'Guangyang', '0316', '065000');
INSERT INTO `e_r_sys_region` VALUES ('131022', '131000', '固安', '固安县', '中国,河北省,廊坊市,固安县', '3', 'Gu\'an', '0316', '065500');
INSERT INTO `e_r_sys_region` VALUES ('131023', '131000', '永清', '永清县', '中国,河北省,廊坊市,永清县', '3', 'Yongqing', '0316', '065600');
INSERT INTO `e_r_sys_region` VALUES ('131024', '131000', '香河', '香河县', '中国,河北省,廊坊市,香河县', '3', 'Xianghe', '0316', '065400');
INSERT INTO `e_r_sys_region` VALUES ('131025', '131000', '大城', '大城县', '中国,河北省,廊坊市,大城县', '3', 'Daicheng', '0316', '065900');
INSERT INTO `e_r_sys_region` VALUES ('131026', '131000', '文安', '文安县', '中国,河北省,廊坊市,文安县', '3', 'Wen\'an', '0316', '065800');
INSERT INTO `e_r_sys_region` VALUES ('131028', '131000', '大厂', '大厂回族自治县', '中国,河北省,廊坊市,大厂回族自治县', '3', 'Dachang', '0316', '065300');
INSERT INTO `e_r_sys_region` VALUES ('131081', '131000', '霸州', '霸州市', '中国,河北省,廊坊市,霸州市', '3', 'Bazhou', '0316', '065700');
INSERT INTO `e_r_sys_region` VALUES ('131082', '131000', '三河', '三河市', '中国,河北省,廊坊市,三河市', '3', 'Sanhe', '0316', '065200');
INSERT INTO `e_r_sys_region` VALUES ('131100', '130000', '衡水', '衡水市', '中国,河北省,衡水市', '2', 'Hengshui', '0318', '053000');
INSERT INTO `e_r_sys_region` VALUES ('131102', '131100', '桃城', '桃城区', '中国,河北省,衡水市,桃城区', '3', 'Taocheng', '0318', '053000');
INSERT INTO `e_r_sys_region` VALUES ('131121', '131100', '枣强', '枣强县', '中国,河北省,衡水市,枣强县', '3', 'Zaoqiang', '0318', '053100');
INSERT INTO `e_r_sys_region` VALUES ('131122', '131100', '武邑', '武邑县', '中国,河北省,衡水市,武邑县', '3', 'Wuyi', '0318', '053400');
INSERT INTO `e_r_sys_region` VALUES ('131123', '131100', '武强', '武强县', '中国,河北省,衡水市,武强县', '3', 'Wuqiang', '0318', '053300');
INSERT INTO `e_r_sys_region` VALUES ('131124', '131100', '饶阳', '饶阳县', '中国,河北省,衡水市,饶阳县', '3', 'Raoyang', '0318', '053900');
INSERT INTO `e_r_sys_region` VALUES ('131125', '131100', '安平', '安平县', '中国,河北省,衡水市,安平县', '3', 'Anping', '0318', '053600');
INSERT INTO `e_r_sys_region` VALUES ('131126', '131100', '故城', '故城县', '中国,河北省,衡水市,故城县', '3', 'Gucheng', '0318', '053800');
INSERT INTO `e_r_sys_region` VALUES ('131127', '131100', '景县', '景县', '中国,河北省,衡水市,景县', '3', 'Jingxian', '0318', '053500');
INSERT INTO `e_r_sys_region` VALUES ('131128', '131100', '阜城', '阜城县', '中国,河北省,衡水市,阜城县', '3', 'Fucheng', '0318', '053700');
INSERT INTO `e_r_sys_region` VALUES ('131181', '131100', '冀州', '冀州市', '中国,河北省,衡水市,冀州市', '3', 'Jizhou', '0318', '053200');
INSERT INTO `e_r_sys_region` VALUES ('131182', '131100', '深州', '深州市', '中国,河北省,衡水市,深州市', '3', 'Shenzhou', '0318', '053800');
INSERT INTO `e_r_sys_region` VALUES ('140000', '100000', '山西', '山西省', '中国,山西省', '1', 'Shanxi', '', '');
INSERT INTO `e_r_sys_region` VALUES ('140100', '140000', '太原', '太原市', '中国,山西省,太原市', '2', 'Taiyuan', '0351', '030082');
INSERT INTO `e_r_sys_region` VALUES ('140105', '140100', '小店', '小店区', '中国,山西省,太原市,小店区', '3', 'Xiaodian', '0351', '030032');
INSERT INTO `e_r_sys_region` VALUES ('140106', '140100', '迎泽', '迎泽区', '中国,山西省,太原市,迎泽区', '3', 'Yingze', '0351', '030002');
INSERT INTO `e_r_sys_region` VALUES ('140107', '140100', '杏花岭', '杏花岭区', '中国,山西省,太原市,杏花岭区', '3', 'Xinghualing', '0351', '030009');
INSERT INTO `e_r_sys_region` VALUES ('140108', '140100', '尖草坪', '尖草坪区', '中国,山西省,太原市,尖草坪区', '3', 'Jiancaoping', '0351', '030023');
INSERT INTO `e_r_sys_region` VALUES ('140109', '140100', '万柏林', '万柏林区', '中国,山西省,太原市,万柏林区', '3', 'Wanbailin', '0351', '030024');
INSERT INTO `e_r_sys_region` VALUES ('140110', '140100', '晋源', '晋源区', '中国,山西省,太原市,晋源区', '3', 'Jinyuan', '0351', '030025');
INSERT INTO `e_r_sys_region` VALUES ('140121', '140100', '清徐', '清徐县', '中国,山西省,太原市,清徐县', '3', 'Qingxu', '0351', '030400');
INSERT INTO `e_r_sys_region` VALUES ('140122', '140100', '阳曲', '阳曲县', '中国,山西省,太原市,阳曲县', '3', 'Yangqu', '0351', '030100');
INSERT INTO `e_r_sys_region` VALUES ('140123', '140100', '娄烦', '娄烦县', '中国,山西省,太原市,娄烦县', '3', 'Loufan', '0351', '030300');
INSERT INTO `e_r_sys_region` VALUES ('140181', '140100', '古交', '古交市', '中国,山西省,太原市,古交市', '3', 'Gujiao', '0351', '030200');
INSERT INTO `e_r_sys_region` VALUES ('140200', '140000', '大同', '大同市', '中国,山西省,大同市', '2', 'Datong', '0352', '037008');
INSERT INTO `e_r_sys_region` VALUES ('140202', '140200', '城区', '城区', '中国,山西省,大同市,城区', '3', 'Chengqu', '0352', '037008');
INSERT INTO `e_r_sys_region` VALUES ('140203', '140200', '矿区', '矿区', '中国,山西省,大同市,矿区', '3', 'Kuangqu', '0352', '037003');
INSERT INTO `e_r_sys_region` VALUES ('140211', '140200', '南郊', '南郊区', '中国,山西省,大同市,南郊区', '3', 'Nanjiao', '0352', '037001');
INSERT INTO `e_r_sys_region` VALUES ('140212', '140200', '新荣', '新荣区', '中国,山西省,大同市,新荣区', '3', 'Xinrong', '0352', '037002');
INSERT INTO `e_r_sys_region` VALUES ('140221', '140200', '阳高', '阳高县', '中国,山西省,大同市,阳高县', '3', 'Yanggao', '0352', '038100');
INSERT INTO `e_r_sys_region` VALUES ('140222', '140200', '天镇', '天镇县', '中国,山西省,大同市,天镇县', '3', 'Tianzhen', '0352', '038200');
INSERT INTO `e_r_sys_region` VALUES ('140223', '140200', '广灵', '广灵县', '中国,山西省,大同市,广灵县', '3', 'Guangling', '0352', '037500');
INSERT INTO `e_r_sys_region` VALUES ('140224', '140200', '灵丘', '灵丘县', '中国,山西省,大同市,灵丘县', '3', 'Lingqiu', '0352', '034400');
INSERT INTO `e_r_sys_region` VALUES ('140225', '140200', '浑源', '浑源县', '中国,山西省,大同市,浑源县', '3', 'Hunyuan', '0352', '037400');
INSERT INTO `e_r_sys_region` VALUES ('140226', '140200', '左云', '左云县', '中国,山西省,大同市,左云县', '3', 'Zuoyun', '0352', '037100');
INSERT INTO `e_r_sys_region` VALUES ('140227', '140200', '大同', '大同县', '中国,山西省,大同市,大同县', '3', 'Datong', '0352', '037300');
INSERT INTO `e_r_sys_region` VALUES ('140300', '140000', '阳泉', '阳泉市', '中国,山西省,阳泉市', '2', 'Yangquan', '0353', '045000');
INSERT INTO `e_r_sys_region` VALUES ('140302', '140300', '城区', '城区', '中国,山西省,阳泉市,城区', '3', 'Chengqu', '0353', '045000');
INSERT INTO `e_r_sys_region` VALUES ('140303', '140300', '矿区', '矿区', '中国,山西省,阳泉市,矿区', '3', 'Kuangqu', '0353', '045000');
INSERT INTO `e_r_sys_region` VALUES ('140311', '140300', '郊区', '郊区', '中国,山西省,阳泉市,郊区', '3', 'Jiaoqu', '0353', '045011');
INSERT INTO `e_r_sys_region` VALUES ('140321', '140300', '平定', '平定县', '中国,山西省,阳泉市,平定县', '3', 'Pingding', '0353', '045200');
INSERT INTO `e_r_sys_region` VALUES ('140322', '140300', '盂县', '盂县', '中国,山西省,阳泉市,盂县', '3', 'Yuxian', '0353', '045100');
INSERT INTO `e_r_sys_region` VALUES ('140400', '140000', '长治', '长治市', '中国,山西省,长治市', '2', 'Changzhi', '0355', '046000');
INSERT INTO `e_r_sys_region` VALUES ('140402', '140400', '城区', '城区', '中国,山西省,长治市,城区', '3', 'Chengqu', '0355', '046011');
INSERT INTO `e_r_sys_region` VALUES ('140411', '140400', '郊区', '郊区', '中国,山西省,长治市,郊区', '3', 'Jiaoqu', '0355', '046011');
INSERT INTO `e_r_sys_region` VALUES ('140421', '140400', '长治', '长治县', '中国,山西省,长治市,长治县', '3', 'Changzhi', '0355', '047100');
INSERT INTO `e_r_sys_region` VALUES ('140423', '140400', '襄垣', '襄垣县', '中国,山西省,长治市,襄垣县', '3', 'Xiangyuan', '0355', '046200');
INSERT INTO `e_r_sys_region` VALUES ('140424', '140400', '屯留', '屯留县', '中国,山西省,长治市,屯留县', '3', 'Tunliu', '0355', '046100');
INSERT INTO `e_r_sys_region` VALUES ('140425', '140400', '平顺', '平顺县', '中国,山西省,长治市,平顺县', '3', 'Pingshun', '0355', '047400');
INSERT INTO `e_r_sys_region` VALUES ('140426', '140400', '黎城', '黎城县', '中国,山西省,长治市,黎城县', '3', 'Licheng', '0355', '047600');
INSERT INTO `e_r_sys_region` VALUES ('140427', '140400', '壶关', '壶关县', '中国,山西省,长治市,壶关县', '3', 'Huguan', '0355', '047300');
INSERT INTO `e_r_sys_region` VALUES ('140428', '140400', '长子', '长子县', '中国,山西省,长治市,长子县', '3', 'Zhangzi', '0355', '046600');
INSERT INTO `e_r_sys_region` VALUES ('140429', '140400', '武乡', '武乡县', '中国,山西省,长治市,武乡县', '3', 'Wuxiang', '0355', '046300');
INSERT INTO `e_r_sys_region` VALUES ('140430', '140400', '沁县', '沁县', '中国,山西省,长治市,沁县', '3', 'Qinxian', '0355', '046400');
INSERT INTO `e_r_sys_region` VALUES ('140431', '140400', '沁源', '沁源县', '中国,山西省,长治市,沁源县', '3', 'Qinyuan', '0355', '046500');
INSERT INTO `e_r_sys_region` VALUES ('140481', '140400', '潞城', '潞城市', '中国,山西省,长治市,潞城市', '3', 'Lucheng', '0355', '047500');
INSERT INTO `e_r_sys_region` VALUES ('140500', '140000', '晋城', '晋城市', '中国,山西省,晋城市', '2', 'Jincheng', '0356', '048000');
INSERT INTO `e_r_sys_region` VALUES ('140502', '140500', '城区', '城区', '中国,山西省,晋城市,城区', '3', 'Chengqu', '0356', '048000');
INSERT INTO `e_r_sys_region` VALUES ('140521', '140500', '沁水', '沁水县', '中国,山西省,晋城市,沁水县', '3', 'Qinshui', '0356', '048200');
INSERT INTO `e_r_sys_region` VALUES ('140522', '140500', '阳城', '阳城县', '中国,山西省,晋城市,阳城县', '3', 'Yangcheng', '0356', '048100');
INSERT INTO `e_r_sys_region` VALUES ('140524', '140500', '陵川', '陵川县', '中国,山西省,晋城市,陵川县', '3', 'Lingchuan', '0356', '048300');
INSERT INTO `e_r_sys_region` VALUES ('140525', '140500', '泽州', '泽州县', '中国,山西省,晋城市,泽州县', '3', 'Zezhou', '0356', '048012');
INSERT INTO `e_r_sys_region` VALUES ('140581', '140500', '高平', '高平市', '中国,山西省,晋城市,高平市', '3', 'Gaoping', '0356', '048400');
INSERT INTO `e_r_sys_region` VALUES ('140600', '140000', '朔州', '朔州市', '中国,山西省,朔州市', '2', 'Shuozhou', '0349', '038500');
INSERT INTO `e_r_sys_region` VALUES ('140602', '140600', '朔城', '朔城区', '中国,山西省,朔州市,朔城区', '3', 'Shuocheng', '0349', '036000');
INSERT INTO `e_r_sys_region` VALUES ('140603', '140600', '平鲁', '平鲁区', '中国,山西省,朔州市,平鲁区', '3', 'Pinglu', '0349', '038600');
INSERT INTO `e_r_sys_region` VALUES ('140621', '140600', '山阴', '山阴县', '中国,山西省,朔州市,山阴县', '3', 'Shanyin', '0349', '036900');
INSERT INTO `e_r_sys_region` VALUES ('140622', '140600', '应县', '应县', '中国,山西省,朔州市,应县', '3', 'Yingxian', '0349', '037600');
INSERT INTO `e_r_sys_region` VALUES ('140623', '140600', '右玉', '右玉县', '中国,山西省,朔州市,右玉县', '3', 'Youyu', '0349', '037200');
INSERT INTO `e_r_sys_region` VALUES ('140624', '140600', '怀仁', '怀仁县', '中国,山西省,朔州市,怀仁县', '3', 'Huairen', '0349', '038300');
INSERT INTO `e_r_sys_region` VALUES ('140700', '140000', '晋中', '晋中市', '中国,山西省,晋中市', '2', 'Jinzhong', '0354', '030600');
INSERT INTO `e_r_sys_region` VALUES ('140702', '140700', '榆次', '榆次区', '中国,山西省,晋中市,榆次区', '3', 'Yuci', '0354', '030600');
INSERT INTO `e_r_sys_region` VALUES ('140721', '140700', '榆社', '榆社县', '中国,山西省,晋中市,榆社县', '3', 'Yushe', '0354', '031800');
INSERT INTO `e_r_sys_region` VALUES ('140722', '140700', '左权', '左权县', '中国,山西省,晋中市,左权县', '3', 'Zuoquan', '0354', '032600');
INSERT INTO `e_r_sys_region` VALUES ('140723', '140700', '和顺', '和顺县', '中国,山西省,晋中市,和顺县', '3', 'Heshun', '0354', '032700');
INSERT INTO `e_r_sys_region` VALUES ('140724', '140700', '昔阳', '昔阳县', '中国,山西省,晋中市,昔阳县', '3', 'Xiyang', '0354', '045300');
INSERT INTO `e_r_sys_region` VALUES ('140725', '140700', '寿阳', '寿阳县', '中国,山西省,晋中市,寿阳县', '3', 'Shouyang', '0354', '045400');
INSERT INTO `e_r_sys_region` VALUES ('140726', '140700', '太谷', '太谷县', '中国,山西省,晋中市,太谷县', '3', 'Taigu', '0354', '030800');
INSERT INTO `e_r_sys_region` VALUES ('140727', '140700', '祁县', '祁县', '中国,山西省,晋中市,祁县', '3', 'Qixian', '0354', '030900');
INSERT INTO `e_r_sys_region` VALUES ('140728', '140700', '平遥', '平遥县', '中国,山西省,晋中市,平遥县', '3', 'Pingyao', '0354', '031100');
INSERT INTO `e_r_sys_region` VALUES ('140729', '140700', '灵石', '灵石县', '中国,山西省,晋中市,灵石县', '3', 'Lingshi', '0354', '031300');
INSERT INTO `e_r_sys_region` VALUES ('140781', '140700', '介休', '介休市', '中国,山西省,晋中市,介休市', '3', 'Jiexiu', '0354', '032000');
INSERT INTO `e_r_sys_region` VALUES ('140800', '140000', '运城', '运城市', '中国,山西省,运城市', '2', 'Yuncheng', '0359', '044000');
INSERT INTO `e_r_sys_region` VALUES ('140802', '140800', '盐湖', '盐湖区', '中国,山西省,运城市,盐湖区', '3', 'Yanhu', '0359', '044000');
INSERT INTO `e_r_sys_region` VALUES ('140821', '140800', '临猗', '临猗县', '中国,山西省,运城市,临猗县', '3', 'Linyi', '0359', '044100');
INSERT INTO `e_r_sys_region` VALUES ('140822', '140800', '万荣', '万荣县', '中国,山西省,运城市,万荣县', '3', 'Wanrong', '0359', '044200');
INSERT INTO `e_r_sys_region` VALUES ('140823', '140800', '闻喜', '闻喜县', '中国,山西省,运城市,闻喜县', '3', 'Wenxi', '0359', '043800');
INSERT INTO `e_r_sys_region` VALUES ('140824', '140800', '稷山', '稷山县', '中国,山西省,运城市,稷山县', '3', 'Jishan', '0359', '043200');
INSERT INTO `e_r_sys_region` VALUES ('140825', '140800', '新绛', '新绛县', '中国,山西省,运城市,新绛县', '3', 'Xinjiang', '0359', '043100');
INSERT INTO `e_r_sys_region` VALUES ('140826', '140800', '绛县', '绛县', '中国,山西省,运城市,绛县', '3', 'Jiangxian', '0359', '043600');
INSERT INTO `e_r_sys_region` VALUES ('140827', '140800', '垣曲', '垣曲县', '中国,山西省,运城市,垣曲县', '3', 'Yuanqu', '0359', '043700');
INSERT INTO `e_r_sys_region` VALUES ('140828', '140800', '夏县', '夏县', '中国,山西省,运城市,夏县', '3', 'Xiaxian', '0359', '044400');
INSERT INTO `e_r_sys_region` VALUES ('140829', '140800', '平陆', '平陆县', '中国,山西省,运城市,平陆县', '3', 'Pinglu', '0359', '044300');
INSERT INTO `e_r_sys_region` VALUES ('140830', '140800', '芮城', '芮城县', '中国,山西省,运城市,芮城县', '3', 'Ruicheng', '0359', '044600');
INSERT INTO `e_r_sys_region` VALUES ('140881', '140800', '永济', '永济市', '中国,山西省,运城市,永济市', '3', 'Yongji', '0359', '044500');
INSERT INTO `e_r_sys_region` VALUES ('140882', '140800', '河津', '河津市', '中国,山西省,运城市,河津市', '3', 'Hejin', '0359', '043300');
INSERT INTO `e_r_sys_region` VALUES ('140900', '140000', '忻州', '忻州市', '中国,山西省,忻州市', '2', 'Xinzhou', '0350', '034000');
INSERT INTO `e_r_sys_region` VALUES ('140902', '140900', '忻府', '忻府区', '中国,山西省,忻州市,忻府区', '3', 'Xinfu', '0350', '034000');
INSERT INTO `e_r_sys_region` VALUES ('140921', '140900', '定襄', '定襄县', '中国,山西省,忻州市,定襄县', '3', 'Dingxiang', '0350', '035400');
INSERT INTO `e_r_sys_region` VALUES ('140922', '140900', '五台', '五台县', '中国,山西省,忻州市,五台县', '3', 'Wutai', '0350', '035500');
INSERT INTO `e_r_sys_region` VALUES ('140923', '140900', '代县', '代县', '中国,山西省,忻州市,代县', '3', 'Daixian', '0350', '034200');
INSERT INTO `e_r_sys_region` VALUES ('140924', '140900', '繁峙', '繁峙县', '中国,山西省,忻州市,繁峙县', '3', 'Fanshi', '0350', '034300');
INSERT INTO `e_r_sys_region` VALUES ('140925', '140900', '宁武', '宁武县', '中国,山西省,忻州市,宁武县', '3', 'Ningwu', '0350', '036700');
INSERT INTO `e_r_sys_region` VALUES ('140926', '140900', '静乐', '静乐县', '中国,山西省,忻州市,静乐县', '3', 'Jingle', '0350', '035100');
INSERT INTO `e_r_sys_region` VALUES ('140927', '140900', '神池', '神池县', '中国,山西省,忻州市,神池县', '3', 'Shenchi', '0350', '036100');
INSERT INTO `e_r_sys_region` VALUES ('140928', '140900', '五寨', '五寨县', '中国,山西省,忻州市,五寨县', '3', 'Wuzhai', '0350', '036200');
INSERT INTO `e_r_sys_region` VALUES ('140929', '140900', '岢岚', '岢岚县', '中国,山西省,忻州市,岢岚县', '3', 'Kelan', '0350', '036300');
INSERT INTO `e_r_sys_region` VALUES ('140930', '140900', '河曲', '河曲县', '中国,山西省,忻州市,河曲县', '3', 'Hequ', '0350', '036500');
INSERT INTO `e_r_sys_region` VALUES ('140931', '140900', '保德', '保德县', '中国,山西省,忻州市,保德县', '3', 'Baode', '0350', '036600');
INSERT INTO `e_r_sys_region` VALUES ('140932', '140900', '偏关', '偏关县', '中国,山西省,忻州市,偏关县', '3', 'Pianguan', '0350', '036400');
INSERT INTO `e_r_sys_region` VALUES ('140981', '140900', '原平', '原平市', '中国,山西省,忻州市,原平市', '3', 'Yuanping', '0350', '034100');
INSERT INTO `e_r_sys_region` VALUES ('141000', '140000', '临汾', '临汾市', '中国,山西省,临汾市', '2', 'Linfen', '0357', '041000');
INSERT INTO `e_r_sys_region` VALUES ('141002', '141000', '尧都', '尧都区', '中国,山西省,临汾市,尧都区', '3', 'Yaodu', '0357', '041000');
INSERT INTO `e_r_sys_region` VALUES ('141021', '141000', '曲沃', '曲沃县', '中国,山西省,临汾市,曲沃县', '3', 'Quwo', '0357', '043400');
INSERT INTO `e_r_sys_region` VALUES ('141022', '141000', '翼城', '翼城县', '中国,山西省,临汾市,翼城县', '3', 'Yicheng', '0357', '043500');
INSERT INTO `e_r_sys_region` VALUES ('141023', '141000', '襄汾', '襄汾县', '中国,山西省,临汾市,襄汾县', '3', 'Xiangfen', '0357', '041500');
INSERT INTO `e_r_sys_region` VALUES ('141024', '141000', '洪洞', '洪洞县', '中国,山西省,临汾市,洪洞县', '3', 'Hongtong', '0357', '041600');
INSERT INTO `e_r_sys_region` VALUES ('141025', '141000', '古县', '古县', '中国,山西省,临汾市,古县', '3', 'Guxian', '0357', '042400');
INSERT INTO `e_r_sys_region` VALUES ('141026', '141000', '安泽', '安泽县', '中国,山西省,临汾市,安泽县', '3', 'Anze', '0357', '042500');
INSERT INTO `e_r_sys_region` VALUES ('141027', '141000', '浮山', '浮山县', '中国,山西省,临汾市,浮山县', '3', 'Fushan', '0357', '042600');
INSERT INTO `e_r_sys_region` VALUES ('141028', '141000', '吉县', '吉县', '中国,山西省,临汾市,吉县', '3', 'Jixian', '0357', '042200');
INSERT INTO `e_r_sys_region` VALUES ('141029', '141000', '乡宁', '乡宁县', '中国,山西省,临汾市,乡宁县', '3', 'Xiangning', '0357', '042100');
INSERT INTO `e_r_sys_region` VALUES ('141030', '141000', '大宁', '大宁县', '中国,山西省,临汾市,大宁县', '3', 'Daning', '0357', '042300');
INSERT INTO `e_r_sys_region` VALUES ('141031', '141000', '隰县', '隰县', '中国,山西省,临汾市,隰县', '3', 'Xixian', '0357', '041300');
INSERT INTO `e_r_sys_region` VALUES ('141032', '141000', '永和', '永和县', '中国,山西省,临汾市,永和县', '3', 'Yonghe', '0357', '041400');
INSERT INTO `e_r_sys_region` VALUES ('141033', '141000', '蒲县', '蒲县', '中国,山西省,临汾市,蒲县', '3', 'Puxian', '0357', '041200');
INSERT INTO `e_r_sys_region` VALUES ('141034', '141000', '汾西', '汾西县', '中国,山西省,临汾市,汾西县', '3', 'Fenxi', '0357', '031500');
INSERT INTO `e_r_sys_region` VALUES ('141081', '141000', '侯马', '侯马市', '中国,山西省,临汾市,侯马市', '3', 'Houma', '0357', '043000');
INSERT INTO `e_r_sys_region` VALUES ('141082', '141000', '霍州', '霍州市', '中国,山西省,临汾市,霍州市', '3', 'Huozhou', '0357', '031400');
INSERT INTO `e_r_sys_region` VALUES ('141100', '140000', '吕梁', '吕梁市', '中国,山西省,吕梁市', '2', 'Lvliang', '0358', '033000');
INSERT INTO `e_r_sys_region` VALUES ('141102', '141100', '离石', '离石区', '中国,山西省,吕梁市,离石区', '3', 'Lishi', '0358', '033000');
INSERT INTO `e_r_sys_region` VALUES ('141121', '141100', '文水', '文水县', '中国,山西省,吕梁市,文水县', '3', 'Wenshui', '0358', '032100');
INSERT INTO `e_r_sys_region` VALUES ('141122', '141100', '交城', '交城县', '中国,山西省,吕梁市,交城县', '3', 'Jiaocheng', '0358', '030500');
INSERT INTO `e_r_sys_region` VALUES ('141123', '141100', '兴县', '兴县', '中国,山西省,吕梁市,兴县', '3', 'Xingxian', '0358', '033600');
INSERT INTO `e_r_sys_region` VALUES ('141124', '141100', '临县', '临县', '中国,山西省,吕梁市,临县', '3', 'Linxian', '0358', '033200');
INSERT INTO `e_r_sys_region` VALUES ('141125', '141100', '柳林', '柳林县', '中国,山西省,吕梁市,柳林县', '3', 'Liulin', '0358', '033300');
INSERT INTO `e_r_sys_region` VALUES ('141126', '141100', '石楼', '石楼县', '中国,山西省,吕梁市,石楼县', '3', 'Shilou', '0358', '032500');
INSERT INTO `e_r_sys_region` VALUES ('141127', '141100', '岚县', '岚县', '中国,山西省,吕梁市,岚县', '3', 'Lanxian', '0358', '033500');
INSERT INTO `e_r_sys_region` VALUES ('141128', '141100', '方山', '方山县', '中国,山西省,吕梁市,方山县', '3', 'Fangshan', '0358', '033100');
INSERT INTO `e_r_sys_region` VALUES ('141129', '141100', '中阳', '中阳县', '中国,山西省,吕梁市,中阳县', '3', 'Zhongyang', '0358', '033400');
INSERT INTO `e_r_sys_region` VALUES ('141130', '141100', '交口', '交口县', '中国,山西省,吕梁市,交口县', '3', 'Jiaokou', '0358', '032400');
INSERT INTO `e_r_sys_region` VALUES ('141181', '141100', '孝义', '孝义市', '中国,山西省,吕梁市,孝义市', '3', 'Xiaoyi', '0358', '032300');
INSERT INTO `e_r_sys_region` VALUES ('141182', '141100', '汾阳', '汾阳市', '中国,山西省,吕梁市,汾阳市', '3', 'Fenyang', '0358', '032200');
INSERT INTO `e_r_sys_region` VALUES ('150000', '100000', '内蒙古', '内蒙古自治区', '中国,内蒙古自治区', '1', 'Inner Mongolia', '', '');
INSERT INTO `e_r_sys_region` VALUES ('150100', '150000', '呼和浩特', '呼和浩特市', '中国,内蒙古自治区,呼和浩特市', '2', 'Hohhot', '0471', '010000');
INSERT INTO `e_r_sys_region` VALUES ('150102', '150100', '新城', '新城区', '中国,内蒙古自治区,呼和浩特市,新城区', '3', 'Xincheng', '0471', '010050');
INSERT INTO `e_r_sys_region` VALUES ('150103', '150100', '回民', '回民区', '中国,内蒙古自治区,呼和浩特市,回民区', '3', 'Huimin', '0471', '010030');
INSERT INTO `e_r_sys_region` VALUES ('150104', '150100', '玉泉', '玉泉区', '中国,内蒙古自治区,呼和浩特市,玉泉区', '3', 'Yuquan', '0471', '010020');
INSERT INTO `e_r_sys_region` VALUES ('150105', '150100', '赛罕', '赛罕区', '中国,内蒙古自治区,呼和浩特市,赛罕区', '3', 'Saihan', '0471', '010020');
INSERT INTO `e_r_sys_region` VALUES ('150121', '150100', '土默特左旗', '土默特左旗', '中国,内蒙古自治区,呼和浩特市,土默特左旗', '3', 'Tumotezuoqi', '0471', '010100');
INSERT INTO `e_r_sys_region` VALUES ('150122', '150100', '托克托', '托克托县', '中国,内蒙古自治区,呼和浩特市,托克托县', '3', 'Tuoketuo', '0471', '010200');
INSERT INTO `e_r_sys_region` VALUES ('150123', '150100', '和林格尔', '和林格尔县', '中国,内蒙古自治区,呼和浩特市,和林格尔县', '3', 'Helingeer', '0471', '011500');
INSERT INTO `e_r_sys_region` VALUES ('150124', '150100', '清水河', '清水河县', '中国,内蒙古自治区,呼和浩特市,清水河县', '3', 'Qingshuihe', '0471', '011600');
INSERT INTO `e_r_sys_region` VALUES ('150125', '150100', '武川', '武川县', '中国,内蒙古自治区,呼和浩特市,武川县', '3', 'Wuchuan', '0471', '011700');
INSERT INTO `e_r_sys_region` VALUES ('150200', '150000', '包头', '包头市', '中国,内蒙古自治区,包头市', '2', 'Baotou', '0472', '014025');
INSERT INTO `e_r_sys_region` VALUES ('150202', '150200', '东河', '东河区', '中国,内蒙古自治区,包头市,东河区', '3', 'Donghe', '0472', '014040');
INSERT INTO `e_r_sys_region` VALUES ('150203', '150200', '昆都仑', '昆都仑区', '中国,内蒙古自治区,包头市,昆都仑区', '3', 'Kundulun', '0472', '014010');
INSERT INTO `e_r_sys_region` VALUES ('150204', '150200', '青山', '青山区', '中国,内蒙古自治区,包头市,青山区', '3', 'Qingshan', '0472', '014030');
INSERT INTO `e_r_sys_region` VALUES ('150205', '150200', '石拐', '石拐区', '中国,内蒙古自治区,包头市,石拐区', '3', 'Shiguai', '0472', '014070');
INSERT INTO `e_r_sys_region` VALUES ('150206', '150200', '白云鄂博矿区', '白云鄂博矿区', '中国,内蒙古自治区,包头市,白云鄂博矿区', '3', 'Baiyunebokuangqu', '0472', '014080');
INSERT INTO `e_r_sys_region` VALUES ('150207', '150200', '九原', '九原区', '中国,内蒙古自治区,包头市,九原区', '3', 'Jiuyuan', '0472', '014060');
INSERT INTO `e_r_sys_region` VALUES ('150221', '150200', '土默特右旗', '土默特右旗', '中国,内蒙古自治区,包头市,土默特右旗', '3', 'Tumoteyouqi', '0472', '014100');
INSERT INTO `e_r_sys_region` VALUES ('150222', '150200', '固阳', '固阳县', '中国,内蒙古自治区,包头市,固阳县', '3', 'Guyang', '0472', '014200');
INSERT INTO `e_r_sys_region` VALUES ('150223', '150200', '达茂旗', '达尔罕茂明安联合旗', '中国,内蒙古自治区,包头市,达尔罕茂明安联合旗', '3', 'Damaoqi', '0472', '014500');
INSERT INTO `e_r_sys_region` VALUES ('150300', '150000', '乌海', '乌海市', '中国,内蒙古自治区,乌海市', '2', 'Wuhai', '0473', '016000');
INSERT INTO `e_r_sys_region` VALUES ('150302', '150300', '海勃湾', '海勃湾区', '中国,内蒙古自治区,乌海市,海勃湾区', '3', 'Haibowan', '0473', '016000');
INSERT INTO `e_r_sys_region` VALUES ('150303', '150300', '海南', '海南区', '中国,内蒙古自治区,乌海市,海南区', '3', 'Hainan', '0473', '016030');
INSERT INTO `e_r_sys_region` VALUES ('150304', '150300', '乌达', '乌达区', '中国,内蒙古自治区,乌海市,乌达区', '3', 'Wuda', '0473', '016040');
INSERT INTO `e_r_sys_region` VALUES ('150400', '150000', '赤峰', '赤峰市', '中国,内蒙古自治区,赤峰市', '2', 'Chifeng', '0476', '024000');
INSERT INTO `e_r_sys_region` VALUES ('150402', '150400', '红山', '红山区', '中国,内蒙古自治区,赤峰市,红山区', '3', 'Hongshan', '0476', '024020');
INSERT INTO `e_r_sys_region` VALUES ('150403', '150400', '元宝山', '元宝山区', '中国,内蒙古自治区,赤峰市,元宝山区', '3', 'Yuanbaoshan', '0476', '024076');
INSERT INTO `e_r_sys_region` VALUES ('150404', '150400', '松山', '松山区', '中国,内蒙古自治区,赤峰市,松山区', '3', 'Songshan', '0476', '024005');
INSERT INTO `e_r_sys_region` VALUES ('150421', '150400', '阿鲁科尔沁旗', '阿鲁科尔沁旗', '中国,内蒙古自治区,赤峰市,阿鲁科尔沁旗', '3', 'Alukeerqinqi', '0476', '025550');
INSERT INTO `e_r_sys_region` VALUES ('150422', '150400', '巴林左旗', '巴林左旗', '中国,内蒙古自治区,赤峰市,巴林左旗', '3', 'Balinzuoqi', '0476', '025450');
INSERT INTO `e_r_sys_region` VALUES ('150423', '150400', '巴林右旗', '巴林右旗', '中国,内蒙古自治区,赤峰市,巴林右旗', '3', 'Balinyouqi', '0476', '025150');
INSERT INTO `e_r_sys_region` VALUES ('150424', '150400', '林西', '林西县', '中国,内蒙古自治区,赤峰市,林西县', '3', 'Linxi', '0476', '025250');
INSERT INTO `e_r_sys_region` VALUES ('150425', '150400', '克什克腾旗', '克什克腾旗', '中国,内蒙古自治区,赤峰市,克什克腾旗', '3', 'Keshiketengqi', '0476', '025350');
INSERT INTO `e_r_sys_region` VALUES ('150426', '150400', '翁牛特旗', '翁牛特旗', '中国,内蒙古自治区,赤峰市,翁牛特旗', '3', 'Wengniuteqi', '0476', '024500');
INSERT INTO `e_r_sys_region` VALUES ('150428', '150400', '喀喇沁旗', '喀喇沁旗', '中国,内蒙古自治区,赤峰市,喀喇沁旗', '3', 'Kalaqinqi', '0476', '024400');
INSERT INTO `e_r_sys_region` VALUES ('150429', '150400', '宁城', '宁城县', '中国,内蒙古自治区,赤峰市,宁城县', '3', 'Ningcheng', '0476', '024200');
INSERT INTO `e_r_sys_region` VALUES ('150430', '150400', '敖汉旗', '敖汉旗', '中国,内蒙古自治区,赤峰市,敖汉旗', '3', 'Aohanqi', '0476', '024300');
INSERT INTO `e_r_sys_region` VALUES ('150500', '150000', '通辽', '通辽市', '中国,内蒙古自治区,通辽市', '2', 'Tongliao', '0475', '028000');
INSERT INTO `e_r_sys_region` VALUES ('150502', '150500', '科尔沁', '科尔沁区', '中国,内蒙古自治区,通辽市,科尔沁区', '3', 'Keerqin', '0475', '028000');
INSERT INTO `e_r_sys_region` VALUES ('150521', '150500', '科尔沁左翼中旗', '科尔沁左翼中旗', '中国,内蒙古自治区,通辽市,科尔沁左翼中旗', '3', 'Keerqinzuoyizhongqi', '0475', '029300');
INSERT INTO `e_r_sys_region` VALUES ('150522', '150500', '科尔沁左翼后旗', '科尔沁左翼后旗', '中国,内蒙古自治区,通辽市,科尔沁左翼后旗', '3', 'Keerqinzuoyihouqi', '0475', '028100');
INSERT INTO `e_r_sys_region` VALUES ('150523', '150500', '开鲁', '开鲁县', '中国,内蒙古自治区,通辽市,开鲁县', '3', 'Kailu', '0475', '028400');
INSERT INTO `e_r_sys_region` VALUES ('150524', '150500', '库伦旗', '库伦旗', '中国,内蒙古自治区,通辽市,库伦旗', '3', 'Kulunqi', '0475', '028200');
INSERT INTO `e_r_sys_region` VALUES ('150525', '150500', '奈曼旗', '奈曼旗', '中国,内蒙古自治区,通辽市,奈曼旗', '3', 'Naimanqi', '0475', '028300');
INSERT INTO `e_r_sys_region` VALUES ('150526', '150500', '扎鲁特旗', '扎鲁特旗', '中国,内蒙古自治区,通辽市,扎鲁特旗', '3', 'Zhaluteqi', '0475', '029100');
INSERT INTO `e_r_sys_region` VALUES ('150581', '150500', '霍林郭勒', '霍林郭勒市', '中国,内蒙古自治区,通辽市,霍林郭勒市', '3', 'Huolinguole', '0475', '029200');
INSERT INTO `e_r_sys_region` VALUES ('150600', '150000', '鄂尔多斯', '鄂尔多斯市', '中国,内蒙古自治区,鄂尔多斯市', '2', 'Ordos', '0477', '017004');
INSERT INTO `e_r_sys_region` VALUES ('150602', '150600', '东胜', '东胜区', '中国,内蒙古自治区,鄂尔多斯市,东胜区', '3', 'Dongsheng', '0477', '017000');
INSERT INTO `e_r_sys_region` VALUES ('150621', '150600', '达拉特旗', '达拉特旗', '中国,内蒙古自治区,鄂尔多斯市,达拉特旗', '3', 'Dalateqi', '0477', '014300');
INSERT INTO `e_r_sys_region` VALUES ('150622', '150600', '准格尔旗', '准格尔旗', '中国,内蒙古自治区,鄂尔多斯市,准格尔旗', '3', 'Zhungeerqi', '0477', '017100');
INSERT INTO `e_r_sys_region` VALUES ('150623', '150600', '鄂托克前旗', '鄂托克前旗', '中国,内蒙古自治区,鄂尔多斯市,鄂托克前旗', '3', 'Etuokeqianqi', '0477', '016200');
INSERT INTO `e_r_sys_region` VALUES ('150624', '150600', '鄂托克旗', '鄂托克旗', '中国,内蒙古自治区,鄂尔多斯市,鄂托克旗', '3', 'Etuokeqi', '0477', '016100');
INSERT INTO `e_r_sys_region` VALUES ('150625', '150600', '杭锦旗', '杭锦旗', '中国,内蒙古自治区,鄂尔多斯市,杭锦旗', '3', 'Hangjinqi', '0477', '017400');
INSERT INTO `e_r_sys_region` VALUES ('150626', '150600', '乌审旗', '乌审旗', '中国,内蒙古自治区,鄂尔多斯市,乌审旗', '3', 'Wushenqi', '0477', '017300');
INSERT INTO `e_r_sys_region` VALUES ('150627', '150600', '伊金霍洛旗', '伊金霍洛旗', '中国,内蒙古自治区,鄂尔多斯市,伊金霍洛旗', '3', 'Yijinhuoluoqi', '0477', '017200');
INSERT INTO `e_r_sys_region` VALUES ('150700', '150000', '呼伦贝尔', '呼伦贝尔市', '中国,内蒙古自治区,呼伦贝尔市', '2', 'Hulunber', '0470', '021008');
INSERT INTO `e_r_sys_region` VALUES ('150702', '150700', '海拉尔', '海拉尔区', '中国,内蒙古自治区,呼伦贝尔市,海拉尔区', '3', 'Hailaer', '0470', '021000');
INSERT INTO `e_r_sys_region` VALUES ('150703', '150700', '扎赉诺尔', '扎赉诺尔区', '中国,内蒙古自治区,呼伦贝尔市,扎赉诺尔区', '3', 'Zhalainuoer', '0470', '021410');
INSERT INTO `e_r_sys_region` VALUES ('150721', '150700', '阿荣旗', '阿荣旗', '中国,内蒙古自治区,呼伦贝尔市,阿荣旗', '3', 'Arongqi', '0470', '162750');
INSERT INTO `e_r_sys_region` VALUES ('150722', '150700', '莫旗', '莫力达瓦达斡尔族自治旗', '中国,内蒙古自治区,呼伦贝尔市,莫力达瓦达斡尔族自治旗', '3', 'Moqi', '0470', '162850');
INSERT INTO `e_r_sys_region` VALUES ('150723', '150700', '鄂伦春', '鄂伦春自治旗', '中国,内蒙古自治区,呼伦贝尔市,鄂伦春自治旗', '3', 'Elunchun', '0470', '165450');
INSERT INTO `e_r_sys_region` VALUES ('150724', '150700', '鄂温', '鄂温克族自治旗', '中国,内蒙古自治区,呼伦贝尔市,鄂温克族自治旗', '3', 'Ewen', '0470', '021100');
INSERT INTO `e_r_sys_region` VALUES ('150725', '150700', '陈巴尔虎旗', '陈巴尔虎旗', '中国,内蒙古自治区,呼伦贝尔市,陈巴尔虎旗', '3', 'Chenbaerhuqi', '0470', '021500');
INSERT INTO `e_r_sys_region` VALUES ('150726', '150700', '新巴尔虎左旗', '新巴尔虎左旗', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎左旗', '3', 'Xinbaerhuzuoqi', '0470', '021200');
INSERT INTO `e_r_sys_region` VALUES ('150727', '150700', '新巴尔虎右旗', '新巴尔虎右旗', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎右旗', '3', 'Xinbaerhuyouqi', '0470', '021300');
INSERT INTO `e_r_sys_region` VALUES ('150781', '150700', '满洲里', '满洲里市', '中国,内蒙古自治区,呼伦贝尔市,满洲里市', '3', 'Manzhouli', '0470', '021400');
INSERT INTO `e_r_sys_region` VALUES ('150782', '150700', '牙克石', '牙克石市', '中国,内蒙古自治区,呼伦贝尔市,牙克石市', '3', 'Yakeshi', '0470', '022150');
INSERT INTO `e_r_sys_region` VALUES ('150783', '150700', '扎兰屯', '扎兰屯市', '中国,内蒙古自治区,呼伦贝尔市,扎兰屯市', '3', 'Zhalantun', '0470', '162650');
INSERT INTO `e_r_sys_region` VALUES ('150784', '150700', '额尔古纳', '额尔古纳市', '中国,内蒙古自治区,呼伦贝尔市,额尔古纳市', '3', 'Eerguna', '0470', '022250');
INSERT INTO `e_r_sys_region` VALUES ('150785', '150700', '根河', '根河市', '中国,内蒙古自治区,呼伦贝尔市,根河市', '3', 'Genhe', '0470', '022350');
INSERT INTO `e_r_sys_region` VALUES ('150800', '150000', '巴彦淖尔', '巴彦淖尔市', '中国,内蒙古自治区,巴彦淖尔市', '2', 'Bayan Nur', '0478', '015001');
INSERT INTO `e_r_sys_region` VALUES ('150802', '150800', '临河', '临河区', '中国,内蒙古自治区,巴彦淖尔市,临河区', '3', 'Linhe', '0478', '015001');
INSERT INTO `e_r_sys_region` VALUES ('150821', '150800', '五原', '五原县', '中国,内蒙古自治区,巴彦淖尔市,五原县', '3', 'Wuyuan', '0478', '015100');
INSERT INTO `e_r_sys_region` VALUES ('150822', '150800', '磴口', '磴口县', '中国,内蒙古自治区,巴彦淖尔市,磴口县', '3', 'Dengkou', '0478', '015200');
INSERT INTO `e_r_sys_region` VALUES ('150823', '150800', '乌拉特前旗', '乌拉特前旗', '中国,内蒙古自治区,巴彦淖尔市,乌拉特前旗', '3', 'Wulateqianqi', '0478', '014400');
INSERT INTO `e_r_sys_region` VALUES ('150824', '150800', '乌拉特中旗', '乌拉特中旗', '中国,内蒙古自治区,巴彦淖尔市,乌拉特中旗', '3', 'Wulatezhongqi', '0478', '015300');
INSERT INTO `e_r_sys_region` VALUES ('150825', '150800', '乌拉特后旗', '乌拉特后旗', '中国,内蒙古自治区,巴彦淖尔市,乌拉特后旗', '3', 'Wulatehouqi', '0478', '015500');
INSERT INTO `e_r_sys_region` VALUES ('150826', '150800', '杭锦后旗', '杭锦后旗', '中国,内蒙古自治区,巴彦淖尔市,杭锦后旗', '3', 'Hangjinhouqi', '0478', '015400');
INSERT INTO `e_r_sys_region` VALUES ('150900', '150000', '乌兰察布', '乌兰察布市', '中国,内蒙古自治区,乌兰察布市', '2', 'Ulanqab', '0474', '012000');
INSERT INTO `e_r_sys_region` VALUES ('150902', '150900', '集宁', '集宁区', '中国,内蒙古自治区,乌兰察布市,集宁区', '3', 'Jining', '0474', '012000');
INSERT INTO `e_r_sys_region` VALUES ('150921', '150900', '卓资', '卓资县', '中国,内蒙古自治区,乌兰察布市,卓资县', '3', 'Zhuozi', '0474', '012300');
INSERT INTO `e_r_sys_region` VALUES ('150922', '150900', '化德', '化德县', '中国,内蒙古自治区,乌兰察布市,化德县', '3', 'Huade', '0474', '013350');
INSERT INTO `e_r_sys_region` VALUES ('150923', '150900', '商都', '商都县', '中国,内蒙古自治区,乌兰察布市,商都县', '3', 'Shangdu', '0474', '013450');
INSERT INTO `e_r_sys_region` VALUES ('150924', '150900', '兴和', '兴和县', '中国,内蒙古自治区,乌兰察布市,兴和县', '3', 'Xinghe', '0474', '013650');
INSERT INTO `e_r_sys_region` VALUES ('150925', '150900', '凉城', '凉城县', '中国,内蒙古自治区,乌兰察布市,凉城县', '3', 'Liangcheng', '0474', '013750');
INSERT INTO `e_r_sys_region` VALUES ('150926', '150900', '察右前旗', '察哈尔右翼前旗', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼前旗', '3', 'Chayouqianqi', '0474', '012200');
INSERT INTO `e_r_sys_region` VALUES ('150927', '150900', '察右中旗', '察哈尔右翼中旗', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼中旗', '3', 'Chayouzhongqi', '0474', '013550');
INSERT INTO `e_r_sys_region` VALUES ('150928', '150900', '察右后旗', '察哈尔右翼后旗', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼后旗', '3', 'Chayouhouqi', '0474', '012400');
INSERT INTO `e_r_sys_region` VALUES ('150929', '150900', '四子王旗', '四子王旗', '中国,内蒙古自治区,乌兰察布市,四子王旗', '3', 'Siziwangqi', '0474', '011800');
INSERT INTO `e_r_sys_region` VALUES ('150981', '150900', '丰镇', '丰镇市', '中国,内蒙古自治区,乌兰察布市,丰镇市', '3', 'Fengzhen', '0474', '012100');
INSERT INTO `e_r_sys_region` VALUES ('152200', '150000', '兴安盟', '兴安盟', '中国,内蒙古自治区,兴安盟', '2', 'Hinggan', '0482', '137401');
INSERT INTO `e_r_sys_region` VALUES ('152201', '152200', '乌兰浩特', '乌兰浩特市', '中国,内蒙古自治区,兴安盟,乌兰浩特市', '3', 'Wulanhaote', '0482', '137401');
INSERT INTO `e_r_sys_region` VALUES ('152202', '152200', '阿尔山', '阿尔山市', '中国,内蒙古自治区,兴安盟,阿尔山市', '3', 'Aershan', '0482', '137800');
INSERT INTO `e_r_sys_region` VALUES ('152221', '152200', '科右前旗', '科尔沁右翼前旗', '中国,内蒙古自治区,兴安盟,科尔沁右翼前旗', '3', 'Keyouqianqi', '0482', '137423');
INSERT INTO `e_r_sys_region` VALUES ('152222', '152200', '科右中旗', '科尔沁右翼中旗', '中国,内蒙古自治区,兴安盟,科尔沁右翼中旗', '3', 'Keyouzhongqi', '0482', '029400');
INSERT INTO `e_r_sys_region` VALUES ('152223', '152200', '扎赉特旗', '扎赉特旗', '中国,内蒙古自治区,兴安盟,扎赉特旗', '3', 'Zhalaiteqi', '0482', '137600');
INSERT INTO `e_r_sys_region` VALUES ('152224', '152200', '突泉', '突泉县', '中国,内蒙古自治区,兴安盟,突泉县', '3', 'Tuquan', '0482', '137500');
INSERT INTO `e_r_sys_region` VALUES ('152500', '150000', '锡林郭勒盟', '锡林郭勒盟', '中国,内蒙古自治区,锡林郭勒盟', '2', 'Xilin Gol', '0479', '026000');
INSERT INTO `e_r_sys_region` VALUES ('152501', '152500', '二连浩特', '二连浩特市', '中国,内蒙古自治区,锡林郭勒盟,二连浩特市', '3', 'Erlianhaote', '0479', '011100');
INSERT INTO `e_r_sys_region` VALUES ('152502', '152500', '锡林浩特', '锡林浩特市', '中国,内蒙古自治区,锡林郭勒盟,锡林浩特市', '3', 'Xilinhaote', '0479', '026021');
INSERT INTO `e_r_sys_region` VALUES ('152522', '152500', '阿巴嘎旗', '阿巴嘎旗', '中国,内蒙古自治区,锡林郭勒盟,阿巴嘎旗', '3', 'Abagaqi', '0479', '011400');
INSERT INTO `e_r_sys_region` VALUES ('152523', '152500', '苏尼特左旗', '苏尼特左旗', '中国,内蒙古自治区,锡林郭勒盟,苏尼特左旗', '3', 'Sunitezuoqi', '0479', '011300');
INSERT INTO `e_r_sys_region` VALUES ('152524', '152500', '苏尼特右旗', '苏尼特右旗', '中国,内蒙古自治区,锡林郭勒盟,苏尼特右旗', '3', 'Suniteyouqi', '0479', '011200');
INSERT INTO `e_r_sys_region` VALUES ('152525', '152500', '东乌旗', '东乌珠穆沁旗', '中国,内蒙古自治区,锡林郭勒盟,东乌珠穆沁旗', '3', 'Dongwuqi', '0479', '026300');
INSERT INTO `e_r_sys_region` VALUES ('152526', '152500', '西乌旗', '西乌珠穆沁旗', '中国,内蒙古自治区,锡林郭勒盟,西乌珠穆沁旗', '3', 'Xiwuqi', '0479', '026200');
INSERT INTO `e_r_sys_region` VALUES ('152527', '152500', '太仆寺旗', '太仆寺旗', '中国,内蒙古自治区,锡林郭勒盟,太仆寺旗', '3', 'Taipusiqi', '0479', '027000');
INSERT INTO `e_r_sys_region` VALUES ('152528', '152500', '镶黄旗', '镶黄旗', '中国,内蒙古自治区,锡林郭勒盟,镶黄旗', '3', 'Xianghuangqi', '0479', '013250');
INSERT INTO `e_r_sys_region` VALUES ('152529', '152500', '正镶白旗', '正镶白旗', '中国,内蒙古自治区,锡林郭勒盟,正镶白旗', '3', 'Zhengxiangbaiqi', '0479', '013800');
INSERT INTO `e_r_sys_region` VALUES ('152530', '152500', '正蓝旗', '正蓝旗', '中国,内蒙古自治区,锡林郭勒盟,正蓝旗', '3', 'Zhenglanqi', '0479', '027200');
INSERT INTO `e_r_sys_region` VALUES ('152531', '152500', '多伦', '多伦县', '中国,内蒙古自治区,锡林郭勒盟,多伦县', '3', 'Duolun', '0479', '027300');
INSERT INTO `e_r_sys_region` VALUES ('152900', '150000', '阿拉善盟', '阿拉善盟', '中国,内蒙古自治区,阿拉善盟', '2', 'Alxa', '0483', '750306');
INSERT INTO `e_r_sys_region` VALUES ('152921', '152900', '阿拉善左旗', '阿拉善左旗', '中国,内蒙古自治区,阿拉善盟,阿拉善左旗', '3', 'Alashanzuoqi', '0483', '750306');
INSERT INTO `e_r_sys_region` VALUES ('152922', '152900', '阿拉善右旗', '阿拉善右旗', '中国,内蒙古自治区,阿拉善盟,阿拉善右旗', '3', 'Alashanyouqi', '0483', '737300');
INSERT INTO `e_r_sys_region` VALUES ('152923', '152900', '额济纳旗', '额济纳旗', '中国,内蒙古自治区,阿拉善盟,额济纳旗', '3', 'Ejinaqi', '0483', '735400');
INSERT INTO `e_r_sys_region` VALUES ('210000', '100000', '辽宁', '辽宁省', '中国,辽宁省', '1', 'Liaoning', '', '');
INSERT INTO `e_r_sys_region` VALUES ('210100', '210000', '沈阳', '沈阳市', '中国,辽宁省,沈阳市', '2', 'Shenyang', '024', '110013');
INSERT INTO `e_r_sys_region` VALUES ('210102', '210100', '和平', '和平区', '中国,辽宁省,沈阳市,和平区', '3', 'Heping', '024', '110001');
INSERT INTO `e_r_sys_region` VALUES ('210103', '210100', '沈河', '沈河区', '中国,辽宁省,沈阳市,沈河区', '3', 'Shenhe', '024', '110011');
INSERT INTO `e_r_sys_region` VALUES ('210104', '210100', '大东', '大东区', '中国,辽宁省,沈阳市,大东区', '3', 'Dadong', '024', '110041');
INSERT INTO `e_r_sys_region` VALUES ('210105', '210100', '皇姑', '皇姑区', '中国,辽宁省,沈阳市,皇姑区', '3', 'Huanggu', '024', '110031');
INSERT INTO `e_r_sys_region` VALUES ('210106', '210100', '铁西', '铁西区', '中国,辽宁省,沈阳市,铁西区', '3', 'Tiexi', '024', '110021');
INSERT INTO `e_r_sys_region` VALUES ('210111', '210100', '苏家屯', '苏家屯区', '中国,辽宁省,沈阳市,苏家屯区', '3', 'Sujiatun', '024', '110101');
INSERT INTO `e_r_sys_region` VALUES ('210112', '210100', '浑南', '浑南区', '中国,辽宁省,沈阳市,浑南区', '3', 'Hunnan', '024', '110015');
INSERT INTO `e_r_sys_region` VALUES ('210113', '210100', '沈北新区', '沈北新区', '中国,辽宁省,沈阳市,沈北新区', '3', 'Shenbeixinqu', '024', '110121');
INSERT INTO `e_r_sys_region` VALUES ('210114', '210100', '于洪', '于洪区', '中国,辽宁省,沈阳市,于洪区', '3', 'Yuhong', '024', '110141');
INSERT INTO `e_r_sys_region` VALUES ('210122', '210100', '辽中', '辽中县', '中国,辽宁省,沈阳市,辽中县', '3', 'Liaozhong', '024', '110200');
INSERT INTO `e_r_sys_region` VALUES ('210123', '210100', '康平', '康平县', '中国,辽宁省,沈阳市,康平县', '3', 'Kangping', '024', '110500');
INSERT INTO `e_r_sys_region` VALUES ('210124', '210100', '法库', '法库县', '中国,辽宁省,沈阳市,法库县', '3', 'Faku', '024', '110400');
INSERT INTO `e_r_sys_region` VALUES ('210181', '210100', '新民', '新民市', '中国,辽宁省,沈阳市,新民市', '3', 'Xinmin', '024', '110300');
INSERT INTO `e_r_sys_region` VALUES ('210200', '210000', '大连', '大连市', '中国,辽宁省,大连市', '2', 'Dalian', '0411', '116011');
INSERT INTO `e_r_sys_region` VALUES ('210202', '210200', '中山', '中山区', '中国,辽宁省,大连市,中山区', '3', 'Zhongshan', '0411', '116001');
INSERT INTO `e_r_sys_region` VALUES ('210203', '210200', '西岗', '西岗区', '中国,辽宁省,大连市,西岗区', '3', 'Xigang', '0411', '116011');
INSERT INTO `e_r_sys_region` VALUES ('210204', '210200', '沙河口', '沙河口区', '中国,辽宁省,大连市,沙河口区', '3', 'Shahekou', '0411', '116021');
INSERT INTO `e_r_sys_region` VALUES ('210211', '210200', '甘井子', '甘井子区', '中国,辽宁省,大连市,甘井子区', '3', 'Ganjingzi', '0411', '116033');
INSERT INTO `e_r_sys_region` VALUES ('210212', '210200', '旅顺口', '旅顺口区', '中国,辽宁省,大连市,旅顺口区', '3', 'Lvshunkou', '0411', '116041');
INSERT INTO `e_r_sys_region` VALUES ('210213', '210200', '金州', '金州区', '中国,辽宁省,大连市,金州区', '3', 'Jinzhou', '0411', '116100');
INSERT INTO `e_r_sys_region` VALUES ('210224', '210200', '长海', '长海县', '中国,辽宁省,大连市,长海县', '3', 'Changhai', '0411', '116500');
INSERT INTO `e_r_sys_region` VALUES ('210281', '210200', '瓦房店', '瓦房店市', '中国,辽宁省,大连市,瓦房店市', '3', 'Wafangdian', '0411', '116300');
INSERT INTO `e_r_sys_region` VALUES ('210282', '210200', '普兰店', '普兰店市', '中国,辽宁省,大连市,普兰店市', '3', 'Pulandian', '0411', '116200');
INSERT INTO `e_r_sys_region` VALUES ('210283', '210200', '庄河', '庄河市', '中国,辽宁省,大连市,庄河市', '3', 'Zhuanghe', '0411', '116400');
INSERT INTO `e_r_sys_region` VALUES ('210300', '210000', '鞍山', '鞍山市', '中国,辽宁省,鞍山市', '2', 'Anshan', '0412', '114001');
INSERT INTO `e_r_sys_region` VALUES ('210302', '210300', '铁东', '铁东区', '中国,辽宁省,鞍山市,铁东区', '3', 'Tiedong', '0412', '114001');
INSERT INTO `e_r_sys_region` VALUES ('210303', '210300', '铁西', '铁西区', '中国,辽宁省,鞍山市,铁西区', '3', 'Tiexi', '0413', '114013');
INSERT INTO `e_r_sys_region` VALUES ('210304', '210300', '立山', '立山区', '中国,辽宁省,鞍山市,立山区', '3', 'Lishan', '0414', '114031');
INSERT INTO `e_r_sys_region` VALUES ('210311', '210300', '千山', '千山区', '中国,辽宁省,鞍山市,千山区', '3', 'Qianshan', '0415', '114041');
INSERT INTO `e_r_sys_region` VALUES ('210321', '210300', '台安', '台安县', '中国,辽宁省,鞍山市,台安县', '3', 'Tai\'an', '0417', '114100');
INSERT INTO `e_r_sys_region` VALUES ('210323', '210300', '岫岩', '岫岩满族自治县', '中国,辽宁省,鞍山市,岫岩满族自治县', '3', 'Xiuyan', '0418', '114300');
INSERT INTO `e_r_sys_region` VALUES ('210381', '210300', '海城', '海城市', '中国,辽宁省,鞍山市,海城市', '3', 'Haicheng', '0416', '114200');
INSERT INTO `e_r_sys_region` VALUES ('210400', '210000', '抚顺', '抚顺市', '中国,辽宁省,抚顺市', '2', 'Fushun', '024', '113008');
INSERT INTO `e_r_sys_region` VALUES ('210402', '210400', '新抚', '新抚区', '中国,辽宁省,抚顺市,新抚区', '3', 'Xinfu', '024', '113008');
INSERT INTO `e_r_sys_region` VALUES ('210403', '210400', '东洲', '东洲区', '中国,辽宁省,抚顺市,东洲区', '3', 'Dongzhou', '024', '113003');
INSERT INTO `e_r_sys_region` VALUES ('210404', '210400', '望花', '望花区', '中国,辽宁省,抚顺市,望花区', '3', 'Wanghua', '024', '113001');
INSERT INTO `e_r_sys_region` VALUES ('210411', '210400', '顺城', '顺城区', '中国,辽宁省,抚顺市,顺城区', '3', 'Shuncheng', '024', '113006');
INSERT INTO `e_r_sys_region` VALUES ('210421', '210400', '抚顺', '抚顺县', '中国,辽宁省,抚顺市,抚顺县', '3', 'Fushun', '024', '113006');
INSERT INTO `e_r_sys_region` VALUES ('210422', '210400', '新宾', '新宾满族自治县', '中国,辽宁省,抚顺市,新宾满族自治县', '3', 'Xinbin', '024', '113200');
INSERT INTO `e_r_sys_region` VALUES ('210423', '210400', '清原', '清原满族自治县', '中国,辽宁省,抚顺市,清原满族自治县', '3', 'Qingyuan', '024', '113300');
INSERT INTO `e_r_sys_region` VALUES ('210500', '210000', '本溪', '本溪市', '中国,辽宁省,本溪市', '2', 'Benxi', '0414', '117000');
INSERT INTO `e_r_sys_region` VALUES ('210502', '210500', '平山', '平山区', '中国,辽宁省,本溪市,平山区', '3', 'Pingshan', '0414', '117000');
INSERT INTO `e_r_sys_region` VALUES ('210503', '210500', '溪湖', '溪湖区', '中国,辽宁省,本溪市,溪湖区', '3', 'Xihu', '0414', '117002');
INSERT INTO `e_r_sys_region` VALUES ('210504', '210500', '明山', '明山区', '中国,辽宁省,本溪市,明山区', '3', 'Mingshan', '0414', '117021');
INSERT INTO `e_r_sys_region` VALUES ('210505', '210500', '南芬', '南芬区', '中国,辽宁省,本溪市,南芬区', '3', 'Nanfen', '0414', '117014');
INSERT INTO `e_r_sys_region` VALUES ('210521', '210500', '本溪', '本溪满族自治县', '中国,辽宁省,本溪市,本溪满族自治县', '3', 'Benxi', '0414', '117100');
INSERT INTO `e_r_sys_region` VALUES ('210522', '210500', '桓仁', '桓仁满族自治县', '中国,辽宁省,本溪市,桓仁满族自治县', '3', 'Huanren', '0414', '117200');
INSERT INTO `e_r_sys_region` VALUES ('210600', '210000', '丹东', '丹东市', '中国,辽宁省,丹东市', '2', 'Dandong', '0415', '118000');
INSERT INTO `e_r_sys_region` VALUES ('210602', '210600', '元宝', '元宝区', '中国,辽宁省,丹东市,元宝区', '3', 'Yuanbao', '0415', '118000');
INSERT INTO `e_r_sys_region` VALUES ('210603', '210600', '振兴', '振兴区', '中国,辽宁省,丹东市,振兴区', '3', 'Zhenxing', '0415', '118002');
INSERT INTO `e_r_sys_region` VALUES ('210604', '210600', '振安', '振安区', '中国,辽宁省,丹东市,振安区', '3', 'Zhen\'an', '0415', '118001');
INSERT INTO `e_r_sys_region` VALUES ('210624', '210600', '宽甸', '宽甸满族自治县', '中国,辽宁省,丹东市,宽甸满族自治县', '3', 'Kuandian', '0415', '118200');
INSERT INTO `e_r_sys_region` VALUES ('210681', '210600', '东港', '东港市', '中国,辽宁省,丹东市,东港市', '3', 'Donggang', '0415', '118300');
INSERT INTO `e_r_sys_region` VALUES ('210682', '210600', '凤城', '凤城市', '中国,辽宁省,丹东市,凤城市', '3', 'Fengcheng', '0415', '118100');
INSERT INTO `e_r_sys_region` VALUES ('210700', '210000', '锦州', '锦州市', '中国,辽宁省,锦州市', '2', 'Jinzhou', '0416', '121000');
INSERT INTO `e_r_sys_region` VALUES ('210702', '210700', '古塔', '古塔区', '中国,辽宁省,锦州市,古塔区', '3', 'Guta', '0416', '121001');
INSERT INTO `e_r_sys_region` VALUES ('210703', '210700', '凌河', '凌河区', '中国,辽宁省,锦州市,凌河区', '3', 'Linghe', '0416', '121000');
INSERT INTO `e_r_sys_region` VALUES ('210711', '210700', '太和', '太和区', '中国,辽宁省,锦州市,太和区', '3', 'Taihe', '0416', '121011');
INSERT INTO `e_r_sys_region` VALUES ('210726', '210700', '黑山', '黑山县', '中国,辽宁省,锦州市,黑山县', '3', 'Heishan', '0416', '121400');
INSERT INTO `e_r_sys_region` VALUES ('210727', '210700', '义县', '义县', '中国,辽宁省,锦州市,义县', '3', 'Yixian', '0416', '121100');
INSERT INTO `e_r_sys_region` VALUES ('210781', '210700', '凌海', '凌海市', '中国,辽宁省,锦州市,凌海市', '3', 'Linghai', '0416', '121200');
INSERT INTO `e_r_sys_region` VALUES ('210782', '210700', '北镇', '北镇市', '中国,辽宁省,锦州市,北镇市', '3', 'Beizhen', '0416', '121300');
INSERT INTO `e_r_sys_region` VALUES ('210800', '210000', '营口', '营口市', '中国,辽宁省,营口市', '2', 'Yingkou', '0417', '115003');
INSERT INTO `e_r_sys_region` VALUES ('210802', '210800', '站前', '站前区', '中国,辽宁省,营口市,站前区', '3', 'Zhanqian', '0417', '115002');
INSERT INTO `e_r_sys_region` VALUES ('210803', '210800', '西市', '西市区', '中国,辽宁省,营口市,西市区', '3', 'Xishi', '0417', '115004');
INSERT INTO `e_r_sys_region` VALUES ('210804', '210800', '鲅鱼圈', '鲅鱼圈区', '中国,辽宁省,营口市,鲅鱼圈区', '3', 'Bayuquan', '0417', '115007');
INSERT INTO `e_r_sys_region` VALUES ('210811', '210800', '老边', '老边区', '中国,辽宁省,营口市,老边区', '3', 'Laobian', '0417', '115005');
INSERT INTO `e_r_sys_region` VALUES ('210881', '210800', '盖州', '盖州市', '中国,辽宁省,营口市,盖州市', '3', 'Gaizhou', '0417', '115200');
INSERT INTO `e_r_sys_region` VALUES ('210882', '210800', '大石桥', '大石桥市', '中国,辽宁省,营口市,大石桥市', '3', 'Dashiqiao', '0417', '115100');
INSERT INTO `e_r_sys_region` VALUES ('210900', '210000', '阜新', '阜新市', '中国,辽宁省,阜新市', '2', 'Fuxin', '0418', '123000');
INSERT INTO `e_r_sys_region` VALUES ('210902', '210900', '海州', '海州区', '中国,辽宁省,阜新市,海州区', '3', 'Haizhou', '0418', '123000');
INSERT INTO `e_r_sys_region` VALUES ('210903', '210900', '新邱', '新邱区', '中国,辽宁省,阜新市,新邱区', '3', 'Xinqiu', '0418', '123005');
INSERT INTO `e_r_sys_region` VALUES ('210904', '210900', '太平', '太平区', '中国,辽宁省,阜新市,太平区', '3', 'Taiping', '0418', '123003');
INSERT INTO `e_r_sys_region` VALUES ('210905', '210900', '清河门', '清河门区', '中国,辽宁省,阜新市,清河门区', '3', 'Qinghemen', '0418', '123006');
INSERT INTO `e_r_sys_region` VALUES ('210911', '210900', '细河', '细河区', '中国,辽宁省,阜新市,细河区', '3', 'Xihe', '0418', '123000');
INSERT INTO `e_r_sys_region` VALUES ('210921', '210900', '阜新', '阜新蒙古族自治县', '中国,辽宁省,阜新市,阜新蒙古族自治县', '3', 'Fuxin', '0418', '123100');
INSERT INTO `e_r_sys_region` VALUES ('210922', '210900', '彰武', '彰武县', '中国,辽宁省,阜新市,彰武县', '3', 'Zhangwu', '0418', '123200');
INSERT INTO `e_r_sys_region` VALUES ('211000', '210000', '辽阳', '辽阳市', '中国,辽宁省,辽阳市', '2', 'Liaoyang', '0419', '111000');
INSERT INTO `e_r_sys_region` VALUES ('211002', '211000', '白塔', '白塔区', '中国,辽宁省,辽阳市,白塔区', '3', 'Baita', '0419', '111000');
INSERT INTO `e_r_sys_region` VALUES ('211003', '211000', '文圣', '文圣区', '中国,辽宁省,辽阳市,文圣区', '3', 'Wensheng', '0419', '111000');
INSERT INTO `e_r_sys_region` VALUES ('211004', '211000', '宏伟', '宏伟区', '中国,辽宁省,辽阳市,宏伟区', '3', 'Hongwei', '0419', '111003');
INSERT INTO `e_r_sys_region` VALUES ('211005', '211000', '弓长岭', '弓长岭区', '中国,辽宁省,辽阳市,弓长岭区', '3', 'Gongchangling', '0419', '111008');
INSERT INTO `e_r_sys_region` VALUES ('211011', '211000', '太子河', '太子河区', '中国,辽宁省,辽阳市,太子河区', '3', 'Taizihe', '0419', '111000');
INSERT INTO `e_r_sys_region` VALUES ('211021', '211000', '辽阳', '辽阳县', '中国,辽宁省,辽阳市,辽阳县', '3', 'Liaoyang', '0419', '111200');
INSERT INTO `e_r_sys_region` VALUES ('211081', '211000', '灯塔', '灯塔市', '中国,辽宁省,辽阳市,灯塔市', '3', 'Dengta', '0419', '111300');
INSERT INTO `e_r_sys_region` VALUES ('211100', '210000', '盘锦', '盘锦市', '中国,辽宁省,盘锦市', '2', 'Panjin', '0427', '124010');
INSERT INTO `e_r_sys_region` VALUES ('211102', '211100', '双台子', '双台子区', '中国,辽宁省,盘锦市,双台子区', '3', 'Shuangtaizi', '0427', '124000');
INSERT INTO `e_r_sys_region` VALUES ('211103', '211100', '兴隆台', '兴隆台区', '中国,辽宁省,盘锦市,兴隆台区', '3', 'Xinglongtai', '0427', '124010');
INSERT INTO `e_r_sys_region` VALUES ('211121', '211100', '大洼', '大洼县', '中国,辽宁省,盘锦市,大洼县', '3', 'Dawa', '0427', '124200');
INSERT INTO `e_r_sys_region` VALUES ('211122', '211100', '盘山', '盘山县', '中国,辽宁省,盘锦市,盘山县', '3', 'Panshan', '0427', '124000');
INSERT INTO `e_r_sys_region` VALUES ('211200', '210000', '铁岭', '铁岭市', '中国,辽宁省,铁岭市', '2', 'Tieling', '024', '112000');
INSERT INTO `e_r_sys_region` VALUES ('211202', '211200', '银州', '银州区', '中国,辽宁省,铁岭市,银州区', '3', 'Yinzhou', '024', '112000');
INSERT INTO `e_r_sys_region` VALUES ('211204', '211200', '清河', '清河区', '中国,辽宁省,铁岭市,清河区', '3', 'Qinghe', '024', '112003');
INSERT INTO `e_r_sys_region` VALUES ('211221', '211200', '铁岭', '铁岭县', '中国,辽宁省,铁岭市,铁岭县', '3', 'Tieling', '024', '112000');
INSERT INTO `e_r_sys_region` VALUES ('211223', '211200', '西丰', '西丰县', '中国,辽宁省,铁岭市,西丰县', '3', 'Xifeng', '024', '112400');
INSERT INTO `e_r_sys_region` VALUES ('211224', '211200', '昌图', '昌图县', '中国,辽宁省,铁岭市,昌图县', '3', 'Changtu', '024', '112500');
INSERT INTO `e_r_sys_region` VALUES ('211281', '211200', '调兵山', '调兵山市', '中国,辽宁省,铁岭市,调兵山市', '3', 'Diaobingshan', '024', '112700');
INSERT INTO `e_r_sys_region` VALUES ('211282', '211200', '开原', '开原市', '中国,辽宁省,铁岭市,开原市', '3', 'Kaiyuan', '024', '112300');
INSERT INTO `e_r_sys_region` VALUES ('211300', '210000', '朝阳', '朝阳市', '中国,辽宁省,朝阳市', '2', 'Chaoyang', '0421', '122000');
INSERT INTO `e_r_sys_region` VALUES ('211302', '211300', '双塔', '双塔区', '中国,辽宁省,朝阳市,双塔区', '3', 'Shuangta', '0421', '122000');
INSERT INTO `e_r_sys_region` VALUES ('211303', '211300', '龙城', '龙城区', '中国,辽宁省,朝阳市,龙城区', '3', 'Longcheng', '0421', '122000');
INSERT INTO `e_r_sys_region` VALUES ('211321', '211300', '朝阳', '朝阳县', '中国,辽宁省,朝阳市,朝阳县', '3', 'Chaoyang', '0421', '122000');
INSERT INTO `e_r_sys_region` VALUES ('211322', '211300', '建平', '建平县', '中国,辽宁省,朝阳市,建平县', '3', 'Jianping', '0421', '122400');
INSERT INTO `e_r_sys_region` VALUES ('211324', '211300', '喀喇沁左翼', '喀喇沁左翼蒙古族自治县', '中国,辽宁省,朝阳市,喀喇沁左翼蒙古族自治县', '3', 'Kalaqinzuoyi', '0421', '122300');
INSERT INTO `e_r_sys_region` VALUES ('211381', '211300', '北票', '北票市', '中国,辽宁省,朝阳市,北票市', '3', 'Beipiao', '0421', '122100');
INSERT INTO `e_r_sys_region` VALUES ('211382', '211300', '凌源', '凌源市', '中国,辽宁省,朝阳市,凌源市', '3', 'Lingyuan', '0421', '122500');
INSERT INTO `e_r_sys_region` VALUES ('211400', '210000', '葫芦岛', '葫芦岛市', '中国,辽宁省,葫芦岛市', '2', 'Huludao', '0429', '125000');
INSERT INTO `e_r_sys_region` VALUES ('211402', '211400', '连山', '连山区', '中国,辽宁省,葫芦岛市,连山区', '3', 'Lianshan', '0429', '125001');
INSERT INTO `e_r_sys_region` VALUES ('211403', '211400', '龙港', '龙港区', '中国,辽宁省,葫芦岛市,龙港区', '3', 'Longgang', '0429', '125003');
INSERT INTO `e_r_sys_region` VALUES ('211404', '211400', '南票', '南票区', '中国,辽宁省,葫芦岛市,南票区', '3', 'Nanpiao', '0429', '125027');
INSERT INTO `e_r_sys_region` VALUES ('211421', '211400', '绥中', '绥中县', '中国,辽宁省,葫芦岛市,绥中县', '3', 'Suizhong', '0429', '125200');
INSERT INTO `e_r_sys_region` VALUES ('211422', '211400', '建昌', '建昌县', '中国,辽宁省,葫芦岛市,建昌县', '3', 'Jianchang', '0429', '125300');
INSERT INTO `e_r_sys_region` VALUES ('211481', '211400', '兴城', '兴城市', '中国,辽宁省,葫芦岛市,兴城市', '3', 'Xingcheng', '0429', '125100');
INSERT INTO `e_r_sys_region` VALUES ('211500', '210000', '金普新区', '金普新区', '中国,辽宁省,金普新区', '2', 'Jinpuxinqu', '0411', '116100');
INSERT INTO `e_r_sys_region` VALUES ('211501', '211500', '金州新区', '金州新区', '中国,辽宁省,金普新区,金州新区', '3', 'Jinzhouxinqu', '0411', '116100');
INSERT INTO `e_r_sys_region` VALUES ('211502', '211500', '普湾新区', '普湾新区', '中国,辽宁省,金普新区,普湾新区', '3', 'Puwanxinqu', '0411', '116200');
INSERT INTO `e_r_sys_region` VALUES ('211503', '211500', '保税区', '保税区', '中国,辽宁省,金普新区,保税区', '3', 'Baoshuiqu', '0411', '116100');
INSERT INTO `e_r_sys_region` VALUES ('220000', '100000', '吉林', '吉林省', '中国,吉林省', '1', 'Jilin', '', '');
INSERT INTO `e_r_sys_region` VALUES ('220100', '220000', '长春', '长春市', '中国,吉林省,长春市', '2', 'Changchun', '0431', '130022');
INSERT INTO `e_r_sys_region` VALUES ('220102', '220100', '南关', '南关区', '中国,吉林省,长春市,南关区', '3', 'Nanguan', '0431', '130022');
INSERT INTO `e_r_sys_region` VALUES ('220103', '220100', '宽城', '宽城区', '中国,吉林省,长春市,宽城区', '3', 'Kuancheng', '0431', '130051');
INSERT INTO `e_r_sys_region` VALUES ('220104', '220100', '朝阳', '朝阳区', '中国,吉林省,长春市,朝阳区', '3', 'Chaoyang', '0431', '130012');
INSERT INTO `e_r_sys_region` VALUES ('220105', '220100', '二道', '二道区', '中国,吉林省,长春市,二道区', '3', 'Erdao', '0431', '130031');
INSERT INTO `e_r_sys_region` VALUES ('220106', '220100', '绿园', '绿园区', '中国,吉林省,长春市,绿园区', '3', 'Lvyuan', '0431', '130062');
INSERT INTO `e_r_sys_region` VALUES ('220112', '220100', '双阳', '双阳区', '中国,吉林省,长春市,双阳区', '3', 'Shuangyang', '0431', '130600');
INSERT INTO `e_r_sys_region` VALUES ('220113', '220100', '九台', '九台区', '中国,吉林省,长春市,九台区', '3', 'Jiutai', '0431', '130500');
INSERT INTO `e_r_sys_region` VALUES ('220122', '220100', '农安', '农安县', '中国,吉林省,长春市,农安县', '3', 'Nong\'an', '0431', '130200');
INSERT INTO `e_r_sys_region` VALUES ('220182', '220100', '榆树', '榆树市', '中国,吉林省,长春市,榆树市', '3', 'Yushu', '0431', '130400');
INSERT INTO `e_r_sys_region` VALUES ('220183', '220100', '德惠', '德惠市', '中国,吉林省,长春市,德惠市', '3', 'Dehui', '0431', '130300');
INSERT INTO `e_r_sys_region` VALUES ('220200', '220000', '吉林', '吉林市', '中国,吉林省,吉林市', '2', 'Jilin', '0432', '132011');
INSERT INTO `e_r_sys_region` VALUES ('220202', '220200', '昌邑', '昌邑区', '中国,吉林省,吉林市,昌邑区', '3', 'Changyi', '0432', '132002');
INSERT INTO `e_r_sys_region` VALUES ('220203', '220200', '龙潭', '龙潭区', '中国,吉林省,吉林市,龙潭区', '3', 'Longtan', '0432', '132021');
INSERT INTO `e_r_sys_region` VALUES ('220204', '220200', '船营', '船营区', '中国,吉林省,吉林市,船营区', '3', 'Chuanying', '0432', '132011');
INSERT INTO `e_r_sys_region` VALUES ('220211', '220200', '丰满', '丰满区', '中国,吉林省,吉林市,丰满区', '3', 'Fengman', '0432', '132013');
INSERT INTO `e_r_sys_region` VALUES ('220221', '220200', '永吉', '永吉县', '中国,吉林省,吉林市,永吉县', '3', 'Yongji', '0432', '132200');
INSERT INTO `e_r_sys_region` VALUES ('220281', '220200', '蛟河', '蛟河市', '中国,吉林省,吉林市,蛟河市', '3', 'Jiaohe', '0432', '132500');
INSERT INTO `e_r_sys_region` VALUES ('220282', '220200', '桦甸', '桦甸市', '中国,吉林省,吉林市,桦甸市', '3', 'Huadian', '0432', '132400');
INSERT INTO `e_r_sys_region` VALUES ('220283', '220200', '舒兰', '舒兰市', '中国,吉林省,吉林市,舒兰市', '3', 'Shulan', '0432', '132600');
INSERT INTO `e_r_sys_region` VALUES ('220284', '220200', '磐石', '磐石市', '中国,吉林省,吉林市,磐石市', '3', 'Panshi', '0432', '132300');
INSERT INTO `e_r_sys_region` VALUES ('220300', '220000', '四平', '四平市', '中国,吉林省,四平市', '2', 'Siping', '0434', '136000');
INSERT INTO `e_r_sys_region` VALUES ('220302', '220300', '铁西', '铁西区', '中国,吉林省,四平市,铁西区', '3', 'Tiexi', '0434', '136000');
INSERT INTO `e_r_sys_region` VALUES ('220303', '220300', '铁东', '铁东区', '中国,吉林省,四平市,铁东区', '3', 'Tiedong', '0434', '136001');
INSERT INTO `e_r_sys_region` VALUES ('220322', '220300', '梨树', '梨树县', '中国,吉林省,四平市,梨树县', '3', 'Lishu', '0434', '136500');
INSERT INTO `e_r_sys_region` VALUES ('220323', '220300', '伊通', '伊通满族自治县', '中国,吉林省,四平市,伊通满族自治县', '3', 'Yitong', '0434', '130700');
INSERT INTO `e_r_sys_region` VALUES ('220381', '220300', '公主岭', '公主岭市', '中国,吉林省,四平市,公主岭市', '3', 'Gongzhuling', '0434', '136100');
INSERT INTO `e_r_sys_region` VALUES ('220382', '220300', '双辽', '双辽市', '中国,吉林省,四平市,双辽市', '3', 'Shuangliao', '0434', '136400');
INSERT INTO `e_r_sys_region` VALUES ('220400', '220000', '辽源', '辽源市', '中国,吉林省,辽源市', '2', 'Liaoyuan', '0437', '136200');
INSERT INTO `e_r_sys_region` VALUES ('220402', '220400', '龙山', '龙山区', '中国,吉林省,辽源市,龙山区', '3', 'Longshan', '0437', '136200');
INSERT INTO `e_r_sys_region` VALUES ('220403', '220400', '西安', '西安区', '中国,吉林省,辽源市,西安区', '3', 'Xi\'an', '0437', '136201');
INSERT INTO `e_r_sys_region` VALUES ('220421', '220400', '东丰', '东丰县', '中国,吉林省,辽源市,东丰县', '3', 'Dongfeng', '0437', '136300');
INSERT INTO `e_r_sys_region` VALUES ('220422', '220400', '东辽', '东辽县', '中国,吉林省,辽源市,东辽县', '3', 'Dongliao', '0437', '136600');
INSERT INTO `e_r_sys_region` VALUES ('220500', '220000', '通化', '通化市', '中国,吉林省,通化市', '2', 'Tonghua', '0435', '134001');
INSERT INTO `e_r_sys_region` VALUES ('220502', '220500', '东昌', '东昌区', '中国,吉林省,通化市,东昌区', '3', 'Dongchang', '0435', '134001');
INSERT INTO `e_r_sys_region` VALUES ('220503', '220500', '二道江', '二道江区', '中国,吉林省,通化市,二道江区', '3', 'Erdaojiang', '0435', '134003');
INSERT INTO `e_r_sys_region` VALUES ('220521', '220500', '通化', '通化县', '中国,吉林省,通化市,通化县', '3', 'Tonghua', '0435', '134100');
INSERT INTO `e_r_sys_region` VALUES ('220523', '220500', '辉南', '辉南县', '中国,吉林省,通化市,辉南县', '3', 'Huinan', '0435', '135100');
INSERT INTO `e_r_sys_region` VALUES ('220524', '220500', '柳河', '柳河县', '中国,吉林省,通化市,柳河县', '3', 'Liuhe', '0435', '135300');
INSERT INTO `e_r_sys_region` VALUES ('220581', '220500', '梅河口', '梅河口市', '中国,吉林省,通化市,梅河口市', '3', 'Meihekou', '0435', '135000');
INSERT INTO `e_r_sys_region` VALUES ('220582', '220500', '集安', '集安市', '中国,吉林省,通化市,集安市', '3', 'Ji\'an', '0435', '134200');
INSERT INTO `e_r_sys_region` VALUES ('220600', '220000', '白山', '白山市', '中国,吉林省,白山市', '2', 'Baishan', '0439', '134300');
INSERT INTO `e_r_sys_region` VALUES ('220602', '220600', '浑江', '浑江区', '中国,吉林省,白山市,浑江区', '3', 'Hunjiang', '0439', '134300');
INSERT INTO `e_r_sys_region` VALUES ('220605', '220600', '江源', '江源区', '中国,吉林省,白山市,江源区', '3', 'Jiangyuan', '0439', '134700');
INSERT INTO `e_r_sys_region` VALUES ('220621', '220600', '抚松', '抚松县', '中国,吉林省,白山市,抚松县', '3', 'Fusong', '0439', '134500');
INSERT INTO `e_r_sys_region` VALUES ('220622', '220600', '靖宇', '靖宇县', '中国,吉林省,白山市,靖宇县', '3', 'Jingyu', '0439', '135200');
INSERT INTO `e_r_sys_region` VALUES ('220623', '220600', '长白', '长白朝鲜族自治县', '中国,吉林省,白山市,长白朝鲜族自治县', '3', 'Changbai', '0439', '134400');
INSERT INTO `e_r_sys_region` VALUES ('220681', '220600', '临江', '临江市', '中国,吉林省,白山市,临江市', '3', 'Linjiang', '0439', '134600');
INSERT INTO `e_r_sys_region` VALUES ('220700', '220000', '松原', '松原市', '中国,吉林省,松原市', '2', 'Songyuan', '0438', '138000');
INSERT INTO `e_r_sys_region` VALUES ('220702', '220700', '宁江', '宁江区', '中国,吉林省,松原市,宁江区', '3', 'Ningjiang', '0438', '138000');
INSERT INTO `e_r_sys_region` VALUES ('220721', '220700', '前郭尔罗斯', '前郭尔罗斯蒙古族自治县', '中国,吉林省,松原市,前郭尔罗斯蒙古族自治县', '3', 'Qianguoerluosi', '0438', '138000');
INSERT INTO `e_r_sys_region` VALUES ('220722', '220700', '长岭', '长岭县', '中国,吉林省,松原市,长岭县', '3', 'Changling', '0438', '131500');
INSERT INTO `e_r_sys_region` VALUES ('220723', '220700', '乾安', '乾安县', '中国,吉林省,松原市,乾安县', '3', 'Qian\'an', '0438', '131400');
INSERT INTO `e_r_sys_region` VALUES ('220781', '220700', '扶余', '扶余市', '中国,吉林省,松原市,扶余市', '3', 'Fuyu', '0438', '131200');
INSERT INTO `e_r_sys_region` VALUES ('220800', '220000', '白城', '白城市', '中国,吉林省,白城市', '2', 'Baicheng', '0436', '137000');
INSERT INTO `e_r_sys_region` VALUES ('220802', '220800', '洮北', '洮北区', '中国,吉林省,白城市,洮北区', '3', 'Taobei', '0436', '137000');
INSERT INTO `e_r_sys_region` VALUES ('220821', '220800', '镇赉', '镇赉县', '中国,吉林省,白城市,镇赉县', '3', 'Zhenlai', '0436', '137300');
INSERT INTO `e_r_sys_region` VALUES ('220822', '220800', '通榆', '通榆县', '中国,吉林省,白城市,通榆县', '3', 'Tongyu', '0436', '137200');
INSERT INTO `e_r_sys_region` VALUES ('220881', '220800', '洮南', '洮南市', '中国,吉林省,白城市,洮南市', '3', 'Taonan', '0436', '137100');
INSERT INTO `e_r_sys_region` VALUES ('220882', '220800', '大安', '大安市', '中国,吉林省,白城市,大安市', '3', 'Da\'an', '0436', '131300');
INSERT INTO `e_r_sys_region` VALUES ('222400', '220000', '延边', '延边朝鲜族自治州', '中国,吉林省,延边朝鲜族自治州', '2', 'Yanbian', '0433', '133000');
INSERT INTO `e_r_sys_region` VALUES ('222401', '222400', '延吉', '延吉市', '中国,吉林省,延边朝鲜族自治州,延吉市', '3', 'Yanji', '0433', '133000');
INSERT INTO `e_r_sys_region` VALUES ('222402', '222400', '图们', '图们市', '中国,吉林省,延边朝鲜族自治州,图们市', '3', 'Tumen', '0433', '133100');
INSERT INTO `e_r_sys_region` VALUES ('222403', '222400', '敦化', '敦化市', '中国,吉林省,延边朝鲜族自治州,敦化市', '3', 'Dunhua', '0433', '133700');
INSERT INTO `e_r_sys_region` VALUES ('222404', '222400', '珲春', '珲春市', '中国,吉林省,延边朝鲜族自治州,珲春市', '3', 'Hunchun', '0433', '133300');
INSERT INTO `e_r_sys_region` VALUES ('222405', '222400', '龙井', '龙井市', '中国,吉林省,延边朝鲜族自治州,龙井市', '3', 'Longjing', '0433', '133400');
INSERT INTO `e_r_sys_region` VALUES ('222406', '222400', '和龙', '和龙市', '中国,吉林省,延边朝鲜族自治州,和龙市', '3', 'Helong', '0433', '133500');
INSERT INTO `e_r_sys_region` VALUES ('222424', '222400', '汪清', '汪清县', '中国,吉林省,延边朝鲜族自治州,汪清县', '3', 'Wangqing', '0433', '133200');
INSERT INTO `e_r_sys_region` VALUES ('222426', '222400', '安图', '安图县', '中国,吉林省,延边朝鲜族自治州,安图县', '3', 'Antu', '0433', '133600');
INSERT INTO `e_r_sys_region` VALUES ('230000', '100000', '黑龙江', '黑龙江省', '中国,黑龙江省', '1', 'Heilongjiang', '', '');
INSERT INTO `e_r_sys_region` VALUES ('230100', '230000', '哈尔滨', '哈尔滨市', '中国,黑龙江省,哈尔滨市', '2', 'Harbin', '0451', '150010');
INSERT INTO `e_r_sys_region` VALUES ('230102', '230100', '道里', '道里区', '中国,黑龙江省,哈尔滨市,道里区', '3', 'Daoli', '0451', '150010');
INSERT INTO `e_r_sys_region` VALUES ('230103', '230100', '南岗', '南岗区', '中国,黑龙江省,哈尔滨市,南岗区', '3', 'Nangang', '0451', '150006');
INSERT INTO `e_r_sys_region` VALUES ('230104', '230100', '道外', '道外区', '中国,黑龙江省,哈尔滨市,道外区', '3', 'Daowai', '0451', '150020');
INSERT INTO `e_r_sys_region` VALUES ('230108', '230100', '平房', '平房区', '中国,黑龙江省,哈尔滨市,平房区', '3', 'Pingfang', '0451', '150060');
INSERT INTO `e_r_sys_region` VALUES ('230109', '230100', '松北', '松北区', '中国,黑龙江省,哈尔滨市,松北区', '3', 'Songbei', '0451', '150028');
INSERT INTO `e_r_sys_region` VALUES ('230110', '230100', '香坊', '香坊区', '中国,黑龙江省,哈尔滨市,香坊区', '3', 'Xiangfang', '0451', '150036');
INSERT INTO `e_r_sys_region` VALUES ('230111', '230100', '呼兰', '呼兰区', '中国,黑龙江省,哈尔滨市,呼兰区', '3', 'Hulan', '0451', '150500');
INSERT INTO `e_r_sys_region` VALUES ('230112', '230100', '阿城', '阿城区', '中国,黑龙江省,哈尔滨市,阿城区', '3', 'A\'cheng', '0451', '150300');
INSERT INTO `e_r_sys_region` VALUES ('230113', '230100', '双城', '双城区', '中国,黑龙江省,哈尔滨市,双城区', '3', 'Shuangcheng', '0451', '150100');
INSERT INTO `e_r_sys_region` VALUES ('230123', '230100', '依兰', '依兰县', '中国,黑龙江省,哈尔滨市,依兰县', '3', 'Yilan', '0451', '154800');
INSERT INTO `e_r_sys_region` VALUES ('230124', '230100', '方正', '方正县', '中国,黑龙江省,哈尔滨市,方正县', '3', 'Fangzheng', '0451', '150800');
INSERT INTO `e_r_sys_region` VALUES ('230125', '230100', '宾县', '宾县', '中国,黑龙江省,哈尔滨市,宾县', '3', 'Binxian', '0451', '150400');
INSERT INTO `e_r_sys_region` VALUES ('230126', '230100', '巴彦', '巴彦县', '中国,黑龙江省,哈尔滨市,巴彦县', '3', 'Bayan', '0451', '151800');
INSERT INTO `e_r_sys_region` VALUES ('230127', '230100', '木兰', '木兰县', '中国,黑龙江省,哈尔滨市,木兰县', '3', 'Mulan', '0451', '151900');
INSERT INTO `e_r_sys_region` VALUES ('230128', '230100', '通河', '通河县', '中国,黑龙江省,哈尔滨市,通河县', '3', 'Tonghe', '0451', '150900');
INSERT INTO `e_r_sys_region` VALUES ('230129', '230100', '延寿', '延寿县', '中国,黑龙江省,哈尔滨市,延寿县', '3', 'Yanshou', '0451', '150700');
INSERT INTO `e_r_sys_region` VALUES ('230183', '230100', '尚志', '尚志市', '中国,黑龙江省,哈尔滨市,尚志市', '3', 'Shangzhi', '0451', '150600');
INSERT INTO `e_r_sys_region` VALUES ('230184', '230100', '五常', '五常市', '中国,黑龙江省,哈尔滨市,五常市', '3', 'Wuchang', '0451', '150200');
INSERT INTO `e_r_sys_region` VALUES ('230200', '230000', '齐齐哈尔', '齐齐哈尔市', '中国,黑龙江省,齐齐哈尔市', '2', 'Qiqihar', '0452', '161005');
INSERT INTO `e_r_sys_region` VALUES ('230202', '230200', '龙沙', '龙沙区', '中国,黑龙江省,齐齐哈尔市,龙沙区', '3', 'Longsha', '0452', '161000');
INSERT INTO `e_r_sys_region` VALUES ('230203', '230200', '建华', '建华区', '中国,黑龙江省,齐齐哈尔市,建华区', '3', 'Jianhua', '0452', '161006');
INSERT INTO `e_r_sys_region` VALUES ('230204', '230200', '铁锋', '铁锋区', '中国,黑龙江省,齐齐哈尔市,铁锋区', '3', 'Tiefeng', '0452', '161000');
INSERT INTO `e_r_sys_region` VALUES ('230205', '230200', '昂昂溪', '昂昂溪区', '中国,黑龙江省,齐齐哈尔市,昂昂溪区', '3', 'Angangxi', '0452', '161031');
INSERT INTO `e_r_sys_region` VALUES ('230206', '230200', '富拉尔基', '富拉尔基区', '中国,黑龙江省,齐齐哈尔市,富拉尔基区', '3', 'Fulaerji', '0452', '161041');
INSERT INTO `e_r_sys_region` VALUES ('230207', '230200', '碾子山', '碾子山区', '中国,黑龙江省,齐齐哈尔市,碾子山区', '3', 'Nianzishan', '0452', '161046');
INSERT INTO `e_r_sys_region` VALUES ('230208', '230200', '梅里斯', '梅里斯达斡尔族区', '中国,黑龙江省,齐齐哈尔市,梅里斯达斡尔族区', '3', 'Meilisi', '0452', '161021');
INSERT INTO `e_r_sys_region` VALUES ('230221', '230200', '龙江', '龙江县', '中国,黑龙江省,齐齐哈尔市,龙江县', '3', 'Longjiang', '0452', '161100');
INSERT INTO `e_r_sys_region` VALUES ('230223', '230200', '依安', '依安县', '中国,黑龙江省,齐齐哈尔市,依安县', '3', 'Yi\'an', '0452', '161500');
INSERT INTO `e_r_sys_region` VALUES ('230224', '230200', '泰来', '泰来县', '中国,黑龙江省,齐齐哈尔市,泰来县', '3', 'Tailai', '0452', '162400');
INSERT INTO `e_r_sys_region` VALUES ('230225', '230200', '甘南', '甘南县', '中国,黑龙江省,齐齐哈尔市,甘南县', '3', 'Gannan', '0452', '162100');
INSERT INTO `e_r_sys_region` VALUES ('230227', '230200', '富裕', '富裕县', '中国,黑龙江省,齐齐哈尔市,富裕县', '3', 'Fuyu', '0452', '161200');
INSERT INTO `e_r_sys_region` VALUES ('230229', '230200', '克山', '克山县', '中国,黑龙江省,齐齐哈尔市,克山县', '3', 'Keshan', '0452', '161600');
INSERT INTO `e_r_sys_region` VALUES ('230230', '230200', '克东', '克东县', '中国,黑龙江省,齐齐哈尔市,克东县', '3', 'Kedong', '0452', '164800');
INSERT INTO `e_r_sys_region` VALUES ('230231', '230200', '拜泉', '拜泉县', '中国,黑龙江省,齐齐哈尔市,拜泉县', '3', 'Baiquan', '0452', '164700');
INSERT INTO `e_r_sys_region` VALUES ('230281', '230200', '讷河', '讷河市', '中国,黑龙江省,齐齐哈尔市,讷河市', '3', 'Nehe', '0452', '161300');
INSERT INTO `e_r_sys_region` VALUES ('230300', '230000', '鸡西', '鸡西市', '中国,黑龙江省,鸡西市', '2', 'Jixi', '0467', '158100');
INSERT INTO `e_r_sys_region` VALUES ('230302', '230300', '鸡冠', '鸡冠区', '中国,黑龙江省,鸡西市,鸡冠区', '3', 'Jiguan', '0467', '158100');
INSERT INTO `e_r_sys_region` VALUES ('230303', '230300', '恒山', '恒山区', '中国,黑龙江省,鸡西市,恒山区', '3', 'Hengshan', '0467', '158130');
INSERT INTO `e_r_sys_region` VALUES ('230304', '230300', '滴道', '滴道区', '中国,黑龙江省,鸡西市,滴道区', '3', 'Didao', '0467', '158150');
INSERT INTO `e_r_sys_region` VALUES ('230305', '230300', '梨树', '梨树区', '中国,黑龙江省,鸡西市,梨树区', '3', 'Lishu', '0467', '158160');
INSERT INTO `e_r_sys_region` VALUES ('230306', '230300', '城子河', '城子河区', '中国,黑龙江省,鸡西市,城子河区', '3', 'Chengzihe', '0467', '158170');
INSERT INTO `e_r_sys_region` VALUES ('230307', '230300', '麻山', '麻山区', '中国,黑龙江省,鸡西市,麻山区', '3', 'Mashan', '0467', '158180');
INSERT INTO `e_r_sys_region` VALUES ('230321', '230300', '鸡东', '鸡东县', '中国,黑龙江省,鸡西市,鸡东县', '3', 'Jidong', '0467', '158200');
INSERT INTO `e_r_sys_region` VALUES ('230381', '230300', '虎林', '虎林市', '中国,黑龙江省,鸡西市,虎林市', '3', 'Hulin', '0467', '158400');
INSERT INTO `e_r_sys_region` VALUES ('230382', '230300', '密山', '密山市', '中国,黑龙江省,鸡西市,密山市', '3', 'Mishan', '0467', '158300');
INSERT INTO `e_r_sys_region` VALUES ('230400', '230000', '鹤岗', '鹤岗市', '中国,黑龙江省,鹤岗市', '2', 'Hegang', '0468', '154100');
INSERT INTO `e_r_sys_region` VALUES ('230402', '230400', '向阳', '向阳区', '中国,黑龙江省,鹤岗市,向阳区', '3', 'Xiangyang', '0468', '154100');
INSERT INTO `e_r_sys_region` VALUES ('230403', '230400', '工农', '工农区', '中国,黑龙江省,鹤岗市,工农区', '3', 'Gongnong', '0468', '154101');
INSERT INTO `e_r_sys_region` VALUES ('230404', '230400', '南山', '南山区', '中国,黑龙江省,鹤岗市,南山区', '3', 'Nanshan', '0468', '154104');
INSERT INTO `e_r_sys_region` VALUES ('230405', '230400', '兴安', '兴安区', '中国,黑龙江省,鹤岗市,兴安区', '3', 'Xing\'an', '0468', '154102');
INSERT INTO `e_r_sys_region` VALUES ('230406', '230400', '东山', '东山区', '中国,黑龙江省,鹤岗市,东山区', '3', 'Dongshan', '0468', '154106');
INSERT INTO `e_r_sys_region` VALUES ('230407', '230400', '兴山', '兴山区', '中国,黑龙江省,鹤岗市,兴山区', '3', 'Xingshan', '0468', '154105');
INSERT INTO `e_r_sys_region` VALUES ('230421', '230400', '萝北', '萝北县', '中国,黑龙江省,鹤岗市,萝北县', '3', 'Luobei', '0468', '154200');
INSERT INTO `e_r_sys_region` VALUES ('230422', '230400', '绥滨', '绥滨县', '中国,黑龙江省,鹤岗市,绥滨县', '3', 'Suibin', '0468', '156200');
INSERT INTO `e_r_sys_region` VALUES ('230500', '230000', '双鸭山', '双鸭山市', '中国,黑龙江省,双鸭山市', '2', 'Shuangyashan', '0469', '155100');
INSERT INTO `e_r_sys_region` VALUES ('230502', '230500', '尖山', '尖山区', '中国,黑龙江省,双鸭山市,尖山区', '3', 'Jianshan', '0469', '155100');
INSERT INTO `e_r_sys_region` VALUES ('230503', '230500', '岭东', '岭东区', '中国,黑龙江省,双鸭山市,岭东区', '3', 'Lingdong', '0469', '155120');
INSERT INTO `e_r_sys_region` VALUES ('230505', '230500', '四方台', '四方台区', '中国,黑龙江省,双鸭山市,四方台区', '3', 'Sifangtai', '0469', '155130');
INSERT INTO `e_r_sys_region` VALUES ('230506', '230500', '宝山', '宝山区', '中国,黑龙江省,双鸭山市,宝山区', '3', 'Baoshan', '0469', '155131');
INSERT INTO `e_r_sys_region` VALUES ('230521', '230500', '集贤', '集贤县', '中国,黑龙江省,双鸭山市,集贤县', '3', 'Jixian', '0469', '155900');
INSERT INTO `e_r_sys_region` VALUES ('230522', '230500', '友谊', '友谊县', '中国,黑龙江省,双鸭山市,友谊县', '3', 'Youyi', '0469', '155800');
INSERT INTO `e_r_sys_region` VALUES ('230523', '230500', '宝清', '宝清县', '中国,黑龙江省,双鸭山市,宝清县', '3', 'Baoqing', '0469', '155600');
INSERT INTO `e_r_sys_region` VALUES ('230524', '230500', '饶河', '饶河县', '中国,黑龙江省,双鸭山市,饶河县', '3', 'Raohe', '0469', '155700');
INSERT INTO `e_r_sys_region` VALUES ('230600', '230000', '大庆', '大庆市', '中国,黑龙江省,大庆市', '2', 'Daqing', '0459', '163000');
INSERT INTO `e_r_sys_region` VALUES ('230602', '230600', '萨尔图', '萨尔图区', '中国,黑龙江省,大庆市,萨尔图区', '3', 'Saertu', '0459', '163001');
INSERT INTO `e_r_sys_region` VALUES ('230603', '230600', '龙凤', '龙凤区', '中国,黑龙江省,大庆市,龙凤区', '3', 'Longfeng', '0459', '163711');
INSERT INTO `e_r_sys_region` VALUES ('230604', '230600', '让胡路', '让胡路区', '中国,黑龙江省,大庆市,让胡路区', '3', 'Ranghulu', '0459', '163712');
INSERT INTO `e_r_sys_region` VALUES ('230605', '230600', '红岗', '红岗区', '中国,黑龙江省,大庆市,红岗区', '3', 'Honggang', '0459', '163511');
INSERT INTO `e_r_sys_region` VALUES ('230606', '230600', '大同', '大同区', '中国,黑龙江省,大庆市,大同区', '3', 'Datong', '0459', '163515');
INSERT INTO `e_r_sys_region` VALUES ('230621', '230600', '肇州', '肇州县', '中国,黑龙江省,大庆市,肇州县', '3', 'Zhaozhou', '0459', '166400');
INSERT INTO `e_r_sys_region` VALUES ('230622', '230600', '肇源', '肇源县', '中国,黑龙江省,大庆市,肇源县', '3', 'Zhaoyuan', '0459', '166500');
INSERT INTO `e_r_sys_region` VALUES ('230623', '230600', '林甸', '林甸县', '中国,黑龙江省,大庆市,林甸县', '3', 'Lindian', '0459', '166300');
INSERT INTO `e_r_sys_region` VALUES ('230624', '230600', '杜尔伯特', '杜尔伯特蒙古族自治县', '中国,黑龙江省,大庆市,杜尔伯特蒙古族自治县', '3', 'Duerbote', '0459', '166200');
INSERT INTO `e_r_sys_region` VALUES ('230700', '230000', '伊春', '伊春市', '中国,黑龙江省,伊春市', '2', 'Yichun', '0458', '153000');
INSERT INTO `e_r_sys_region` VALUES ('230702', '230700', '伊春', '伊春区', '中国,黑龙江省,伊春市,伊春区', '3', 'Yichun', '0458', '153000');
INSERT INTO `e_r_sys_region` VALUES ('230703', '230700', '南岔', '南岔区', '中国,黑龙江省,伊春市,南岔区', '3', 'Nancha', '0458', '153100');
INSERT INTO `e_r_sys_region` VALUES ('230704', '230700', '友好', '友好区', '中国,黑龙江省,伊春市,友好区', '3', 'Youhao', '0458', '153031');
INSERT INTO `e_r_sys_region` VALUES ('230705', '230700', '西林', '西林区', '中国,黑龙江省,伊春市,西林区', '3', 'Xilin', '0458', '153025');
INSERT INTO `e_r_sys_region` VALUES ('230706', '230700', '翠峦', '翠峦区', '中国,黑龙江省,伊春市,翠峦区', '3', 'Cuiluan', '0458', '153013');
INSERT INTO `e_r_sys_region` VALUES ('230707', '230700', '新青', '新青区', '中国,黑龙江省,伊春市,新青区', '3', 'Xinqing', '0458', '153036');
INSERT INTO `e_r_sys_region` VALUES ('230708', '230700', '美溪', '美溪区', '中国,黑龙江省,伊春市,美溪区', '3', 'Meixi', '0458', '153021');
INSERT INTO `e_r_sys_region` VALUES ('230709', '230700', '金山屯', '金山屯区', '中国,黑龙江省,伊春市,金山屯区', '3', 'Jinshantun', '0458', '153026');
INSERT INTO `e_r_sys_region` VALUES ('230710', '230700', '五营', '五营区', '中国,黑龙江省,伊春市,五营区', '3', 'Wuying', '0458', '153033');
INSERT INTO `e_r_sys_region` VALUES ('230711', '230700', '乌马河', '乌马河区', '中国,黑龙江省,伊春市,乌马河区', '3', 'Wumahe', '0458', '153011');
INSERT INTO `e_r_sys_region` VALUES ('230712', '230700', '汤旺河', '汤旺河区', '中国,黑龙江省,伊春市,汤旺河区', '3', 'Tangwanghe', '0458', '153037');
INSERT INTO `e_r_sys_region` VALUES ('230713', '230700', '带岭', '带岭区', '中国,黑龙江省,伊春市,带岭区', '3', 'Dailing', '0458', '153106');
INSERT INTO `e_r_sys_region` VALUES ('230714', '230700', '乌伊岭', '乌伊岭区', '中国,黑龙江省,伊春市,乌伊岭区', '3', 'Wuyiling', '0458', '153038');
INSERT INTO `e_r_sys_region` VALUES ('230715', '230700', '红星', '红星区', '中国,黑龙江省,伊春市,红星区', '3', 'Hongxing', '0458', '153035');
INSERT INTO `e_r_sys_region` VALUES ('230716', '230700', '上甘岭', '上甘岭区', '中国,黑龙江省,伊春市,上甘岭区', '3', 'Shangganling', '0458', '153032');
INSERT INTO `e_r_sys_region` VALUES ('230722', '230700', '嘉荫', '嘉荫县', '中国,黑龙江省,伊春市,嘉荫县', '3', 'Jiayin', '0458', '153200');
INSERT INTO `e_r_sys_region` VALUES ('230781', '230700', '铁力', '铁力市', '中国,黑龙江省,伊春市,铁力市', '3', 'Tieli', '0458', '152500');
INSERT INTO `e_r_sys_region` VALUES ('230800', '230000', '佳木斯', '佳木斯市', '中国,黑龙江省,佳木斯市', '2', 'Jiamusi', '0454', '154002');
INSERT INTO `e_r_sys_region` VALUES ('230803', '230800', '向阳', '向阳区', '中国,黑龙江省,佳木斯市,向阳区', '3', 'Xiangyang', '0454', '154002');
INSERT INTO `e_r_sys_region` VALUES ('230804', '230800', '前进', '前进区', '中国,黑龙江省,佳木斯市,前进区', '3', 'Qianjin', '0454', '154002');
INSERT INTO `e_r_sys_region` VALUES ('230805', '230800', '东风', '东风区', '中国,黑龙江省,佳木斯市,东风区', '3', 'Dongfeng', '0454', '154005');
INSERT INTO `e_r_sys_region` VALUES ('230811', '230800', '郊区', '郊区', '中国,黑龙江省,佳木斯市,郊区', '3', 'Jiaoqu', '0454', '154004');
INSERT INTO `e_r_sys_region` VALUES ('230822', '230800', '桦南', '桦南县', '中国,黑龙江省,佳木斯市,桦南县', '3', 'Huanan', '0454', '154400');
INSERT INTO `e_r_sys_region` VALUES ('230826', '230800', '桦川', '桦川县', '中国,黑龙江省,佳木斯市,桦川县', '3', 'Huachuan', '0454', '154300');
INSERT INTO `e_r_sys_region` VALUES ('230828', '230800', '汤原', '汤原县', '中国,黑龙江省,佳木斯市,汤原县', '3', 'Tangyuan', '0454', '154700');
INSERT INTO `e_r_sys_region` VALUES ('230833', '230800', '抚远', '抚远县', '中国,黑龙江省,佳木斯市,抚远县', '3', 'Fuyuan', '0454', '156500');
INSERT INTO `e_r_sys_region` VALUES ('230881', '230800', '同江', '同江市', '中国,黑龙江省,佳木斯市,同江市', '3', 'Tongjiang', '0454', '156400');
INSERT INTO `e_r_sys_region` VALUES ('230882', '230800', '富锦', '富锦市', '中国,黑龙江省,佳木斯市,富锦市', '3', 'Fujin', '0454', '156100');
INSERT INTO `e_r_sys_region` VALUES ('230900', '230000', '七台河', '七台河市', '中国,黑龙江省,七台河市', '2', 'Qitaihe', '0464', '154600');
INSERT INTO `e_r_sys_region` VALUES ('230902', '230900', '新兴', '新兴区', '中国,黑龙江省,七台河市,新兴区', '3', 'Xinxing', '0464', '154604');
INSERT INTO `e_r_sys_region` VALUES ('230903', '230900', '桃山', '桃山区', '中国,黑龙江省,七台河市,桃山区', '3', 'Taoshan', '0464', '154600');
INSERT INTO `e_r_sys_region` VALUES ('230904', '230900', '茄子河', '茄子河区', '中国,黑龙江省,七台河市,茄子河区', '3', 'Qiezihe', '0464', '154622');
INSERT INTO `e_r_sys_region` VALUES ('230921', '230900', '勃利', '勃利县', '中国,黑龙江省,七台河市,勃利县', '3', 'Boli', '0464', '154500');
INSERT INTO `e_r_sys_region` VALUES ('231000', '230000', '牡丹江', '牡丹江市', '中国,黑龙江省,牡丹江市', '2', 'Mudanjiang', '0453', '157000');
INSERT INTO `e_r_sys_region` VALUES ('231002', '231000', '东安', '东安区', '中国,黑龙江省,牡丹江市,东安区', '3', 'Dong\'an', '0453', '157000');
INSERT INTO `e_r_sys_region` VALUES ('231003', '231000', '阳明', '阳明区', '中国,黑龙江省,牡丹江市,阳明区', '3', 'Yangming', '0453', '157013');
INSERT INTO `e_r_sys_region` VALUES ('231004', '231000', '爱民', '爱民区', '中国,黑龙江省,牡丹江市,爱民区', '3', 'Aimin', '0453', '157009');
INSERT INTO `e_r_sys_region` VALUES ('231005', '231000', '西安', '西安区', '中国,黑龙江省,牡丹江市,西安区', '3', 'Xi\'an', '0453', '157000');
INSERT INTO `e_r_sys_region` VALUES ('231024', '231000', '东宁', '东宁县', '中国,黑龙江省,牡丹江市,东宁县', '3', 'Dongning', '0453', '157200');
INSERT INTO `e_r_sys_region` VALUES ('231025', '231000', '林口', '林口县', '中国,黑龙江省,牡丹江市,林口县', '3', 'Linkou', '0453', '157600');
INSERT INTO `e_r_sys_region` VALUES ('231081', '231000', '绥芬河', '绥芬河市', '中国,黑龙江省,牡丹江市,绥芬河市', '3', 'Suifenhe', '0453', '157300');
INSERT INTO `e_r_sys_region` VALUES ('231083', '231000', '海林', '海林市', '中国,黑龙江省,牡丹江市,海林市', '3', 'Hailin', '0453', '157100');
INSERT INTO `e_r_sys_region` VALUES ('231084', '231000', '宁安', '宁安市', '中国,黑龙江省,牡丹江市,宁安市', '3', 'Ning\'an', '0453', '157400');
INSERT INTO `e_r_sys_region` VALUES ('231085', '231000', '穆棱', '穆棱市', '中国,黑龙江省,牡丹江市,穆棱市', '3', 'Muling', '0453', '157500');
INSERT INTO `e_r_sys_region` VALUES ('231100', '230000', '黑河', '黑河市', '中国,黑龙江省,黑河市', '2', 'Heihe', '0456', '164300');
INSERT INTO `e_r_sys_region` VALUES ('231102', '231100', '爱辉', '爱辉区', '中国,黑龙江省,黑河市,爱辉区', '3', 'Aihui', '0456', '164300');
INSERT INTO `e_r_sys_region` VALUES ('231121', '231100', '嫩江', '嫩江县', '中国,黑龙江省,黑河市,嫩江县', '3', 'Nenjiang', '0456', '161400');
INSERT INTO `e_r_sys_region` VALUES ('231123', '231100', '逊克', '逊克县', '中国,黑龙江省,黑河市,逊克县', '3', 'Xunke', '0456', '164400');
INSERT INTO `e_r_sys_region` VALUES ('231124', '231100', '孙吴', '孙吴县', '中国,黑龙江省,黑河市,孙吴县', '3', 'Sunwu', '0456', '164200');
INSERT INTO `e_r_sys_region` VALUES ('231181', '231100', '北安', '北安市', '中国,黑龙江省,黑河市,北安市', '3', 'Bei\'an', '0456', '164000');
INSERT INTO `e_r_sys_region` VALUES ('231182', '231100', '五大连池', '五大连池市', '中国,黑龙江省,黑河市,五大连池市', '3', 'Wudalianchi', '0456', '164100');
INSERT INTO `e_r_sys_region` VALUES ('231200', '230000', '绥化', '绥化市', '中国,黑龙江省,绥化市', '2', 'Suihua', '0455', '152000');
INSERT INTO `e_r_sys_region` VALUES ('231202', '231200', '北林', '北林区', '中国,黑龙江省,绥化市,北林区', '3', 'Beilin', '0455', '152000');
INSERT INTO `e_r_sys_region` VALUES ('231221', '231200', '望奎', '望奎县', '中国,黑龙江省,绥化市,望奎县', '3', 'Wangkui', '0455', '152100');
INSERT INTO `e_r_sys_region` VALUES ('231222', '231200', '兰西', '兰西县', '中国,黑龙江省,绥化市,兰西县', '3', 'Lanxi', '0455', '151500');
INSERT INTO `e_r_sys_region` VALUES ('231223', '231200', '青冈', '青冈县', '中国,黑龙江省,绥化市,青冈县', '3', 'Qinggang', '0455', '151600');
INSERT INTO `e_r_sys_region` VALUES ('231224', '231200', '庆安', '庆安县', '中国,黑龙江省,绥化市,庆安县', '3', 'Qing\'an', '0455', '152400');
INSERT INTO `e_r_sys_region` VALUES ('231225', '231200', '明水', '明水县', '中国,黑龙江省,绥化市,明水县', '3', 'Mingshui', '0455', '151700');
INSERT INTO `e_r_sys_region` VALUES ('231226', '231200', '绥棱', '绥棱县', '中国,黑龙江省,绥化市,绥棱县', '3', 'Suileng', '0455', '152200');
INSERT INTO `e_r_sys_region` VALUES ('231281', '231200', '安达', '安达市', '中国,黑龙江省,绥化市,安达市', '3', 'Anda', '0455', '151400');
INSERT INTO `e_r_sys_region` VALUES ('231282', '231200', '肇东', '肇东市', '中国,黑龙江省,绥化市,肇东市', '3', 'Zhaodong', '0455', '151100');
INSERT INTO `e_r_sys_region` VALUES ('231283', '231200', '海伦', '海伦市', '中国,黑龙江省,绥化市,海伦市', '3', 'Hailun', '0455', '152300');
INSERT INTO `e_r_sys_region` VALUES ('232700', '230000', '大兴安岭', '大兴安岭地区', '中国,黑龙江省,大兴安岭地区', '2', 'DaXingAnLing', '0457', '165000');
INSERT INTO `e_r_sys_region` VALUES ('232701', '232700', '加格达奇', '加格达奇区', '中国,黑龙江省,大兴安岭地区,加格达奇区', '3', 'Jiagedaqi', '0457', '165000');
INSERT INTO `e_r_sys_region` VALUES ('232702', '232700', '新林', '新林区', '中国,黑龙江省,大兴安岭地区,新林区', '3', 'Xinlin', '0457', '165000');
INSERT INTO `e_r_sys_region` VALUES ('232703', '232700', '松岭', '松岭区', '中国,黑龙江省,大兴安岭地区,松岭区', '3', 'Songling', '0457', '165000');
INSERT INTO `e_r_sys_region` VALUES ('232704', '232700', '呼中', '呼中区', '中国,黑龙江省,大兴安岭地区,呼中区', '3', 'Huzhong', '0457', '165000');
INSERT INTO `e_r_sys_region` VALUES ('232721', '232700', '呼玛', '呼玛县', '中国,黑龙江省,大兴安岭地区,呼玛县', '3', 'Huma', '0457', '165100');
INSERT INTO `e_r_sys_region` VALUES ('232722', '232700', '塔河', '塔河县', '中国,黑龙江省,大兴安岭地区,塔河县', '3', 'Tahe', '0457', '165200');
INSERT INTO `e_r_sys_region` VALUES ('232723', '232700', '漠河', '漠河县', '中国,黑龙江省,大兴安岭地区,漠河县', '3', 'Mohe', '0457', '165300');
INSERT INTO `e_r_sys_region` VALUES ('310000', '100000', '上海', '上海', '中国,上海', '1', 'Shanghai', '', '');
INSERT INTO `e_r_sys_region` VALUES ('310100', '310000', '上海', '上海市', '中国,上海,上海市', '2', 'Shanghai', '021', '200000');
INSERT INTO `e_r_sys_region` VALUES ('310101', '310100', '黄浦', '黄浦区', '中国,上海,上海市,黄浦区', '3', 'Huangpu', '021', '200001');
INSERT INTO `e_r_sys_region` VALUES ('310104', '310100', '徐汇', '徐汇区', '中国,上海,上海市,徐汇区', '3', 'Xuhui', '021', '200030');
INSERT INTO `e_r_sys_region` VALUES ('310105', '310100', '长宁', '长宁区', '中国,上海,上海市,长宁区', '3', 'Changning', '021', '200050');
INSERT INTO `e_r_sys_region` VALUES ('310106', '310100', '静安', '静安区', '中国,上海,上海市,静安区', '3', 'Jing\'an', '021', '200040');
INSERT INTO `e_r_sys_region` VALUES ('310107', '310100', '普陀', '普陀区', '中国,上海,上海市,普陀区', '3', 'Putuo', '021', '200333');
INSERT INTO `e_r_sys_region` VALUES ('310108', '310100', '闸北', '闸北区', '中国,上海,上海市,闸北区', '3', 'Zhabei', '021', '200070');
INSERT INTO `e_r_sys_region` VALUES ('310109', '310100', '虹口', '虹口区', '中国,上海,上海市,虹口区', '3', 'Hongkou', '021', '200086');
INSERT INTO `e_r_sys_region` VALUES ('310110', '310100', '杨浦', '杨浦区', '中国,上海,上海市,杨浦区', '3', 'Yangpu', '021', '200082');
INSERT INTO `e_r_sys_region` VALUES ('310112', '310100', '闵行', '闵行区', '中国,上海,上海市,闵行区', '3', 'Minhang', '021', '201100');
INSERT INTO `e_r_sys_region` VALUES ('310113', '310100', '宝山', '宝山区', '中国,上海,上海市,宝山区', '3', 'Baoshan', '021', '201900');
INSERT INTO `e_r_sys_region` VALUES ('310114', '310100', '嘉定', '嘉定区', '中国,上海,上海市,嘉定区', '3', 'Jiading', '021', '201800');
INSERT INTO `e_r_sys_region` VALUES ('310115', '310100', '浦东', '浦东新区', '中国,上海,上海市,浦东新区', '3', 'Pudong', '021', '200135');
INSERT INTO `e_r_sys_region` VALUES ('310116', '310100', '金山', '金山区', '中国,上海,上海市,金山区', '3', 'Jinshan', '021', '200540');
INSERT INTO `e_r_sys_region` VALUES ('310117', '310100', '松江', '松江区', '中国,上海,上海市,松江区', '3', 'Songjiang', '021', '201600');
INSERT INTO `e_r_sys_region` VALUES ('310118', '310100', '青浦', '青浦区', '中国,上海,上海市,青浦区', '3', 'Qingpu', '021', '201700');
INSERT INTO `e_r_sys_region` VALUES ('310120', '310100', '奉贤', '奉贤区', '中国,上海,上海市,奉贤区', '3', 'Fengxian', '021', '201400');
INSERT INTO `e_r_sys_region` VALUES ('310230', '310100', '崇明', '崇明县', '中国,上海,上海市,崇明县', '3', 'Chongming', '021', '202150');
INSERT INTO `e_r_sys_region` VALUES ('320000', '100000', '江苏', '江苏省', '中国,江苏省', '1', 'Jiangsu', '', '');
INSERT INTO `e_r_sys_region` VALUES ('320100', '320000', '南京', '南京市', '中国,江苏省,南京市', '2', 'Nanjing', '025', '210008');
INSERT INTO `e_r_sys_region` VALUES ('320102', '320100', '玄武', '玄武区', '中国,江苏省,南京市,玄武区', '3', 'Xuanwu', '025', '210018');
INSERT INTO `e_r_sys_region` VALUES ('320104', '320100', '秦淮', '秦淮区', '中国,江苏省,南京市,秦淮区', '3', 'Qinhuai', '025', '210001');
INSERT INTO `e_r_sys_region` VALUES ('320105', '320100', '建邺', '建邺区', '中国,江苏省,南京市,建邺区', '3', 'Jianye', '025', '210004');
INSERT INTO `e_r_sys_region` VALUES ('320106', '320100', '鼓楼', '鼓楼区', '中国,江苏省,南京市,鼓楼区', '3', 'Gulou', '025', '210009');
INSERT INTO `e_r_sys_region` VALUES ('320111', '320100', '浦口', '浦口区', '中国,江苏省,南京市,浦口区', '3', 'Pukou', '025', '211800');
INSERT INTO `e_r_sys_region` VALUES ('320113', '320100', '栖霞', '栖霞区', '中国,江苏省,南京市,栖霞区', '3', 'Qixia', '025', '210046');
INSERT INTO `e_r_sys_region` VALUES ('320114', '320100', '雨花台', '雨花台区', '中国,江苏省,南京市,雨花台区', '3', 'Yuhuatai', '025', '210012');
INSERT INTO `e_r_sys_region` VALUES ('320115', '320100', '江宁', '江宁区', '中国,江苏省,南京市,江宁区', '3', 'Jiangning', '025', '211100');
INSERT INTO `e_r_sys_region` VALUES ('320116', '320100', '六合', '六合区', '中国,江苏省,南京市,六合区', '3', 'Luhe', '025', '211500');
INSERT INTO `e_r_sys_region` VALUES ('320117', '320100', '溧水', '溧水区', '中国,江苏省,南京市,溧水区', '3', 'Lishui', '025', '211200');
INSERT INTO `e_r_sys_region` VALUES ('320118', '320100', '高淳', '高淳区', '中国,江苏省,南京市,高淳区', '3', 'Gaochun', '025', '211300');
INSERT INTO `e_r_sys_region` VALUES ('320200', '320000', '无锡', '无锡市', '中国,江苏省,无锡市', '2', 'Wuxi', '0510', '214000');
INSERT INTO `e_r_sys_region` VALUES ('320202', '320200', '崇安', '崇安区', '中国,江苏省,无锡市,崇安区', '3', 'Chong\'an', '0510', '214001');
INSERT INTO `e_r_sys_region` VALUES ('320203', '320200', '南长', '南长区', '中国,江苏省,无锡市,南长区', '3', 'Nanchang', '0510', '214021');
INSERT INTO `e_r_sys_region` VALUES ('320204', '320200', '北塘', '北塘区', '中国,江苏省,无锡市,北塘区', '3', 'Beitang', '0510', '214044');
INSERT INTO `e_r_sys_region` VALUES ('320205', '320200', '锡山', '锡山区', '中国,江苏省,无锡市,锡山区', '3', 'Xishan', '0510', '214101');
INSERT INTO `e_r_sys_region` VALUES ('320206', '320200', '惠山', '惠山区', '中国,江苏省,无锡市,惠山区', '3', 'Huishan', '0510', '214174');
INSERT INTO `e_r_sys_region` VALUES ('320211', '320200', '滨湖', '滨湖区', '中国,江苏省,无锡市,滨湖区', '3', 'Binhu', '0510', '214123');
INSERT INTO `e_r_sys_region` VALUES ('320281', '320200', '江阴', '江阴市', '中国,江苏省,无锡市,江阴市', '3', 'Jiangyin', '0510', '214431');
INSERT INTO `e_r_sys_region` VALUES ('320282', '320200', '宜兴', '宜兴市', '中国,江苏省,无锡市,宜兴市', '3', 'Yixing', '0510', '214200');
INSERT INTO `e_r_sys_region` VALUES ('320300', '320000', '徐州', '徐州市', '中国,江苏省,徐州市', '2', 'Xuzhou', '0516', '221003');
INSERT INTO `e_r_sys_region` VALUES ('320302', '320300', '鼓楼', '鼓楼区', '中国,江苏省,徐州市,鼓楼区', '3', 'Gulou', '0516', '221005');
INSERT INTO `e_r_sys_region` VALUES ('320303', '320300', '云龙', '云龙区', '中国,江苏省,徐州市,云龙区', '3', 'Yunlong', '0516', '221007');
INSERT INTO `e_r_sys_region` VALUES ('320305', '320300', '贾汪', '贾汪区', '中国,江苏省,徐州市,贾汪区', '3', 'Jiawang', '0516', '221003');
INSERT INTO `e_r_sys_region` VALUES ('320311', '320300', '泉山', '泉山区', '中国,江苏省,徐州市,泉山区', '3', 'Quanshan', '0516', '221006');
INSERT INTO `e_r_sys_region` VALUES ('320312', '320300', '铜山', '铜山区', '中国,江苏省,徐州市,铜山区', '3', 'Tongshan', '0516', '221106');
INSERT INTO `e_r_sys_region` VALUES ('320321', '320300', '丰县', '丰县', '中国,江苏省,徐州市,丰县', '3', 'Fengxian', '0516', '221700');
INSERT INTO `e_r_sys_region` VALUES ('320322', '320300', '沛县', '沛县', '中国,江苏省,徐州市,沛县', '3', 'Peixian', '0516', '221600');
INSERT INTO `e_r_sys_region` VALUES ('320324', '320300', '睢宁', '睢宁县', '中国,江苏省,徐州市,睢宁县', '3', 'Suining', '0516', '221200');
INSERT INTO `e_r_sys_region` VALUES ('320381', '320300', '新沂', '新沂市', '中国,江苏省,徐州市,新沂市', '3', 'Xinyi', '0516', '221400');
INSERT INTO `e_r_sys_region` VALUES ('320382', '320300', '邳州', '邳州市', '中国,江苏省,徐州市,邳州市', '3', 'Pizhou', '0516', '221300');
INSERT INTO `e_r_sys_region` VALUES ('320400', '320000', '常州', '常州市', '中国,江苏省,常州市', '2', 'Changzhou', '0519', '213000');
INSERT INTO `e_r_sys_region` VALUES ('320402', '320400', '天宁', '天宁区', '中国,江苏省,常州市,天宁区', '3', 'Tianning', '0519', '213000');
INSERT INTO `e_r_sys_region` VALUES ('320404', '320400', '钟楼', '钟楼区', '中国,江苏省,常州市,钟楼区', '3', 'Zhonglou', '0519', '213023');
INSERT INTO `e_r_sys_region` VALUES ('320405', '320400', '戚墅堰', '戚墅堰区', '中国,江苏省,常州市,戚墅堰区', '3', 'Qishuyan', '0519', '213025');
INSERT INTO `e_r_sys_region` VALUES ('320411', '320400', '新北', '新北区', '中国,江苏省,常州市,新北区', '3', 'Xinbei', '0519', '213022');
INSERT INTO `e_r_sys_region` VALUES ('320412', '320400', '武进', '武进区', '中国,江苏省,常州市,武进区', '3', 'Wujin', '0519', '213100');
INSERT INTO `e_r_sys_region` VALUES ('320481', '320400', '溧阳', '溧阳市', '中国,江苏省,常州市,溧阳市', '3', 'Liyang', '0519', '213300');
INSERT INTO `e_r_sys_region` VALUES ('320482', '320400', '金坛', '金坛市', '中国,江苏省,常州市,金坛市', '3', 'Jintan', '0519', '213200');
INSERT INTO `e_r_sys_region` VALUES ('320500', '320000', '苏州', '苏州市', '中国,江苏省,苏州市', '2', 'Suzhou', '0512', '215002');
INSERT INTO `e_r_sys_region` VALUES ('320505', '320500', '虎丘', '虎丘区', '中国,江苏省,苏州市,虎丘区', '3', 'Huqiu', '0512', '215004');
INSERT INTO `e_r_sys_region` VALUES ('320506', '320500', '吴中', '吴中区', '中国,江苏省,苏州市,吴中区', '3', 'Wuzhong', '0512', '215128');
INSERT INTO `e_r_sys_region` VALUES ('320507', '320500', '相城', '相城区', '中国,江苏省,苏州市,相城区', '3', 'Xiangcheng', '0512', '215131');
INSERT INTO `e_r_sys_region` VALUES ('320508', '320500', '姑苏', '姑苏区', '中国,江苏省,苏州市,姑苏区', '3', 'Gusu', '0512', '215031');
INSERT INTO `e_r_sys_region` VALUES ('320509', '320500', '吴江', '吴江区', '中国,江苏省,苏州市,吴江区', '3', 'Wujiang', '0512', '215200');
INSERT INTO `e_r_sys_region` VALUES ('320581', '320500', '常熟', '常熟市', '中国,江苏省,苏州市,常熟市', '3', 'Changshu', '0512', '215500');
INSERT INTO `e_r_sys_region` VALUES ('320582', '320500', '张家港', '张家港市', '中国,江苏省,苏州市,张家港市', '3', 'Zhangjiagang', '0512', '215600');
INSERT INTO `e_r_sys_region` VALUES ('320583', '320500', '昆山', '昆山市', '中国,江苏省,苏州市,昆山市', '3', 'Kunshan', '0512', '215300');
INSERT INTO `e_r_sys_region` VALUES ('320585', '320500', '太仓', '太仓市', '中国,江苏省,苏州市,太仓市', '3', 'Taicang', '0512', '215400');
INSERT INTO `e_r_sys_region` VALUES ('320600', '320000', '南通', '南通市', '中国,江苏省,南通市', '2', 'Nantong', '0513', '226001');
INSERT INTO `e_r_sys_region` VALUES ('320602', '320600', '崇川', '崇川区', '中国,江苏省,南通市,崇川区', '3', 'Chongchuan', '0513', '226001');
INSERT INTO `e_r_sys_region` VALUES ('320611', '320600', '港闸', '港闸区', '中国,江苏省,南通市,港闸区', '3', 'Gangzha', '0513', '226001');
INSERT INTO `e_r_sys_region` VALUES ('320612', '320600', '通州', '通州区', '中国,江苏省,南通市,通州区', '3', 'Tongzhou', '0513', '226300');
INSERT INTO `e_r_sys_region` VALUES ('320621', '320600', '海安', '海安县', '中国,江苏省,南通市,海安县', '3', 'Hai\'an', '0513', '226600');
INSERT INTO `e_r_sys_region` VALUES ('320623', '320600', '如东', '如东县', '中国,江苏省,南通市,如东县', '3', 'Rudong', '0513', '226400');
INSERT INTO `e_r_sys_region` VALUES ('320681', '320600', '启东', '启东市', '中国,江苏省,南通市,启东市', '3', 'Qidong', '0513', '226200');
INSERT INTO `e_r_sys_region` VALUES ('320682', '320600', '如皋', '如皋市', '中国,江苏省,南通市,如皋市', '3', 'Rugao', '0513', '226500');
INSERT INTO `e_r_sys_region` VALUES ('320684', '320600', '海门', '海门市', '中国,江苏省,南通市,海门市', '3', 'Haimen', '0513', '226100');
INSERT INTO `e_r_sys_region` VALUES ('320700', '320000', '连云港', '连云港市', '中国,江苏省,连云港市', '2', 'Lianyungang', '0518', '222002');
INSERT INTO `e_r_sys_region` VALUES ('320703', '320700', '连云', '连云区', '中国,江苏省,连云港市,连云区', '3', 'Lianyun', '0518', '222042');
INSERT INTO `e_r_sys_region` VALUES ('320706', '320700', '海州', '海州区', '中国,江苏省,连云港市,海州区', '3', 'Haizhou', '0518', '222003');
INSERT INTO `e_r_sys_region` VALUES ('320707', '320700', '赣榆', '赣榆区', '中国,江苏省,连云港市,赣榆区', '3', 'Ganyu', '0518', '222100');
INSERT INTO `e_r_sys_region` VALUES ('320722', '320700', '东海', '东海县', '中国,江苏省,连云港市,东海县', '3', 'Donghai', '0518', '222300');
INSERT INTO `e_r_sys_region` VALUES ('320723', '320700', '灌云', '灌云县', '中国,江苏省,连云港市,灌云县', '3', 'Guanyun', '0518', '222200');
INSERT INTO `e_r_sys_region` VALUES ('320724', '320700', '灌南', '灌南县', '中国,江苏省,连云港市,灌南县', '3', 'Guannan', '0518', '222500');
INSERT INTO `e_r_sys_region` VALUES ('320800', '320000', '淮安', '淮安市', '中国,江苏省,淮安市', '2', 'Huai\'an', '0517', '223001');
INSERT INTO `e_r_sys_region` VALUES ('320802', '320800', '清河', '清河区', '中国,江苏省,淮安市,清河区', '3', 'Qinghe', '0517', '223001');
INSERT INTO `e_r_sys_region` VALUES ('320803', '320800', '淮安', '淮安区', '中国,江苏省,淮安市,淮安区', '3', 'Huai\'an', '0517', '223200');
INSERT INTO `e_r_sys_region` VALUES ('320804', '320800', '淮阴', '淮阴区', '中国,江苏省,淮安市,淮阴区', '3', 'Huaiyin', '0517', '223300');
INSERT INTO `e_r_sys_region` VALUES ('320811', '320800', '清浦', '清浦区', '中国,江苏省,淮安市,清浦区', '3', 'Qingpu', '0517', '223002');
INSERT INTO `e_r_sys_region` VALUES ('320826', '320800', '涟水', '涟水县', '中国,江苏省,淮安市,涟水县', '3', 'Lianshui', '0517', '223400');
INSERT INTO `e_r_sys_region` VALUES ('320829', '320800', '洪泽', '洪泽县', '中国,江苏省,淮安市,洪泽县', '3', 'Hongze', '0517', '223100');
INSERT INTO `e_r_sys_region` VALUES ('320830', '320800', '盱眙', '盱眙县', '中国,江苏省,淮安市,盱眙县', '3', 'Xuyi', '0517', '211700');
INSERT INTO `e_r_sys_region` VALUES ('320831', '320800', '金湖', '金湖县', '中国,江苏省,淮安市,金湖县', '3', 'Jinhu', '0517', '211600');
INSERT INTO `e_r_sys_region` VALUES ('320900', '320000', '盐城', '盐城市', '中国,江苏省,盐城市', '2', 'Yancheng', '0515', '224005');
INSERT INTO `e_r_sys_region` VALUES ('320902', '320900', '亭湖', '亭湖区', '中国,江苏省,盐城市,亭湖区', '3', 'Tinghu', '0515', '224005');
INSERT INTO `e_r_sys_region` VALUES ('320903', '320900', '盐都', '盐都区', '中国,江苏省,盐城市,盐都区', '3', 'Yandu', '0515', '224055');
INSERT INTO `e_r_sys_region` VALUES ('320921', '320900', '响水', '响水县', '中国,江苏省,盐城市,响水县', '3', 'Xiangshui', '0515', '224600');
INSERT INTO `e_r_sys_region` VALUES ('320922', '320900', '滨海', '滨海县', '中国,江苏省,盐城市,滨海县', '3', 'Binhai', '0515', '224500');
INSERT INTO `e_r_sys_region` VALUES ('320923', '320900', '阜宁', '阜宁县', '中国,江苏省,盐城市,阜宁县', '3', 'Funing', '0515', '224400');
INSERT INTO `e_r_sys_region` VALUES ('320924', '320900', '射阳', '射阳县', '中国,江苏省,盐城市,射阳县', '3', 'Sheyang', '0515', '224300');
INSERT INTO `e_r_sys_region` VALUES ('320925', '320900', '建湖', '建湖县', '中国,江苏省,盐城市,建湖县', '3', 'Jianhu', '0515', '224700');
INSERT INTO `e_r_sys_region` VALUES ('320981', '320900', '东台', '东台市', '中国,江苏省,盐城市,东台市', '3', 'Dongtai', '0515', '224200');
INSERT INTO `e_r_sys_region` VALUES ('320982', '320900', '大丰', '大丰市', '中国,江苏省,盐城市,大丰市', '3', 'Dafeng', '0515', '224100');
INSERT INTO `e_r_sys_region` VALUES ('321000', '320000', '扬州', '扬州市', '中国,江苏省,扬州市', '2', 'Yangzhou', '0514', '225002');
INSERT INTO `e_r_sys_region` VALUES ('321002', '321000', '广陵', '广陵区', '中国,江苏省,扬州市,广陵区', '3', 'Guangling', '0514', '225002');
INSERT INTO `e_r_sys_region` VALUES ('321003', '321000', '邗江', '邗江区', '中国,江苏省,扬州市,邗江区', '3', 'Hanjiang', '0514', '225002');
INSERT INTO `e_r_sys_region` VALUES ('321012', '321000', '江都', '江都区', '中国,江苏省,扬州市,江都区', '3', 'Jiangdu', '0514', '225200');
INSERT INTO `e_r_sys_region` VALUES ('321023', '321000', '宝应', '宝应县', '中国,江苏省,扬州市,宝应县', '3', 'Baoying', '0514', '225800');
INSERT INTO `e_r_sys_region` VALUES ('321081', '321000', '仪征', '仪征市', '中国,江苏省,扬州市,仪征市', '3', 'Yizheng', '0514', '211400');
INSERT INTO `e_r_sys_region` VALUES ('321084', '321000', '高邮', '高邮市', '中国,江苏省,扬州市,高邮市', '3', 'Gaoyou', '0514', '225600');
INSERT INTO `e_r_sys_region` VALUES ('321100', '320000', '镇江', '镇江市', '中国,江苏省,镇江市', '2', 'Zhenjiang', '0511', '212004');
INSERT INTO `e_r_sys_region` VALUES ('321102', '321100', '京口', '京口区', '中国,江苏省,镇江市,京口区', '3', 'Jingkou', '0511', '212003');
INSERT INTO `e_r_sys_region` VALUES ('321111', '321100', '润州', '润州区', '中国,江苏省,镇江市,润州区', '3', 'Runzhou', '0511', '212005');
INSERT INTO `e_r_sys_region` VALUES ('321112', '321100', '丹徒', '丹徒区', '中国,江苏省,镇江市,丹徒区', '3', 'Dantu', '0511', '212028');
INSERT INTO `e_r_sys_region` VALUES ('321181', '321100', '丹阳', '丹阳市', '中国,江苏省,镇江市,丹阳市', '3', 'Danyang', '0511', '212300');
INSERT INTO `e_r_sys_region` VALUES ('321182', '321100', '扬中', '扬中市', '中国,江苏省,镇江市,扬中市', '3', 'Yangzhong', '0511', '212200');
INSERT INTO `e_r_sys_region` VALUES ('321183', '321100', '句容', '句容市', '中国,江苏省,镇江市,句容市', '3', 'Jurong', '0511', '212400');
INSERT INTO `e_r_sys_region` VALUES ('321200', '320000', '泰州', '泰州市', '中国,江苏省,泰州市', '2', 'Taizhou', '0523', '225300');
INSERT INTO `e_r_sys_region` VALUES ('321202', '321200', '海陵', '海陵区', '中国,江苏省,泰州市,海陵区', '3', 'Hailing', '0523', '225300');
INSERT INTO `e_r_sys_region` VALUES ('321203', '321200', '高港', '高港区', '中国,江苏省,泰州市,高港区', '3', 'Gaogang', '0523', '225321');
INSERT INTO `e_r_sys_region` VALUES ('321204', '321200', '姜堰', '姜堰区', '中国,江苏省,泰州市,姜堰区', '3', 'Jiangyan', '0523', '225500');
INSERT INTO `e_r_sys_region` VALUES ('321281', '321200', '兴化', '兴化市', '中国,江苏省,泰州市,兴化市', '3', 'Xinghua', '0523', '225700');
INSERT INTO `e_r_sys_region` VALUES ('321282', '321200', '靖江', '靖江市', '中国,江苏省,泰州市,靖江市', '3', 'Jingjiang', '0523', '214500');
INSERT INTO `e_r_sys_region` VALUES ('321283', '321200', '泰兴', '泰兴市', '中国,江苏省,泰州市,泰兴市', '3', 'Taixing', '0523', '225400');
INSERT INTO `e_r_sys_region` VALUES ('321300', '320000', '宿迁', '宿迁市', '中国,江苏省,宿迁市', '2', 'Suqian', '0527', '223800');
INSERT INTO `e_r_sys_region` VALUES ('321302', '321300', '宿城', '宿城区', '中国,江苏省,宿迁市,宿城区', '3', 'Sucheng', '0527', '223800');
INSERT INTO `e_r_sys_region` VALUES ('321311', '321300', '宿豫', '宿豫区', '中国,江苏省,宿迁市,宿豫区', '3', 'Suyu', '0527', '223800');
INSERT INTO `e_r_sys_region` VALUES ('321322', '321300', '沭阳', '沭阳县', '中国,江苏省,宿迁市,沭阳县', '3', 'Shuyang', '0527', '223600');
INSERT INTO `e_r_sys_region` VALUES ('321323', '321300', '泗阳', '泗阳县', '中国,江苏省,宿迁市,泗阳县', '3', 'Siyang', '0527', '223700');
INSERT INTO `e_r_sys_region` VALUES ('321324', '321300', '泗洪', '泗洪县', '中国,江苏省,宿迁市,泗洪县', '3', 'Sihong', '0527', '223900');
INSERT INTO `e_r_sys_region` VALUES ('330000', '100000', '浙江', '浙江省', '中国,浙江省', '1', 'Zhejiang', '', '');
INSERT INTO `e_r_sys_region` VALUES ('330100', '330000', '杭州', '杭州市', '中国,浙江省,杭州市', '2', 'Hangzhou', '0571', '310026');
INSERT INTO `e_r_sys_region` VALUES ('330102', '330100', '上城', '上城区', '中国,浙江省,杭州市,上城区', '3', 'Shangcheng', '0571', '310002');
INSERT INTO `e_r_sys_region` VALUES ('330103', '330100', '下城', '下城区', '中国,浙江省,杭州市,下城区', '3', 'Xiacheng', '0571', '310006');
INSERT INTO `e_r_sys_region` VALUES ('330104', '330100', '江干', '江干区', '中国,浙江省,杭州市,江干区', '3', 'Jianggan', '0571', '310016');
INSERT INTO `e_r_sys_region` VALUES ('330105', '330100', '拱墅', '拱墅区', '中国,浙江省,杭州市,拱墅区', '3', 'Gongshu', '0571', '310011');
INSERT INTO `e_r_sys_region` VALUES ('330106', '330100', '西湖', '西湖区', '中国,浙江省,杭州市,西湖区', '3', 'Xihu', '0571', '310013');
INSERT INTO `e_r_sys_region` VALUES ('330108', '330100', '滨江', '滨江区', '中国,浙江省,杭州市,滨江区', '3', 'Binjiang', '0571', '310051');
INSERT INTO `e_r_sys_region` VALUES ('330109', '330100', '萧山', '萧山区', '中国,浙江省,杭州市,萧山区', '3', 'Xiaoshan', '0571', '311200');
INSERT INTO `e_r_sys_region` VALUES ('330110', '330100', '余杭', '余杭区', '中国,浙江省,杭州市,余杭区', '3', 'Yuhang', '0571', '311100');
INSERT INTO `e_r_sys_region` VALUES ('330122', '330100', '桐庐', '桐庐县', '中国,浙江省,杭州市,桐庐县', '3', 'Tonglu', '0571', '311500');
INSERT INTO `e_r_sys_region` VALUES ('330127', '330100', '淳安', '淳安县', '中国,浙江省,杭州市,淳安县', '3', 'Chun\'an', '0571', '311700');
INSERT INTO `e_r_sys_region` VALUES ('330182', '330100', '建德', '建德市', '中国,浙江省,杭州市,建德市', '3', 'Jiande', '0571', '311600');
INSERT INTO `e_r_sys_region` VALUES ('330183', '330100', '富阳', '富阳区', '中国,浙江省,杭州市,富阳区', '3', 'Fuyang', '0571', '311400');
INSERT INTO `e_r_sys_region` VALUES ('330185', '330100', '临安', '临安市', '中国,浙江省,杭州市,临安市', '3', 'Lin\'an', '0571', '311300');
INSERT INTO `e_r_sys_region` VALUES ('330200', '330000', '宁波', '宁波市', '中国,浙江省,宁波市', '2', 'Ningbo', '0574', '315000');
INSERT INTO `e_r_sys_region` VALUES ('330203', '330200', '海曙', '海曙区', '中国,浙江省,宁波市,海曙区', '3', 'Haishu', '0574', '315000');
INSERT INTO `e_r_sys_region` VALUES ('330204', '330200', '江东', '江东区', '中国,浙江省,宁波市,江东区', '3', 'Jiangdong', '0574', '315040');
INSERT INTO `e_r_sys_region` VALUES ('330205', '330200', '江北', '江北区', '中国,浙江省,宁波市,江北区', '3', 'Jiangbei', '0574', '315020');
INSERT INTO `e_r_sys_region` VALUES ('330206', '330200', '北仑', '北仑区', '中国,浙江省,宁波市,北仑区', '3', 'Beilun', '0574', '315800');
INSERT INTO `e_r_sys_region` VALUES ('330211', '330200', '镇海', '镇海区', '中国,浙江省,宁波市,镇海区', '3', 'Zhenhai', '0574', '315200');
INSERT INTO `e_r_sys_region` VALUES ('330212', '330200', '鄞州', '鄞州区', '中国,浙江省,宁波市,鄞州区', '3', 'Yinzhou', '0574', '315100');
INSERT INTO `e_r_sys_region` VALUES ('330225', '330200', '象山', '象山县', '中国,浙江省,宁波市,象山县', '3', 'Xiangshan', '0574', '315700');
INSERT INTO `e_r_sys_region` VALUES ('330226', '330200', '宁海', '宁海县', '中国,浙江省,宁波市,宁海县', '3', 'Ninghai', '0574', '315600');
INSERT INTO `e_r_sys_region` VALUES ('330281', '330200', '余姚', '余姚市', '中国,浙江省,宁波市,余姚市', '3', 'Yuyao', '0574', '315400');
INSERT INTO `e_r_sys_region` VALUES ('330282', '330200', '慈溪', '慈溪市', '中国,浙江省,宁波市,慈溪市', '3', 'Cixi', '0574', '315300');
INSERT INTO `e_r_sys_region` VALUES ('330283', '330200', '奉化', '奉化市', '中国,浙江省,宁波市,奉化市', '3', 'Fenghua', '0574', '315500');
INSERT INTO `e_r_sys_region` VALUES ('330300', '330000', '温州', '温州市', '中国,浙江省,温州市', '2', 'Wenzhou', '0577', '325000');
INSERT INTO `e_r_sys_region` VALUES ('330302', '330300', '鹿城', '鹿城区', '中国,浙江省,温州市,鹿城区', '3', 'Lucheng', '0577', '325000');
INSERT INTO `e_r_sys_region` VALUES ('330303', '330300', '龙湾', '龙湾区', '中国,浙江省,温州市,龙湾区', '3', 'Longwan', '0577', '325013');
INSERT INTO `e_r_sys_region` VALUES ('330304', '330300', '瓯海', '瓯海区', '中国,浙江省,温州市,瓯海区', '3', 'Ouhai', '0577', '325005');
INSERT INTO `e_r_sys_region` VALUES ('330322', '330300', '洞头', '洞头县', '中国,浙江省,温州市,洞头县', '3', 'Dongtou', '0577', '325700');
INSERT INTO `e_r_sys_region` VALUES ('330324', '330300', '永嘉', '永嘉县', '中国,浙江省,温州市,永嘉县', '3', 'Yongjia', '0577', '325100');
INSERT INTO `e_r_sys_region` VALUES ('330326', '330300', '平阳', '平阳县', '中国,浙江省,温州市,平阳县', '3', 'Pingyang', '0577', '325400');
INSERT INTO `e_r_sys_region` VALUES ('330327', '330300', '苍南', '苍南县', '中国,浙江省,温州市,苍南县', '3', 'Cangnan', '0577', '325800');
INSERT INTO `e_r_sys_region` VALUES ('330328', '330300', '文成', '文成县', '中国,浙江省,温州市,文成县', '3', 'Wencheng', '0577', '325300');
INSERT INTO `e_r_sys_region` VALUES ('330329', '330300', '泰顺', '泰顺县', '中国,浙江省,温州市,泰顺县', '3', 'Taishun', '0577', '325500');
INSERT INTO `e_r_sys_region` VALUES ('330381', '330300', '瑞安', '瑞安市', '中国,浙江省,温州市,瑞安市', '3', 'Rui\'an', '0577', '325200');
INSERT INTO `e_r_sys_region` VALUES ('330382', '330300', '乐清', '乐清市', '中国,浙江省,温州市,乐清市', '3', 'Yueqing', '0577', '325600');
INSERT INTO `e_r_sys_region` VALUES ('330400', '330000', '嘉兴', '嘉兴市', '中国,浙江省,嘉兴市', '2', 'Jiaxing', '0573', '314000');
INSERT INTO `e_r_sys_region` VALUES ('330402', '330400', '南湖', '南湖区', '中国,浙江省,嘉兴市,南湖区', '3', 'Nanhu', '0573', '314051');
INSERT INTO `e_r_sys_region` VALUES ('330411', '330400', '秀洲', '秀洲区', '中国,浙江省,嘉兴市,秀洲区', '3', 'Xiuzhou', '0573', '314031');
INSERT INTO `e_r_sys_region` VALUES ('330421', '330400', '嘉善', '嘉善县', '中国,浙江省,嘉兴市,嘉善县', '3', 'Jiashan', '0573', '314100');
INSERT INTO `e_r_sys_region` VALUES ('330424', '330400', '海盐', '海盐县', '中国,浙江省,嘉兴市,海盐县', '3', 'Haiyan', '0573', '314300');
INSERT INTO `e_r_sys_region` VALUES ('330481', '330400', '海宁', '海宁市', '中国,浙江省,嘉兴市,海宁市', '3', 'Haining', '0573', '314400');
INSERT INTO `e_r_sys_region` VALUES ('330482', '330400', '平湖', '平湖市', '中国,浙江省,嘉兴市,平湖市', '3', 'Pinghu', '0573', '314200');
INSERT INTO `e_r_sys_region` VALUES ('330483', '330400', '桐乡', '桐乡市', '中国,浙江省,嘉兴市,桐乡市', '3', 'Tongxiang', '0573', '314500');
INSERT INTO `e_r_sys_region` VALUES ('330500', '330000', '湖州', '湖州市', '中国,浙江省,湖州市', '2', 'Huzhou', '0572', '313000');
INSERT INTO `e_r_sys_region` VALUES ('330502', '330500', '吴兴', '吴兴区', '中国,浙江省,湖州市,吴兴区', '3', 'Wuxing', '0572', '313000');
INSERT INTO `e_r_sys_region` VALUES ('330503', '330500', '南浔', '南浔区', '中国,浙江省,湖州市,南浔区', '3', 'Nanxun', '0572', '313009');
INSERT INTO `e_r_sys_region` VALUES ('330521', '330500', '德清', '德清县', '中国,浙江省,湖州市,德清县', '3', 'Deqing', '0572', '313200');
INSERT INTO `e_r_sys_region` VALUES ('330522', '330500', '长兴', '长兴县', '中国,浙江省,湖州市,长兴县', '3', 'Changxing', '0572', '313100');
INSERT INTO `e_r_sys_region` VALUES ('330523', '330500', '安吉', '安吉县', '中国,浙江省,湖州市,安吉县', '3', 'Anji', '0572', '313300');
INSERT INTO `e_r_sys_region` VALUES ('330600', '330000', '绍兴', '绍兴市', '中国,浙江省,绍兴市', '2', 'Shaoxing', '0575', '312000');
INSERT INTO `e_r_sys_region` VALUES ('330602', '330600', '越城', '越城区', '中国,浙江省,绍兴市,越城区', '3', 'Yuecheng', '0575', '312000');
INSERT INTO `e_r_sys_region` VALUES ('330603', '330600', '柯桥', '柯桥区', '中国,浙江省,绍兴市,柯桥区', '3', 'Keqiao ', '0575', '312030');
INSERT INTO `e_r_sys_region` VALUES ('330604', '330600', '上虞', '上虞区', '中国,浙江省,绍兴市,上虞区', '3', 'Shangyu', '0575', '312300');
INSERT INTO `e_r_sys_region` VALUES ('330624', '330600', '新昌', '新昌县', '中国,浙江省,绍兴市,新昌县', '3', 'Xinchang', '0575', '312500');
INSERT INTO `e_r_sys_region` VALUES ('330681', '330600', '诸暨', '诸暨市', '中国,浙江省,绍兴市,诸暨市', '3', 'Zhuji', '0575', '311800');
INSERT INTO `e_r_sys_region` VALUES ('330683', '330600', '嵊州', '嵊州市', '中国,浙江省,绍兴市,嵊州市', '3', 'Shengzhou', '0575', '312400');
INSERT INTO `e_r_sys_region` VALUES ('330700', '330000', '金华', '金华市', '中国,浙江省,金华市', '2', 'Jinhua', '0579', '321000');
INSERT INTO `e_r_sys_region` VALUES ('330702', '330700', '婺城', '婺城区', '中国,浙江省,金华市,婺城区', '3', 'Wucheng', '0579', '321000');
INSERT INTO `e_r_sys_region` VALUES ('330703', '330700', '金东', '金东区', '中国,浙江省,金华市,金东区', '3', 'Jindong', '0579', '321000');
INSERT INTO `e_r_sys_region` VALUES ('330723', '330700', '武义', '武义县', '中国,浙江省,金华市,武义县', '3', 'Wuyi', '0579', '321200');
INSERT INTO `e_r_sys_region` VALUES ('330726', '330700', '浦江', '浦江县', '中国,浙江省,金华市,浦江县', '3', 'Pujiang', '0579', '322200');
INSERT INTO `e_r_sys_region` VALUES ('330727', '330700', '磐安', '磐安县', '中国,浙江省,金华市,磐安县', '3', 'Pan\'an', '0579', '322300');
INSERT INTO `e_r_sys_region` VALUES ('330781', '330700', '兰溪', '兰溪市', '中国,浙江省,金华市,兰溪市', '3', 'Lanxi', '0579', '321100');
INSERT INTO `e_r_sys_region` VALUES ('330782', '330700', '义乌', '义乌市', '中国,浙江省,金华市,义乌市', '3', 'Yiwu', '0579', '322000');
INSERT INTO `e_r_sys_region` VALUES ('330783', '330700', '东阳', '东阳市', '中国,浙江省,金华市,东阳市', '3', 'Dongyang', '0579', '322100');
INSERT INTO `e_r_sys_region` VALUES ('330784', '330700', '永康', '永康市', '中国,浙江省,金华市,永康市', '3', 'Yongkang', '0579', '321300');
INSERT INTO `e_r_sys_region` VALUES ('330800', '330000', '衢州', '衢州市', '中国,浙江省,衢州市', '2', 'Quzhou', '0570', '324002');
INSERT INTO `e_r_sys_region` VALUES ('330802', '330800', '柯城', '柯城区', '中国,浙江省,衢州市,柯城区', '3', 'Kecheng', '0570', '324100');
INSERT INTO `e_r_sys_region` VALUES ('330803', '330800', '衢江', '衢江区', '中国,浙江省,衢州市,衢江区', '3', 'Qujiang', '0570', '324022');
INSERT INTO `e_r_sys_region` VALUES ('330822', '330800', '常山', '常山县', '中国,浙江省,衢州市,常山县', '3', 'Changshan', '0570', '324200');
INSERT INTO `e_r_sys_region` VALUES ('330824', '330800', '开化', '开化县', '中国,浙江省,衢州市,开化县', '3', 'Kaihua', '0570', '324300');
INSERT INTO `e_r_sys_region` VALUES ('330825', '330800', '龙游', '龙游县', '中国,浙江省,衢州市,龙游县', '3', 'Longyou', '0570', '324400');
INSERT INTO `e_r_sys_region` VALUES ('330881', '330800', '江山', '江山市', '中国,浙江省,衢州市,江山市', '3', 'Jiangshan', '0570', '324100');
INSERT INTO `e_r_sys_region` VALUES ('330900', '330000', '舟山', '舟山市', '中国,浙江省,舟山市', '2', 'Zhoushan', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('330902', '330900', '定海', '定海区', '中国,浙江省,舟山市,定海区', '3', 'Dinghai', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('330903', '330900', '普陀', '普陀区', '中国,浙江省,舟山市,普陀区', '3', 'Putuo', '0580', '316100');
INSERT INTO `e_r_sys_region` VALUES ('330921', '330900', '岱山', '岱山县', '中国,浙江省,舟山市,岱山县', '3', 'Daishan', '0580', '316200');
INSERT INTO `e_r_sys_region` VALUES ('330922', '330900', '嵊泗', '嵊泗县', '中国,浙江省,舟山市,嵊泗县', '3', 'Shengsi', '0580', '202450');
INSERT INTO `e_r_sys_region` VALUES ('331000', '330000', '台州', '台州市', '中国,浙江省,台州市', '2', 'Taizhou', '0576', '318000');
INSERT INTO `e_r_sys_region` VALUES ('331002', '331000', '椒江', '椒江区', '中国,浙江省,台州市,椒江区', '3', 'Jiaojiang', '0576', '318000');
INSERT INTO `e_r_sys_region` VALUES ('331003', '331000', '黄岩', '黄岩区', '中国,浙江省,台州市,黄岩区', '3', 'Huangyan', '0576', '318020');
INSERT INTO `e_r_sys_region` VALUES ('331004', '331000', '路桥', '路桥区', '中国,浙江省,台州市,路桥区', '3', 'Luqiao', '0576', '318050');
INSERT INTO `e_r_sys_region` VALUES ('331021', '331000', '玉环', '玉环县', '中国,浙江省,台州市,玉环县', '3', 'Yuhuan', '0576', '317600');
INSERT INTO `e_r_sys_region` VALUES ('331022', '331000', '三门', '三门县', '中国,浙江省,台州市,三门县', '3', 'Sanmen', '0576', '317100');
INSERT INTO `e_r_sys_region` VALUES ('331023', '331000', '天台', '天台县', '中国,浙江省,台州市,天台县', '3', 'Tiantai', '0576', '317200');
INSERT INTO `e_r_sys_region` VALUES ('331024', '331000', '仙居', '仙居县', '中国,浙江省,台州市,仙居县', '3', 'Xianju', '0576', '317300');
INSERT INTO `e_r_sys_region` VALUES ('331081', '331000', '温岭', '温岭市', '中国,浙江省,台州市,温岭市', '3', 'Wenling', '0576', '317500');
INSERT INTO `e_r_sys_region` VALUES ('331082', '331000', '临海', '临海市', '中国,浙江省,台州市,临海市', '3', 'Linhai', '0576', '317000');
INSERT INTO `e_r_sys_region` VALUES ('331100', '330000', '丽水', '丽水市', '中国,浙江省,丽水市', '2', 'Lishui', '0578', '323000');
INSERT INTO `e_r_sys_region` VALUES ('331102', '331100', '莲都', '莲都区', '中国,浙江省,丽水市,莲都区', '3', 'Liandu', '0578', '323000');
INSERT INTO `e_r_sys_region` VALUES ('331121', '331100', '青田', '青田县', '中国,浙江省,丽水市,青田县', '3', 'Qingtian', '0578', '323900');
INSERT INTO `e_r_sys_region` VALUES ('331122', '331100', '缙云', '缙云县', '中国,浙江省,丽水市,缙云县', '3', 'Jinyun', '0578', '321400');
INSERT INTO `e_r_sys_region` VALUES ('331123', '331100', '遂昌', '遂昌县', '中国,浙江省,丽水市,遂昌县', '3', 'Suichang', '0578', '323300');
INSERT INTO `e_r_sys_region` VALUES ('331124', '331100', '松阳', '松阳县', '中国,浙江省,丽水市,松阳县', '3', 'Songyang', '0578', '323400');
INSERT INTO `e_r_sys_region` VALUES ('331125', '331100', '云和', '云和县', '中国,浙江省,丽水市,云和县', '3', 'Yunhe', '0578', '323600');
INSERT INTO `e_r_sys_region` VALUES ('331126', '331100', '庆元', '庆元县', '中国,浙江省,丽水市,庆元县', '3', 'Qingyuan', '0578', '323800');
INSERT INTO `e_r_sys_region` VALUES ('331127', '331100', '景宁', '景宁畲族自治县', '中国,浙江省,丽水市,景宁畲族自治县', '3', 'Jingning', '0578', '323500');
INSERT INTO `e_r_sys_region` VALUES ('331181', '331100', '龙泉', '龙泉市', '中国,浙江省,丽水市,龙泉市', '3', 'Longquan', '0578', '323700');
INSERT INTO `e_r_sys_region` VALUES ('331200', '330000', '舟山新区', '舟山群岛新区', '中国,浙江省,舟山群岛新区', '2', 'Zhoushan', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331201', '331200', '金塘', '金塘岛', '中国,浙江省,舟山群岛新区,金塘岛', '3', 'Jintang', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331202', '331200', '六横', '六横岛', '中国,浙江省,舟山群岛新区,六横岛', '3', 'Liuheng', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331203', '331200', '衢山', '衢山岛', '中国,浙江省,舟山群岛新区,衢山岛', '3', 'Qushan', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331204', '331200', '舟山', '舟山本岛西北部', '中国,浙江省,舟山群岛新区,舟山本岛西北部', '3', 'Zhoushan', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331205', '331200', '岱山', '岱山岛西南部', '中国,浙江省,舟山群岛新区,岱山岛西南部', '3', 'Daishan', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331206', '331200', '泗礁', '泗礁岛', '中国,浙江省,舟山群岛新区,泗礁岛', '3', 'Sijiao', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331207', '331200', '朱家尖', '朱家尖岛', '中国,浙江省,舟山群岛新区,朱家尖岛', '3', 'Zhujiajian', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331208', '331200', '洋山', '洋山岛', '中国,浙江省,舟山群岛新区,洋山岛', '3', 'Yangshan', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331209', '331200', '长涂', '长涂岛', '中国,浙江省,舟山群岛新区,长涂岛', '3', 'Changtu', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('331210', '331200', '虾峙', '虾峙岛', '中国,浙江省,舟山群岛新区,虾峙岛', '3', 'Xiazhi', '0580', '316000');
INSERT INTO `e_r_sys_region` VALUES ('340000', '100000', '安徽', '安徽省', '中国,安徽省', '1', 'Anhui', '', '');
INSERT INTO `e_r_sys_region` VALUES ('340100', '340000', '合肥', '合肥市', '中国,安徽省,合肥市', '2', 'Hefei', '0551', '230001');
INSERT INTO `e_r_sys_region` VALUES ('340102', '340100', '瑶海', '瑶海区', '中国,安徽省,合肥市,瑶海区', '3', 'Yaohai', '0551', '230011');
INSERT INTO `e_r_sys_region` VALUES ('340103', '340100', '庐阳', '庐阳区', '中国,安徽省,合肥市,庐阳区', '3', 'Luyang', '0551', '230001');
INSERT INTO `e_r_sys_region` VALUES ('340104', '340100', '蜀山', '蜀山区', '中国,安徽省,合肥市,蜀山区', '3', 'Shushan', '0551', '230031');
INSERT INTO `e_r_sys_region` VALUES ('340111', '340100', '包河', '包河区', '中国,安徽省,合肥市,包河区', '3', 'Baohe', '0551', '230041');
INSERT INTO `e_r_sys_region` VALUES ('340121', '340100', '长丰', '长丰县', '中国,安徽省,合肥市,长丰县', '3', 'Changfeng', '0551', '231100');
INSERT INTO `e_r_sys_region` VALUES ('340122', '340100', '肥东', '肥东县', '中国,安徽省,合肥市,肥东县', '3', 'Feidong', '0551', '231600');
INSERT INTO `e_r_sys_region` VALUES ('340123', '340100', '肥西', '肥西县', '中国,安徽省,合肥市,肥西县', '3', 'Feixi', '0551', '231200');
INSERT INTO `e_r_sys_region` VALUES ('340124', '340100', '庐江', '庐江县', '中国,安徽省,合肥市,庐江县', '3', 'Lujiang', '0565', '231500');
INSERT INTO `e_r_sys_region` VALUES ('340181', '340100', '巢湖', '巢湖市', '中国,安徽省,合肥市,巢湖市', '3', 'Chaohu', '0565', '238000');
INSERT INTO `e_r_sys_region` VALUES ('340200', '340000', '芜湖', '芜湖市', '中国,安徽省,芜湖市', '2', 'Wuhu', '0551', '241000');
INSERT INTO `e_r_sys_region` VALUES ('340202', '340200', '镜湖', '镜湖区', '中国,安徽省,芜湖市,镜湖区', '3', 'Jinghu', '0553', '241000');
INSERT INTO `e_r_sys_region` VALUES ('340203', '340200', '弋江', '弋江区', '中国,安徽省,芜湖市,弋江区', '3', 'Yijiang', '0553', '241000');
INSERT INTO `e_r_sys_region` VALUES ('340207', '340200', '鸠江', '鸠江区', '中国,安徽省,芜湖市,鸠江区', '3', 'Jiujiang', '0553', '241000');
INSERT INTO `e_r_sys_region` VALUES ('340208', '340200', '三山', '三山区', '中国,安徽省,芜湖市,三山区', '3', 'Sanshan', '0553', '241000');
INSERT INTO `e_r_sys_region` VALUES ('340221', '340200', '芜湖', '芜湖县', '中国,安徽省,芜湖市,芜湖县', '3', 'Wuhu', '0553', '241100');
INSERT INTO `e_r_sys_region` VALUES ('340222', '340200', '繁昌', '繁昌县', '中国,安徽省,芜湖市,繁昌县', '3', 'Fanchang', '0553', '241200');
INSERT INTO `e_r_sys_region` VALUES ('340223', '340200', '南陵', '南陵县', '中国,安徽省,芜湖市,南陵县', '3', 'Nanling', '0553', '242400');
INSERT INTO `e_r_sys_region` VALUES ('340225', '340200', '无为', '无为县', '中国,安徽省,芜湖市,无为县', '3', 'Wuwei', '0565', '238300');
INSERT INTO `e_r_sys_region` VALUES ('340300', '340000', '蚌埠', '蚌埠市', '中国,安徽省,蚌埠市', '2', 'Bengbu', '0552', '233000');
INSERT INTO `e_r_sys_region` VALUES ('340302', '340300', '龙子湖', '龙子湖区', '中国,安徽省,蚌埠市,龙子湖区', '3', 'Longzihu', '0552', '233000');
INSERT INTO `e_r_sys_region` VALUES ('340303', '340300', '蚌山', '蚌山区', '中国,安徽省,蚌埠市,蚌山区', '3', 'Bengshan', '0552', '233000');
INSERT INTO `e_r_sys_region` VALUES ('340304', '340300', '禹会', '禹会区', '中国,安徽省,蚌埠市,禹会区', '3', 'Yuhui', '0552', '233010');
INSERT INTO `e_r_sys_region` VALUES ('340311', '340300', '淮上', '淮上区', '中国,安徽省,蚌埠市,淮上区', '3', 'Huaishang', '0552', '233002');
INSERT INTO `e_r_sys_region` VALUES ('340321', '340300', '怀远', '怀远县', '中国,安徽省,蚌埠市,怀远县', '3', 'Huaiyuan', '0552', '233400');
INSERT INTO `e_r_sys_region` VALUES ('340322', '340300', '五河', '五河县', '中国,安徽省,蚌埠市,五河县', '3', 'Wuhe', '0552', '233300');
INSERT INTO `e_r_sys_region` VALUES ('340323', '340300', '固镇', '固镇县', '中国,安徽省,蚌埠市,固镇县', '3', 'Guzhen', '0552', '233700');
INSERT INTO `e_r_sys_region` VALUES ('340400', '340000', '淮南', '淮南市', '中国,安徽省,淮南市', '2', 'Huainan', '0554', '232001');
INSERT INTO `e_r_sys_region` VALUES ('340402', '340400', '大通', '大通区', '中国,安徽省,淮南市,大通区', '3', 'Datong', '0554', '232033');
INSERT INTO `e_r_sys_region` VALUES ('340403', '340400', '田家庵', '田家庵区', '中国,安徽省,淮南市,田家庵区', '3', 'Tianjiaan', '0554', '232000');
INSERT INTO `e_r_sys_region` VALUES ('340404', '340400', '谢家集', '谢家集区', '中国,安徽省,淮南市,谢家集区', '3', 'Xiejiaji', '0554', '232052');
INSERT INTO `e_r_sys_region` VALUES ('340405', '340400', '八公山', '八公山区', '中国,安徽省,淮南市,八公山区', '3', 'Bagongshan', '0554', '232072');
INSERT INTO `e_r_sys_region` VALUES ('340406', '340400', '潘集', '潘集区', '中国,安徽省,淮南市,潘集区', '3', 'Panji', '0554', '232082');
INSERT INTO `e_r_sys_region` VALUES ('340421', '340400', '凤台', '凤台县', '中国,安徽省,淮南市,凤台县', '3', 'Fengtai', '0554', '232100');
INSERT INTO `e_r_sys_region` VALUES ('340500', '340000', '马鞍山', '马鞍山市', '中国,安徽省,马鞍山市', '2', 'Ma\'anshan', '0555', '243001');
INSERT INTO `e_r_sys_region` VALUES ('340503', '340500', '花山', '花山区', '中国,安徽省,马鞍山市,花山区', '3', 'Huashan', '0555', '243000');
INSERT INTO `e_r_sys_region` VALUES ('340504', '340500', '雨山', '雨山区', '中国,安徽省,马鞍山市,雨山区', '3', 'Yushan', '0555', '243071');
INSERT INTO `e_r_sys_region` VALUES ('340506', '340500', '博望', '博望区', '中国,安徽省,马鞍山市,博望区', '3', 'Bowang', '0555', '243131');
INSERT INTO `e_r_sys_region` VALUES ('340521', '340500', '当涂', '当涂县', '中国,安徽省,马鞍山市,当涂县', '3', 'Dangtu', '0555', '243100');
INSERT INTO `e_r_sys_region` VALUES ('340522', '340500', '含山', '含山县', '中国,安徽省,马鞍山市,含山县', '3', 'Hanshan ', '0555', '238100');
INSERT INTO `e_r_sys_region` VALUES ('340523', '340500', '和县', '和县', '中国,安徽省,马鞍山市,和县', '3', 'Hexian', '0555', '238200');
INSERT INTO `e_r_sys_region` VALUES ('340600', '340000', '淮北', '淮北市', '中国,安徽省,淮北市', '2', 'Huaibei', '0561', '235000');
INSERT INTO `e_r_sys_region` VALUES ('340602', '340600', '杜集', '杜集区', '中国,安徽省,淮北市,杜集区', '3', 'Duji', '0561', '235000');
INSERT INTO `e_r_sys_region` VALUES ('340603', '340600', '相山', '相山区', '中国,安徽省,淮北市,相山区', '3', 'Xiangshan', '0561', '235000');
INSERT INTO `e_r_sys_region` VALUES ('340604', '340600', '烈山', '烈山区', '中国,安徽省,淮北市,烈山区', '3', 'Lieshan', '0561', '235000');
INSERT INTO `e_r_sys_region` VALUES ('340621', '340600', '濉溪', '濉溪县', '中国,安徽省,淮北市,濉溪县', '3', 'Suixi', '0561', '235100');
INSERT INTO `e_r_sys_region` VALUES ('340700', '340000', '铜陵', '铜陵市', '中国,安徽省,铜陵市', '2', 'Tongling', '0562', '244000');
INSERT INTO `e_r_sys_region` VALUES ('340702', '340700', '铜官山', '铜官山区', '中国,安徽省,铜陵市,铜官山区', '3', 'Tongguanshan', '0562', '244000');
INSERT INTO `e_r_sys_region` VALUES ('340703', '340700', '狮子山', '狮子山区', '中国,安徽省,铜陵市,狮子山区', '3', 'Shizishan', '0562', '244000');
INSERT INTO `e_r_sys_region` VALUES ('340711', '340700', '郊区', '郊区', '中国,安徽省,铜陵市,郊区', '3', 'Jiaoqu', '0562', '244000');
INSERT INTO `e_r_sys_region` VALUES ('340721', '340700', '铜陵', '铜陵县', '中国,安徽省,铜陵市,铜陵县', '3', 'Tongling', '0562', '244100');
INSERT INTO `e_r_sys_region` VALUES ('340800', '340000', '安庆', '安庆市', '中国,安徽省,安庆市', '2', 'Anqing', '0556', '246001');
INSERT INTO `e_r_sys_region` VALUES ('340802', '340800', '迎江', '迎江区', '中国,安徽省,安庆市,迎江区', '3', 'Yingjiang', '0556', '246001');
INSERT INTO `e_r_sys_region` VALUES ('340803', '340800', '大观', '大观区', '中国,安徽省,安庆市,大观区', '3', 'Daguan', '0556', '246002');
INSERT INTO `e_r_sys_region` VALUES ('340811', '340800', '宜秀', '宜秀区', '中国,安徽省,安庆市,宜秀区', '3', 'Yixiu', '0556', '246003');
INSERT INTO `e_r_sys_region` VALUES ('340822', '340800', '怀宁', '怀宁县', '中国,安徽省,安庆市,怀宁县', '3', 'Huaining', '0556', '246100');
INSERT INTO `e_r_sys_region` VALUES ('340823', '340800', '枞阳', '枞阳县', '中国,安徽省,安庆市,枞阳县', '3', 'Zongyang', '0556', '246700');
INSERT INTO `e_r_sys_region` VALUES ('340824', '340800', '潜山', '潜山县', '中国,安徽省,安庆市,潜山县', '3', 'Qianshan', '0556', '246300');
INSERT INTO `e_r_sys_region` VALUES ('340825', '340800', '太湖', '太湖县', '中国,安徽省,安庆市,太湖县', '3', 'Taihu', '0556', '246400');
INSERT INTO `e_r_sys_region` VALUES ('340826', '340800', '宿松', '宿松县', '中国,安徽省,安庆市,宿松县', '3', 'Susong', '0556', '246500');
INSERT INTO `e_r_sys_region` VALUES ('340827', '340800', '望江', '望江县', '中国,安徽省,安庆市,望江县', '3', 'Wangjiang', '0556', '246200');
INSERT INTO `e_r_sys_region` VALUES ('340828', '340800', '岳西', '岳西县', '中国,安徽省,安庆市,岳西县', '3', 'Yuexi', '0556', '246600');
INSERT INTO `e_r_sys_region` VALUES ('340881', '340800', '桐城', '桐城市', '中国,安徽省,安庆市,桐城市', '3', 'Tongcheng', '0556', '231400');
INSERT INTO `e_r_sys_region` VALUES ('341000', '340000', '黄山', '黄山市', '中国,安徽省,黄山市', '2', 'Huangshan', '0559', '245000');
INSERT INTO `e_r_sys_region` VALUES ('341002', '341000', '屯溪', '屯溪区', '中国,安徽省,黄山市,屯溪区', '3', 'Tunxi', '0559', '245000');
INSERT INTO `e_r_sys_region` VALUES ('341003', '341000', '黄山', '黄山区', '中国,安徽省,黄山市,黄山区', '3', 'Huangshan', '0559', '242700');
INSERT INTO `e_r_sys_region` VALUES ('341004', '341000', '徽州', '徽州区', '中国,安徽省,黄山市,徽州区', '3', 'Huizhou', '0559', '245061');
INSERT INTO `e_r_sys_region` VALUES ('341021', '341000', '歙县', '歙县', '中国,安徽省,黄山市,歙县', '3', 'Shexian', '0559', '245200');
INSERT INTO `e_r_sys_region` VALUES ('341022', '341000', '休宁', '休宁县', '中国,安徽省,黄山市,休宁县', '3', 'Xiuning', '0559', '245400');
INSERT INTO `e_r_sys_region` VALUES ('341023', '341000', '黟县', '黟县', '中国,安徽省,黄山市,黟县', '3', 'Yixian', '0559', '245500');
INSERT INTO `e_r_sys_region` VALUES ('341024', '341000', '祁门', '祁门县', '中国,安徽省,黄山市,祁门县', '3', 'Qimen', '0559', '245600');
INSERT INTO `e_r_sys_region` VALUES ('341100', '340000', '滁州', '滁州市', '中国,安徽省,滁州市', '2', 'Chuzhou', '0550', '239000');
INSERT INTO `e_r_sys_region` VALUES ('341102', '341100', '琅琊', '琅琊区', '中国,安徽省,滁州市,琅琊区', '3', 'Langya', '0550', '239000');
INSERT INTO `e_r_sys_region` VALUES ('341103', '341100', '南谯', '南谯区', '中国,安徽省,滁州市,南谯区', '3', 'Nanqiao', '0550', '239000');
INSERT INTO `e_r_sys_region` VALUES ('341122', '341100', '来安', '来安县', '中国,安徽省,滁州市,来安县', '3', 'Lai\'an', '0550', '239200');
INSERT INTO `e_r_sys_region` VALUES ('341124', '341100', '全椒', '全椒县', '中国,安徽省,滁州市,全椒县', '3', 'Quanjiao', '0550', '239500');
INSERT INTO `e_r_sys_region` VALUES ('341125', '341100', '定远', '定远县', '中国,安徽省,滁州市,定远县', '3', 'Dingyuan', '0550', '233200');
INSERT INTO `e_r_sys_region` VALUES ('341126', '341100', '凤阳', '凤阳县', '中国,安徽省,滁州市,凤阳县', '3', 'Fengyang', '0550', '233100');
INSERT INTO `e_r_sys_region` VALUES ('341181', '341100', '天长', '天长市', '中国,安徽省,滁州市,天长市', '3', 'Tianchang', '0550', '239300');
INSERT INTO `e_r_sys_region` VALUES ('341182', '341100', '明光', '明光市', '中国,安徽省,滁州市,明光市', '3', 'Mingguang', '0550', '239400');
INSERT INTO `e_r_sys_region` VALUES ('341200', '340000', '阜阳', '阜阳市', '中国,安徽省,阜阳市', '2', 'Fuyang', '0558', '236033');
INSERT INTO `e_r_sys_region` VALUES ('341202', '341200', '颍州', '颍州区', '中国,安徽省,阜阳市,颍州区', '3', 'Yingzhou', '0558', '236001');
INSERT INTO `e_r_sys_region` VALUES ('341203', '341200', '颍东', '颍东区', '中国,安徽省,阜阳市,颍东区', '3', 'Yingdong', '0558', '236058');
INSERT INTO `e_r_sys_region` VALUES ('341204', '341200', '颍泉', '颍泉区', '中国,安徽省,阜阳市,颍泉区', '3', 'Yingquan', '0558', '236045');
INSERT INTO `e_r_sys_region` VALUES ('341221', '341200', '临泉', '临泉县', '中国,安徽省,阜阳市,临泉县', '3', 'Linquan', '0558', '236400');
INSERT INTO `e_r_sys_region` VALUES ('341222', '341200', '太和', '太和县', '中国,安徽省,阜阳市,太和县', '3', 'Taihe', '0558', '236600');
INSERT INTO `e_r_sys_region` VALUES ('341225', '341200', '阜南', '阜南县', '中国,安徽省,阜阳市,阜南县', '3', 'Funan', '0558', '236300');
INSERT INTO `e_r_sys_region` VALUES ('341226', '341200', '颍上', '颍上县', '中国,安徽省,阜阳市,颍上县', '3', 'Yingshang', '0558', '236200');
INSERT INTO `e_r_sys_region` VALUES ('341282', '341200', '界首', '界首市', '中国,安徽省,阜阳市,界首市', '3', 'Jieshou', '0558', '236500');
INSERT INTO `e_r_sys_region` VALUES ('341300', '340000', '宿州', '宿州市', '中国,安徽省,宿州市', '2', 'Suzhou', '0557', '234000');
INSERT INTO `e_r_sys_region` VALUES ('341302', '341300', '埇桥', '埇桥区', '中国,安徽省,宿州市,埇桥区', '3', 'Yongqiao', '0557', '234000');
INSERT INTO `e_r_sys_region` VALUES ('341321', '341300', '砀山', '砀山县', '中国,安徽省,宿州市,砀山县', '3', 'Dangshan', '0557', '235300');
INSERT INTO `e_r_sys_region` VALUES ('341322', '341300', '萧县', '萧县', '中国,安徽省,宿州市,萧县', '3', 'Xiaoxian', '0557', '235200');
INSERT INTO `e_r_sys_region` VALUES ('341323', '341300', '灵璧', '灵璧县', '中国,安徽省,宿州市,灵璧县', '3', 'Lingbi', '0557', '234200');
INSERT INTO `e_r_sys_region` VALUES ('341324', '341300', '泗县', '泗县', '中国,安徽省,宿州市,泗县', '3', 'Sixian', '0557', '234300');
INSERT INTO `e_r_sys_region` VALUES ('341500', '340000', '六安', '六安市', '中国,安徽省,六安市', '2', 'Lu\'an', '0564', '237000');
INSERT INTO `e_r_sys_region` VALUES ('341502', '341500', '金安', '金安区', '中国,安徽省,六安市,金安区', '3', 'Jin\'an', '0564', '237005');
INSERT INTO `e_r_sys_region` VALUES ('341503', '341500', '裕安', '裕安区', '中国,安徽省,六安市,裕安区', '3', 'Yu\'an', '0564', '237010');
INSERT INTO `e_r_sys_region` VALUES ('341521', '341500', '寿县', '寿县', '中国,安徽省,六安市,寿县', '3', 'Shouxian', '0564', '232200');
INSERT INTO `e_r_sys_region` VALUES ('341522', '341500', '霍邱', '霍邱县', '中国,安徽省,六安市,霍邱县', '3', 'Huoqiu', '0564', '237400');
INSERT INTO `e_r_sys_region` VALUES ('341523', '341500', '舒城', '舒城县', '中国,安徽省,六安市,舒城县', '3', 'Shucheng', '0564', '231300');
INSERT INTO `e_r_sys_region` VALUES ('341524', '341500', '金寨', '金寨县', '中国,安徽省,六安市,金寨县', '3', 'Jinzhai', '0564', '237300');
INSERT INTO `e_r_sys_region` VALUES ('341525', '341500', '霍山', '霍山县', '中国,安徽省,六安市,霍山县', '3', 'Huoshan', '0564', '237200');
INSERT INTO `e_r_sys_region` VALUES ('341600', '340000', '亳州', '亳州市', '中国,安徽省,亳州市', '2', 'Bozhou', '0558', '236802');
INSERT INTO `e_r_sys_region` VALUES ('341602', '341600', '谯城', '谯城区', '中国,安徽省,亳州市,谯城区', '3', 'Qiaocheng', '0558', '236800');
INSERT INTO `e_r_sys_region` VALUES ('341621', '341600', '涡阳', '涡阳县', '中国,安徽省,亳州市,涡阳县', '3', 'Guoyang', '0558', '233600');
INSERT INTO `e_r_sys_region` VALUES ('341622', '341600', '蒙城', '蒙城县', '中国,安徽省,亳州市,蒙城县', '3', 'Mengcheng', '0558', '233500');
INSERT INTO `e_r_sys_region` VALUES ('341623', '341600', '利辛', '利辛县', '中国,安徽省,亳州市,利辛县', '3', 'Lixin', '0558', '236700');
INSERT INTO `e_r_sys_region` VALUES ('341700', '340000', '池州', '池州市', '中国,安徽省,池州市', '2', 'Chizhou', '0566', '247100');
INSERT INTO `e_r_sys_region` VALUES ('341702', '341700', '贵池', '贵池区', '中国,安徽省,池州市,贵池区', '3', 'Guichi', '0566', '247100');
INSERT INTO `e_r_sys_region` VALUES ('341721', '341700', '东至', '东至县', '中国,安徽省,池州市,东至县', '3', 'Dongzhi', '0566', '247200');
INSERT INTO `e_r_sys_region` VALUES ('341722', '341700', '石台', '石台县', '中国,安徽省,池州市,石台县', '3', 'Shitai', '0566', '245100');
INSERT INTO `e_r_sys_region` VALUES ('341723', '341700', '青阳', '青阳县', '中国,安徽省,池州市,青阳县', '3', 'Qingyang', '0566', '242800');
INSERT INTO `e_r_sys_region` VALUES ('341800', '340000', '宣城', '宣城市', '中国,安徽省,宣城市', '2', 'Xuancheng', '0563', '242000');
INSERT INTO `e_r_sys_region` VALUES ('341802', '341800', '宣州', '宣州区', '中国,安徽省,宣城市,宣州区', '3', 'Xuanzhou', '0563', '242000');
INSERT INTO `e_r_sys_region` VALUES ('341821', '341800', '郎溪', '郎溪县', '中国,安徽省,宣城市,郎溪县', '3', 'Langxi', '0563', '242100');
INSERT INTO `e_r_sys_region` VALUES ('341822', '341800', '广德', '广德县', '中国,安徽省,宣城市,广德县', '3', 'Guangde', '0563', '242200');
INSERT INTO `e_r_sys_region` VALUES ('341823', '341800', '泾县', '泾县', '中国,安徽省,宣城市,泾县', '3', 'Jingxian', '0563', '242500');
INSERT INTO `e_r_sys_region` VALUES ('341824', '341800', '绩溪', '绩溪县', '中国,安徽省,宣城市,绩溪县', '3', 'Jixi', '0563', '245300');
INSERT INTO `e_r_sys_region` VALUES ('341825', '341800', '旌德', '旌德县', '中国,安徽省,宣城市,旌德县', '3', 'Jingde', '0563', '242600');
INSERT INTO `e_r_sys_region` VALUES ('341881', '341800', '宁国', '宁国市', '中国,安徽省,宣城市,宁国市', '3', 'Ningguo', '0563', '242300');
INSERT INTO `e_r_sys_region` VALUES ('350000', '100000', '福建', '福建省', '中国,福建省', '1', 'Fujian', '', '');
INSERT INTO `e_r_sys_region` VALUES ('350100', '350000', '福州', '福州市', '中国,福建省,福州市', '2', 'Fuzhou', '0591', '350001');
INSERT INTO `e_r_sys_region` VALUES ('350102', '350100', '鼓楼', '鼓楼区', '中国,福建省,福州市,鼓楼区', '3', 'Gulou', '0591', '350001');
INSERT INTO `e_r_sys_region` VALUES ('350103', '350100', '台江', '台江区', '中国,福建省,福州市,台江区', '3', 'Taijiang', '0591', '350004');
INSERT INTO `e_r_sys_region` VALUES ('350104', '350100', '仓山', '仓山区', '中国,福建省,福州市,仓山区', '3', 'Cangshan', '0591', '350007');
INSERT INTO `e_r_sys_region` VALUES ('350105', '350100', '马尾', '马尾区', '中国,福建省,福州市,马尾区', '3', 'Mawei', '0591', '350015');
INSERT INTO `e_r_sys_region` VALUES ('350111', '350100', '晋安', '晋安区', '中国,福建省,福州市,晋安区', '3', 'Jin\'an', '0591', '350011');
INSERT INTO `e_r_sys_region` VALUES ('350121', '350100', '闽侯', '闽侯县', '中国,福建省,福州市,闽侯县', '3', 'Minhou', '0591', '350100');
INSERT INTO `e_r_sys_region` VALUES ('350122', '350100', '连江', '连江县', '中国,福建省,福州市,连江县', '3', 'Lianjiang', '0591', '350500');
INSERT INTO `e_r_sys_region` VALUES ('350123', '350100', '罗源', '罗源县', '中国,福建省,福州市,罗源县', '3', 'Luoyuan', '0591', '350600');
INSERT INTO `e_r_sys_region` VALUES ('350124', '350100', '闽清', '闽清县', '中国,福建省,福州市,闽清县', '3', 'Minqing', '0591', '350800');
INSERT INTO `e_r_sys_region` VALUES ('350125', '350100', '永泰', '永泰县', '中国,福建省,福州市,永泰县', '3', 'Yongtai', '0591', '350700');
INSERT INTO `e_r_sys_region` VALUES ('350128', '350100', '平潭', '平潭县', '中国,福建省,福州市,平潭县', '3', 'Pingtan', '0591', '350400');
INSERT INTO `e_r_sys_region` VALUES ('350181', '350100', '福清', '福清市', '中国,福建省,福州市,福清市', '3', 'Fuqing', '0591', '350300');
INSERT INTO `e_r_sys_region` VALUES ('350182', '350100', '长乐', '长乐市', '中国,福建省,福州市,长乐市', '3', 'Changle', '0591', '350200');
INSERT INTO `e_r_sys_region` VALUES ('350200', '350000', '厦门', '厦门市', '中国,福建省,厦门市', '2', 'Xiamen', '0592', '361003');
INSERT INTO `e_r_sys_region` VALUES ('350203', '350200', '思明', '思明区', '中国,福建省,厦门市,思明区', '3', 'Siming', '0592', '361001');
INSERT INTO `e_r_sys_region` VALUES ('350205', '350200', '海沧', '海沧区', '中国,福建省,厦门市,海沧区', '3', 'Haicang', '0592', '361026');
INSERT INTO `e_r_sys_region` VALUES ('350206', '350200', '湖里', '湖里区', '中国,福建省,厦门市,湖里区', '3', 'Huli', '0592', '361006');
INSERT INTO `e_r_sys_region` VALUES ('350211', '350200', '集美', '集美区', '中国,福建省,厦门市,集美区', '3', 'Jimei', '0592', '361021');
INSERT INTO `e_r_sys_region` VALUES ('350212', '350200', '同安', '同安区', '中国,福建省,厦门市,同安区', '3', 'Tong\'an', '0592', '361100');
INSERT INTO `e_r_sys_region` VALUES ('350213', '350200', '翔安', '翔安区', '中国,福建省,厦门市,翔安区', '3', 'Xiang\'an', '0592', '361101');
INSERT INTO `e_r_sys_region` VALUES ('350300', '350000', '莆田', '莆田市', '中国,福建省,莆田市', '2', 'Putian', '0594', '351100');
INSERT INTO `e_r_sys_region` VALUES ('350302', '350300', '城厢', '城厢区', '中国,福建省,莆田市,城厢区', '3', 'Chengxiang', '0594', '351100');
INSERT INTO `e_r_sys_region` VALUES ('350303', '350300', '涵江', '涵江区', '中国,福建省,莆田市,涵江区', '3', 'Hanjiang', '0594', '351111');
INSERT INTO `e_r_sys_region` VALUES ('350304', '350300', '荔城', '荔城区', '中国,福建省,莆田市,荔城区', '3', 'Licheng', '0594', '351100');
INSERT INTO `e_r_sys_region` VALUES ('350305', '350300', '秀屿', '秀屿区', '中国,福建省,莆田市,秀屿区', '3', 'Xiuyu', '0594', '351152');
INSERT INTO `e_r_sys_region` VALUES ('350322', '350300', '仙游', '仙游县', '中国,福建省,莆田市,仙游县', '3', 'Xianyou', '0594', '351200');
INSERT INTO `e_r_sys_region` VALUES ('350400', '350000', '三明', '三明市', '中国,福建省,三明市', '2', 'Sanming', '0598', '365000');
INSERT INTO `e_r_sys_region` VALUES ('350402', '350400', '梅列', '梅列区', '中国,福建省,三明市,梅列区', '3', 'Meilie', '0598', '365000');
INSERT INTO `e_r_sys_region` VALUES ('350403', '350400', '三元', '三元区', '中国,福建省,三明市,三元区', '3', 'Sanyuan', '0598', '365001');
INSERT INTO `e_r_sys_region` VALUES ('350421', '350400', '明溪', '明溪县', '中国,福建省,三明市,明溪县', '3', 'Mingxi', '0598', '365200');
INSERT INTO `e_r_sys_region` VALUES ('350423', '350400', '清流', '清流县', '中国,福建省,三明市,清流县', '3', 'Qingliu', '0598', '365300');
INSERT INTO `e_r_sys_region` VALUES ('350424', '350400', '宁化', '宁化县', '中国,福建省,三明市,宁化县', '3', 'Ninghua', '0598', '365400');
INSERT INTO `e_r_sys_region` VALUES ('350425', '350400', '大田', '大田县', '中国,福建省,三明市,大田县', '3', 'Datian', '0598', '366100');
INSERT INTO `e_r_sys_region` VALUES ('350426', '350400', '尤溪', '尤溪县', '中国,福建省,三明市,尤溪县', '3', 'Youxi', '0598', '365100');
INSERT INTO `e_r_sys_region` VALUES ('350427', '350400', '沙县', '沙县', '中国,福建省,三明市,沙县', '3', 'Shaxian', '0598', '365500');
INSERT INTO `e_r_sys_region` VALUES ('350428', '350400', '将乐', '将乐县', '中国,福建省,三明市,将乐县', '3', 'Jiangle', '0598', '353300');
INSERT INTO `e_r_sys_region` VALUES ('350429', '350400', '泰宁', '泰宁县', '中国,福建省,三明市,泰宁县', '3', 'Taining', '0598', '354400');
INSERT INTO `e_r_sys_region` VALUES ('350430', '350400', '建宁', '建宁县', '中国,福建省,三明市,建宁县', '3', 'Jianning', '0598', '354500');
INSERT INTO `e_r_sys_region` VALUES ('350481', '350400', '永安', '永安市', '中国,福建省,三明市,永安市', '3', 'Yong\'an', '0598', '366000');
INSERT INTO `e_r_sys_region` VALUES ('350500', '350000', '泉州', '泉州市', '中国,福建省,泉州市', '2', 'Quanzhou', '0595', '362000');
INSERT INTO `e_r_sys_region` VALUES ('350502', '350500', '鲤城', '鲤城区', '中国,福建省,泉州市,鲤城区', '3', 'Licheng', '0595', '362000');
INSERT INTO `e_r_sys_region` VALUES ('350503', '350500', '丰泽', '丰泽区', '中国,福建省,泉州市,丰泽区', '3', 'Fengze', '0595', '362000');
INSERT INTO `e_r_sys_region` VALUES ('350504', '350500', '洛江', '洛江区', '中国,福建省,泉州市,洛江区', '3', 'Luojiang', '0595', '362011');
INSERT INTO `e_r_sys_region` VALUES ('350505', '350500', '泉港', '泉港区', '中国,福建省,泉州市,泉港区', '3', 'Quangang', '0595', '362114');
INSERT INTO `e_r_sys_region` VALUES ('350521', '350500', '惠安', '惠安县', '中国,福建省,泉州市,惠安县', '3', 'Hui\'an', '0595', '362100');
INSERT INTO `e_r_sys_region` VALUES ('350524', '350500', '安溪', '安溪县', '中国,福建省,泉州市,安溪县', '3', 'Anxi', '0595', '362400');
INSERT INTO `e_r_sys_region` VALUES ('350525', '350500', '永春', '永春县', '中国,福建省,泉州市,永春县', '3', 'Yongchun', '0595', '362600');
INSERT INTO `e_r_sys_region` VALUES ('350526', '350500', '德化', '德化县', '中国,福建省,泉州市,德化县', '3', 'Dehua', '0595', '362500');
INSERT INTO `e_r_sys_region` VALUES ('350527', '350500', '金门', '金门县', '中国,福建省,泉州市,金门县', '3', 'Jinmen', '', '');
INSERT INTO `e_r_sys_region` VALUES ('350581', '350500', '石狮', '石狮市', '中国,福建省,泉州市,石狮市', '3', 'Shishi', '0595', '362700');
INSERT INTO `e_r_sys_region` VALUES ('350582', '350500', '晋江', '晋江市', '中国,福建省,泉州市,晋江市', '3', 'Jinjiang', '0595', '362200');
INSERT INTO `e_r_sys_region` VALUES ('350583', '350500', '南安', '南安市', '中国,福建省,泉州市,南安市', '3', 'Nan\'an', '0595', '362300');
INSERT INTO `e_r_sys_region` VALUES ('350600', '350000', '漳州', '漳州市', '中国,福建省,漳州市', '2', 'Zhangzhou', '0596', '363005');
INSERT INTO `e_r_sys_region` VALUES ('350602', '350600', '芗城', '芗城区', '中国,福建省,漳州市,芗城区', '3', 'Xiangcheng', '0596', '363000');
INSERT INTO `e_r_sys_region` VALUES ('350603', '350600', '龙文', '龙文区', '中国,福建省,漳州市,龙文区', '3', 'Longwen', '0596', '363005');
INSERT INTO `e_r_sys_region` VALUES ('350622', '350600', '云霄', '云霄县', '中国,福建省,漳州市,云霄县', '3', 'Yunxiao', '0596', '363300');
INSERT INTO `e_r_sys_region` VALUES ('350623', '350600', '漳浦', '漳浦县', '中国,福建省,漳州市,漳浦县', '3', 'Zhangpu', '0596', '363200');
INSERT INTO `e_r_sys_region` VALUES ('350624', '350600', '诏安', '诏安县', '中国,福建省,漳州市,诏安县', '3', 'Zhao\'an', '0596', '363500');
INSERT INTO `e_r_sys_region` VALUES ('350625', '350600', '长泰', '长泰县', '中国,福建省,漳州市,长泰县', '3', 'Changtai', '0596', '363900');
INSERT INTO `e_r_sys_region` VALUES ('350626', '350600', '东山', '东山县', '中国,福建省,漳州市,东山县', '3', 'Dongshan', '0596', '363400');
INSERT INTO `e_r_sys_region` VALUES ('350627', '350600', '南靖', '南靖县', '中国,福建省,漳州市,南靖县', '3', 'Nanjing', '0596', '363600');
INSERT INTO `e_r_sys_region` VALUES ('350628', '350600', '平和', '平和县', '中国,福建省,漳州市,平和县', '3', 'Pinghe', '0596', '363700');
INSERT INTO `e_r_sys_region` VALUES ('350629', '350600', '华安', '华安县', '中国,福建省,漳州市,华安县', '3', 'Hua\'an', '0596', '363800');
INSERT INTO `e_r_sys_region` VALUES ('350681', '350600', '龙海', '龙海市', '中国,福建省,漳州市,龙海市', '3', 'Longhai', '0596', '363100');
INSERT INTO `e_r_sys_region` VALUES ('350700', '350000', '南平', '南平市', '中国,福建省,南平市', '2', 'Nanping', '0599', '353000');
INSERT INTO `e_r_sys_region` VALUES ('350702', '350700', '延平', '延平区', '中国,福建省,南平市,延平区', '3', 'Yanping', '0600', '353000');
INSERT INTO `e_r_sys_region` VALUES ('350703', '350700', '建阳', '建阳区', '中国,福建省,南平市,建阳区', '3', 'Jianyang', '0599', '354200');
INSERT INTO `e_r_sys_region` VALUES ('350721', '350700', '顺昌', '顺昌县', '中国,福建省,南平市,顺昌县', '3', 'Shunchang', '0605', '353200');
INSERT INTO `e_r_sys_region` VALUES ('350722', '350700', '浦城', '浦城县', '中国,福建省,南平市,浦城县', '3', 'Pucheng', '0606', '353400');
INSERT INTO `e_r_sys_region` VALUES ('350723', '350700', '光泽', '光泽县', '中国,福建省,南平市,光泽县', '3', 'Guangze', '0607', '354100');
INSERT INTO `e_r_sys_region` VALUES ('350724', '350700', '松溪', '松溪县', '中国,福建省,南平市,松溪县', '3', 'Songxi', '0608', '353500');
INSERT INTO `e_r_sys_region` VALUES ('350725', '350700', '政和', '政和县', '中国,福建省,南平市,政和县', '3', 'Zhenghe', '0609', '353600');
INSERT INTO `e_r_sys_region` VALUES ('350781', '350700', '邵武', '邵武市', '中国,福建省,南平市,邵武市', '3', 'Shaowu', '0601', '354000');
INSERT INTO `e_r_sys_region` VALUES ('350782', '350700', '武夷山', '武夷山市', '中国,福建省,南平市,武夷山市', '3', 'Wuyishan', '0602', '354300');
INSERT INTO `e_r_sys_region` VALUES ('350783', '350700', '建瓯', '建瓯市', '中国,福建省,南平市,建瓯市', '3', 'Jianou', '0603', '353100');
INSERT INTO `e_r_sys_region` VALUES ('350800', '350000', '龙岩', '龙岩市', '中国,福建省,龙岩市', '2', 'Longyan', '0597', '364000');
INSERT INTO `e_r_sys_region` VALUES ('350802', '350800', '新罗', '新罗区', '中国,福建省,龙岩市,新罗区', '3', 'Xinluo', '0597', '364000');
INSERT INTO `e_r_sys_region` VALUES ('350821', '350800', '长汀', '长汀县', '中国,福建省,龙岩市,长汀县', '3', 'Changting', '0597', '366300');
INSERT INTO `e_r_sys_region` VALUES ('350822', '350800', '永定', '永定区', '中国,福建省,龙岩市,永定区', '3', 'Yongding', '0597', '364100');
INSERT INTO `e_r_sys_region` VALUES ('350823', '350800', '上杭', '上杭县', '中国,福建省,龙岩市,上杭县', '3', 'Shanghang', '0597', '364200');
INSERT INTO `e_r_sys_region` VALUES ('350824', '350800', '武平', '武平县', '中国,福建省,龙岩市,武平县', '3', 'Wuping', '0597', '364300');
INSERT INTO `e_r_sys_region` VALUES ('350825', '350800', '连城', '连城县', '中国,福建省,龙岩市,连城县', '3', 'Liancheng', '0597', '366200');
INSERT INTO `e_r_sys_region` VALUES ('350881', '350800', '漳平', '漳平市', '中国,福建省,龙岩市,漳平市', '3', 'Zhangping', '0597', '364400');
INSERT INTO `e_r_sys_region` VALUES ('350900', '350000', '宁德', '宁德市', '中国,福建省,宁德市', '2', 'Ningde', '0593', '352100');
INSERT INTO `e_r_sys_region` VALUES ('350902', '350900', '蕉城', '蕉城区', '中国,福建省,宁德市,蕉城区', '3', 'Jiaocheng', '0593', '352100');
INSERT INTO `e_r_sys_region` VALUES ('350921', '350900', '霞浦', '霞浦县', '中国,福建省,宁德市,霞浦县', '3', 'Xiapu', '0593', '355100');
INSERT INTO `e_r_sys_region` VALUES ('350922', '350900', '古田', '古田县', '中国,福建省,宁德市,古田县', '3', 'Gutian', '0593', '352200');
INSERT INTO `e_r_sys_region` VALUES ('350923', '350900', '屏南', '屏南县', '中国,福建省,宁德市,屏南县', '3', 'Pingnan', '0593', '352300');
INSERT INTO `e_r_sys_region` VALUES ('350924', '350900', '寿宁', '寿宁县', '中国,福建省,宁德市,寿宁县', '3', 'Shouning', '0593', '355500');
INSERT INTO `e_r_sys_region` VALUES ('350925', '350900', '周宁', '周宁县', '中国,福建省,宁德市,周宁县', '3', 'Zhouning', '0593', '355400');
INSERT INTO `e_r_sys_region` VALUES ('350926', '350900', '柘荣', '柘荣县', '中国,福建省,宁德市,柘荣县', '3', 'Zherong', '0593', '355300');
INSERT INTO `e_r_sys_region` VALUES ('350981', '350900', '福安', '福安市', '中国,福建省,宁德市,福安市', '3', 'Fu\'an', '0593', '355000');
INSERT INTO `e_r_sys_region` VALUES ('350982', '350900', '福鼎', '福鼎市', '中国,福建省,宁德市,福鼎市', '3', 'Fuding', '0593', '355200');
INSERT INTO `e_r_sys_region` VALUES ('360000', '100000', '江西', '江西省', '中国,江西省', '1', 'Jiangxi', '', '');
INSERT INTO `e_r_sys_region` VALUES ('360100', '360000', '南昌', '南昌市', '中国,江西省,南昌市', '2', 'Nanchang', '0791', '330008');
INSERT INTO `e_r_sys_region` VALUES ('360102', '360100', '东湖', '东湖区', '中国,江西省,南昌市,东湖区', '3', 'Donghu', '0791', '330006');
INSERT INTO `e_r_sys_region` VALUES ('360103', '360100', '西湖', '西湖区', '中国,江西省,南昌市,西湖区', '3', 'Xihu', '0791', '330009');
INSERT INTO `e_r_sys_region` VALUES ('360104', '360100', '青云谱', '青云谱区', '中国,江西省,南昌市,青云谱区', '3', 'Qingyunpu', '0791', '330001');
INSERT INTO `e_r_sys_region` VALUES ('360105', '360100', '湾里', '湾里区', '中国,江西省,南昌市,湾里区', '3', 'Wanli', '0791', '330004');
INSERT INTO `e_r_sys_region` VALUES ('360111', '360100', '青山湖', '青山湖区', '中国,江西省,南昌市,青山湖区', '3', 'Qingshanhu', '0791', '330029');
INSERT INTO `e_r_sys_region` VALUES ('360121', '360100', '南昌', '南昌县', '中国,江西省,南昌市,南昌县', '3', 'Nanchang', '0791', '330200');
INSERT INTO `e_r_sys_region` VALUES ('360122', '360100', '新建', '新建县', '中国,江西省,南昌市,新建县', '3', 'Xinjian', '0791', '330100');
INSERT INTO `e_r_sys_region` VALUES ('360123', '360100', '安义', '安义县', '中国,江西省,南昌市,安义县', '3', 'Anyi', '0791', '330500');
INSERT INTO `e_r_sys_region` VALUES ('360124', '360100', '进贤', '进贤县', '中国,江西省,南昌市,进贤县', '3', 'Jinxian', '0791', '331700');
INSERT INTO `e_r_sys_region` VALUES ('360200', '360000', '景德镇', '景德镇市', '中国,江西省,景德镇市', '2', 'Jingdezhen', '0798', '333000');
INSERT INTO `e_r_sys_region` VALUES ('360202', '360200', '昌江', '昌江区', '中国,江西省,景德镇市,昌江区', '3', 'Changjiang', '0799', '333000');
INSERT INTO `e_r_sys_region` VALUES ('360203', '360200', '珠山', '珠山区', '中国,江西省,景德镇市,珠山区', '3', 'Zhushan', '0800', '333000');
INSERT INTO `e_r_sys_region` VALUES ('360222', '360200', '浮梁', '浮梁县', '中国,江西省,景德镇市,浮梁县', '3', 'Fuliang', '0802', '333400');
INSERT INTO `e_r_sys_region` VALUES ('360281', '360200', '乐平', '乐平市', '中国,江西省,景德镇市,乐平市', '3', 'Leping', '0801', '333300');
INSERT INTO `e_r_sys_region` VALUES ('360300', '360000', '萍乡', '萍乡市', '中国,江西省,萍乡市', '2', 'Pingxiang', '0799', '337000');
INSERT INTO `e_r_sys_region` VALUES ('360302', '360300', '安源', '安源区', '中国,江西省,萍乡市,安源区', '3', 'Anyuan', '0800', '337000');
INSERT INTO `e_r_sys_region` VALUES ('360313', '360300', '湘东', '湘东区', '中国,江西省,萍乡市,湘东区', '3', 'Xiangdong', '0801', '337016');
INSERT INTO `e_r_sys_region` VALUES ('360321', '360300', '莲花', '莲花县', '中国,江西省,萍乡市,莲花县', '3', 'Lianhua', '0802', '337100');
INSERT INTO `e_r_sys_region` VALUES ('360322', '360300', '上栗', '上栗县', '中国,江西省,萍乡市,上栗县', '3', 'Shangli', '0803', '337009');
INSERT INTO `e_r_sys_region` VALUES ('360323', '360300', '芦溪', '芦溪县', '中国,江西省,萍乡市,芦溪县', '3', 'Luxi', '0804', '337053');
INSERT INTO `e_r_sys_region` VALUES ('360400', '360000', '九江', '九江市', '中国,江西省,九江市', '2', 'Jiujiang', '0792', '332000');
INSERT INTO `e_r_sys_region` VALUES ('360402', '360400', '庐山', '庐山区', '中国,江西省,九江市,庐山区', '3', 'Lushan', '0792', '332005');
INSERT INTO `e_r_sys_region` VALUES ('360403', '360400', '浔阳', '浔阳区', '中国,江西省,九江市,浔阳区', '3', 'Xunyang', '0792', '332000');
INSERT INTO `e_r_sys_region` VALUES ('360421', '360400', '九江', '九江县', '中国,江西省,九江市,九江县', '3', 'Jiujiang', '0792', '332100');
INSERT INTO `e_r_sys_region` VALUES ('360423', '360400', '武宁', '武宁县', '中国,江西省,九江市,武宁县', '3', 'Wuning', '0792', '332300');
INSERT INTO `e_r_sys_region` VALUES ('360424', '360400', '修水', '修水县', '中国,江西省,九江市,修水县', '3', 'Xiushui', '0792', '332400');
INSERT INTO `e_r_sys_region` VALUES ('360425', '360400', '永修', '永修县', '中国,江西省,九江市,永修县', '3', 'Yongxiu', '0792', '330300');
INSERT INTO `e_r_sys_region` VALUES ('360426', '360400', '德安', '德安县', '中国,江西省,九江市,德安县', '3', 'De\'an', '0792', '330400');
INSERT INTO `e_r_sys_region` VALUES ('360427', '360400', '星子', '星子县', '中国,江西省,九江市,星子县', '3', 'Xingzi', '0792', '332800');
INSERT INTO `e_r_sys_region` VALUES ('360428', '360400', '都昌', '都昌县', '中国,江西省,九江市,都昌县', '3', 'Duchang', '0792', '332600');
INSERT INTO `e_r_sys_region` VALUES ('360429', '360400', '湖口', '湖口县', '中国,江西省,九江市,湖口县', '3', 'Hukou', '0792', '332500');
INSERT INTO `e_r_sys_region` VALUES ('360430', '360400', '彭泽', '彭泽县', '中国,江西省,九江市,彭泽县', '3', 'Pengze', '0792', '332700');
INSERT INTO `e_r_sys_region` VALUES ('360481', '360400', '瑞昌', '瑞昌市', '中国,江西省,九江市,瑞昌市', '3', 'Ruichang', '0792', '332200');
INSERT INTO `e_r_sys_region` VALUES ('360482', '360400', '共青城', '共青城市', '中国,江西省,九江市,共青城市', '3', 'Gongqingcheng', '0792', '332020');
INSERT INTO `e_r_sys_region` VALUES ('360500', '360000', '新余', '新余市', '中国,江西省,新余市', '2', 'Xinyu', '0790', '338025');
INSERT INTO `e_r_sys_region` VALUES ('360502', '360500', '渝水', '渝水区', '中国,江西省,新余市,渝水区', '3', 'Yushui', '0790', '338025');
INSERT INTO `e_r_sys_region` VALUES ('360521', '360500', '分宜', '分宜县', '中国,江西省,新余市,分宜县', '3', 'Fenyi', '0790', '336600');
INSERT INTO `e_r_sys_region` VALUES ('360600', '360000', '鹰潭', '鹰潭市', '中国,江西省,鹰潭市', '2', 'Yingtan', '0701', '335000');
INSERT INTO `e_r_sys_region` VALUES ('360602', '360600', '月湖', '月湖区', '中国,江西省,鹰潭市,月湖区', '3', 'Yuehu', '0701', '335000');
INSERT INTO `e_r_sys_region` VALUES ('360622', '360600', '余江', '余江县', '中国,江西省,鹰潭市,余江县', '3', 'Yujiang', '0701', '335200');
INSERT INTO `e_r_sys_region` VALUES ('360681', '360600', '贵溪', '贵溪市', '中国,江西省,鹰潭市,贵溪市', '3', 'Guixi', '0701', '335400');
INSERT INTO `e_r_sys_region` VALUES ('360700', '360000', '赣州', '赣州市', '中国,江西省,赣州市', '2', 'Ganzhou', '0797', '341000');
INSERT INTO `e_r_sys_region` VALUES ('360702', '360700', '章贡', '章贡区', '中国,江西省,赣州市,章贡区', '3', 'Zhanggong', '0797', '341000');
INSERT INTO `e_r_sys_region` VALUES ('360703', '360700', '南康', '南康区', '中国,江西省,赣州市,南康区', '3', 'Nankang', '0797', '341400');
INSERT INTO `e_r_sys_region` VALUES ('360721', '360700', '赣县', '赣县', '中国,江西省,赣州市,赣县', '3', 'Ganxian', '0797', '341100');
INSERT INTO `e_r_sys_region` VALUES ('360722', '360700', '信丰', '信丰县', '中国,江西省,赣州市,信丰县', '3', 'Xinfeng', '0797', '341600');
INSERT INTO `e_r_sys_region` VALUES ('360723', '360700', '大余', '大余县', '中国,江西省,赣州市,大余县', '3', 'Dayu', '0797', '341500');
INSERT INTO `e_r_sys_region` VALUES ('360724', '360700', '上犹', '上犹县', '中国,江西省,赣州市,上犹县', '3', 'Shangyou', '0797', '341200');
INSERT INTO `e_r_sys_region` VALUES ('360725', '360700', '崇义', '崇义县', '中国,江西省,赣州市,崇义县', '3', 'Chongyi', '0797', '341300');
INSERT INTO `e_r_sys_region` VALUES ('360726', '360700', '安远', '安远县', '中国,江西省,赣州市,安远县', '3', 'Anyuan', '0797', '342100');
INSERT INTO `e_r_sys_region` VALUES ('360727', '360700', '龙南', '龙南县', '中国,江西省,赣州市,龙南县', '3', 'Longnan', '0797', '341700');
INSERT INTO `e_r_sys_region` VALUES ('360728', '360700', '定南', '定南县', '中国,江西省,赣州市,定南县', '3', 'Dingnan', '0797', '341900');
INSERT INTO `e_r_sys_region` VALUES ('360729', '360700', '全南', '全南县', '中国,江西省,赣州市,全南县', '3', 'Quannan', '0797', '341800');
INSERT INTO `e_r_sys_region` VALUES ('360730', '360700', '宁都', '宁都县', '中国,江西省,赣州市,宁都县', '3', 'Ningdu', '0797', '342800');
INSERT INTO `e_r_sys_region` VALUES ('360731', '360700', '于都', '于都县', '中国,江西省,赣州市,于都县', '3', 'Yudu', '0797', '342300');
INSERT INTO `e_r_sys_region` VALUES ('360732', '360700', '兴国', '兴国县', '中国,江西省,赣州市,兴国县', '3', 'Xingguo', '0797', '342400');
INSERT INTO `e_r_sys_region` VALUES ('360733', '360700', '会昌', '会昌县', '中国,江西省,赣州市,会昌县', '3', 'Huichang', '0797', '342600');
INSERT INTO `e_r_sys_region` VALUES ('360734', '360700', '寻乌', '寻乌县', '中国,江西省,赣州市,寻乌县', '3', 'Xunwu', '0797', '342200');
INSERT INTO `e_r_sys_region` VALUES ('360735', '360700', '石城', '石城县', '中国,江西省,赣州市,石城县', '3', 'Shicheng', '0797', '342700');
INSERT INTO `e_r_sys_region` VALUES ('360781', '360700', '瑞金', '瑞金市', '中国,江西省,赣州市,瑞金市', '3', 'Ruijin', '0797', '342500');
INSERT INTO `e_r_sys_region` VALUES ('360800', '360000', '吉安', '吉安市', '中国,江西省,吉安市', '2', 'Ji\'an', '0796', '343000');
INSERT INTO `e_r_sys_region` VALUES ('360802', '360800', '吉州', '吉州区', '中国,江西省,吉安市,吉州区', '3', 'Jizhou', '0796', '343000');
INSERT INTO `e_r_sys_region` VALUES ('360803', '360800', '青原', '青原区', '中国,江西省,吉安市,青原区', '3', 'Qingyuan', '0796', '343009');
INSERT INTO `e_r_sys_region` VALUES ('360821', '360800', '吉安', '吉安县', '中国,江西省,吉安市,吉安县', '3', 'Ji\'an', '0796', '343100');
INSERT INTO `e_r_sys_region` VALUES ('360822', '360800', '吉水', '吉水县', '中国,江西省,吉安市,吉水县', '3', 'Jishui', '0796', '331600');
INSERT INTO `e_r_sys_region` VALUES ('360823', '360800', '峡江', '峡江县', '中国,江西省,吉安市,峡江县', '3', 'Xiajiang', '0796', '331409');
INSERT INTO `e_r_sys_region` VALUES ('360824', '360800', '新干', '新干县', '中国,江西省,吉安市,新干县', '3', 'Xingan', '0796', '331300');
INSERT INTO `e_r_sys_region` VALUES ('360825', '360800', '永丰', '永丰县', '中国,江西省,吉安市,永丰县', '3', 'Yongfeng', '0796', '331500');
INSERT INTO `e_r_sys_region` VALUES ('360826', '360800', '泰和', '泰和县', '中国,江西省,吉安市,泰和县', '3', 'Taihe', '0796', '343700');
INSERT INTO `e_r_sys_region` VALUES ('360827', '360800', '遂川', '遂川县', '中国,江西省,吉安市,遂川县', '3', 'Suichuan', '0796', '343900');
INSERT INTO `e_r_sys_region` VALUES ('360828', '360800', '万安', '万安县', '中国,江西省,吉安市,万安县', '3', 'Wan\'an', '0796', '343800');
INSERT INTO `e_r_sys_region` VALUES ('360829', '360800', '安福', '安福县', '中国,江西省,吉安市,安福县', '3', 'Anfu', '0796', '343200');
INSERT INTO `e_r_sys_region` VALUES ('360830', '360800', '永新', '永新县', '中国,江西省,吉安市,永新县', '3', 'Yongxin', '0796', '343400');
INSERT INTO `e_r_sys_region` VALUES ('360881', '360800', '井冈山', '井冈山市', '中国,江西省,吉安市,井冈山市', '3', 'Jinggangshan', '0796', '343600');
INSERT INTO `e_r_sys_region` VALUES ('360900', '360000', '宜春', '宜春市', '中国,江西省,宜春市', '2', 'Yichun', '0795', '336000');
INSERT INTO `e_r_sys_region` VALUES ('360902', '360900', '袁州', '袁州区', '中国,江西省,宜春市,袁州区', '3', 'Yuanzhou', '0795', '336000');
INSERT INTO `e_r_sys_region` VALUES ('360921', '360900', '奉新', '奉新县', '中国,江西省,宜春市,奉新县', '3', 'Fengxin', '0795', '330700');
INSERT INTO `e_r_sys_region` VALUES ('360922', '360900', '万载', '万载县', '中国,江西省,宜春市,万载县', '3', 'Wanzai', '0795', '336100');
INSERT INTO `e_r_sys_region` VALUES ('360923', '360900', '上高', '上高县', '中国,江西省,宜春市,上高县', '3', 'Shanggao', '0795', '336400');
INSERT INTO `e_r_sys_region` VALUES ('360924', '360900', '宜丰', '宜丰县', '中国,江西省,宜春市,宜丰县', '3', 'Yifeng', '0795', '336300');
INSERT INTO `e_r_sys_region` VALUES ('360925', '360900', '靖安', '靖安县', '中国,江西省,宜春市,靖安县', '3', 'Jing\'an', '0795', '330600');
INSERT INTO `e_r_sys_region` VALUES ('360926', '360900', '铜鼓', '铜鼓县', '中国,江西省,宜春市,铜鼓县', '3', 'Tonggu', '0795', '336200');
INSERT INTO `e_r_sys_region` VALUES ('360981', '360900', '丰城', '丰城市', '中国,江西省,宜春市,丰城市', '3', 'Fengcheng', '0795', '331100');
INSERT INTO `e_r_sys_region` VALUES ('360982', '360900', '樟树', '樟树市', '中国,江西省,宜春市,樟树市', '3', 'Zhangshu', '0795', '331200');
INSERT INTO `e_r_sys_region` VALUES ('360983', '360900', '高安', '高安市', '中国,江西省,宜春市,高安市', '3', 'Gao\'an', '0795', '330800');
INSERT INTO `e_r_sys_region` VALUES ('361000', '360000', '抚州', '抚州市', '中国,江西省,抚州市', '2', 'Fuzhou', '0794', '344000');
INSERT INTO `e_r_sys_region` VALUES ('361002', '361000', '临川', '临川区', '中国,江西省,抚州市,临川区', '3', 'Linchuan', '0794', '344000');
INSERT INTO `e_r_sys_region` VALUES ('361021', '361000', '南城', '南城县', '中国,江西省,抚州市,南城县', '3', 'Nancheng', '0794', '344700');
INSERT INTO `e_r_sys_region` VALUES ('361022', '361000', '黎川', '黎川县', '中国,江西省,抚州市,黎川县', '3', 'Lichuan', '0794', '344600');
INSERT INTO `e_r_sys_region` VALUES ('361023', '361000', '南丰', '南丰县', '中国,江西省,抚州市,南丰县', '3', 'Nanfeng', '0794', '344500');
INSERT INTO `e_r_sys_region` VALUES ('361024', '361000', '崇仁', '崇仁县', '中国,江西省,抚州市,崇仁县', '3', 'Chongren', '0794', '344200');
INSERT INTO `e_r_sys_region` VALUES ('361025', '361000', '乐安', '乐安县', '中国,江西省,抚州市,乐安县', '3', 'Le\'an', '0794', '344300');
INSERT INTO `e_r_sys_region` VALUES ('361026', '361000', '宜黄', '宜黄县', '中国,江西省,抚州市,宜黄县', '3', 'Yihuang', '0794', '344400');
INSERT INTO `e_r_sys_region` VALUES ('361027', '361000', '金溪', '金溪县', '中国,江西省,抚州市,金溪县', '3', 'Jinxi', '0794', '344800');
INSERT INTO `e_r_sys_region` VALUES ('361028', '361000', '资溪', '资溪县', '中国,江西省,抚州市,资溪县', '3', 'Zixi', '0794', '335300');
INSERT INTO `e_r_sys_region` VALUES ('361029', '361000', '东乡', '东乡县', '中国,江西省,抚州市,东乡县', '3', 'Dongxiang', '0794', '331800');
INSERT INTO `e_r_sys_region` VALUES ('361030', '361000', '广昌', '广昌县', '中国,江西省,抚州市,广昌县', '3', 'Guangchang', '0794', '344900');
INSERT INTO `e_r_sys_region` VALUES ('361100', '360000', '上饶', '上饶市', '中国,江西省,上饶市', '2', 'Shangrao', '0793', '334000');
INSERT INTO `e_r_sys_region` VALUES ('361102', '361100', '信州', '信州区', '中国,江西省,上饶市,信州区', '3', 'Xinzhou', '0793', '334000');
INSERT INTO `e_r_sys_region` VALUES ('361121', '361100', '上饶', '上饶县', '中国,江西省,上饶市,上饶县', '3', 'Shangrao', '0793', '334100');
INSERT INTO `e_r_sys_region` VALUES ('361122', '361100', '广丰', '广丰县', '中国,江西省,上饶市,广丰县', '3', 'Guangfeng', '0793', '334600');
INSERT INTO `e_r_sys_region` VALUES ('361123', '361100', '玉山', '玉山县', '中国,江西省,上饶市,玉山县', '3', 'Yushan', '0793', '334700');
INSERT INTO `e_r_sys_region` VALUES ('361124', '361100', '铅山', '铅山县', '中国,江西省,上饶市,铅山县', '3', 'Yanshan', '0793', '334500');
INSERT INTO `e_r_sys_region` VALUES ('361125', '361100', '横峰', '横峰县', '中国,江西省,上饶市,横峰县', '3', 'Hengfeng', '0793', '334300');
INSERT INTO `e_r_sys_region` VALUES ('361126', '361100', '弋阳', '弋阳县', '中国,江西省,上饶市,弋阳县', '3', 'Yiyang', '0793', '334400');
INSERT INTO `e_r_sys_region` VALUES ('361127', '361100', '余干', '余干县', '中国,江西省,上饶市,余干县', '3', 'Yugan', '0793', '335100');
INSERT INTO `e_r_sys_region` VALUES ('361128', '361100', '鄱阳', '鄱阳县', '中国,江西省,上饶市,鄱阳县', '3', 'Poyang', '0793', '333100');
INSERT INTO `e_r_sys_region` VALUES ('361129', '361100', '万年', '万年县', '中国,江西省,上饶市,万年县', '3', 'Wannian', '0793', '335500');
INSERT INTO `e_r_sys_region` VALUES ('361130', '361100', '婺源', '婺源县', '中国,江西省,上饶市,婺源县', '3', 'Wuyuan', '0793', '333200');
INSERT INTO `e_r_sys_region` VALUES ('361181', '361100', '德兴', '德兴市', '中国,江西省,上饶市,德兴市', '3', 'Dexing', '0793', '334200');
INSERT INTO `e_r_sys_region` VALUES ('370000', '100000', '山东', '山东省', '中国,山东省', '1', 'Shandong', '', '');
INSERT INTO `e_r_sys_region` VALUES ('370100', '370000', '济南', '济南市', '中国,山东省,济南市', '2', 'Jinan', '0531', '250001');
INSERT INTO `e_r_sys_region` VALUES ('370102', '370100', '历下', '历下区', '中国,山东省,济南市,历下区', '3', 'Lixia', '0531', '250014');
INSERT INTO `e_r_sys_region` VALUES ('370103', '370100', '市中区', '市中区', '中国,山东省,济南市,市中区', '3', 'Shizhongqu', '0531', '250001');
INSERT INTO `e_r_sys_region` VALUES ('370104', '370100', '槐荫', '槐荫区', '中国,山东省,济南市,槐荫区', '3', 'Huaiyin', '0531', '250117');
INSERT INTO `e_r_sys_region` VALUES ('370105', '370100', '天桥', '天桥区', '中国,山东省,济南市,天桥区', '3', 'Tianqiao', '0531', '250031');
INSERT INTO `e_r_sys_region` VALUES ('370112', '370100', '历城', '历城区', '中国,山东省,济南市,历城区', '3', 'Licheng', '0531', '250100');
INSERT INTO `e_r_sys_region` VALUES ('370113', '370100', '长清', '长清区', '中国,山东省,济南市,长清区', '3', 'Changqing', '0531', '250300');
INSERT INTO `e_r_sys_region` VALUES ('370124', '370100', '平阴', '平阴县', '中国,山东省,济南市,平阴县', '3', 'Pingyin', '0531', '250400');
INSERT INTO `e_r_sys_region` VALUES ('370125', '370100', '济阳', '济阳县', '中国,山东省,济南市,济阳县', '3', 'Jiyang', '0531', '251400');
INSERT INTO `e_r_sys_region` VALUES ('370126', '370100', '商河', '商河县', '中国,山东省,济南市,商河县', '3', 'Shanghe', '0531', '251600');
INSERT INTO `e_r_sys_region` VALUES ('370181', '370100', '章丘', '章丘市', '中国,山东省,济南市,章丘市', '3', 'Zhangqiu', '0531', '250200');
INSERT INTO `e_r_sys_region` VALUES ('370200', '370000', '青岛', '青岛市', '中国,山东省,青岛市', '2', 'Qingdao', '0532', '266001');
INSERT INTO `e_r_sys_region` VALUES ('370202', '370200', '市南', '市南区', '中国,山东省,青岛市,市南区', '3', 'Shinan', '0532', '266001');
INSERT INTO `e_r_sys_region` VALUES ('370203', '370200', '市北', '市北区', '中国,山东省,青岛市,市北区', '3', 'Shibei', '0532', '266011');
INSERT INTO `e_r_sys_region` VALUES ('370211', '370200', '黄岛', '黄岛区', '中国,山东省,青岛市,黄岛区', '3', 'Huangdao', '0532', '266500');
INSERT INTO `e_r_sys_region` VALUES ('370212', '370200', '崂山', '崂山区', '中国,山东省,青岛市,崂山区', '3', 'Laoshan', '0532', '266100');
INSERT INTO `e_r_sys_region` VALUES ('370213', '370200', '李沧', '李沧区', '中国,山东省,青岛市,李沧区', '3', 'Licang', '0532', '266021');
INSERT INTO `e_r_sys_region` VALUES ('370214', '370200', '城阳', '城阳区', '中国,山东省,青岛市,城阳区', '3', 'Chengyang', '0532', '266041');
INSERT INTO `e_r_sys_region` VALUES ('370281', '370200', '胶州', '胶州市', '中国,山东省,青岛市,胶州市', '3', 'Jiaozhou', '0532', '266300');
INSERT INTO `e_r_sys_region` VALUES ('370282', '370200', '即墨', '即墨市', '中国,山东省,青岛市,即墨市', '3', 'Jimo', '0532', '266200');
INSERT INTO `e_r_sys_region` VALUES ('370283', '370200', '平度', '平度市', '中国,山东省,青岛市,平度市', '3', 'Pingdu', '0532', '266700');
INSERT INTO `e_r_sys_region` VALUES ('370285', '370200', '莱西', '莱西市', '中国,山东省,青岛市,莱西市', '3', 'Laixi', '0532', '266600');
INSERT INTO `e_r_sys_region` VALUES ('370286', '370200', '西海岸', '西海岸新区', '中国,山东省,青岛市,西海岸新区', '3', 'Xihai\'an', '0532', '266500');
INSERT INTO `e_r_sys_region` VALUES ('370300', '370000', '淄博', '淄博市', '中国,山东省,淄博市', '2', 'Zibo', '0533', '255039');
INSERT INTO `e_r_sys_region` VALUES ('370302', '370300', '淄川', '淄川区', '中国,山东省,淄博市,淄川区', '3', 'Zichuan', '0533', '255100');
INSERT INTO `e_r_sys_region` VALUES ('370303', '370300', '张店', '张店区', '中国,山东省,淄博市,张店区', '3', 'Zhangdian', '0533', '255022');
INSERT INTO `e_r_sys_region` VALUES ('370304', '370300', '博山', '博山区', '中国,山东省,淄博市,博山区', '3', 'Boshan', '0533', '255200');
INSERT INTO `e_r_sys_region` VALUES ('370305', '370300', '临淄', '临淄区', '中国,山东省,淄博市,临淄区', '3', 'Linzi', '0533', '255400');
INSERT INTO `e_r_sys_region` VALUES ('370306', '370300', '周村', '周村区', '中国,山东省,淄博市,周村区', '3', 'Zhoucun', '0533', '255300');
INSERT INTO `e_r_sys_region` VALUES ('370321', '370300', '桓台', '桓台县', '中国,山东省,淄博市,桓台县', '3', 'Huantai', '0533', '256400');
INSERT INTO `e_r_sys_region` VALUES ('370322', '370300', '高青', '高青县', '中国,山东省,淄博市,高青县', '3', 'Gaoqing', '0533', '256300');
INSERT INTO `e_r_sys_region` VALUES ('370323', '370300', '沂源', '沂源县', '中国,山东省,淄博市,沂源县', '3', 'Yiyuan', '0533', '256100');
INSERT INTO `e_r_sys_region` VALUES ('370400', '370000', '枣庄', '枣庄市', '中国,山东省,枣庄市', '2', 'Zaozhuang', '0632', '277101');
INSERT INTO `e_r_sys_region` VALUES ('370402', '370400', '市中区', '市中区', '中国,山东省,枣庄市,市中区', '3', 'Shizhongqu', '0632', '277101');
INSERT INTO `e_r_sys_region` VALUES ('370403', '370400', '薛城', '薛城区', '中国,山东省,枣庄市,薛城区', '3', 'Xuecheng', '0632', '277000');
INSERT INTO `e_r_sys_region` VALUES ('370404', '370400', '峄城', '峄城区', '中国,山东省,枣庄市,峄城区', '3', 'Yicheng', '0632', '277300');
INSERT INTO `e_r_sys_region` VALUES ('370405', '370400', '台儿庄', '台儿庄区', '中国,山东省,枣庄市,台儿庄区', '3', 'Taierzhuang', '0632', '277400');
INSERT INTO `e_r_sys_region` VALUES ('370406', '370400', '山亭', '山亭区', '中国,山东省,枣庄市,山亭区', '3', 'Shanting', '0632', '277200');
INSERT INTO `e_r_sys_region` VALUES ('370481', '370400', '滕州', '滕州市', '中国,山东省,枣庄市,滕州市', '3', 'Tengzhou', '0632', '277500');
INSERT INTO `e_r_sys_region` VALUES ('370500', '370000', '东营', '东营市', '中国,山东省,东营市', '2', 'Dongying', '0546', '257093');
INSERT INTO `e_r_sys_region` VALUES ('370502', '370500', '东营', '东营区', '中国,山东省,东营市,东营区', '3', 'Dongying', '0546', '257029');
INSERT INTO `e_r_sys_region` VALUES ('370503', '370500', '河口', '河口区', '中国,山东省,东营市,河口区', '3', 'Hekou', '0546', '257200');
INSERT INTO `e_r_sys_region` VALUES ('370521', '370500', '垦利', '垦利县', '中国,山东省,东营市,垦利县', '3', 'Kenli', '0546', '257500');
INSERT INTO `e_r_sys_region` VALUES ('370522', '370500', '利津', '利津县', '中国,山东省,东营市,利津县', '3', 'Lijin', '0546', '257400');
INSERT INTO `e_r_sys_region` VALUES ('370523', '370500', '广饶', '广饶县', '中国,山东省,东营市,广饶县', '3', 'Guangrao', '0546', '257300');
INSERT INTO `e_r_sys_region` VALUES ('370600', '370000', '烟台', '烟台市', '中国,山东省,烟台市', '2', 'Yantai', '0635', '264010');
INSERT INTO `e_r_sys_region` VALUES ('370602', '370600', '芝罘', '芝罘区', '中国,山东省,烟台市,芝罘区', '3', 'Zhifu', '0635', '264001');
INSERT INTO `e_r_sys_region` VALUES ('370611', '370600', '福山', '福山区', '中国,山东省,烟台市,福山区', '3', 'Fushan', '0635', '265500');
INSERT INTO `e_r_sys_region` VALUES ('370612', '370600', '牟平', '牟平区', '中国,山东省,烟台市,牟平区', '3', 'Muping', '0635', '264100');
INSERT INTO `e_r_sys_region` VALUES ('370613', '370600', '莱山', '莱山区', '中国,山东省,烟台市,莱山区', '3', 'Laishan', '0635', '264600');
INSERT INTO `e_r_sys_region` VALUES ('370634', '370600', '长岛', '长岛县', '中国,山东省,烟台市,长岛县', '3', 'Changdao', '0635', '265800');
INSERT INTO `e_r_sys_region` VALUES ('370681', '370600', '龙口', '龙口市', '中国,山东省,烟台市,龙口市', '3', 'Longkou', '0635', '265700');
INSERT INTO `e_r_sys_region` VALUES ('370682', '370600', '莱阳', '莱阳市', '中国,山东省,烟台市,莱阳市', '3', 'Laiyang', '0635', '265200');
INSERT INTO `e_r_sys_region` VALUES ('370683', '370600', '莱州', '莱州市', '中国,山东省,烟台市,莱州市', '3', 'Laizhou', '0635', '261400');
INSERT INTO `e_r_sys_region` VALUES ('370684', '370600', '蓬莱', '蓬莱市', '中国,山东省,烟台市,蓬莱市', '3', 'Penglai', '0635', '265600');
INSERT INTO `e_r_sys_region` VALUES ('370685', '370600', '招远', '招远市', '中国,山东省,烟台市,招远市', '3', 'Zhaoyuan', '0635', '265400');
INSERT INTO `e_r_sys_region` VALUES ('370686', '370600', '栖霞', '栖霞市', '中国,山东省,烟台市,栖霞市', '3', 'Qixia', '0635', '265300');
INSERT INTO `e_r_sys_region` VALUES ('370687', '370600', '海阳', '海阳市', '中国,山东省,烟台市,海阳市', '3', 'Haiyang', '0635', '265100');
INSERT INTO `e_r_sys_region` VALUES ('370700', '370000', '潍坊', '潍坊市', '中国,山东省,潍坊市', '2', 'Weifang', '0536', '261041');
INSERT INTO `e_r_sys_region` VALUES ('370702', '370700', '潍城', '潍城区', '中国,山东省,潍坊市,潍城区', '3', 'Weicheng', '0536', '261021');
INSERT INTO `e_r_sys_region` VALUES ('370703', '370700', '寒亭', '寒亭区', '中国,山东省,潍坊市,寒亭区', '3', 'Hanting', '0536', '261100');
INSERT INTO `e_r_sys_region` VALUES ('370704', '370700', '坊子', '坊子区', '中国,山东省,潍坊市,坊子区', '3', 'Fangzi', '0536', '261200');
INSERT INTO `e_r_sys_region` VALUES ('370705', '370700', '奎文', '奎文区', '中国,山东省,潍坊市,奎文区', '3', 'Kuiwen', '0536', '261031');
INSERT INTO `e_r_sys_region` VALUES ('370724', '370700', '临朐', '临朐县', '中国,山东省,潍坊市,临朐县', '3', 'Linqu', '0536', '262600');
INSERT INTO `e_r_sys_region` VALUES ('370725', '370700', '昌乐', '昌乐县', '中国,山东省,潍坊市,昌乐县', '3', 'Changle', '0536', '262400');
INSERT INTO `e_r_sys_region` VALUES ('370781', '370700', '青州', '青州市', '中国,山东省,潍坊市,青州市', '3', 'Qingzhou', '0536', '262500');
INSERT INTO `e_r_sys_region` VALUES ('370782', '370700', '诸城', '诸城市', '中国,山东省,潍坊市,诸城市', '3', 'Zhucheng', '0536', '262200');
INSERT INTO `e_r_sys_region` VALUES ('370783', '370700', '寿光', '寿光市', '中国,山东省,潍坊市,寿光市', '3', 'Shouguang', '0536', '262700');
INSERT INTO `e_r_sys_region` VALUES ('370784', '370700', '安丘', '安丘市', '中国,山东省,潍坊市,安丘市', '3', 'Anqiu', '0536', '262100');
INSERT INTO `e_r_sys_region` VALUES ('370785', '370700', '高密', '高密市', '中国,山东省,潍坊市,高密市', '3', 'Gaomi', '0536', '261500');
INSERT INTO `e_r_sys_region` VALUES ('370786', '370700', '昌邑', '昌邑市', '中国,山东省,潍坊市,昌邑市', '3', 'Changyi', '0536', '261300');
INSERT INTO `e_r_sys_region` VALUES ('370800', '370000', '济宁', '济宁市', '中国,山东省,济宁市', '2', 'Jining', '0537', '272119');
INSERT INTO `e_r_sys_region` VALUES ('370811', '370800', '任城', '任城区', '中国,山东省,济宁市,任城区', '3', 'Rencheng', '0537', '272113');
INSERT INTO `e_r_sys_region` VALUES ('370812', '370800', '兖州', '兖州区', '中国,山东省,济宁市,兖州区', '3', 'Yanzhou ', '0537', '272000');
INSERT INTO `e_r_sys_region` VALUES ('370826', '370800', '微山', '微山县', '中国,山东省,济宁市,微山县', '3', 'Weishan', '0537', '277600');
INSERT INTO `e_r_sys_region` VALUES ('370827', '370800', '鱼台', '鱼台县', '中国,山东省,济宁市,鱼台县', '3', 'Yutai', '0537', '272300');
INSERT INTO `e_r_sys_region` VALUES ('370828', '370800', '金乡', '金乡县', '中国,山东省,济宁市,金乡县', '3', 'Jinxiang', '0537', '272200');
INSERT INTO `e_r_sys_region` VALUES ('370829', '370800', '嘉祥', '嘉祥县', '中国,山东省,济宁市,嘉祥县', '3', 'Jiaxiang', '0537', '272400');
INSERT INTO `e_r_sys_region` VALUES ('370830', '370800', '汶上', '汶上县', '中国,山东省,济宁市,汶上县', '3', 'Wenshang', '0537', '272501');
INSERT INTO `e_r_sys_region` VALUES ('370831', '370800', '泗水', '泗水县', '中国,山东省,济宁市,泗水县', '3', 'Sishui', '0537', '273200');
INSERT INTO `e_r_sys_region` VALUES ('370832', '370800', '梁山', '梁山县', '中国,山东省,济宁市,梁山县', '3', 'Liangshan', '0537', '272600');
INSERT INTO `e_r_sys_region` VALUES ('370881', '370800', '曲阜', '曲阜市', '中国,山东省,济宁市,曲阜市', '3', 'Qufu', '0537', '273100');
INSERT INTO `e_r_sys_region` VALUES ('370883', '370800', '邹城', '邹城市', '中国,山东省,济宁市,邹城市', '3', 'Zoucheng', '0537', '273500');
INSERT INTO `e_r_sys_region` VALUES ('370900', '370000', '泰安', '泰安市', '中国,山东省,泰安市', '2', 'Tai\'an', '0538', '271000');
INSERT INTO `e_r_sys_region` VALUES ('370902', '370900', '泰山', '泰山区', '中国,山东省,泰安市,泰山区', '3', 'Taishan', '0538', '271000');
INSERT INTO `e_r_sys_region` VALUES ('370911', '370900', '岱岳', '岱岳区', '中国,山东省,泰安市,岱岳区', '3', 'Daiyue', '0538', '271000');
INSERT INTO `e_r_sys_region` VALUES ('370921', '370900', '宁阳', '宁阳县', '中国,山东省,泰安市,宁阳县', '3', 'Ningyang', '0538', '271400');
INSERT INTO `e_r_sys_region` VALUES ('370923', '370900', '东平', '东平县', '中国,山东省,泰安市,东平县', '3', 'Dongping', '0538', '271500');
INSERT INTO `e_r_sys_region` VALUES ('370982', '370900', '新泰', '新泰市', '中国,山东省,泰安市,新泰市', '3', 'Xintai', '0538', '271200');
INSERT INTO `e_r_sys_region` VALUES ('370983', '370900', '肥城', '肥城市', '中国,山东省,泰安市,肥城市', '3', 'Feicheng', '0538', '271600');
INSERT INTO `e_r_sys_region` VALUES ('371000', '370000', '威海', '威海市', '中国,山东省,威海市', '2', 'Weihai', '0631', '264200');
INSERT INTO `e_r_sys_region` VALUES ('371002', '371000', '环翠', '环翠区', '中国,山东省,威海市,环翠区', '3', 'Huancui', '0631', '264200');
INSERT INTO `e_r_sys_region` VALUES ('371003', '371000', '文登', '文登区', '中国,山东省,威海市,文登区', '3', 'Wendeng', '0631', '266440');
INSERT INTO `e_r_sys_region` VALUES ('371082', '371000', '荣成', '荣成市', '中国,山东省,威海市,荣成市', '3', 'Rongcheng', '0631', '264300');
INSERT INTO `e_r_sys_region` VALUES ('371083', '371000', '乳山', '乳山市', '中国,山东省,威海市,乳山市', '3', 'Rushan', '0631', '264500');
INSERT INTO `e_r_sys_region` VALUES ('371100', '370000', '日照', '日照市', '中国,山东省,日照市', '2', 'Rizhao', '0633', '276800');
INSERT INTO `e_r_sys_region` VALUES ('371102', '371100', '东港', '东港区', '中国,山东省,日照市,东港区', '3', 'Donggang', '0633', '276800');
INSERT INTO `e_r_sys_region` VALUES ('371103', '371100', '岚山', '岚山区', '中国,山东省,日照市,岚山区', '3', 'Lanshan', '0633', '276808');
INSERT INTO `e_r_sys_region` VALUES ('371121', '371100', '五莲', '五莲县', '中国,山东省,日照市,五莲县', '3', 'Wulian', '0633', '262300');
INSERT INTO `e_r_sys_region` VALUES ('371122', '371100', '莒县', '莒县', '中国,山东省,日照市,莒县', '3', 'Juxian', '0633', '276500');
INSERT INTO `e_r_sys_region` VALUES ('371200', '370000', '莱芜', '莱芜市', '中国,山东省,莱芜市', '2', 'Laiwu', '0634', '271100');
INSERT INTO `e_r_sys_region` VALUES ('371202', '371200', '莱城', '莱城区', '中国,山东省,莱芜市,莱城区', '3', 'Laicheng', '0634', '271199');
INSERT INTO `e_r_sys_region` VALUES ('371203', '371200', '钢城', '钢城区', '中国,山东省,莱芜市,钢城区', '3', 'Gangcheng', '0634', '271100');
INSERT INTO `e_r_sys_region` VALUES ('371300', '370000', '临沂', '临沂市', '中国,山东省,临沂市', '2', 'Linyi', '0539', '253000');
INSERT INTO `e_r_sys_region` VALUES ('371302', '371300', '兰山', '兰山区', '中国,山东省,临沂市,兰山区', '3', 'Lanshan', '0539', '276002');
INSERT INTO `e_r_sys_region` VALUES ('371311', '371300', '罗庄', '罗庄区', '中国,山东省,临沂市,罗庄区', '3', 'Luozhuang', '0539', '276022');
INSERT INTO `e_r_sys_region` VALUES ('371312', '371300', '河东', '河东区', '中国,山东省,临沂市,河东区', '3', 'Hedong', '0539', '276034');
INSERT INTO `e_r_sys_region` VALUES ('371321', '371300', '沂南', '沂南县', '中国,山东省,临沂市,沂南县', '3', 'Yinan', '0539', '276300');
INSERT INTO `e_r_sys_region` VALUES ('371322', '371300', '郯城', '郯城县', '中国,山东省,临沂市,郯城县', '3', 'Tancheng', '0539', '276100');
INSERT INTO `e_r_sys_region` VALUES ('371323', '371300', '沂水', '沂水县', '中国,山东省,临沂市,沂水县', '3', 'Yishui', '0539', '276400');
INSERT INTO `e_r_sys_region` VALUES ('371324', '371300', '兰陵', '兰陵县', '中国,山东省,临沂市,兰陵县', '3', 'Lanling', '0539', '277700');
INSERT INTO `e_r_sys_region` VALUES ('371325', '371300', '费县', '费县', '中国,山东省,临沂市,费县', '3', 'Feixian', '0539', '273400');
INSERT INTO `e_r_sys_region` VALUES ('371326', '371300', '平邑', '平邑县', '中国,山东省,临沂市,平邑县', '3', 'Pingyi', '0539', '273300');
INSERT INTO `e_r_sys_region` VALUES ('371327', '371300', '莒南', '莒南县', '中国,山东省,临沂市,莒南县', '3', 'Junan', '0539', '276600');
INSERT INTO `e_r_sys_region` VALUES ('371328', '371300', '蒙阴', '蒙阴县', '中国,山东省,临沂市,蒙阴县', '3', 'Mengyin', '0539', '276200');
INSERT INTO `e_r_sys_region` VALUES ('371329', '371300', '临沭', '临沭县', '中国,山东省,临沂市,临沭县', '3', 'Linshu', '0539', '276700');
INSERT INTO `e_r_sys_region` VALUES ('371400', '370000', '德州', '德州市', '中国,山东省,德州市', '2', 'Dezhou', '0534', '253000');
INSERT INTO `e_r_sys_region` VALUES ('371402', '371400', '德城', '德城区', '中国,山东省,德州市,德城区', '3', 'Decheng', '0534', '253012');
INSERT INTO `e_r_sys_region` VALUES ('371403', '371400', '陵城', '陵城区', '中国,山东省,德州市,陵城区', '3', 'Lingcheng', '0534', '253500');
INSERT INTO `e_r_sys_region` VALUES ('371422', '371400', '宁津', '宁津县', '中国,山东省,德州市,宁津县', '3', 'Ningjin', '0534', '253400');
INSERT INTO `e_r_sys_region` VALUES ('371423', '371400', '庆云', '庆云县', '中国,山东省,德州市,庆云县', '3', 'Qingyun', '0534', '253700');
INSERT INTO `e_r_sys_region` VALUES ('371424', '371400', '临邑', '临邑县', '中国,山东省,德州市,临邑县', '3', 'Linyi', '0534', '251500');
INSERT INTO `e_r_sys_region` VALUES ('371425', '371400', '齐河', '齐河县', '中国,山东省,德州市,齐河县', '3', 'Qihe', '0534', '251100');
INSERT INTO `e_r_sys_region` VALUES ('371426', '371400', '平原', '平原县', '中国,山东省,德州市,平原县', '3', 'Pingyuan', '0534', '253100');
INSERT INTO `e_r_sys_region` VALUES ('371427', '371400', '夏津', '夏津县', '中国,山东省,德州市,夏津县', '3', 'Xiajin', '0534', '253200');
INSERT INTO `e_r_sys_region` VALUES ('371428', '371400', '武城', '武城县', '中国,山东省,德州市,武城县', '3', 'Wucheng', '0534', '253300');
INSERT INTO `e_r_sys_region` VALUES ('371481', '371400', '乐陵', '乐陵市', '中国,山东省,德州市,乐陵市', '3', 'Leling', '0534', '253600');
INSERT INTO `e_r_sys_region` VALUES ('371482', '371400', '禹城', '禹城市', '中国,山东省,德州市,禹城市', '3', 'Yucheng', '0534', '251200');
INSERT INTO `e_r_sys_region` VALUES ('371500', '370000', '聊城', '聊城市', '中国,山东省,聊城市', '2', 'Liaocheng', '0635', '252052');
INSERT INTO `e_r_sys_region` VALUES ('371502', '371500', '东昌府', '东昌府区', '中国,山东省,聊城市,东昌府区', '3', 'Dongchangfu', '0635', '252000');
INSERT INTO `e_r_sys_region` VALUES ('371521', '371500', '阳谷', '阳谷县', '中国,山东省,聊城市,阳谷县', '3', 'Yanggu', '0635', '252300');
INSERT INTO `e_r_sys_region` VALUES ('371522', '371500', '莘县', '莘县', '中国,山东省,聊城市,莘县', '3', 'Shenxian', '0635', '252400');
INSERT INTO `e_r_sys_region` VALUES ('371523', '371500', '茌平', '茌平县', '中国,山东省,聊城市,茌平县', '3', 'Chiping', '0635', '252100');
INSERT INTO `e_r_sys_region` VALUES ('371524', '371500', '东阿', '东阿县', '中国,山东省,聊城市,东阿县', '3', 'Dong\'e', '0635', '252200');
INSERT INTO `e_r_sys_region` VALUES ('371525', '371500', '冠县', '冠县', '中国,山东省,聊城市,冠县', '3', 'Guanxian', '0635', '252500');
INSERT INTO `e_r_sys_region` VALUES ('371526', '371500', '高唐', '高唐县', '中国,山东省,聊城市,高唐县', '3', 'Gaotang', '0635', '252800');
INSERT INTO `e_r_sys_region` VALUES ('371581', '371500', '临清', '临清市', '中国,山东省,聊城市,临清市', '3', 'Linqing', '0635', '252600');
INSERT INTO `e_r_sys_region` VALUES ('371600', '370000', '滨州', '滨州市', '中国,山东省,滨州市', '2', 'Binzhou', '0543', '256619');
INSERT INTO `e_r_sys_region` VALUES ('371602', '371600', '滨城', '滨城区', '中国,山东省,滨州市,滨城区', '3', 'Bincheng', '0543', '256613');
INSERT INTO `e_r_sys_region` VALUES ('371603', '371600', '沾化', '沾化区', '中国,山东省,滨州市,沾化区', '3', 'Zhanhua', '0543', '256800');
INSERT INTO `e_r_sys_region` VALUES ('371621', '371600', '惠民', '惠民县', '中国,山东省,滨州市,惠民县', '3', 'Huimin', '0543', '251700');
INSERT INTO `e_r_sys_region` VALUES ('371622', '371600', '阳信', '阳信县', '中国,山东省,滨州市,阳信县', '3', 'Yangxin', '0543', '251800');
INSERT INTO `e_r_sys_region` VALUES ('371623', '371600', '无棣', '无棣县', '中国,山东省,滨州市,无棣县', '3', 'Wudi', '0543', '251900');
INSERT INTO `e_r_sys_region` VALUES ('371625', '371600', '博兴', '博兴县', '中国,山东省,滨州市,博兴县', '3', 'Boxing', '0543', '256500');
INSERT INTO `e_r_sys_region` VALUES ('371626', '371600', '邹平', '邹平县', '中国,山东省,滨州市,邹平县', '3', 'Zouping', '0543', '256200');
INSERT INTO `e_r_sys_region` VALUES ('371627', '371600', '北海新区', '北海新区', '中国,山东省,滨州市,北海新区', '3', 'Beihaixinqu', '0543', '256200');
INSERT INTO `e_r_sys_region` VALUES ('371700', '370000', '菏泽', '菏泽市', '中国,山东省,菏泽市', '2', 'Heze', '0530', '274020');
INSERT INTO `e_r_sys_region` VALUES ('371702', '371700', '牡丹', '牡丹区', '中国,山东省,菏泽市,牡丹区', '3', 'Mudan', '0530', '274009');
INSERT INTO `e_r_sys_region` VALUES ('371721', '371700', '曹县', '曹县', '中国,山东省,菏泽市,曹县', '3', 'Caoxian', '0530', '274400');
INSERT INTO `e_r_sys_region` VALUES ('371722', '371700', '单县', '单县', '中国,山东省,菏泽市,单县', '3', 'Shanxian', '0530', '273700');
INSERT INTO `e_r_sys_region` VALUES ('371723', '371700', '成武', '成武县', '中国,山东省,菏泽市,成武县', '3', 'Chengwu', '0530', '274200');
INSERT INTO `e_r_sys_region` VALUES ('371724', '371700', '巨野', '巨野县', '中国,山东省,菏泽市,巨野县', '3', 'Juye', '0530', '274900');
INSERT INTO `e_r_sys_region` VALUES ('371725', '371700', '郓城', '郓城县', '中国,山东省,菏泽市,郓城县', '3', 'Yuncheng', '0530', '274700');
INSERT INTO `e_r_sys_region` VALUES ('371726', '371700', '鄄城', '鄄城县', '中国,山东省,菏泽市,鄄城县', '3', 'Juancheng', '0530', '274600');
INSERT INTO `e_r_sys_region` VALUES ('371727', '371700', '定陶', '定陶县', '中国,山东省,菏泽市,定陶县', '3', 'Dingtao', '0530', '274100');
INSERT INTO `e_r_sys_region` VALUES ('371728', '371700', '东明', '东明县', '中国,山东省,菏泽市,东明县', '3', 'Dongming', '0530', '274500');
INSERT INTO `e_r_sys_region` VALUES ('410000', '100000', '河南', '河南省', '中国,河南省', '1', 'Henan', '', '');
INSERT INTO `e_r_sys_region` VALUES ('410100', '410000', '郑州', '郑州市', '中国,河南省,郑州市', '2', 'Zhengzhou', '0371', '450000');
INSERT INTO `e_r_sys_region` VALUES ('410102', '410100', '中原', '中原区', '中国,河南省,郑州市,中原区', '3', 'Zhongyuan', '0371', '450007');
INSERT INTO `e_r_sys_region` VALUES ('410103', '410100', '二七', '二七区', '中国,河南省,郑州市,二七区', '3', 'Erqi', '0371', '450052');
INSERT INTO `e_r_sys_region` VALUES ('410104', '410100', '管城', '管城回族区', '中国,河南省,郑州市,管城回族区', '3', 'Guancheng', '0371', '450000');
INSERT INTO `e_r_sys_region` VALUES ('410105', '410100', '金水', '金水区', '中国,河南省,郑州市,金水区', '3', 'Jinshui', '0371', '450003');
INSERT INTO `e_r_sys_region` VALUES ('410106', '410100', '上街', '上街区', '中国,河南省,郑州市,上街区', '3', 'Shangjie', '0371', '450041');
INSERT INTO `e_r_sys_region` VALUES ('410108', '410100', '惠济', '惠济区', '中国,河南省,郑州市,惠济区', '3', 'Huiji', '0371', '450053');
INSERT INTO `e_r_sys_region` VALUES ('410122', '410100', '中牟', '中牟县', '中国,河南省,郑州市,中牟县', '3', 'Zhongmu', '0371', '451450');
INSERT INTO `e_r_sys_region` VALUES ('410181', '410100', '巩义', '巩义市', '中国,河南省,郑州市,巩义市', '3', 'Gongyi', '0371', '451200');
INSERT INTO `e_r_sys_region` VALUES ('410182', '410100', '荥阳', '荥阳市', '中国,河南省,郑州市,荥阳市', '3', 'Xingyang', '0371', '450100');
INSERT INTO `e_r_sys_region` VALUES ('410183', '410100', '新密', '新密市', '中国,河南省,郑州市,新密市', '3', 'Xinmi', '0371', '452300');
INSERT INTO `e_r_sys_region` VALUES ('410184', '410100', '新郑', '新郑市', '中国,河南省,郑州市,新郑市', '3', 'Xinzheng', '0371', '451100');
INSERT INTO `e_r_sys_region` VALUES ('410185', '410100', '登封', '登封市', '中国,河南省,郑州市,登封市', '3', 'Dengfeng', '0371', '452470');
INSERT INTO `e_r_sys_region` VALUES ('410200', '410000', '开封', '开封市', '中国,河南省,开封市', '2', 'Kaifeng', '0378', '475001');
INSERT INTO `e_r_sys_region` VALUES ('410202', '410200', '龙亭', '龙亭区', '中国,河南省,开封市,龙亭区', '3', 'Longting', '0378', '475100');
INSERT INTO `e_r_sys_region` VALUES ('410203', '410200', '顺河', '顺河回族区', '中国,河南省,开封市,顺河回族区', '3', 'Shunhe', '0378', '475000');
INSERT INTO `e_r_sys_region` VALUES ('410204', '410200', '鼓楼', '鼓楼区', '中国,河南省,开封市,鼓楼区', '3', 'Gulou', '0378', '475000');
INSERT INTO `e_r_sys_region` VALUES ('410205', '410200', '禹王台', '禹王台区', '中国,河南省,开封市,禹王台区', '3', 'Yuwangtai', '0378', '475003');
INSERT INTO `e_r_sys_region` VALUES ('410212', '410200', '祥符', '祥符区', '中国,河南省,开封市,祥符区', '3', 'Xiangfu', '0378', '475100');
INSERT INTO `e_r_sys_region` VALUES ('410221', '410200', '杞县', '杞县', '中国,河南省,开封市,杞县', '3', 'Qixian', '0378', '475200');
INSERT INTO `e_r_sys_region` VALUES ('410222', '410200', '通许', '通许县', '中国,河南省,开封市,通许县', '3', 'Tongxu', '0378', '475400');
INSERT INTO `e_r_sys_region` VALUES ('410223', '410200', '尉氏', '尉氏县', '中国,河南省,开封市,尉氏县', '3', 'Weishi', '0378', '475500');
INSERT INTO `e_r_sys_region` VALUES ('410225', '410200', '兰考', '兰考县', '中国,河南省,开封市,兰考县', '3', 'Lankao', '0378', '475300');
INSERT INTO `e_r_sys_region` VALUES ('410300', '410000', '洛阳', '洛阳市', '中国,河南省,洛阳市', '2', 'Luoyang', '0379', '471000');
INSERT INTO `e_r_sys_region` VALUES ('410302', '410300', '老城', '老城区', '中国,河南省,洛阳市,老城区', '3', 'Laocheng', '0379', '471002');
INSERT INTO `e_r_sys_region` VALUES ('410303', '410300', '西工', '西工区', '中国,河南省,洛阳市,西工区', '3', 'Xigong', '0379', '471000');
INSERT INTO `e_r_sys_region` VALUES ('410304', '410300', '瀍河', '瀍河回族区', '中国,河南省,洛阳市,瀍河回族区', '3', 'Chanhe', '0379', '471002');
INSERT INTO `e_r_sys_region` VALUES ('410305', '410300', '涧西', '涧西区', '中国,河南省,洛阳市,涧西区', '3', 'Jianxi', '0379', '471003');
INSERT INTO `e_r_sys_region` VALUES ('410306', '410300', '吉利', '吉利区', '中国,河南省,洛阳市,吉利区', '3', 'Jili', '0379', '471012');
INSERT INTO `e_r_sys_region` VALUES ('410311', '410300', '洛龙', '洛龙区', '中国,河南省,洛阳市,洛龙区', '3', 'Luolong', '0379', '471000');
INSERT INTO `e_r_sys_region` VALUES ('410322', '410300', '孟津', '孟津县', '中国,河南省,洛阳市,孟津县', '3', 'Mengjin', '0379', '471100');
INSERT INTO `e_r_sys_region` VALUES ('410323', '410300', '新安', '新安县', '中国,河南省,洛阳市,新安县', '3', 'Xin\'an', '0379', '471800');
INSERT INTO `e_r_sys_region` VALUES ('410324', '410300', '栾川', '栾川县', '中国,河南省,洛阳市,栾川县', '3', 'Luanchuan', '0379', '471500');
INSERT INTO `e_r_sys_region` VALUES ('410325', '410300', '嵩县', '嵩县', '中国,河南省,洛阳市,嵩县', '3', 'Songxian', '0379', '471400');
INSERT INTO `e_r_sys_region` VALUES ('410326', '410300', '汝阳', '汝阳县', '中国,河南省,洛阳市,汝阳县', '3', 'Ruyang', '0379', '471200');
INSERT INTO `e_r_sys_region` VALUES ('410327', '410300', '宜阳', '宜阳县', '中国,河南省,洛阳市,宜阳县', '3', 'Yiyang', '0379', '471600');
INSERT INTO `e_r_sys_region` VALUES ('410328', '410300', '洛宁', '洛宁县', '中国,河南省,洛阳市,洛宁县', '3', 'Luoning', '0379', '471700');
INSERT INTO `e_r_sys_region` VALUES ('410329', '410300', '伊川', '伊川县', '中国,河南省,洛阳市,伊川县', '3', 'Yichuan', '0379', '471300');
INSERT INTO `e_r_sys_region` VALUES ('410381', '410300', '偃师', '偃师市', '中国,河南省,洛阳市,偃师市', '3', 'Yanshi', '0379', '471900');
INSERT INTO `e_r_sys_region` VALUES ('410400', '410000', '平顶山', '平顶山市', '中国,河南省,平顶山市', '2', 'Pingdingshan', '0375', '467000');
INSERT INTO `e_r_sys_region` VALUES ('410402', '410400', '新华', '新华区', '中国,河南省,平顶山市,新华区', '3', 'Xinhua', '0375', '467002');
INSERT INTO `e_r_sys_region` VALUES ('410403', '410400', '卫东', '卫东区', '中国,河南省,平顶山市,卫东区', '3', 'Weidong', '0375', '467021');
INSERT INTO `e_r_sys_region` VALUES ('410404', '410400', '石龙', '石龙区', '中国,河南省,平顶山市,石龙区', '3', 'Shilong', '0375', '467045');
INSERT INTO `e_r_sys_region` VALUES ('410411', '410400', '湛河', '湛河区', '中国,河南省,平顶山市,湛河区', '3', 'Zhanhe', '0375', '467000');
INSERT INTO `e_r_sys_region` VALUES ('410421', '410400', '宝丰', '宝丰县', '中国,河南省,平顶山市,宝丰县', '3', 'Baofeng', '0375', '467400');
INSERT INTO `e_r_sys_region` VALUES ('410422', '410400', '叶县', '叶县', '中国,河南省,平顶山市,叶县', '3', 'Yexian', '0375', '467200');
INSERT INTO `e_r_sys_region` VALUES ('410423', '410400', '鲁山', '鲁山县', '中国,河南省,平顶山市,鲁山县', '3', 'Lushan', '0375', '467300');
INSERT INTO `e_r_sys_region` VALUES ('410425', '410400', '郏县', '郏县', '中国,河南省,平顶山市,郏县', '3', 'Jiaxian', '0375', '467100');
INSERT INTO `e_r_sys_region` VALUES ('410481', '410400', '舞钢', '舞钢市', '中国,河南省,平顶山市,舞钢市', '3', 'Wugang', '0375', '462500');
INSERT INTO `e_r_sys_region` VALUES ('410482', '410400', '汝州', '汝州市', '中国,河南省,平顶山市,汝州市', '3', 'Ruzhou', '0375', '467500');
INSERT INTO `e_r_sys_region` VALUES ('410500', '410000', '安阳', '安阳市', '中国,河南省,安阳市', '2', 'Anyang', '0372', '455000');
INSERT INTO `e_r_sys_region` VALUES ('410502', '410500', '文峰', '文峰区', '中国,河南省,安阳市,文峰区', '3', 'Wenfeng', '0372', '455000');
INSERT INTO `e_r_sys_region` VALUES ('410503', '410500', '北关', '北关区', '中国,河南省,安阳市,北关区', '3', 'Beiguan', '0372', '455001');
INSERT INTO `e_r_sys_region` VALUES ('410505', '410500', '殷都', '殷都区', '中国,河南省,安阳市,殷都区', '3', 'Yindu', '0372', '455004');
INSERT INTO `e_r_sys_region` VALUES ('410506', '410500', '龙安', '龙安区', '中国,河南省,安阳市,龙安区', '3', 'Long\'an', '0372', '455001');
INSERT INTO `e_r_sys_region` VALUES ('410522', '410500', '安阳', '安阳县', '中国,河南省,安阳市,安阳县', '3', 'Anyang', '0372', '455000');
INSERT INTO `e_r_sys_region` VALUES ('410523', '410500', '汤阴', '汤阴县', '中国,河南省,安阳市,汤阴县', '3', 'Tangyin', '0372', '456150');
INSERT INTO `e_r_sys_region` VALUES ('410526', '410500', '滑县', '滑县', '中国,河南省,安阳市,滑县', '3', 'Huaxian', '0372', '456400');
INSERT INTO `e_r_sys_region` VALUES ('410527', '410500', '内黄', '内黄县', '中国,河南省,安阳市,内黄县', '3', 'Neihuang', '0372', '456350');
INSERT INTO `e_r_sys_region` VALUES ('410581', '410500', '林州', '林州市', '中国,河南省,安阳市,林州市', '3', 'Linzhou', '0372', '456550');
INSERT INTO `e_r_sys_region` VALUES ('410600', '410000', '鹤壁', '鹤壁市', '中国,河南省,鹤壁市', '2', 'Hebi', '0392', '458030');
INSERT INTO `e_r_sys_region` VALUES ('410602', '410600', '鹤山', '鹤山区', '中国,河南省,鹤壁市,鹤山区', '3', 'Heshan', '0392', '458010');
INSERT INTO `e_r_sys_region` VALUES ('410603', '410600', '山城', '山城区', '中国,河南省,鹤壁市,山城区', '3', 'Shancheng', '0392', '458000');
INSERT INTO `e_r_sys_region` VALUES ('410611', '410600', '淇滨', '淇滨区', '中国,河南省,鹤壁市,淇滨区', '3', 'Qibin', '0392', '458000');
INSERT INTO `e_r_sys_region` VALUES ('410621', '410600', '浚县', '浚县', '中国,河南省,鹤壁市,浚县', '3', 'Xunxian', '0392', '456250');
INSERT INTO `e_r_sys_region` VALUES ('410622', '410600', '淇县', '淇县', '中国,河南省,鹤壁市,淇县', '3', 'Qixian', '0392', '456750');
INSERT INTO `e_r_sys_region` VALUES ('410700', '410000', '新乡', '新乡市', '中国,河南省,新乡市', '2', 'Xinxiang', '0373', '453000');
INSERT INTO `e_r_sys_region` VALUES ('410702', '410700', '红旗', '红旗区', '中国,河南省,新乡市,红旗区', '3', 'Hongqi', '0373', '453000');
INSERT INTO `e_r_sys_region` VALUES ('410703', '410700', '卫滨', '卫滨区', '中国,河南省,新乡市,卫滨区', '3', 'Weibin', '0373', '453000');
INSERT INTO `e_r_sys_region` VALUES ('410704', '410700', '凤泉', '凤泉区', '中国,河南省,新乡市,凤泉区', '3', 'Fengquan', '0373', '453011');
INSERT INTO `e_r_sys_region` VALUES ('410711', '410700', '牧野', '牧野区', '中国,河南省,新乡市,牧野区', '3', 'Muye', '0373', '453002');
INSERT INTO `e_r_sys_region` VALUES ('410721', '410700', '新乡', '新乡县', '中国,河南省,新乡市,新乡县', '3', 'Xinxiang', '0373', '453700');
INSERT INTO `e_r_sys_region` VALUES ('410724', '410700', '获嘉', '获嘉县', '中国,河南省,新乡市,获嘉县', '3', 'Huojia', '0373', '453800');
INSERT INTO `e_r_sys_region` VALUES ('410725', '410700', '原阳', '原阳县', '中国,河南省,新乡市,原阳县', '3', 'Yuanyang', '0373', '453500');
INSERT INTO `e_r_sys_region` VALUES ('410726', '410700', '延津', '延津县', '中国,河南省,新乡市,延津县', '3', 'Yanjin', '0373', '453200');
INSERT INTO `e_r_sys_region` VALUES ('410727', '410700', '封丘', '封丘县', '中国,河南省,新乡市,封丘县', '3', 'Fengqiu', '0373', '453300');
INSERT INTO `e_r_sys_region` VALUES ('410728', '410700', '长垣', '长垣县', '中国,河南省,新乡市,长垣县', '3', 'Changyuan', '0373', '453400');
INSERT INTO `e_r_sys_region` VALUES ('410781', '410700', '卫辉', '卫辉市', '中国,河南省,新乡市,卫辉市', '3', 'Weihui', '0373', '453100');
INSERT INTO `e_r_sys_region` VALUES ('410782', '410700', '辉县', '辉县市', '中国,河南省,新乡市,辉县市', '3', 'Huixian', '0373', '453600');
INSERT INTO `e_r_sys_region` VALUES ('410800', '410000', '焦作', '焦作市', '中国,河南省,焦作市', '2', 'Jiaozuo', '0391', '454002');
INSERT INTO `e_r_sys_region` VALUES ('410802', '410800', '解放', '解放区', '中国,河南省,焦作市,解放区', '3', 'Jiefang', '0391', '454000');
INSERT INTO `e_r_sys_region` VALUES ('410803', '410800', '中站', '中站区', '中国,河南省,焦作市,中站区', '3', 'Zhongzhan', '0391', '454191');
INSERT INTO `e_r_sys_region` VALUES ('410804', '410800', '马村', '马村区', '中国,河南省,焦作市,马村区', '3', 'Macun', '0391', '454171');
INSERT INTO `e_r_sys_region` VALUES ('410811', '410800', '山阳', '山阳区', '中国,河南省,焦作市,山阳区', '3', 'Shanyang', '0391', '454002');
INSERT INTO `e_r_sys_region` VALUES ('410821', '410800', '修武', '修武县', '中国,河南省,焦作市,修武县', '3', 'Xiuwu', '0391', '454350');
INSERT INTO `e_r_sys_region` VALUES ('410822', '410800', '博爱', '博爱县', '中国,河南省,焦作市,博爱县', '3', 'Boai', '0391', '454450');
INSERT INTO `e_r_sys_region` VALUES ('410823', '410800', '武陟', '武陟县', '中国,河南省,焦作市,武陟县', '3', 'Wuzhi', '0391', '454950');
INSERT INTO `e_r_sys_region` VALUES ('410825', '410800', '温县', '温县', '中国,河南省,焦作市,温县', '3', 'Wenxian', '0391', '454850');
INSERT INTO `e_r_sys_region` VALUES ('410882', '410800', '沁阳', '沁阳市', '中国,河南省,焦作市,沁阳市', '3', 'Qinyang', '0391', '454550');
INSERT INTO `e_r_sys_region` VALUES ('410883', '410800', '孟州', '孟州市', '中国,河南省,焦作市,孟州市', '3', 'Mengzhou', '0391', '454750');
INSERT INTO `e_r_sys_region` VALUES ('410900', '410000', '濮阳', '濮阳市', '中国,河南省,濮阳市', '2', 'Puyang', '0393', '457000');
INSERT INTO `e_r_sys_region` VALUES ('410902', '410900', '华龙', '华龙区', '中国,河南省,濮阳市,华龙区', '3', 'Hualong', '0393', '457001');
INSERT INTO `e_r_sys_region` VALUES ('410922', '410900', '清丰', '清丰县', '中国,河南省,濮阳市,清丰县', '3', 'Qingfeng', '0393', '457300');
INSERT INTO `e_r_sys_region` VALUES ('410923', '410900', '南乐', '南乐县', '中国,河南省,濮阳市,南乐县', '3', 'Nanle', '0393', '457400');
INSERT INTO `e_r_sys_region` VALUES ('410926', '410900', '范县', '范县', '中国,河南省,濮阳市,范县', '3', 'Fanxian', '0393', '457500');
INSERT INTO `e_r_sys_region` VALUES ('410927', '410900', '台前', '台前县', '中国,河南省,濮阳市,台前县', '3', 'Taiqian', '0393', '457600');
INSERT INTO `e_r_sys_region` VALUES ('410928', '410900', '濮阳', '濮阳县', '中国,河南省,濮阳市,濮阳县', '3', 'Puyang', '0393', '457100');
INSERT INTO `e_r_sys_region` VALUES ('411000', '410000', '许昌', '许昌市', '中国,河南省,许昌市', '2', 'Xuchang', '0374', '461000');
INSERT INTO `e_r_sys_region` VALUES ('411002', '411000', '魏都', '魏都区', '中国,河南省,许昌市,魏都区', '3', 'Weidu', '0374', '461000');
INSERT INTO `e_r_sys_region` VALUES ('411023', '411000', '许昌', '许昌县', '中国,河南省,许昌市,许昌县', '3', 'Xuchang', '0374', '461100');
INSERT INTO `e_r_sys_region` VALUES ('411024', '411000', '鄢陵', '鄢陵县', '中国,河南省,许昌市,鄢陵县', '3', 'Yanling', '0374', '461200');
INSERT INTO `e_r_sys_region` VALUES ('411025', '411000', '襄城', '襄城县', '中国,河南省,许昌市,襄城县', '3', 'Xiangcheng', '0374', '461700');
INSERT INTO `e_r_sys_region` VALUES ('411081', '411000', '禹州', '禹州市', '中国,河南省,许昌市,禹州市', '3', 'Yuzhou', '0374', '461670');
INSERT INTO `e_r_sys_region` VALUES ('411082', '411000', '长葛', '长葛市', '中国,河南省,许昌市,长葛市', '3', 'Changge', '0374', '461500');
INSERT INTO `e_r_sys_region` VALUES ('411100', '410000', '漯河', '漯河市', '中国,河南省,漯河市', '2', 'Luohe', '0395', '462000');
INSERT INTO `e_r_sys_region` VALUES ('411102', '411100', '源汇', '源汇区', '中国,河南省,漯河市,源汇区', '3', 'Yuanhui', '0395', '462000');
INSERT INTO `e_r_sys_region` VALUES ('411103', '411100', '郾城', '郾城区', '中国,河南省,漯河市,郾城区', '3', 'Yancheng', '0395', '462300');
INSERT INTO `e_r_sys_region` VALUES ('411104', '411100', '召陵', '召陵区', '中国,河南省,漯河市,召陵区', '3', 'Zhaoling', '0395', '462300');
INSERT INTO `e_r_sys_region` VALUES ('411121', '411100', '舞阳', '舞阳县', '中国,河南省,漯河市,舞阳县', '3', 'Wuyang', '0395', '462400');
INSERT INTO `e_r_sys_region` VALUES ('411122', '411100', '临颍', '临颍县', '中国,河南省,漯河市,临颍县', '3', 'Linying', '0395', '462600');
INSERT INTO `e_r_sys_region` VALUES ('411200', '410000', '三门峡', '三门峡市', '中国,河南省,三门峡市', '2', 'Sanmenxia', '0398', '472000');
INSERT INTO `e_r_sys_region` VALUES ('411202', '411200', '湖滨', '湖滨区', '中国,河南省,三门峡市,湖滨区', '3', 'Hubin', '0398', '472000');
INSERT INTO `e_r_sys_region` VALUES ('411221', '411200', '渑池', '渑池县', '中国,河南省,三门峡市,渑池县', '3', 'Mianchi', '0398', '472400');
INSERT INTO `e_r_sys_region` VALUES ('411222', '411200', '陕县', '陕县', '中国,河南省,三门峡市,陕县', '3', 'Shanxian', '0398', '472100');
INSERT INTO `e_r_sys_region` VALUES ('411224', '411200', '卢氏', '卢氏县', '中国,河南省,三门峡市,卢氏县', '3', 'Lushi', '0398', '472200');
INSERT INTO `e_r_sys_region` VALUES ('411281', '411200', '义马', '义马市', '中国,河南省,三门峡市,义马市', '3', 'Yima', '0398', '472300');
INSERT INTO `e_r_sys_region` VALUES ('411282', '411200', '灵宝', '灵宝市', '中国,河南省,三门峡市,灵宝市', '3', 'Lingbao', '0398', '472500');
INSERT INTO `e_r_sys_region` VALUES ('411300', '410000', '南阳', '南阳市', '中国,河南省,南阳市', '2', 'Nanyang', '0377', '473002');
INSERT INTO `e_r_sys_region` VALUES ('411302', '411300', '宛城', '宛城区', '中国,河南省,南阳市,宛城区', '3', 'Wancheng', '0377', '473001');
INSERT INTO `e_r_sys_region` VALUES ('411303', '411300', '卧龙', '卧龙区', '中国,河南省,南阳市,卧龙区', '3', 'Wolong', '0377', '473003');
INSERT INTO `e_r_sys_region` VALUES ('411321', '411300', '南召', '南召县', '中国,河南省,南阳市,南召县', '3', 'Nanzhao', '0377', '474650');
INSERT INTO `e_r_sys_region` VALUES ('411322', '411300', '方城', '方城县', '中国,河南省,南阳市,方城县', '3', 'Fangcheng', '0377', '473200');
INSERT INTO `e_r_sys_region` VALUES ('411323', '411300', '西峡', '西峡县', '中国,河南省,南阳市,西峡县', '3', 'Xixia', '0377', '474550');
INSERT INTO `e_r_sys_region` VALUES ('411324', '411300', '镇平', '镇平县', '中国,河南省,南阳市,镇平县', '3', 'Zhenping', '0377', '474250');
INSERT INTO `e_r_sys_region` VALUES ('411325', '411300', '内乡', '内乡县', '中国,河南省,南阳市,内乡县', '3', 'Neixiang', '0377', '474350');
INSERT INTO `e_r_sys_region` VALUES ('411326', '411300', '淅川', '淅川县', '中国,河南省,南阳市,淅川县', '3', 'Xichuan', '0377', '474450');
INSERT INTO `e_r_sys_region` VALUES ('411327', '411300', '社旗', '社旗县', '中国,河南省,南阳市,社旗县', '3', 'Sheqi', '0377', '473300');
INSERT INTO `e_r_sys_region` VALUES ('411328', '411300', '唐河', '唐河县', '中国,河南省,南阳市,唐河县', '3', 'Tanghe', '0377', '473400');
INSERT INTO `e_r_sys_region` VALUES ('411329', '411300', '新野', '新野县', '中国,河南省,南阳市,新野县', '3', 'Xinye', '0377', '473500');
INSERT INTO `e_r_sys_region` VALUES ('411330', '411300', '桐柏', '桐柏县', '中国,河南省,南阳市,桐柏县', '3', 'Tongbai', '0377', '474750');
INSERT INTO `e_r_sys_region` VALUES ('411381', '411300', '邓州', '邓州市', '中国,河南省,南阳市,邓州市', '3', 'Dengzhou', '0377', '474150');
INSERT INTO `e_r_sys_region` VALUES ('411400', '410000', '商丘', '商丘市', '中国,河南省,商丘市', '2', 'Shangqiu', '0370', '476000');
INSERT INTO `e_r_sys_region` VALUES ('411402', '411400', '梁园', '梁园区', '中国,河南省,商丘市,梁园区', '3', 'Liangyuan', '0370', '476000');
INSERT INTO `e_r_sys_region` VALUES ('411403', '411400', '睢阳', '睢阳区', '中国,河南省,商丘市,睢阳区', '3', 'Suiyang', '0370', '476100');
INSERT INTO `e_r_sys_region` VALUES ('411421', '411400', '民权', '民权县', '中国,河南省,商丘市,民权县', '3', 'Minquan', '0370', '476800');
INSERT INTO `e_r_sys_region` VALUES ('411422', '411400', '睢县', '睢县', '中国,河南省,商丘市,睢县', '3', 'Suixian', '0370', '476900');
INSERT INTO `e_r_sys_region` VALUES ('411423', '411400', '宁陵', '宁陵县', '中国,河南省,商丘市,宁陵县', '3', 'Ningling', '0370', '476700');
INSERT INTO `e_r_sys_region` VALUES ('411424', '411400', '柘城', '柘城县', '中国,河南省,商丘市,柘城县', '3', 'Zhecheng', '0370', '476200');
INSERT INTO `e_r_sys_region` VALUES ('411425', '411400', '虞城', '虞城县', '中国,河南省,商丘市,虞城县', '3', 'Yucheng', '0370', '476300');
INSERT INTO `e_r_sys_region` VALUES ('411426', '411400', '夏邑', '夏邑县', '中国,河南省,商丘市,夏邑县', '3', 'Xiayi', '0370', '476400');
INSERT INTO `e_r_sys_region` VALUES ('411481', '411400', '永城', '永城市', '中国,河南省,商丘市,永城市', '3', 'Yongcheng', '0370', '476600');
INSERT INTO `e_r_sys_region` VALUES ('411500', '410000', '信阳', '信阳市', '中国,河南省,信阳市', '2', 'Xinyang', '0376', '464000');
INSERT INTO `e_r_sys_region` VALUES ('411502', '411500', '浉河', '浉河区', '中国,河南省,信阳市,浉河区', '3', 'Shihe', '0376', '464000');
INSERT INTO `e_r_sys_region` VALUES ('411503', '411500', '平桥', '平桥区', '中国,河南省,信阳市,平桥区', '3', 'Pingqiao', '0376', '464100');
INSERT INTO `e_r_sys_region` VALUES ('411521', '411500', '罗山', '罗山县', '中国,河南省,信阳市,罗山县', '3', 'Luoshan', '0376', '464200');
INSERT INTO `e_r_sys_region` VALUES ('411522', '411500', '光山', '光山县', '中国,河南省,信阳市,光山县', '3', 'Guangshan', '0376', '465450');
INSERT INTO `e_r_sys_region` VALUES ('411523', '411500', '新县', '新县', '中国,河南省,信阳市,新县', '3', 'Xinxian', '0376', '465550');
INSERT INTO `e_r_sys_region` VALUES ('411524', '411500', '商城', '商城县', '中国,河南省,信阳市,商城县', '3', 'Shangcheng', '0376', '465350');
INSERT INTO `e_r_sys_region` VALUES ('411525', '411500', '固始', '固始县', '中国,河南省,信阳市,固始县', '3', 'Gushi', '0376', '465250');
INSERT INTO `e_r_sys_region` VALUES ('411526', '411500', '潢川', '潢川县', '中国,河南省,信阳市,潢川县', '3', 'Huangchuan', '0376', '465150');
INSERT INTO `e_r_sys_region` VALUES ('411527', '411500', '淮滨', '淮滨县', '中国,河南省,信阳市,淮滨县', '3', 'Huaibin', '0376', '464400');
INSERT INTO `e_r_sys_region` VALUES ('411528', '411500', '息县', '息县', '中国,河南省,信阳市,息县', '3', 'Xixian', '0376', '464300');
INSERT INTO `e_r_sys_region` VALUES ('411600', '410000', '周口', '周口市', '中国,河南省,周口市', '2', 'Zhoukou', '0394', '466000');
INSERT INTO `e_r_sys_region` VALUES ('411602', '411600', '川汇', '川汇区', '中国,河南省,周口市,川汇区', '3', 'Chuanhui', '0394', '466000');
INSERT INTO `e_r_sys_region` VALUES ('411621', '411600', '扶沟', '扶沟县', '中国,河南省,周口市,扶沟县', '3', 'Fugou', '0394', '461300');
INSERT INTO `e_r_sys_region` VALUES ('411622', '411600', '西华', '西华县', '中国,河南省,周口市,西华县', '3', 'Xihua', '0394', '466600');
INSERT INTO `e_r_sys_region` VALUES ('411623', '411600', '商水', '商水县', '中国,河南省,周口市,商水县', '3', 'Shangshui', '0394', '466100');
INSERT INTO `e_r_sys_region` VALUES ('411624', '411600', '沈丘', '沈丘县', '中国,河南省,周口市,沈丘县', '3', 'Shenqiu', '0394', '466300');
INSERT INTO `e_r_sys_region` VALUES ('411625', '411600', '郸城', '郸城县', '中国,河南省,周口市,郸城县', '3', 'Dancheng', '0394', '477150');
INSERT INTO `e_r_sys_region` VALUES ('411626', '411600', '淮阳', '淮阳县', '中国,河南省,周口市,淮阳县', '3', 'Huaiyang', '0394', '466700');
INSERT INTO `e_r_sys_region` VALUES ('411627', '411600', '太康', '太康县', '中国,河南省,周口市,太康县', '3', 'Taikang', '0394', '461400');
INSERT INTO `e_r_sys_region` VALUES ('411628', '411600', '鹿邑', '鹿邑县', '中国,河南省,周口市,鹿邑县', '3', 'Luyi', '0394', '477200');
INSERT INTO `e_r_sys_region` VALUES ('411681', '411600', '项城', '项城市', '中国,河南省,周口市,项城市', '3', 'Xiangcheng', '0394', '466200');
INSERT INTO `e_r_sys_region` VALUES ('411700', '410000', '驻马店', '驻马店市', '中国,河南省,驻马店市', '2', 'Zhumadian', '0396', '463000');
INSERT INTO `e_r_sys_region` VALUES ('411702', '411700', '驿城', '驿城区', '中国,河南省,驻马店市,驿城区', '3', 'Yicheng', '0396', '463000');
INSERT INTO `e_r_sys_region` VALUES ('411721', '411700', '西平', '西平县', '中国,河南省,驻马店市,西平县', '3', 'Xiping', '0396', '463900');
INSERT INTO `e_r_sys_region` VALUES ('411722', '411700', '上蔡', '上蔡县', '中国,河南省,驻马店市,上蔡县', '3', 'Shangcai', '0396', '463800');
INSERT INTO `e_r_sys_region` VALUES ('411723', '411700', '平舆', '平舆县', '中国,河南省,驻马店市,平舆县', '3', 'Pingyu', '0396', '463400');
INSERT INTO `e_r_sys_region` VALUES ('411724', '411700', '正阳', '正阳县', '中国,河南省,驻马店市,正阳县', '3', 'Zhengyang', '0396', '463600');
INSERT INTO `e_r_sys_region` VALUES ('411725', '411700', '确山', '确山县', '中国,河南省,驻马店市,确山县', '3', 'Queshan', '0396', '463200');
INSERT INTO `e_r_sys_region` VALUES ('411726', '411700', '泌阳', '泌阳县', '中国,河南省,驻马店市,泌阳县', '3', 'Biyang', '0396', '463700');
INSERT INTO `e_r_sys_region` VALUES ('411727', '411700', '汝南', '汝南县', '中国,河南省,驻马店市,汝南县', '3', 'Runan', '0396', '463300');
INSERT INTO `e_r_sys_region` VALUES ('411728', '411700', '遂平', '遂平县', '中国,河南省,驻马店市,遂平县', '3', 'Suiping', '0396', '463100');
INSERT INTO `e_r_sys_region` VALUES ('411729', '411700', '新蔡', '新蔡县', '中国,河南省,驻马店市,新蔡县', '3', 'Xincai', '0396', '463500');
INSERT INTO `e_r_sys_region` VALUES ('419000', '410000', ' ', '直辖县级', '中国,河南省,直辖县级', '2', '', '', '');
INSERT INTO `e_r_sys_region` VALUES ('419001', '419000', '济源', '济源市', '中国,河南省,直辖县级,济源市', '3', 'Jiyuan', '0391', '454650');
INSERT INTO `e_r_sys_region` VALUES ('420000', '100000', '湖北', '湖北省', '中国,湖北省', '1', 'Hubei', '', '');
INSERT INTO `e_r_sys_region` VALUES ('420100', '420000', '武汉', '武汉市', '中国,湖北省,武汉市', '2', 'Wuhan', '', '430014');
INSERT INTO `e_r_sys_region` VALUES ('420102', '420100', '江岸', '江岸区', '中国,湖北省,武汉市,江岸区', '3', 'Jiang\'an', '027', '430014');
INSERT INTO `e_r_sys_region` VALUES ('420103', '420100', '江汉', '江汉区', '中国,湖北省,武汉市,江汉区', '3', 'Jianghan', '027', '430021');
INSERT INTO `e_r_sys_region` VALUES ('420104', '420100', '硚口', '硚口区', '中国,湖北省,武汉市,硚口区', '3', 'Qiaokou', '027', '430033');
INSERT INTO `e_r_sys_region` VALUES ('420105', '420100', '汉阳', '汉阳区', '中国,湖北省,武汉市,汉阳区', '3', 'Hanyang', '027', '430050');
INSERT INTO `e_r_sys_region` VALUES ('420106', '420100', '武昌', '武昌区', '中国,湖北省,武汉市,武昌区', '3', 'Wuchang', '027', '430061');
INSERT INTO `e_r_sys_region` VALUES ('420107', '420100', '青山', '青山区', '中国,湖北省,武汉市,青山区', '3', 'Qingshan', '027', '430080');
INSERT INTO `e_r_sys_region` VALUES ('420111', '420100', '洪山', '洪山区', '中国,湖北省,武汉市,洪山区', '3', 'Hongshan', '027', '430070');
INSERT INTO `e_r_sys_region` VALUES ('420112', '420100', '东西湖', '东西湖区', '中国,湖北省,武汉市,东西湖区', '3', 'Dongxihu', '027', '430040');
INSERT INTO `e_r_sys_region` VALUES ('420113', '420100', '汉南', '汉南区', '中国,湖北省,武汉市,汉南区', '3', 'Hannan', '027', '430090');
INSERT INTO `e_r_sys_region` VALUES ('420114', '420100', '蔡甸', '蔡甸区', '中国,湖北省,武汉市,蔡甸区', '3', 'Caidian', '027', '430100');
INSERT INTO `e_r_sys_region` VALUES ('420115', '420100', '江夏', '江夏区', '中国,湖北省,武汉市,江夏区', '3', 'Jiangxia', '027', '430200');
INSERT INTO `e_r_sys_region` VALUES ('420116', '420100', '黄陂', '黄陂区', '中国,湖北省,武汉市,黄陂区', '3', 'Huangpi', '027', '432200');
INSERT INTO `e_r_sys_region` VALUES ('420117', '420100', '新洲', '新洲区', '中国,湖北省,武汉市,新洲区', '3', 'Xinzhou', '027', '431400');
INSERT INTO `e_r_sys_region` VALUES ('420200', '420000', '黄石', '黄石市', '中国,湖北省,黄石市', '2', 'Huangshi', '0714', '435003');
INSERT INTO `e_r_sys_region` VALUES ('420202', '420200', '黄石港', '黄石港区', '中国,湖北省,黄石市,黄石港区', '3', 'Huangshigang', '0714', '435000');
INSERT INTO `e_r_sys_region` VALUES ('420203', '420200', '西塞山', '西塞山区', '中国,湖北省,黄石市,西塞山区', '3', 'Xisaishan', '0714', '435001');
INSERT INTO `e_r_sys_region` VALUES ('420204', '420200', '下陆', '下陆区', '中国,湖北省,黄石市,下陆区', '3', 'Xialu', '0714', '435005');
INSERT INTO `e_r_sys_region` VALUES ('420205', '420200', '铁山', '铁山区', '中国,湖北省,黄石市,铁山区', '3', 'Tieshan', '0714', '435006');
INSERT INTO `e_r_sys_region` VALUES ('420222', '420200', '阳新', '阳新县', '中国,湖北省,黄石市,阳新县', '3', 'Yangxin', '0714', '435200');
INSERT INTO `e_r_sys_region` VALUES ('420281', '420200', '大冶', '大冶市', '中国,湖北省,黄石市,大冶市', '3', 'Daye', '0714', '435100');
INSERT INTO `e_r_sys_region` VALUES ('420300', '420000', '十堰', '十堰市', '中国,湖北省,十堰市', '2', 'Shiyan', '0719', '442000');
INSERT INTO `e_r_sys_region` VALUES ('420302', '420300', '茅箭', '茅箭区', '中国,湖北省,十堰市,茅箭区', '3', 'Maojian', '0719', '442012');
INSERT INTO `e_r_sys_region` VALUES ('420303', '420300', '张湾', '张湾区', '中国,湖北省,十堰市,张湾区', '3', 'Zhangwan', '0719', '442001');
INSERT INTO `e_r_sys_region` VALUES ('420304', '420300', '郧阳', '郧阳区', '中国,湖北省,十堰市,郧阳区', '3', 'Yunyang', '0719', '442500');
INSERT INTO `e_r_sys_region` VALUES ('420322', '420300', '郧西', '郧西县', '中国,湖北省,十堰市,郧西县', '3', 'Yunxi', '0719', '442600');
INSERT INTO `e_r_sys_region` VALUES ('420323', '420300', '竹山', '竹山县', '中国,湖北省,十堰市,竹山县', '3', 'Zhushan', '0719', '442200');
INSERT INTO `e_r_sys_region` VALUES ('420324', '420300', '竹溪', '竹溪县', '中国,湖北省,十堰市,竹溪县', '3', 'Zhuxi', '0719', '442300');
INSERT INTO `e_r_sys_region` VALUES ('420325', '420300', '房县', '房县', '中国,湖北省,十堰市,房县', '3', 'Fangxian', '0719', '442100');
INSERT INTO `e_r_sys_region` VALUES ('420381', '420300', '丹江口', '丹江口市', '中国,湖北省,十堰市,丹江口市', '3', 'Danjiangkou', '0719', '442700');
INSERT INTO `e_r_sys_region` VALUES ('420500', '420000', '宜昌', '宜昌市', '中国,湖北省,宜昌市', '2', 'Yichang', '0717', '443000');
INSERT INTO `e_r_sys_region` VALUES ('420502', '420500', '西陵', '西陵区', '中国,湖北省,宜昌市,西陵区', '3', 'Xiling', '0717', '443000');
INSERT INTO `e_r_sys_region` VALUES ('420503', '420500', '伍家岗', '伍家岗区', '中国,湖北省,宜昌市,伍家岗区', '3', 'Wujiagang', '0717', '443001');
INSERT INTO `e_r_sys_region` VALUES ('420504', '420500', '点军', '点军区', '中国,湖北省,宜昌市,点军区', '3', 'Dianjun', '0717', '443006');
INSERT INTO `e_r_sys_region` VALUES ('420505', '420500', '猇亭', '猇亭区', '中国,湖北省,宜昌市,猇亭区', '3', 'Xiaoting', '0717', '443007');
INSERT INTO `e_r_sys_region` VALUES ('420506', '420500', '夷陵', '夷陵区', '中国,湖北省,宜昌市,夷陵区', '3', 'Yiling', '0717', '443100');
INSERT INTO `e_r_sys_region` VALUES ('420525', '420500', '远安', '远安县', '中国,湖北省,宜昌市,远安县', '3', 'Yuan\'an', '0717', '444200');
INSERT INTO `e_r_sys_region` VALUES ('420526', '420500', '兴山', '兴山县', '中国,湖北省,宜昌市,兴山县', '3', 'Xingshan', '0717', '443711');
INSERT INTO `e_r_sys_region` VALUES ('420527', '420500', '秭归', '秭归县', '中国,湖北省,宜昌市,秭归县', '3', 'Zigui', '0717', '443600');
INSERT INTO `e_r_sys_region` VALUES ('420528', '420500', '长阳', '长阳土家族自治县', '中国,湖北省,宜昌市,长阳土家族自治县', '3', 'Changyang', '0717', '443500');
INSERT INTO `e_r_sys_region` VALUES ('420529', '420500', '五峰', '五峰土家族自治县', '中国,湖北省,宜昌市,五峰土家族自治县', '3', 'Wufeng', '0717', '443413');
INSERT INTO `e_r_sys_region` VALUES ('420581', '420500', '宜都', '宜都市', '中国,湖北省,宜昌市,宜都市', '3', 'Yidu', '0717', '443300');
INSERT INTO `e_r_sys_region` VALUES ('420582', '420500', '当阳', '当阳市', '中国,湖北省,宜昌市,当阳市', '3', 'Dangyang', '0717', '444100');
INSERT INTO `e_r_sys_region` VALUES ('420583', '420500', '枝江', '枝江市', '中国,湖北省,宜昌市,枝江市', '3', 'Zhijiang', '0717', '443200');
INSERT INTO `e_r_sys_region` VALUES ('420600', '420000', '襄阳', '襄阳市', '中国,湖北省,襄阳市', '2', 'Xiangyang', '0710', '441021');
INSERT INTO `e_r_sys_region` VALUES ('420602', '420600', '襄城', '襄城区', '中国,湖北省,襄阳市,襄城区', '3', 'Xiangcheng', '0710', '441021');
INSERT INTO `e_r_sys_region` VALUES ('420606', '420600', '樊城', '樊城区', '中国,湖北省,襄阳市,樊城区', '3', 'Fancheng', '0710', '441001');
INSERT INTO `e_r_sys_region` VALUES ('420607', '420600', '襄州', '襄州区', '中国,湖北省,襄阳市,襄州区', '3', 'Xiangzhou', '0710', '441100');
INSERT INTO `e_r_sys_region` VALUES ('420624', '420600', '南漳', '南漳县', '中国,湖北省,襄阳市,南漳县', '3', 'Nanzhang', '0710', '441500');
INSERT INTO `e_r_sys_region` VALUES ('420625', '420600', '谷城', '谷城县', '中国,湖北省,襄阳市,谷城县', '3', 'Gucheng', '0710', '441700');
INSERT INTO `e_r_sys_region` VALUES ('420626', '420600', '保康', '保康县', '中国,湖北省,襄阳市,保康县', '3', 'Baokang', '0710', '441600');
INSERT INTO `e_r_sys_region` VALUES ('420682', '420600', '老河口', '老河口市', '中国,湖北省,襄阳市,老河口市', '3', 'Laohekou', '0710', '441800');
INSERT INTO `e_r_sys_region` VALUES ('420683', '420600', '枣阳', '枣阳市', '中国,湖北省,襄阳市,枣阳市', '3', 'Zaoyang', '0710', '441200');
INSERT INTO `e_r_sys_region` VALUES ('420684', '420600', '宜城', '宜城市', '中国,湖北省,襄阳市,宜城市', '3', 'Yicheng', '0710', '441400');
INSERT INTO `e_r_sys_region` VALUES ('420700', '420000', '鄂州', '鄂州市', '中国,湖北省,鄂州市', '2', 'Ezhou', '0711', '436000');
INSERT INTO `e_r_sys_region` VALUES ('420702', '420700', '梁子湖', '梁子湖区', '中国,湖北省,鄂州市,梁子湖区', '3', 'Liangzihu', '0711', '436064');
INSERT INTO `e_r_sys_region` VALUES ('420703', '420700', '华容', '华容区', '中国,湖北省,鄂州市,华容区', '3', 'Huarong', '0711', '436030');
INSERT INTO `e_r_sys_region` VALUES ('420704', '420700', '鄂城', '鄂城区', '中国,湖北省,鄂州市,鄂城区', '3', 'Echeng', '0711', '436000');
INSERT INTO `e_r_sys_region` VALUES ('420800', '420000', '荆门', '荆门市', '中国,湖北省,荆门市', '2', 'Jingmen', '0724', '448000');
INSERT INTO `e_r_sys_region` VALUES ('420802', '420800', '东宝', '东宝区', '中国,湖北省,荆门市,东宝区', '3', 'Dongbao', '0724', '448004');
INSERT INTO `e_r_sys_region` VALUES ('420804', '420800', '掇刀', '掇刀区', '中国,湖北省,荆门市,掇刀区', '3', 'Duodao', '0724', '448124');
INSERT INTO `e_r_sys_region` VALUES ('420821', '420800', '京山', '京山县', '中国,湖北省,荆门市,京山县', '3', 'Jingshan', '0724', '431800');
INSERT INTO `e_r_sys_region` VALUES ('420822', '420800', '沙洋', '沙洋县', '中国,湖北省,荆门市,沙洋县', '3', 'Shayang', '0724', '448200');
INSERT INTO `e_r_sys_region` VALUES ('420881', '420800', '钟祥', '钟祥市', '中国,湖北省,荆门市,钟祥市', '3', 'Zhongxiang', '0724', '431900');
INSERT INTO `e_r_sys_region` VALUES ('420900', '420000', '孝感', '孝感市', '中国,湖北省,孝感市', '2', 'Xiaogan', '0712', '432100');
INSERT INTO `e_r_sys_region` VALUES ('420902', '420900', '孝南', '孝南区', '中国,湖北省,孝感市,孝南区', '3', 'Xiaonan', '0712', '432100');
INSERT INTO `e_r_sys_region` VALUES ('420921', '420900', '孝昌', '孝昌县', '中国,湖北省,孝感市,孝昌县', '3', 'Xiaochang', '0712', '432900');
INSERT INTO `e_r_sys_region` VALUES ('420922', '420900', '大悟', '大悟县', '中国,湖北省,孝感市,大悟县', '3', 'Dawu', '0712', '432800');
INSERT INTO `e_r_sys_region` VALUES ('420923', '420900', '云梦', '云梦县', '中国,湖北省,孝感市,云梦县', '3', 'Yunmeng', '0712', '432500');
INSERT INTO `e_r_sys_region` VALUES ('420981', '420900', '应城', '应城市', '中国,湖北省,孝感市,应城市', '3', 'Yingcheng', '0712', '432400');
INSERT INTO `e_r_sys_region` VALUES ('420982', '420900', '安陆', '安陆市', '中国,湖北省,孝感市,安陆市', '3', 'Anlu', '0712', '432600');
INSERT INTO `e_r_sys_region` VALUES ('420984', '420900', '汉川', '汉川市', '中国,湖北省,孝感市,汉川市', '3', 'Hanchuan', '0712', '432300');
INSERT INTO `e_r_sys_region` VALUES ('421000', '420000', '荆州', '荆州市', '中国,湖北省,荆州市', '2', 'Jingzhou', '0716', '434000');
INSERT INTO `e_r_sys_region` VALUES ('421002', '421000', '沙市', '沙市区', '中国,湖北省,荆州市,沙市区', '3', 'Shashi', '0716', '434000');
INSERT INTO `e_r_sys_region` VALUES ('421003', '421000', '荆州', '荆州区', '中国,湖北省,荆州市,荆州区', '3', 'Jingzhou', '0716', '434020');
INSERT INTO `e_r_sys_region` VALUES ('421022', '421000', '公安', '公安县', '中国,湖北省,荆州市,公安县', '3', 'Gong\'an', '0716', '434300');
INSERT INTO `e_r_sys_region` VALUES ('421023', '421000', '监利', '监利县', '中国,湖北省,荆州市,监利县', '3', 'Jianli', '0716', '433300');
INSERT INTO `e_r_sys_region` VALUES ('421024', '421000', '江陵', '江陵县', '中国,湖北省,荆州市,江陵县', '3', 'Jiangling', '0716', '434101');
INSERT INTO `e_r_sys_region` VALUES ('421081', '421000', '石首', '石首市', '中国,湖北省,荆州市,石首市', '3', 'Shishou', '0716', '434400');
INSERT INTO `e_r_sys_region` VALUES ('421083', '421000', '洪湖', '洪湖市', '中国,湖北省,荆州市,洪湖市', '3', 'Honghu', '0716', '433200');
INSERT INTO `e_r_sys_region` VALUES ('421087', '421000', '松滋', '松滋市', '中国,湖北省,荆州市,松滋市', '3', 'Songzi', '0716', '434200');
INSERT INTO `e_r_sys_region` VALUES ('421100', '420000', '黄冈', '黄冈市', '中国,湖北省,黄冈市', '2', 'Huanggang', '0713', '438000');
INSERT INTO `e_r_sys_region` VALUES ('421102', '421100', '黄州', '黄州区', '中国,湖北省,黄冈市,黄州区', '3', 'Huangzhou', '0713', '438000');
INSERT INTO `e_r_sys_region` VALUES ('421121', '421100', '团风', '团风县', '中国,湖北省,黄冈市,团风县', '3', 'Tuanfeng', '0713', '438800');
INSERT INTO `e_r_sys_region` VALUES ('421122', '421100', '红安', '红安县', '中国,湖北省,黄冈市,红安县', '3', 'Hong\'an', '0713', '438401');
INSERT INTO `e_r_sys_region` VALUES ('421123', '421100', '罗田', '罗田县', '中国,湖北省,黄冈市,罗田县', '3', 'Luotian', '0713', '438600');
INSERT INTO `e_r_sys_region` VALUES ('421124', '421100', '英山', '英山县', '中国,湖北省,黄冈市,英山县', '3', 'Yingshan', '0713', '438700');
INSERT INTO `e_r_sys_region` VALUES ('421125', '421100', '浠水', '浠水县', '中国,湖北省,黄冈市,浠水县', '3', 'Xishui', '0713', '438200');
INSERT INTO `e_r_sys_region` VALUES ('421126', '421100', '蕲春', '蕲春县', '中国,湖北省,黄冈市,蕲春县', '3', 'Qichun', '0713', '435300');
INSERT INTO `e_r_sys_region` VALUES ('421127', '421100', '黄梅', '黄梅县', '中国,湖北省,黄冈市,黄梅县', '3', 'Huangmei', '0713', '435500');
INSERT INTO `e_r_sys_region` VALUES ('421181', '421100', '麻城', '麻城市', '中国,湖北省,黄冈市,麻城市', '3', 'Macheng', '0713', '438300');
INSERT INTO `e_r_sys_region` VALUES ('421182', '421100', '武穴', '武穴市', '中国,湖北省,黄冈市,武穴市', '3', 'Wuxue', '0713', '435400');
INSERT INTO `e_r_sys_region` VALUES ('421200', '420000', '咸宁', '咸宁市', '中国,湖北省,咸宁市', '2', 'Xianning', '0715', '437000');
INSERT INTO `e_r_sys_region` VALUES ('421202', '421200', '咸安', '咸安区', '中国,湖北省,咸宁市,咸安区', '3', 'Xian\'an', '0715', '437000');
INSERT INTO `e_r_sys_region` VALUES ('421221', '421200', '嘉鱼', '嘉鱼县', '中国,湖北省,咸宁市,嘉鱼县', '3', 'Jiayu', '0715', '437200');
INSERT INTO `e_r_sys_region` VALUES ('421222', '421200', '通城', '通城县', '中国,湖北省,咸宁市,通城县', '3', 'Tongcheng', '0715', '437400');
INSERT INTO `e_r_sys_region` VALUES ('421223', '421200', '崇阳', '崇阳县', '中国,湖北省,咸宁市,崇阳县', '3', 'Chongyang', '0715', '437500');
INSERT INTO `e_r_sys_region` VALUES ('421224', '421200', '通山', '通山县', '中国,湖北省,咸宁市,通山县', '3', 'Tongshan', '0715', '437600');
INSERT INTO `e_r_sys_region` VALUES ('421281', '421200', '赤壁', '赤壁市', '中国,湖北省,咸宁市,赤壁市', '3', 'Chibi', '0715', '437300');
INSERT INTO `e_r_sys_region` VALUES ('421300', '420000', '随州', '随州市', '中国,湖北省,随州市', '2', 'Suizhou', '0722', '441300');
INSERT INTO `e_r_sys_region` VALUES ('421303', '421300', '曾都', '曾都区', '中国,湖北省,随州市,曾都区', '3', 'Zengdu', '0722', '441300');
INSERT INTO `e_r_sys_region` VALUES ('421321', '421300', '随县', '随县', '中国,湖北省,随州市,随县', '3', 'Suixian', '0722', '441309');
INSERT INTO `e_r_sys_region` VALUES ('421381', '421300', '广水', '广水市', '中国,湖北省,随州市,广水市', '3', 'Guangshui', '0722', '432700');
INSERT INTO `e_r_sys_region` VALUES ('422800', '420000', '恩施', '恩施土家族苗族自治州', '中国,湖北省,恩施土家族苗族自治州', '2', 'Enshi', '0718', '445000');
INSERT INTO `e_r_sys_region` VALUES ('422801', '422800', '恩施', '恩施市', '中国,湖北省,恩施土家族苗族自治州,恩施市', '3', 'Enshi', '0718', '445000');
INSERT INTO `e_r_sys_region` VALUES ('422802', '422800', '利川', '利川市', '中国,湖北省,恩施土家族苗族自治州,利川市', '3', 'Lichuan', '0718', '445400');
INSERT INTO `e_r_sys_region` VALUES ('422822', '422800', '建始', '建始县', '中国,湖北省,恩施土家族苗族自治州,建始县', '3', 'Jianshi', '0718', '445300');
INSERT INTO `e_r_sys_region` VALUES ('422823', '422800', '巴东', '巴东县', '中国,湖北省,恩施土家族苗族自治州,巴东县', '3', 'Badong', '0718', '444300');
INSERT INTO `e_r_sys_region` VALUES ('422825', '422800', '宣恩', '宣恩县', '中国,湖北省,恩施土家族苗族自治州,宣恩县', '3', 'Xuanen', '0718', '445500');
INSERT INTO `e_r_sys_region` VALUES ('422826', '422800', '咸丰', '咸丰县', '中国,湖北省,恩施土家族苗族自治州,咸丰县', '3', 'Xianfeng', '0718', '445600');
INSERT INTO `e_r_sys_region` VALUES ('422827', '422800', '来凤', '来凤县', '中国,湖北省,恩施土家族苗族自治州,来凤县', '3', 'Laifeng', '0718', '445700');
INSERT INTO `e_r_sys_region` VALUES ('422828', '422800', '鹤峰', '鹤峰县', '中国,湖北省,恩施土家族苗族自治州,鹤峰县', '3', 'Hefeng', '0718', '445800');
INSERT INTO `e_r_sys_region` VALUES ('429000', '420000', ' ', '直辖县级', '中国,湖北省,直辖县级', '2', '', '', '');
INSERT INTO `e_r_sys_region` VALUES ('429004', '429000', '仙桃', '仙桃市', '中国,湖北省,直辖县级,仙桃市', '3', 'Xiantao', '0728', '433000');
INSERT INTO `e_r_sys_region` VALUES ('429005', '429000', '潜江', '潜江市', '中国,湖北省,直辖县级,潜江市', '3', 'Qianjiang', '0728', '433100');
INSERT INTO `e_r_sys_region` VALUES ('429006', '429000', '天门', '天门市', '中国,湖北省,直辖县级,天门市', '3', 'Tianmen', '0728', '431700');
INSERT INTO `e_r_sys_region` VALUES ('429021', '429000', '神农架', '神农架林区', '中国,湖北省,直辖县级,神农架林区', '3', 'Shennongjia', '0719', '442400');
INSERT INTO `e_r_sys_region` VALUES ('430000', '100000', '湖南', '湖南省', '中国,湖南省', '1', 'Hunan', '', '');
INSERT INTO `e_r_sys_region` VALUES ('430100', '430000', '长沙', '长沙市', '中国,湖南省,长沙市', '2', 'Changsha', '0731', '410005');
INSERT INTO `e_r_sys_region` VALUES ('430102', '430100', '芙蓉', '芙蓉区', '中国,湖南省,长沙市,芙蓉区', '3', 'Furong', '0731', '410011');
INSERT INTO `e_r_sys_region` VALUES ('430103', '430100', '天心', '天心区', '中国,湖南省,长沙市,天心区', '3', 'Tianxin', '0731', '410004');
INSERT INTO `e_r_sys_region` VALUES ('430104', '430100', '岳麓', '岳麓区', '中国,湖南省,长沙市,岳麓区', '3', 'Yuelu', '0731', '410013');
INSERT INTO `e_r_sys_region` VALUES ('430105', '430100', '开福', '开福区', '中国,湖南省,长沙市,开福区', '3', 'Kaifu', '0731', '410008');
INSERT INTO `e_r_sys_region` VALUES ('430111', '430100', '雨花', '雨花区', '中国,湖南省,长沙市,雨花区', '3', 'Yuhua', '0731', '410011');
INSERT INTO `e_r_sys_region` VALUES ('430112', '430100', '望城', '望城区', '中国,湖南省,长沙市,望城区', '3', 'Wangcheng', '0731', '410200');
INSERT INTO `e_r_sys_region` VALUES ('430121', '430100', '长沙', '长沙县', '中国,湖南省,长沙市,长沙县', '3', 'Changsha', '0731', '410100');
INSERT INTO `e_r_sys_region` VALUES ('430124', '430100', '宁乡', '宁乡县', '中国,湖南省,长沙市,宁乡县', '3', 'Ningxiang', '0731', '410600');
INSERT INTO `e_r_sys_region` VALUES ('430181', '430100', '浏阳', '浏阳市', '中国,湖南省,长沙市,浏阳市', '3', 'Liuyang', '0731', '410300');
INSERT INTO `e_r_sys_region` VALUES ('430200', '430000', '株洲', '株洲市', '中国,湖南省,株洲市', '2', 'Zhuzhou', '0731', '412000');
INSERT INTO `e_r_sys_region` VALUES ('430202', '430200', '荷塘', '荷塘区', '中国,湖南省,株洲市,荷塘区', '3', 'Hetang', '0731', '412000');
INSERT INTO `e_r_sys_region` VALUES ('430203', '430200', '芦淞', '芦淞区', '中国,湖南省,株洲市,芦淞区', '3', 'Lusong', '0731', '412000');
INSERT INTO `e_r_sys_region` VALUES ('430204', '430200', '石峰', '石峰区', '中国,湖南省,株洲市,石峰区', '3', 'Shifeng', '0731', '412005');
INSERT INTO `e_r_sys_region` VALUES ('430211', '430200', '天元', '天元区', '中国,湖南省,株洲市,天元区', '3', 'Tianyuan', '0731', '412007');
INSERT INTO `e_r_sys_region` VALUES ('430221', '430200', '株洲', '株洲县', '中国,湖南省,株洲市,株洲县', '3', 'Zhuzhou', '0731', '412100');
INSERT INTO `e_r_sys_region` VALUES ('430223', '430200', '攸县', '攸县', '中国,湖南省,株洲市,攸县', '3', 'Youxian', '0731', '412300');
INSERT INTO `e_r_sys_region` VALUES ('430224', '430200', '茶陵', '茶陵县', '中国,湖南省,株洲市,茶陵县', '3', 'Chaling', '0731', '412400');
INSERT INTO `e_r_sys_region` VALUES ('430225', '430200', '炎陵', '炎陵县', '中国,湖南省,株洲市,炎陵县', '3', 'Yanling', '0731', '412500');
INSERT INTO `e_r_sys_region` VALUES ('430281', '430200', '醴陵', '醴陵市', '中国,湖南省,株洲市,醴陵市', '3', 'Liling', '0731', '412200');
INSERT INTO `e_r_sys_region` VALUES ('430300', '430000', '湘潭', '湘潭市', '中国,湖南省,湘潭市', '2', 'Xiangtan', '0731', '411100');
INSERT INTO `e_r_sys_region` VALUES ('430302', '430300', '雨湖', '雨湖区', '中国,湖南省,湘潭市,雨湖区', '3', 'Yuhu', '0731', '411100');
INSERT INTO `e_r_sys_region` VALUES ('430304', '430300', '岳塘', '岳塘区', '中国,湖南省,湘潭市,岳塘区', '3', 'Yuetang', '0731', '411101');
INSERT INTO `e_r_sys_region` VALUES ('430321', '430300', '湘潭', '湘潭县', '中国,湖南省,湘潭市,湘潭县', '3', 'Xiangtan', '0731', '411228');
INSERT INTO `e_r_sys_region` VALUES ('430381', '430300', '湘乡', '湘乡市', '中国,湖南省,湘潭市,湘乡市', '3', 'Xiangxiang', '0731', '411400');
INSERT INTO `e_r_sys_region` VALUES ('430382', '430300', '韶山', '韶山市', '中国,湖南省,湘潭市,韶山市', '3', 'Shaoshan', '0731', '411300');
INSERT INTO `e_r_sys_region` VALUES ('430400', '430000', '衡阳', '衡阳市', '中国,湖南省,衡阳市', '2', 'Hengyang', '0734', '421001');
INSERT INTO `e_r_sys_region` VALUES ('430405', '430400', '珠晖', '珠晖区', '中国,湖南省,衡阳市,珠晖区', '3', 'Zhuhui', '0734', '421002');
INSERT INTO `e_r_sys_region` VALUES ('430406', '430400', '雁峰', '雁峰区', '中国,湖南省,衡阳市,雁峰区', '3', 'Yanfeng', '0734', '421001');
INSERT INTO `e_r_sys_region` VALUES ('430407', '430400', '石鼓', '石鼓区', '中国,湖南省,衡阳市,石鼓区', '3', 'Shigu', '0734', '421005');
INSERT INTO `e_r_sys_region` VALUES ('430408', '430400', '蒸湘', '蒸湘区', '中国,湖南省,衡阳市,蒸湘区', '3', 'Zhengxiang', '0734', '421001');
INSERT INTO `e_r_sys_region` VALUES ('430412', '430400', '南岳', '南岳区', '中国,湖南省,衡阳市,南岳区', '3', 'Nanyue', '0734', '421900');
INSERT INTO `e_r_sys_region` VALUES ('430421', '430400', '衡阳', '衡阳县', '中国,湖南省,衡阳市,衡阳县', '3', 'Hengyang', '0734', '421200');
INSERT INTO `e_r_sys_region` VALUES ('430422', '430400', '衡南', '衡南县', '中国,湖南省,衡阳市,衡南县', '3', 'Hengnan', '0734', '421131');
INSERT INTO `e_r_sys_region` VALUES ('430423', '430400', '衡山', '衡山县', '中国,湖南省,衡阳市,衡山县', '3', 'Hengshan', '0734', '421300');
INSERT INTO `e_r_sys_region` VALUES ('430424', '430400', '衡东', '衡东县', '中国,湖南省,衡阳市,衡东县', '3', 'Hengdong', '0734', '421400');
INSERT INTO `e_r_sys_region` VALUES ('430426', '430400', '祁东', '祁东县', '中国,湖南省,衡阳市,祁东县', '3', 'Qidong', '0734', '421600');
INSERT INTO `e_r_sys_region` VALUES ('430481', '430400', '耒阳', '耒阳市', '中国,湖南省,衡阳市,耒阳市', '3', 'Leiyang', '0734', '421800');
INSERT INTO `e_r_sys_region` VALUES ('430482', '430400', '常宁', '常宁市', '中国,湖南省,衡阳市,常宁市', '3', 'Changning', '0734', '421500');
INSERT INTO `e_r_sys_region` VALUES ('430500', '430000', '邵阳', '邵阳市', '中国,湖南省,邵阳市', '2', 'Shaoyang', '0739', '422000');
INSERT INTO `e_r_sys_region` VALUES ('430502', '430500', '双清', '双清区', '中国,湖南省,邵阳市,双清区', '3', 'Shuangqing', '0739', '422001');
INSERT INTO `e_r_sys_region` VALUES ('430503', '430500', '大祥', '大祥区', '中国,湖南省,邵阳市,大祥区', '3', 'Daxiang', '0739', '422000');
INSERT INTO `e_r_sys_region` VALUES ('430511', '430500', '北塔', '北塔区', '中国,湖南省,邵阳市,北塔区', '3', 'Beita', '0739', '422007');
INSERT INTO `e_r_sys_region` VALUES ('430521', '430500', '邵东', '邵东县', '中国,湖南省,邵阳市,邵东县', '3', 'Shaodong', '0739', '422800');
INSERT INTO `e_r_sys_region` VALUES ('430522', '430500', '新邵', '新邵县', '中国,湖南省,邵阳市,新邵县', '3', 'Xinshao', '0739', '422900');
INSERT INTO `e_r_sys_region` VALUES ('430523', '430500', '邵阳', '邵阳县', '中国,湖南省,邵阳市,邵阳县', '3', 'Shaoyang', '0739', '422100');
INSERT INTO `e_r_sys_region` VALUES ('430524', '430500', '隆回', '隆回县', '中国,湖南省,邵阳市,隆回县', '3', 'Longhui', '0739', '422200');
INSERT INTO `e_r_sys_region` VALUES ('430525', '430500', '洞口', '洞口县', '中国,湖南省,邵阳市,洞口县', '3', 'Dongkou', '0739', '422300');
INSERT INTO `e_r_sys_region` VALUES ('430527', '430500', '绥宁', '绥宁县', '中国,湖南省,邵阳市,绥宁县', '3', 'Suining', '0739', '422600');
INSERT INTO `e_r_sys_region` VALUES ('430528', '430500', '新宁', '新宁县', '中国,湖南省,邵阳市,新宁县', '3', 'Xinning', '0739', '422700');
INSERT INTO `e_r_sys_region` VALUES ('430529', '430500', '城步', '城步苗族自治县', '中国,湖南省,邵阳市,城步苗族自治县', '3', 'Chengbu', '0739', '422500');
INSERT INTO `e_r_sys_region` VALUES ('430581', '430500', '武冈', '武冈市', '中国,湖南省,邵阳市,武冈市', '3', 'Wugang', '0739', '422400');
INSERT INTO `e_r_sys_region` VALUES ('430600', '430000', '岳阳', '岳阳市', '中国,湖南省,岳阳市', '2', 'Yueyang', '0730', '414000');
INSERT INTO `e_r_sys_region` VALUES ('430602', '430600', '岳阳楼', '岳阳楼区', '中国,湖南省,岳阳市,岳阳楼区', '3', 'Yueyanglou', '0730', '414000');
INSERT INTO `e_r_sys_region` VALUES ('430603', '430600', '云溪', '云溪区', '中国,湖南省,岳阳市,云溪区', '3', 'Yunxi', '0730', '414009');
INSERT INTO `e_r_sys_region` VALUES ('430611', '430600', '君山', '君山区', '中国,湖南省,岳阳市,君山区', '3', 'Junshan', '0730', '414005');
INSERT INTO `e_r_sys_region` VALUES ('430621', '430600', '岳阳', '岳阳县', '中国,湖南省,岳阳市,岳阳县', '3', 'Yueyang', '0730', '414100');
INSERT INTO `e_r_sys_region` VALUES ('430623', '430600', '华容', '华容县', '中国,湖南省,岳阳市,华容县', '3', 'Huarong', '0730', '414200');
INSERT INTO `e_r_sys_region` VALUES ('430624', '430600', '湘阴', '湘阴县', '中国,湖南省,岳阳市,湘阴县', '3', 'Xiangyin', '0730', '414600');
INSERT INTO `e_r_sys_region` VALUES ('430626', '430600', '平江', '平江县', '中国,湖南省,岳阳市,平江县', '3', 'Pingjiang', '0730', '414500');
INSERT INTO `e_r_sys_region` VALUES ('430681', '430600', '汨罗', '汨罗市', '中国,湖南省,岳阳市,汨罗市', '3', 'Miluo', '0730', '414400');
INSERT INTO `e_r_sys_region` VALUES ('430682', '430600', '临湘', '临湘市', '中国,湖南省,岳阳市,临湘市', '3', 'Linxiang', '0730', '414300');
INSERT INTO `e_r_sys_region` VALUES ('430700', '430000', '常德', '常德市', '中国,湖南省,常德市', '2', 'Changde', '0736', '415000');
INSERT INTO `e_r_sys_region` VALUES ('430702', '430700', '武陵', '武陵区', '中国,湖南省,常德市,武陵区', '3', 'Wuling', '0736', '415000');
INSERT INTO `e_r_sys_region` VALUES ('430703', '430700', '鼎城', '鼎城区', '中国,湖南省,常德市,鼎城区', '3', 'Dingcheng', '0736', '415101');
INSERT INTO `e_r_sys_region` VALUES ('430721', '430700', '安乡', '安乡县', '中国,湖南省,常德市,安乡县', '3', 'Anxiang', '0736', '415600');
INSERT INTO `e_r_sys_region` VALUES ('430722', '430700', '汉寿', '汉寿县', '中国,湖南省,常德市,汉寿县', '3', 'Hanshou', '0736', '415900');
INSERT INTO `e_r_sys_region` VALUES ('430723', '430700', '澧县', '澧县', '中国,湖南省,常德市,澧县', '3', 'Lixian', '0736', '415500');
INSERT INTO `e_r_sys_region` VALUES ('430724', '430700', '临澧', '临澧县', '中国,湖南省,常德市,临澧县', '3', 'Linli', '0736', '415200');
INSERT INTO `e_r_sys_region` VALUES ('430725', '430700', '桃源', '桃源县', '中国,湖南省,常德市,桃源县', '3', 'Taoyuan', '0736', '415700');
INSERT INTO `e_r_sys_region` VALUES ('430726', '430700', '石门', '石门县', '中国,湖南省,常德市,石门县', '3', 'Shimen', '0736', '415300');
INSERT INTO `e_r_sys_region` VALUES ('430781', '430700', '津市', '津市市', '中国,湖南省,常德市,津市市', '3', 'Jinshi', '0736', '415400');
INSERT INTO `e_r_sys_region` VALUES ('430800', '430000', '张家界', '张家界市', '中国,湖南省,张家界市', '2', 'Zhangjiajie', '0744', '427000');
INSERT INTO `e_r_sys_region` VALUES ('430802', '430800', '永定', '永定区', '中国,湖南省,张家界市,永定区', '3', 'Yongding', '0744', '427000');
INSERT INTO `e_r_sys_region` VALUES ('430811', '430800', '武陵源', '武陵源区', '中国,湖南省,张家界市,武陵源区', '3', 'Wulingyuan', '0744', '427400');
INSERT INTO `e_r_sys_region` VALUES ('430821', '430800', '慈利', '慈利县', '中国,湖南省,张家界市,慈利县', '3', 'Cili', '0744', '427200');
INSERT INTO `e_r_sys_region` VALUES ('430822', '430800', '桑植', '桑植县', '中国,湖南省,张家界市,桑植县', '3', 'Sangzhi', '0744', '427100');
INSERT INTO `e_r_sys_region` VALUES ('430900', '430000', '益阳', '益阳市', '中国,湖南省,益阳市', '2', 'Yiyang', '0737', '413000');
INSERT INTO `e_r_sys_region` VALUES ('430902', '430900', '资阳', '资阳区', '中国,湖南省,益阳市,资阳区', '3', 'Ziyang', '0737', '413001');
INSERT INTO `e_r_sys_region` VALUES ('430903', '430900', '赫山', '赫山区', '中国,湖南省,益阳市,赫山区', '3', 'Heshan', '0737', '413002');
INSERT INTO `e_r_sys_region` VALUES ('430921', '430900', '南县', '南县', '中国,湖南省,益阳市,南县', '3', 'Nanxian', '0737', '413200');
INSERT INTO `e_r_sys_region` VALUES ('430922', '430900', '桃江', '桃江县', '中国,湖南省,益阳市,桃江县', '3', 'Taojiang', '0737', '413400');
INSERT INTO `e_r_sys_region` VALUES ('430923', '430900', '安化', '安化县', '中国,湖南省,益阳市,安化县', '3', 'Anhua', '0737', '413500');
INSERT INTO `e_r_sys_region` VALUES ('430981', '430900', '沅江', '沅江市', '中国,湖南省,益阳市,沅江市', '3', 'Yuanjiang', '0737', '413100');
INSERT INTO `e_r_sys_region` VALUES ('431000', '430000', '郴州', '郴州市', '中国,湖南省,郴州市', '2', 'Chenzhou', '0735', '423000');
INSERT INTO `e_r_sys_region` VALUES ('431002', '431000', '北湖', '北湖区', '中国,湖南省,郴州市,北湖区', '3', 'Beihu', '0735', '423000');
INSERT INTO `e_r_sys_region` VALUES ('431003', '431000', '苏仙', '苏仙区', '中国,湖南省,郴州市,苏仙区', '3', 'Suxian', '0735', '423000');
INSERT INTO `e_r_sys_region` VALUES ('431021', '431000', '桂阳', '桂阳县', '中国,湖南省,郴州市,桂阳县', '3', 'Guiyang', '0735', '424400');
INSERT INTO `e_r_sys_region` VALUES ('431022', '431000', '宜章', '宜章县', '中国,湖南省,郴州市,宜章县', '3', 'Yizhang', '0735', '424200');
INSERT INTO `e_r_sys_region` VALUES ('431023', '431000', '永兴', '永兴县', '中国,湖南省,郴州市,永兴县', '3', 'Yongxing', '0735', '423300');
INSERT INTO `e_r_sys_region` VALUES ('431024', '431000', '嘉禾', '嘉禾县', '中国,湖南省,郴州市,嘉禾县', '3', 'Jiahe', '0735', '424500');
INSERT INTO `e_r_sys_region` VALUES ('431025', '431000', '临武', '临武县', '中国,湖南省,郴州市,临武县', '3', 'Linwu', '0735', '424300');
INSERT INTO `e_r_sys_region` VALUES ('431026', '431000', '汝城', '汝城县', '中国,湖南省,郴州市,汝城县', '3', 'Rucheng', '0735', '424100');
INSERT INTO `e_r_sys_region` VALUES ('431027', '431000', '桂东', '桂东县', '中国,湖南省,郴州市,桂东县', '3', 'Guidong', '0735', '423500');
INSERT INTO `e_r_sys_region` VALUES ('431028', '431000', '安仁', '安仁县', '中国,湖南省,郴州市,安仁县', '3', 'Anren', '0735', '423600');
INSERT INTO `e_r_sys_region` VALUES ('431081', '431000', '资兴', '资兴市', '中国,湖南省,郴州市,资兴市', '3', 'Zixing', '0735', '423400');
INSERT INTO `e_r_sys_region` VALUES ('431100', '430000', '永州', '永州市', '中国,湖南省,永州市', '2', 'Yongzhou', '0746', '425000');
INSERT INTO `e_r_sys_region` VALUES ('431102', '431100', '零陵', '零陵区', '中国,湖南省,永州市,零陵区', '3', 'Lingling', '0746', '425100');
INSERT INTO `e_r_sys_region` VALUES ('431103', '431100', '冷水滩', '冷水滩区', '中国,湖南省,永州市,冷水滩区', '3', 'Lengshuitan', '0746', '425100');
INSERT INTO `e_r_sys_region` VALUES ('431121', '431100', '祁阳', '祁阳县', '中国,湖南省,永州市,祁阳县', '3', 'Qiyang', '0746', '426100');
INSERT INTO `e_r_sys_region` VALUES ('431122', '431100', '东安', '东安县', '中国,湖南省,永州市,东安县', '3', 'Dong\'an', '0746', '425900');
INSERT INTO `e_r_sys_region` VALUES ('431123', '431100', '双牌', '双牌县', '中国,湖南省,永州市,双牌县', '3', 'Shuangpai', '0746', '425200');
INSERT INTO `e_r_sys_region` VALUES ('431124', '431100', '道县', '道县', '中国,湖南省,永州市,道县', '3', 'Daoxian', '0746', '425300');
INSERT INTO `e_r_sys_region` VALUES ('431125', '431100', '江永', '江永县', '中国,湖南省,永州市,江永县', '3', 'Jiangyong', '0746', '425400');
INSERT INTO `e_r_sys_region` VALUES ('431126', '431100', '宁远', '宁远县', '中国,湖南省,永州市,宁远县', '3', 'Ningyuan', '0746', '425600');
INSERT INTO `e_r_sys_region` VALUES ('431127', '431100', '蓝山', '蓝山县', '中国,湖南省,永州市,蓝山县', '3', 'Lanshan', '0746', '425800');
INSERT INTO `e_r_sys_region` VALUES ('431128', '431100', '新田', '新田县', '中国,湖南省,永州市,新田县', '3', 'Xintian', '0746', '425700');
INSERT INTO `e_r_sys_region` VALUES ('431129', '431100', '江华', '江华瑶族自治县', '中国,湖南省,永州市,江华瑶族自治县', '3', 'Jianghua', '0746', '425500');
INSERT INTO `e_r_sys_region` VALUES ('431200', '430000', '怀化', '怀化市', '中国,湖南省,怀化市', '2', 'Huaihua', '0745', '418000');
INSERT INTO `e_r_sys_region` VALUES ('431202', '431200', '鹤城', '鹤城区', '中国,湖南省,怀化市,鹤城区', '3', 'Hecheng', '0745', '418000');
INSERT INTO `e_r_sys_region` VALUES ('431221', '431200', '中方', '中方县', '中国,湖南省,怀化市,中方县', '3', 'Zhongfang', '0745', '418005');
INSERT INTO `e_r_sys_region` VALUES ('431222', '431200', '沅陵', '沅陵县', '中国,湖南省,怀化市,沅陵县', '3', 'Yuanling', '0745', '419600');
INSERT INTO `e_r_sys_region` VALUES ('431223', '431200', '辰溪', '辰溪县', '中国,湖南省,怀化市,辰溪县', '3', 'Chenxi', '0745', '419500');
INSERT INTO `e_r_sys_region` VALUES ('431224', '431200', '溆浦', '溆浦县', '中国,湖南省,怀化市,溆浦县', '3', 'Xupu', '0745', '419300');
INSERT INTO `e_r_sys_region` VALUES ('431225', '431200', '会同', '会同县', '中国,湖南省,怀化市,会同县', '3', 'Huitong', '0745', '418300');
INSERT INTO `e_r_sys_region` VALUES ('431226', '431200', '麻阳', '麻阳苗族自治县', '中国,湖南省,怀化市,麻阳苗族自治县', '3', 'Mayang', '0745', '419400');
INSERT INTO `e_r_sys_region` VALUES ('431227', '431200', '新晃', '新晃侗族自治县', '中国,湖南省,怀化市,新晃侗族自治县', '3', 'Xinhuang', '0745', '419200');
INSERT INTO `e_r_sys_region` VALUES ('431228', '431200', '芷江', '芷江侗族自治县', '中国,湖南省,怀化市,芷江侗族自治县', '3', 'Zhijiang', '0745', '419100');
INSERT INTO `e_r_sys_region` VALUES ('431229', '431200', '靖州', '靖州苗族侗族自治县', '中国,湖南省,怀化市,靖州苗族侗族自治县', '3', 'Jingzhou', '0745', '418400');
INSERT INTO `e_r_sys_region` VALUES ('431230', '431200', '通道', '通道侗族自治县', '中国,湖南省,怀化市,通道侗族自治县', '3', 'Tongdao', '0745', '418500');
INSERT INTO `e_r_sys_region` VALUES ('431281', '431200', '洪江', '洪江市', '中国,湖南省,怀化市,洪江市', '3', 'Hongjiang', '0745', '418100');
INSERT INTO `e_r_sys_region` VALUES ('431300', '430000', '娄底', '娄底市', '中国,湖南省,娄底市', '2', 'Loudi', '0738', '417000');
INSERT INTO `e_r_sys_region` VALUES ('431302', '431300', '娄星', '娄星区', '中国,湖南省,娄底市,娄星区', '3', 'Louxing', '0738', '417000');
INSERT INTO `e_r_sys_region` VALUES ('431321', '431300', '双峰', '双峰县', '中国,湖南省,娄底市,双峰县', '3', 'Shuangfeng', '0738', '417700');
INSERT INTO `e_r_sys_region` VALUES ('431322', '431300', '新化', '新化县', '中国,湖南省,娄底市,新化县', '3', 'Xinhua', '0738', '417600');
INSERT INTO `e_r_sys_region` VALUES ('431381', '431300', '冷水江', '冷水江市', '中国,湖南省,娄底市,冷水江市', '3', 'Lengshuijiang', '0738', '417500');
INSERT INTO `e_r_sys_region` VALUES ('431382', '431300', '涟源', '涟源市', '中国,湖南省,娄底市,涟源市', '3', 'Lianyuan', '0738', '417100');
INSERT INTO `e_r_sys_region` VALUES ('433100', '430000', '湘西', '湘西土家族苗族自治州', '中国,湖南省,湘西土家族苗族自治州', '2', 'Xiangxi', '0743', '416000');
INSERT INTO `e_r_sys_region` VALUES ('433101', '433100', '吉首', '吉首市', '中国,湖南省,湘西土家族苗族自治州,吉首市', '3', 'Jishou', '0743', '416000');
INSERT INTO `e_r_sys_region` VALUES ('433122', '433100', '泸溪', '泸溪县', '中国,湖南省,湘西土家族苗族自治州,泸溪县', '3', 'Luxi', '0743', '416100');
INSERT INTO `e_r_sys_region` VALUES ('433123', '433100', '凤凰', '凤凰县', '中国,湖南省,湘西土家族苗族自治州,凤凰县', '3', 'Fenghuang', '0743', '416200');
INSERT INTO `e_r_sys_region` VALUES ('433124', '433100', '花垣', '花垣县', '中国,湖南省,湘西土家族苗族自治州,花垣县', '3', 'Huayuan', '0743', '416400');
INSERT INTO `e_r_sys_region` VALUES ('433125', '433100', '保靖', '保靖县', '中国,湖南省,湘西土家族苗族自治州,保靖县', '3', 'Baojing', '0743', '416500');
INSERT INTO `e_r_sys_region` VALUES ('433126', '433100', '古丈', '古丈县', '中国,湖南省,湘西土家族苗族自治州,古丈县', '3', 'Guzhang', '0743', '416300');
INSERT INTO `e_r_sys_region` VALUES ('433127', '433100', '永顺', '永顺县', '中国,湖南省,湘西土家族苗族自治州,永顺县', '3', 'Yongshun', '0743', '416700');
INSERT INTO `e_r_sys_region` VALUES ('433130', '433100', '龙山', '龙山县', '中国,湖南省,湘西土家族苗族自治州,龙山县', '3', 'Longshan', '0743', '416800');
INSERT INTO `e_r_sys_region` VALUES ('440000', '100000', '广东', '广东省', '中国,广东省', '1', 'Guangdong', '', '');
INSERT INTO `e_r_sys_region` VALUES ('440100', '440000', '广州', '广州市', '中国,广东省,广州市', '2', 'Guangzhou', '020', '510032');
INSERT INTO `e_r_sys_region` VALUES ('440103', '440100', '荔湾', '荔湾区', '中国,广东省,广州市,荔湾区', '3', 'Liwan', '020', '510170');
INSERT INTO `e_r_sys_region` VALUES ('440104', '440100', '越秀', '越秀区', '中国,广东省,广州市,越秀区', '3', 'Yuexiu', '020', '510030');
INSERT INTO `e_r_sys_region` VALUES ('440105', '440100', '海珠', '海珠区', '中国,广东省,广州市,海珠区', '3', 'Haizhu', '020', '510300');
INSERT INTO `e_r_sys_region` VALUES ('440106', '440100', '天河', '天河区', '中国,广东省,广州市,天河区', '3', 'Tianhe', '020', '510665');
INSERT INTO `e_r_sys_region` VALUES ('440111', '440100', '白云', '白云区', '中国,广东省,广州市,白云区', '3', 'Baiyun', '020', '510405');
INSERT INTO `e_r_sys_region` VALUES ('440112', '440100', '黄埔', '黄埔区', '中国,广东省,广州市,黄埔区', '3', 'Huangpu', '020', '510700');
INSERT INTO `e_r_sys_region` VALUES ('440113', '440100', '番禺', '番禺区', '中国,广东省,广州市,番禺区', '3', 'Panyu', '020', '511400');
INSERT INTO `e_r_sys_region` VALUES ('440114', '440100', '花都', '花都区', '中国,广东省,广州市,花都区', '3', 'Huadu', '020', '510800');
INSERT INTO `e_r_sys_region` VALUES ('440115', '440100', '南沙', '南沙区', '中国,广东省,广州市,南沙区', '3', 'Nansha', '020', '511458');
INSERT INTO `e_r_sys_region` VALUES ('440117', '440100', '从化', '从化区', '中国,广东省,广州市,从化区', '3', 'Conghua', '020', '510900');
INSERT INTO `e_r_sys_region` VALUES ('440118', '440100', '增城', '增城区', '中国,广东省,广州市,增城区', '3', 'Zengcheng', '020', '511300');
INSERT INTO `e_r_sys_region` VALUES ('440200', '440000', '韶关', '韶关市', '中国,广东省,韶关市', '2', 'Shaoguan', '0751', '512002');
INSERT INTO `e_r_sys_region` VALUES ('440203', '440200', '武江', '武江区', '中国,广东省,韶关市,武江区', '3', 'Wujiang', '0751', '512026');
INSERT INTO `e_r_sys_region` VALUES ('440204', '440200', '浈江', '浈江区', '中国,广东省,韶关市,浈江区', '3', 'Zhenjiang', '0751', '512023');
INSERT INTO `e_r_sys_region` VALUES ('440205', '440200', '曲江', '曲江区', '中国,广东省,韶关市,曲江区', '3', 'Qujiang', '0751', '512101');
INSERT INTO `e_r_sys_region` VALUES ('440222', '440200', '始兴', '始兴县', '中国,广东省,韶关市,始兴县', '3', 'Shixing', '0751', '512500');
INSERT INTO `e_r_sys_region` VALUES ('440224', '440200', '仁化', '仁化县', '中国,广东省,韶关市,仁化县', '3', 'Renhua', '0751', '512300');
INSERT INTO `e_r_sys_region` VALUES ('440229', '440200', '翁源', '翁源县', '中国,广东省,韶关市,翁源县', '3', 'Wengyuan', '0751', '512600');
INSERT INTO `e_r_sys_region` VALUES ('440232', '440200', '乳源', '乳源瑶族自治县', '中国,广东省,韶关市,乳源瑶族自治县', '3', 'Ruyuan', '0751', '512700');
INSERT INTO `e_r_sys_region` VALUES ('440233', '440200', '新丰', '新丰县', '中国,广东省,韶关市,新丰县', '3', 'Xinfeng', '0751', '511100');
INSERT INTO `e_r_sys_region` VALUES ('440281', '440200', '乐昌', '乐昌市', '中国,广东省,韶关市,乐昌市', '3', 'Lechang', '0751', '512200');
INSERT INTO `e_r_sys_region` VALUES ('440282', '440200', '南雄', '南雄市', '中国,广东省,韶关市,南雄市', '3', 'Nanxiong', '0751', '512400');
INSERT INTO `e_r_sys_region` VALUES ('440300', '440000', '深圳', '深圳市', '中国,广东省,深圳市', '2', 'Shenzhen', '0755', '518035');
INSERT INTO `e_r_sys_region` VALUES ('440303', '440300', '罗湖', '罗湖区', '中国,广东省,深圳市,罗湖区', '3', 'Luohu', '0755', '518021');
INSERT INTO `e_r_sys_region` VALUES ('440304', '440300', '福田', '福田区', '中国,广东省,深圳市,福田区', '3', 'Futian', '0755', '518048');
INSERT INTO `e_r_sys_region` VALUES ('440305', '440300', '南山', '南山区', '中国,广东省,深圳市,南山区', '3', 'Nanshan', '0755', '518051');
INSERT INTO `e_r_sys_region` VALUES ('440306', '440300', '宝安', '宝安区', '中国,广东省,深圳市,宝安区', '3', 'Bao\'an', '0755', '518101');
INSERT INTO `e_r_sys_region` VALUES ('440307', '440300', '龙岗', '龙岗区', '中国,广东省,深圳市,龙岗区', '3', 'Longgang', '0755', '518172');
INSERT INTO `e_r_sys_region` VALUES ('440308', '440300', '盐田', '盐田区', '中国,广东省,深圳市,盐田区', '3', 'Yantian', '0755', '518081');
INSERT INTO `e_r_sys_region` VALUES ('440309', '440300', '光明新区', '光明新区', '中国,广东省,深圳市,光明新区', '3', 'Guangmingxinqu', '0755', '518100');
INSERT INTO `e_r_sys_region` VALUES ('440310', '440300', '坪山新区', '坪山新区', '中国,广东省,深圳市,坪山新区', '3', 'Pingshanxinqu', '0755', '518000');
INSERT INTO `e_r_sys_region` VALUES ('440311', '440300', '大鹏新区', '大鹏新区', '中国,广东省,深圳市,大鹏新区', '3', 'Dapengxinqu', '0755', '518000');
INSERT INTO `e_r_sys_region` VALUES ('440312', '440300', '龙华新区', '龙华新区', '中国,广东省,深圳市,龙华新区', '3', 'Longhuaxinqu', '0755', '518100');
INSERT INTO `e_r_sys_region` VALUES ('440400', '440000', '珠海', '珠海市', '中国,广东省,珠海市', '2', 'Zhuhai', '0756', '519000');
INSERT INTO `e_r_sys_region` VALUES ('440402', '440400', '香洲', '香洲区', '中国,广东省,珠海市,香洲区', '3', 'Xiangzhou', '0756', '519000');
INSERT INTO `e_r_sys_region` VALUES ('440403', '440400', '斗门', '斗门区', '中国,广东省,珠海市,斗门区', '3', 'Doumen', '0756', '519110');
INSERT INTO `e_r_sys_region` VALUES ('440404', '440400', '金湾', '金湾区', '中国,广东省,珠海市,金湾区', '3', 'Jinwan', '0756', '519040');
INSERT INTO `e_r_sys_region` VALUES ('440500', '440000', '汕头', '汕头市', '中国,广东省,汕头市', '2', 'Shantou', '0754', '515041');
INSERT INTO `e_r_sys_region` VALUES ('440507', '440500', '龙湖', '龙湖区', '中国,广东省,汕头市,龙湖区', '3', 'Longhu', '0754', '515041');
INSERT INTO `e_r_sys_region` VALUES ('440511', '440500', '金平', '金平区', '中国,广东省,汕头市,金平区', '3', 'Jinping', '0754', '515041');
INSERT INTO `e_r_sys_region` VALUES ('440512', '440500', '濠江', '濠江区', '中国,广东省,汕头市,濠江区', '3', 'Haojiang', '0754', '515071');
INSERT INTO `e_r_sys_region` VALUES ('440513', '440500', '潮阳', '潮阳区', '中国,广东省,汕头市,潮阳区', '3', 'Chaoyang', '0754', '515100');
INSERT INTO `e_r_sys_region` VALUES ('440514', '440500', '潮南', '潮南区', '中国,广东省,汕头市,潮南区', '3', 'Chaonan', '0754', '515144');
INSERT INTO `e_r_sys_region` VALUES ('440515', '440500', '澄海', '澄海区', '中国,广东省,汕头市,澄海区', '3', 'Chenghai', '0754', '515800');
INSERT INTO `e_r_sys_region` VALUES ('440523', '440500', '南澳', '南澳县', '中国,广东省,汕头市,南澳县', '3', 'Nanao', '0754', '515900');
INSERT INTO `e_r_sys_region` VALUES ('440600', '440000', '佛山', '佛山市', '中国,广东省,佛山市', '2', 'Foshan', '0757', '528000');
INSERT INTO `e_r_sys_region` VALUES ('440604', '440600', '禅城', '禅城区', '中国,广东省,佛山市,禅城区', '3', 'Chancheng', '0757', '528000');
INSERT INTO `e_r_sys_region` VALUES ('440605', '440600', '南海', '南海区', '中国,广东省,佛山市,南海区', '3', 'Nanhai', '0757', '528251');
INSERT INTO `e_r_sys_region` VALUES ('440606', '440600', '顺德', '顺德区', '中国,广东省,佛山市,顺德区', '3', 'Shunde', '0757', '528300');
INSERT INTO `e_r_sys_region` VALUES ('440607', '440600', '三水', '三水区', '中国,广东省,佛山市,三水区', '3', 'Sanshui', '0757', '528133');
INSERT INTO `e_r_sys_region` VALUES ('440608', '440600', '高明', '高明区', '中国,广东省,佛山市,高明区', '3', 'Gaoming', '0757', '528500');
INSERT INTO `e_r_sys_region` VALUES ('440700', '440000', '江门', '江门市', '中国,广东省,江门市', '2', 'Jiangmen', '0750', '529000');
INSERT INTO `e_r_sys_region` VALUES ('440703', '440700', '蓬江', '蓬江区', '中国,广东省,江门市,蓬江区', '3', 'Pengjiang', '0750', '529000');
INSERT INTO `e_r_sys_region` VALUES ('440704', '440700', '江海', '江海区', '中国,广东省,江门市,江海区', '3', 'Jianghai', '0750', '529040');
INSERT INTO `e_r_sys_region` VALUES ('440705', '440700', '新会', '新会区', '中国,广东省,江门市,新会区', '3', 'Xinhui', '0750', '529100');
INSERT INTO `e_r_sys_region` VALUES ('440781', '440700', '台山', '台山市', '中国,广东省,江门市,台山市', '3', 'Taishan', '0750', '529200');
INSERT INTO `e_r_sys_region` VALUES ('440783', '440700', '开平', '开平市', '中国,广东省,江门市,开平市', '3', 'Kaiping', '0750', '529337');
INSERT INTO `e_r_sys_region` VALUES ('440784', '440700', '鹤山', '鹤山市', '中国,广东省,江门市,鹤山市', '3', 'Heshan', '0750', '529700');
INSERT INTO `e_r_sys_region` VALUES ('440785', '440700', '恩平', '恩平市', '中国,广东省,江门市,恩平市', '3', 'Enping', '0750', '529400');
INSERT INTO `e_r_sys_region` VALUES ('440800', '440000', '湛江', '湛江市', '中国,广东省,湛江市', '2', 'Zhanjiang', '0759', '524047');
INSERT INTO `e_r_sys_region` VALUES ('440802', '440800', '赤坎', '赤坎区', '中国,广东省,湛江市,赤坎区', '3', 'Chikan', '0759', '524033');
INSERT INTO `e_r_sys_region` VALUES ('440803', '440800', '霞山', '霞山区', '中国,广东省,湛江市,霞山区', '3', 'Xiashan', '0759', '524011');
INSERT INTO `e_r_sys_region` VALUES ('440804', '440800', '坡头', '坡头区', '中国,广东省,湛江市,坡头区', '3', 'Potou', '0759', '524057');
INSERT INTO `e_r_sys_region` VALUES ('440811', '440800', '麻章', '麻章区', '中国,广东省,湛江市,麻章区', '3', 'Mazhang', '0759', '524094');
INSERT INTO `e_r_sys_region` VALUES ('440823', '440800', '遂溪', '遂溪县', '中国,广东省,湛江市,遂溪县', '3', 'Suixi', '0759', '524300');
INSERT INTO `e_r_sys_region` VALUES ('440825', '440800', '徐闻', '徐闻县', '中国,广东省,湛江市,徐闻县', '3', 'Xuwen', '0759', '524100');
INSERT INTO `e_r_sys_region` VALUES ('440881', '440800', '廉江', '廉江市', '中国,广东省,湛江市,廉江市', '3', 'Lianjiang', '0759', '524400');
INSERT INTO `e_r_sys_region` VALUES ('440882', '440800', '雷州', '雷州市', '中国,广东省,湛江市,雷州市', '3', 'Leizhou', '0759', '524200');
INSERT INTO `e_r_sys_region` VALUES ('440883', '440800', '吴川', '吴川市', '中国,广东省,湛江市,吴川市', '3', 'Wuchuan', '0759', '524500');
INSERT INTO `e_r_sys_region` VALUES ('440900', '440000', '茂名', '茂名市', '中国,广东省,茂名市', '2', 'Maoming', '0668', '525000');
INSERT INTO `e_r_sys_region` VALUES ('440902', '440900', '茂南', '茂南区', '中国,广东省,茂名市,茂南区', '3', 'Maonan', '0668', '525000');
INSERT INTO `e_r_sys_region` VALUES ('440904', '440900', '电白', '电白区', '中国,广东省,茂名市,电白区', '3', 'Dianbai', '0668', '525400');
INSERT INTO `e_r_sys_region` VALUES ('440981', '440900', '高州', '高州市', '中国,广东省,茂名市,高州市', '3', 'Gaozhou', '0668', '525200');
INSERT INTO `e_r_sys_region` VALUES ('440982', '440900', '化州', '化州市', '中国,广东省,茂名市,化州市', '3', 'Huazhou', '0668', '525100');
INSERT INTO `e_r_sys_region` VALUES ('440983', '440900', '信宜', '信宜市', '中国,广东省,茂名市,信宜市', '3', 'Xinyi', '0668', '525300');
INSERT INTO `e_r_sys_region` VALUES ('441200', '440000', '肇庆', '肇庆市', '中国,广东省,肇庆市', '2', 'Zhaoqing', '0758', '526040');
INSERT INTO `e_r_sys_region` VALUES ('441202', '441200', '端州', '端州区', '中国,广东省,肇庆市,端州区', '3', 'Duanzhou', '0758', '526060');
INSERT INTO `e_r_sys_region` VALUES ('441203', '441200', '鼎湖', '鼎湖区', '中国,广东省,肇庆市,鼎湖区', '3', 'Dinghu', '0758', '526070');
INSERT INTO `e_r_sys_region` VALUES ('441223', '441200', '广宁', '广宁县', '中国,广东省,肇庆市,广宁县', '3', 'Guangning', '0758', '526300');
INSERT INTO `e_r_sys_region` VALUES ('441224', '441200', '怀集', '怀集县', '中国,广东省,肇庆市,怀集县', '3', 'Huaiji', '0758', '526400');
INSERT INTO `e_r_sys_region` VALUES ('441225', '441200', '封开', '封开县', '中国,广东省,肇庆市,封开县', '3', 'Fengkai', '0758', '526500');
INSERT INTO `e_r_sys_region` VALUES ('441226', '441200', '德庆', '德庆县', '中国,广东省,肇庆市,德庆县', '3', 'Deqing', '0758', '526600');
INSERT INTO `e_r_sys_region` VALUES ('441283', '441200', '高要', '高要市', '中国,广东省,肇庆市,高要市', '3', 'Gaoyao', '0758', '526100');
INSERT INTO `e_r_sys_region` VALUES ('441284', '441200', '四会', '四会市', '中国,广东省,肇庆市,四会市', '3', 'Sihui', '0758', '526200');
INSERT INTO `e_r_sys_region` VALUES ('441300', '440000', '惠州', '惠州市', '中国,广东省,惠州市', '2', 'Huizhou', '0752', '516000');
INSERT INTO `e_r_sys_region` VALUES ('441302', '441300', '惠城', '惠城区', '中国,广东省,惠州市,惠城区', '3', 'Huicheng', '0752', '516008');
INSERT INTO `e_r_sys_region` VALUES ('441303', '441300', '惠阳', '惠阳区', '中国,广东省,惠州市,惠阳区', '3', 'Huiyang', '0752', '516211');
INSERT INTO `e_r_sys_region` VALUES ('441322', '441300', '博罗', '博罗县', '中国,广东省,惠州市,博罗县', '3', 'Boluo', '0752', '516100');
INSERT INTO `e_r_sys_region` VALUES ('441323', '441300', '惠东', '惠东县', '中国,广东省,惠州市,惠东县', '3', 'Huidong', '0752', '516300');
INSERT INTO `e_r_sys_region` VALUES ('441324', '441300', '龙门', '龙门县', '中国,广东省,惠州市,龙门县', '3', 'Longmen', '0752', '516800');
INSERT INTO `e_r_sys_region` VALUES ('441400', '440000', '梅州', '梅州市', '中国,广东省,梅州市', '2', 'Meizhou', '0753', '514021');
INSERT INTO `e_r_sys_region` VALUES ('441402', '441400', '梅江', '梅江区', '中国,广东省,梅州市,梅江区', '3', 'Meijiang', '0753', '514000');
INSERT INTO `e_r_sys_region` VALUES ('441403', '441400', '梅县', '梅县区', '中国,广东省,梅州市,梅县区', '3', 'Meixian', '0753', '514787');
INSERT INTO `e_r_sys_region` VALUES ('441422', '441400', '大埔', '大埔县', '中国,广东省,梅州市,大埔县', '3', 'Dabu', '0753', '514200');
INSERT INTO `e_r_sys_region` VALUES ('441423', '441400', '丰顺', '丰顺县', '中国,广东省,梅州市,丰顺县', '3', 'Fengshun', '0753', '514300');
INSERT INTO `e_r_sys_region` VALUES ('441424', '441400', '五华', '五华县', '中国,广东省,梅州市,五华县', '3', 'Wuhua', '0753', '514400');
INSERT INTO `e_r_sys_region` VALUES ('441426', '441400', '平远', '平远县', '中国,广东省,梅州市,平远县', '3', 'Pingyuan', '0753', '514600');
INSERT INTO `e_r_sys_region` VALUES ('441427', '441400', '蕉岭', '蕉岭县', '中国,广东省,梅州市,蕉岭县', '3', 'Jiaoling', '0753', '514100');
INSERT INTO `e_r_sys_region` VALUES ('441481', '441400', '兴宁', '兴宁市', '中国,广东省,梅州市,兴宁市', '3', 'Xingning', '0753', '514500');
INSERT INTO `e_r_sys_region` VALUES ('441500', '440000', '汕尾', '汕尾市', '中国,广东省,汕尾市', '2', 'Shanwei', '0660', '516600');
INSERT INTO `e_r_sys_region` VALUES ('441502', '441500', '城区', '城区', '中国,广东省,汕尾市,城区', '3', 'Chengqu', '0660', '516600');
INSERT INTO `e_r_sys_region` VALUES ('441521', '441500', '海丰', '海丰县', '中国,广东省,汕尾市,海丰县', '3', 'Haifeng', '0660', '516400');
INSERT INTO `e_r_sys_region` VALUES ('441523', '441500', '陆河', '陆河县', '中国,广东省,汕尾市,陆河县', '3', 'Luhe', '0660', '516700');
INSERT INTO `e_r_sys_region` VALUES ('441581', '441500', '陆丰', '陆丰市', '中国,广东省,汕尾市,陆丰市', '3', 'Lufeng', '0660', '516500');
INSERT INTO `e_r_sys_region` VALUES ('441600', '440000', '河源', '河源市', '中国,广东省,河源市', '2', 'Heyuan', '0762', '517000');
INSERT INTO `e_r_sys_region` VALUES ('441602', '441600', '源城', '源城区', '中国,广东省,河源市,源城区', '3', 'Yuancheng', '0762', '517000');
INSERT INTO `e_r_sys_region` VALUES ('441621', '441600', '紫金', '紫金县', '中国,广东省,河源市,紫金县', '3', 'Zijin', '0762', '517400');
INSERT INTO `e_r_sys_region` VALUES ('441622', '441600', '龙川', '龙川县', '中国,广东省,河源市,龙川县', '3', 'Longchuan', '0762', '517300');
INSERT INTO `e_r_sys_region` VALUES ('441623', '441600', '连平', '连平县', '中国,广东省,河源市,连平县', '3', 'Lianping', '0762', '517100');
INSERT INTO `e_r_sys_region` VALUES ('441624', '441600', '和平', '和平县', '中国,广东省,河源市,和平县', '3', 'Heping', '0762', '517200');
INSERT INTO `e_r_sys_region` VALUES ('441625', '441600', '东源', '东源县', '中国,广东省,河源市,东源县', '3', 'Dongyuan', '0762', '517583');
INSERT INTO `e_r_sys_region` VALUES ('441700', '440000', '阳江', '阳江市', '中国,广东省,阳江市', '2', 'Yangjiang', '0662', '529500');
INSERT INTO `e_r_sys_region` VALUES ('441702', '441700', '江城', '江城区', '中国,广东省,阳江市,江城区', '3', 'Jiangcheng', '0662', '529500');
INSERT INTO `e_r_sys_region` VALUES ('441704', '441700', '阳东', '阳东区', '中国,广东省,阳江市,阳东区', '3', 'Yangdong', '0662', '529900');
INSERT INTO `e_r_sys_region` VALUES ('441721', '441700', '阳西', '阳西县', '中国,广东省,阳江市,阳西县', '3', 'Yangxi', '0662', '529800');
INSERT INTO `e_r_sys_region` VALUES ('441781', '441700', '阳春', '阳春市', '中国,广东省,阳江市,阳春市', '3', 'Yangchun', '0662', '529600');
INSERT INTO `e_r_sys_region` VALUES ('441800', '440000', '清远', '清远市', '中国,广东省,清远市', '2', 'Qingyuan', '0763', '511500');
INSERT INTO `e_r_sys_region` VALUES ('441802', '441800', '清城', '清城区', '中国,广东省,清远市,清城区', '3', 'Qingcheng', '0763', '511515');
INSERT INTO `e_r_sys_region` VALUES ('441803', '441800', '清新', '清新区', '中国,广东省,清远市,清新区', '3', 'Qingxin', '0763', '511810');
INSERT INTO `e_r_sys_region` VALUES ('441821', '441800', '佛冈', '佛冈县', '中国,广东省,清远市,佛冈县', '3', 'Fogang', '0763', '511600');
INSERT INTO `e_r_sys_region` VALUES ('441823', '441800', '阳山', '阳山县', '中国,广东省,清远市,阳山县', '3', 'Yangshan', '0763', '513100');
INSERT INTO `e_r_sys_region` VALUES ('441825', '441800', '连山', '连山壮族瑶族自治县', '中国,广东省,清远市,连山壮族瑶族自治县', '3', 'Lianshan', '0763', '513200');
INSERT INTO `e_r_sys_region` VALUES ('441826', '441800', '连南', '连南瑶族自治县', '中国,广东省,清远市,连南瑶族自治县', '3', 'Liannan', '0763', '513300');
INSERT INTO `e_r_sys_region` VALUES ('441881', '441800', '英德', '英德市', '中国,广东省,清远市,英德市', '3', 'Yingde', '0763', '513000');
INSERT INTO `e_r_sys_region` VALUES ('441882', '441800', '连州', '连州市', '中国,广东省,清远市,连州市', '3', 'Lianzhou', '0763', '513400');
INSERT INTO `e_r_sys_region` VALUES ('441900', '440000', '东莞', '东莞市', '中国,广东省,东莞市', '2', 'Dongguan', '0769', '523888');
INSERT INTO `e_r_sys_region` VALUES ('441901', '441900', '莞城', '莞城区', '中国,广东省,东莞市,莞城区', '3', 'Guancheng', '0769', '523128');
INSERT INTO `e_r_sys_region` VALUES ('441902', '441900', '南城', '南城区', '中国,广东省,东莞市,南城区', '3', 'Nancheng', '0769', '523617');
INSERT INTO `e_r_sys_region` VALUES ('441904', '441900', '万江', '万江区', '中国,广东省,东莞市,万江区', '3', 'Wanjiang', '0769', '523039');
INSERT INTO `e_r_sys_region` VALUES ('441905', '441900', '石碣', '石碣镇', '中国,广东省,东莞市,石碣镇', '3', 'Shijie', '0769', '523290');
INSERT INTO `e_r_sys_region` VALUES ('441906', '441900', '石龙', '石龙镇', '中国,广东省,东莞市,石龙镇', '3', 'Shilong', '0769', '523326');
INSERT INTO `e_r_sys_region` VALUES ('441907', '441900', '茶山', '茶山镇', '中国,广东省,东莞市,茶山镇', '3', 'Chashan', '0769', '523380');
INSERT INTO `e_r_sys_region` VALUES ('441908', '441900', '石排', '石排镇', '中国,广东省,东莞市,石排镇', '3', 'Shipai', '0769', '523346');
INSERT INTO `e_r_sys_region` VALUES ('441909', '441900', '企石', '企石镇', '中国,广东省,东莞市,企石镇', '3', 'Qishi', '0769', '523507');
INSERT INTO `e_r_sys_region` VALUES ('441910', '441900', '横沥', '横沥镇', '中国,广东省,东莞市,横沥镇', '3', 'Hengli', '0769', '523471');
INSERT INTO `e_r_sys_region` VALUES ('441911', '441900', '桥头', '桥头镇', '中国,广东省,东莞市,桥头镇', '3', 'Qiaotou', '0769', '523520');
INSERT INTO `e_r_sys_region` VALUES ('441912', '441900', '谢岗', '谢岗镇', '中国,广东省,东莞市,谢岗镇', '3', 'Xiegang', '0769', '523592');
INSERT INTO `e_r_sys_region` VALUES ('441913', '441900', '东坑', '东坑镇', '中国,广东省,东莞市,东坑镇', '3', 'Dongkeng', '0769', '523451');
INSERT INTO `e_r_sys_region` VALUES ('441914', '441900', '常平', '常平镇', '中国,广东省,东莞市,常平镇', '3', 'Changping', '0769', '523560');
INSERT INTO `e_r_sys_region` VALUES ('441915', '441900', '寮步', '寮步镇', '中国,广东省,东莞市,寮步镇', '3', 'Liaobu', '0769', '523411');
INSERT INTO `e_r_sys_region` VALUES ('441916', '441900', '大朗', '大朗镇', '中国,广东省,东莞市,大朗镇', '3', 'Dalang', '0769', '523770');
INSERT INTO `e_r_sys_region` VALUES ('441917', '441900', '麻涌', '麻涌镇', '中国,广东省,东莞市,麻涌镇', '3', 'Machong', '0769', '523143');
INSERT INTO `e_r_sys_region` VALUES ('441918', '441900', '中堂', '中堂镇', '中国,广东省,东莞市,中堂镇', '3', 'Zhongtang', '0769', '523233');
INSERT INTO `e_r_sys_region` VALUES ('441919', '441900', '高埗', '高埗镇', '中国,广东省,东莞市,高埗镇', '3', 'Gaobu', '0769', '523282');
INSERT INTO `e_r_sys_region` VALUES ('441920', '441900', '樟木头', '樟木头镇', '中国,广东省,东莞市,樟木头镇', '3', 'Zhangmutou', '0769', '523619');
INSERT INTO `e_r_sys_region` VALUES ('441921', '441900', '大岭山', '大岭山镇', '中国,广东省,东莞市,大岭山镇', '3', 'Dalingshan', '0769', '523835');
INSERT INTO `e_r_sys_region` VALUES ('441922', '441900', '望牛墩', '望牛墩镇', '中国,广东省,东莞市,望牛墩镇', '3', 'Wangniudun', '0769', '523203');
INSERT INTO `e_r_sys_region` VALUES ('441923', '441900', '黄江', '黄江镇', '中国,广东省,东莞市,黄江镇', '3', 'Huangjiang', '0769', '523755');
INSERT INTO `e_r_sys_region` VALUES ('441924', '441900', '洪梅', '洪梅镇', '中国,广东省,东莞市,洪梅镇', '3', 'Hongmei', '0769', '523163');
INSERT INTO `e_r_sys_region` VALUES ('441925', '441900', '清溪', '清溪镇', '中国,广东省,东莞市,清溪镇', '3', 'Qingxi', '0769', '523660');
INSERT INTO `e_r_sys_region` VALUES ('441926', '441900', '沙田', '沙田镇', '中国,广东省,东莞市,沙田镇', '3', 'Shatian', '0769', '523988');
INSERT INTO `e_r_sys_region` VALUES ('441927', '441900', '道滘', '道滘镇', '中国,广东省,东莞市,道滘镇', '3', 'Daojiao', '0769', '523171');
INSERT INTO `e_r_sys_region` VALUES ('441928', '441900', '塘厦', '塘厦镇', '中国,广东省,东莞市,塘厦镇', '3', 'Tangxia', '0769', '523713');
INSERT INTO `e_r_sys_region` VALUES ('441929', '441900', '虎门', '虎门镇', '中国,广东省,东莞市,虎门镇', '3', 'Humen', '0769', '523932');
INSERT INTO `e_r_sys_region` VALUES ('441930', '441900', '厚街', '厚街镇', '中国,广东省,东莞市,厚街镇', '3', 'Houjie', '0769', '523960');
INSERT INTO `e_r_sys_region` VALUES ('441931', '441900', '凤岗', '凤岗镇', '中国,广东省,东莞市,凤岗镇', '3', 'Fenggang', '0769', '523690');
INSERT INTO `e_r_sys_region` VALUES ('441932', '441900', '长安', '长安镇', '中国,广东省,东莞市,长安镇', '3', 'Chang\'an', '0769', '523850');
INSERT INTO `e_r_sys_region` VALUES ('442000', '440000', '中山', '中山市', '中国,广东省,中山市', '2', 'Zhongshan', '0760', '528403');
INSERT INTO `e_r_sys_region` VALUES ('442001', '442000', '石岐', '石岐区', '中国,广东省,中山市,石岐区', '3', 'Shiqi', '0760', '528400');
INSERT INTO `e_r_sys_region` VALUES ('442004', '442000', '南区', '南区', '中国,广东省,中山市,南区', '3', 'Nanqu', '0760', '528400');
INSERT INTO `e_r_sys_region` VALUES ('442005', '442000', '五桂山', '五桂山区', '中国,广东省,中山市,五桂山区', '3', 'Wuguishan', '0760', '528458');
INSERT INTO `e_r_sys_region` VALUES ('442006', '442000', '火炬', '火炬开发区', '中国,广东省,中山市,火炬开发区', '3', 'Huoju', '0760', '528437');
INSERT INTO `e_r_sys_region` VALUES ('442007', '442000', '黄圃', '黄圃镇', '中国,广东省,中山市,黄圃镇', '3', 'Huangpu', '0760', '528429');
INSERT INTO `e_r_sys_region` VALUES ('442008', '442000', '南头', '南头镇', '中国,广东省,中山市,南头镇', '3', 'Nantou', '0760', '528421');
INSERT INTO `e_r_sys_region` VALUES ('442009', '442000', '东凤', '东凤镇', '中国,广东省,中山市,东凤镇', '3', 'Dongfeng', '0760', '528425');
INSERT INTO `e_r_sys_region` VALUES ('442010', '442000', '阜沙', '阜沙镇', '中国,广东省,中山市,阜沙镇', '3', 'Fusha', '0760', '528434');
INSERT INTO `e_r_sys_region` VALUES ('442011', '442000', '小榄', '小榄镇', '中国,广东省,中山市,小榄镇', '3', 'Xiaolan', '0760', '528415');
INSERT INTO `e_r_sys_region` VALUES ('442012', '442000', '东升', '东升镇', '中国,广东省,中山市,东升镇', '3', 'Dongsheng', '0760', '528400');
INSERT INTO `e_r_sys_region` VALUES ('442013', '442000', '古镇', '古镇镇', '中国,广东省,中山市,古镇镇', '3', 'Guzhen', '0760', '528422');
INSERT INTO `e_r_sys_region` VALUES ('442014', '442000', '横栏', '横栏镇', '中国,广东省,中山市,横栏镇', '3', 'Henglan', '0760', '528478');
INSERT INTO `e_r_sys_region` VALUES ('442015', '442000', '三角', '三角镇', '中国,广东省,中山市,三角镇', '3', 'Sanjiao', '0760', '528422');
INSERT INTO `e_r_sys_region` VALUES ('442016', '442000', '民众', '民众镇', '中国,广东省,中山市,民众镇', '3', 'Minzhong', '0760', '528441');
INSERT INTO `e_r_sys_region` VALUES ('442017', '442000', '南朗', '南朗镇', '中国,广东省,中山市,南朗镇', '3', 'Nanlang', '0760', '528454');
INSERT INTO `e_r_sys_region` VALUES ('442018', '442000', '港口', '港口镇', '中国,广东省,中山市,港口镇', '3', 'Gangkou', '0760', '528447');
INSERT INTO `e_r_sys_region` VALUES ('442019', '442000', '大涌', '大涌镇', '中国,广东省,中山市,大涌镇', '3', 'Dayong', '0760', '528476');
INSERT INTO `e_r_sys_region` VALUES ('442020', '442000', '沙溪', '沙溪镇', '中国,广东省,中山市,沙溪镇', '3', 'Shaxi', '0760', '528471');
INSERT INTO `e_r_sys_region` VALUES ('442021', '442000', '三乡', '三乡镇', '中国,广东省,中山市,三乡镇', '3', 'Sanxiang', '0760', '528463');
INSERT INTO `e_r_sys_region` VALUES ('442022', '442000', '板芙', '板芙镇', '中国,广东省,中山市,板芙镇', '3', 'Banfu', '0760', '528459');
INSERT INTO `e_r_sys_region` VALUES ('442023', '442000', '神湾', '神湾镇', '中国,广东省,中山市,神湾镇', '3', 'Shenwan', '0760', '528462');
INSERT INTO `e_r_sys_region` VALUES ('442024', '442000', '坦洲', '坦洲镇', '中国,广东省,中山市,坦洲镇', '3', 'Tanzhou', '0760', '528467');
INSERT INTO `e_r_sys_region` VALUES ('445100', '440000', '潮州', '潮州市', '中国,广东省,潮州市', '2', 'Chaozhou', '0768', '521000');
INSERT INTO `e_r_sys_region` VALUES ('445102', '445100', '湘桥', '湘桥区', '中国,广东省,潮州市,湘桥区', '3', 'Xiangqiao', '0768', '521000');
INSERT INTO `e_r_sys_region` VALUES ('445103', '445100', '潮安', '潮安区', '中国,广东省,潮州市,潮安区', '3', 'Chao\'an', '0768', '515638');
INSERT INTO `e_r_sys_region` VALUES ('445122', '445100', '饶平', '饶平县', '中国,广东省,潮州市,饶平县', '3', 'Raoping', '0768', '515700');
INSERT INTO `e_r_sys_region` VALUES ('445200', '440000', '揭阳', '揭阳市', '中国,广东省,揭阳市', '2', 'Jieyang', '0633', '522000');
INSERT INTO `e_r_sys_region` VALUES ('445202', '445200', '榕城', '榕城区', '中国,广东省,揭阳市,榕城区', '3', 'Rongcheng', '0633', '522000');
INSERT INTO `e_r_sys_region` VALUES ('445203', '445200', '揭东', '揭东区', '中国,广东省,揭阳市,揭东区', '3', 'Jiedong', '0633', '515500');
INSERT INTO `e_r_sys_region` VALUES ('445222', '445200', '揭西', '揭西县', '中国,广东省,揭阳市,揭西县', '3', 'Jiexi', '0633', '515400');
INSERT INTO `e_r_sys_region` VALUES ('445224', '445200', '惠来', '惠来县', '中国,广东省,揭阳市,惠来县', '3', 'Huilai', '0633', '515200');
INSERT INTO `e_r_sys_region` VALUES ('445281', '445200', '普宁', '普宁市', '中国,广东省,揭阳市,普宁市', '3', 'Puning', '0633', '515300');
INSERT INTO `e_r_sys_region` VALUES ('445300', '440000', '云浮', '云浮市', '中国,广东省,云浮市', '2', 'Yunfu', '0766', '527300');
INSERT INTO `e_r_sys_region` VALUES ('445302', '445300', '云城', '云城区', '中国,广东省,云浮市,云城区', '3', 'Yuncheng', '0766', '527300');
INSERT INTO `e_r_sys_region` VALUES ('445303', '445300', '云安', '云安区', '中国,广东省,云浮市,云安区', '3', 'Yun\'an', '0766', '527500');
INSERT INTO `e_r_sys_region` VALUES ('445321', '445300', '新兴', '新兴县', '中国,广东省,云浮市,新兴县', '3', 'Xinxing', '0766', '527400');
INSERT INTO `e_r_sys_region` VALUES ('445322', '445300', '郁南', '郁南县', '中国,广东省,云浮市,郁南县', '3', 'Yunan', '0766', '527100');
INSERT INTO `e_r_sys_region` VALUES ('445381', '445300', '罗定', '罗定市', '中国,广东省,云浮市,罗定市', '3', 'Luoding', '0766', '527200');
INSERT INTO `e_r_sys_region` VALUES ('450000', '100000', '广西', '广西壮族自治区', '中国,广西壮族自治区', '1', 'Guangxi', '', '');
INSERT INTO `e_r_sys_region` VALUES ('450100', '450000', '南宁', '南宁市', '中国,广西壮族自治区,南宁市', '2', 'Nanning', '0771', '530028');
INSERT INTO `e_r_sys_region` VALUES ('450102', '450100', '兴宁', '兴宁区', '中国,广西壮族自治区,南宁市,兴宁区', '3', 'Xingning', '0771', '530023');
INSERT INTO `e_r_sys_region` VALUES ('450103', '450100', '青秀', '青秀区', '中国,广西壮族自治区,南宁市,青秀区', '3', 'Qingxiu', '0771', '530213');
INSERT INTO `e_r_sys_region` VALUES ('450105', '450100', '江南', '江南区', '中国,广西壮族自治区,南宁市,江南区', '3', 'Jiangnan', '0771', '530031');
INSERT INTO `e_r_sys_region` VALUES ('450107', '450100', '西乡塘', '西乡塘区', '中国,广西壮族自治区,南宁市,西乡塘区', '3', 'Xixiangtang', '0771', '530001');
INSERT INTO `e_r_sys_region` VALUES ('450108', '450100', '良庆', '良庆区', '中国,广西壮族自治区,南宁市,良庆区', '3', 'Liangqing', '0771', '530219');
INSERT INTO `e_r_sys_region` VALUES ('450109', '450100', '邕宁', '邕宁区', '中国,广西壮族自治区,南宁市,邕宁区', '3', 'Yongning', '0771', '530200');
INSERT INTO `e_r_sys_region` VALUES ('450122', '450100', '武鸣', '武鸣县', '中国,广西壮族自治区,南宁市,武鸣县', '3', 'Wuming', '0771', '530100');
INSERT INTO `e_r_sys_region` VALUES ('450123', '450100', '隆安', '隆安县', '中国,广西壮族自治区,南宁市,隆安县', '3', 'Long\'an', '0771', '532700');
INSERT INTO `e_r_sys_region` VALUES ('450124', '450100', '马山', '马山县', '中国,广西壮族自治区,南宁市,马山县', '3', 'Mashan', '0771', '530600');
INSERT INTO `e_r_sys_region` VALUES ('450125', '450100', '上林', '上林县', '中国,广西壮族自治区,南宁市,上林县', '3', 'Shanglin', '0771', '530500');
INSERT INTO `e_r_sys_region` VALUES ('450126', '450100', '宾阳', '宾阳县', '中国,广西壮族自治区,南宁市,宾阳县', '3', 'Binyang', '0771', '530400');
INSERT INTO `e_r_sys_region` VALUES ('450127', '450100', '横县', '横县', '中国,广西壮族自治区,南宁市,横县', '3', 'Hengxian', '0771', '530300');
INSERT INTO `e_r_sys_region` VALUES ('450128', '450100', '埌东', '埌东新区', '中国,广西壮族自治区,南宁市,埌东新区', '3', 'Langdong', '0771', '530000');
INSERT INTO `e_r_sys_region` VALUES ('450200', '450000', '柳州', '柳州市', '中国,广西壮族自治区,柳州市', '2', 'Liuzhou', '0772', '545001');
INSERT INTO `e_r_sys_region` VALUES ('450202', '450200', '城中', '城中区', '中国,广西壮族自治区,柳州市,城中区', '3', 'Chengzhong', '0772', '545001');
INSERT INTO `e_r_sys_region` VALUES ('450203', '450200', '鱼峰', '鱼峰区', '中国,广西壮族自治区,柳州市,鱼峰区', '3', 'Yufeng', '0772', '545005');
INSERT INTO `e_r_sys_region` VALUES ('450204', '450200', '柳南', '柳南区', '中国,广西壮族自治区,柳州市,柳南区', '3', 'Liunan', '0772', '545007');
INSERT INTO `e_r_sys_region` VALUES ('450205', '450200', '柳北', '柳北区', '中国,广西壮族自治区,柳州市,柳北区', '3', 'Liubei', '0772', '545002');
INSERT INTO `e_r_sys_region` VALUES ('450221', '450200', '柳江', '柳江县', '中国,广西壮族自治区,柳州市,柳江县', '3', 'Liujiang', '0772', '545100');
INSERT INTO `e_r_sys_region` VALUES ('450222', '450200', '柳城', '柳城县', '中国,广西壮族自治区,柳州市,柳城县', '3', 'Liucheng', '0772', '545200');
INSERT INTO `e_r_sys_region` VALUES ('450223', '450200', '鹿寨', '鹿寨县', '中国,广西壮族自治区,柳州市,鹿寨县', '3', 'Luzhai', '0772', '545600');
INSERT INTO `e_r_sys_region` VALUES ('450224', '450200', '融安', '融安县', '中国,广西壮族自治区,柳州市,融安县', '3', 'Rong\'an', '0772', '545400');
INSERT INTO `e_r_sys_region` VALUES ('450225', '450200', '融水', '融水苗族自治县', '中国,广西壮族自治区,柳州市,融水苗族自治县', '3', 'Rongshui', '0772', '545300');
INSERT INTO `e_r_sys_region` VALUES ('450226', '450200', '三江', '三江侗族自治县', '中国,广西壮族自治区,柳州市,三江侗族自治县', '3', 'Sanjiang', '0772', '545500');
INSERT INTO `e_r_sys_region` VALUES ('450227', '450200', '柳东', '柳东新区', '中国,广西壮族自治区,柳州市,柳东新区', '3', 'Liudong', '0772', '545000');
INSERT INTO `e_r_sys_region` VALUES ('450300', '450000', '桂林', '桂林市', '中国,广西壮族自治区,桂林市', '2', 'Guilin', '0773', '541100');
INSERT INTO `e_r_sys_region` VALUES ('450302', '450300', '秀峰', '秀峰区', '中国,广西壮族自治区,桂林市,秀峰区', '3', 'Xiufeng', '0773', '541001');
INSERT INTO `e_r_sys_region` VALUES ('450303', '450300', '叠彩', '叠彩区', '中国,广西壮族自治区,桂林市,叠彩区', '3', 'Diecai', '0773', '541001');
INSERT INTO `e_r_sys_region` VALUES ('450304', '450300', '象山', '象山区', '中国,广西壮族自治区,桂林市,象山区', '3', 'Xiangshan', '0773', '541002');
INSERT INTO `e_r_sys_region` VALUES ('450305', '450300', '七星', '七星区', '中国,广西壮族自治区,桂林市,七星区', '3', 'Qixing', '0773', '541004');
INSERT INTO `e_r_sys_region` VALUES ('450311', '450300', '雁山', '雁山区', '中国,广西壮族自治区,桂林市,雁山区', '3', 'Yanshan', '0773', '541006');
INSERT INTO `e_r_sys_region` VALUES ('450312', '450300', '临桂', '临桂区', '中国,广西壮族自治区,桂林市,临桂区', '3', 'Lingui', '0773', '541100');
INSERT INTO `e_r_sys_region` VALUES ('450321', '450300', '阳朔', '阳朔县', '中国,广西壮族自治区,桂林市,阳朔县', '3', 'Yangshuo', '0773', '541900');
INSERT INTO `e_r_sys_region` VALUES ('450323', '450300', '灵川', '灵川县', '中国,广西壮族自治区,桂林市,灵川县', '3', 'Lingchuan', '0773', '541200');
INSERT INTO `e_r_sys_region` VALUES ('450324', '450300', '全州', '全州县', '中国,广西壮族自治区,桂林市,全州县', '3', 'Quanzhou', '0773', '541503');
INSERT INTO `e_r_sys_region` VALUES ('450325', '450300', '兴安', '兴安县', '中国,广西壮族自治区,桂林市,兴安县', '3', 'Xing\'an', '0773', '541300');
INSERT INTO `e_r_sys_region` VALUES ('450326', '450300', '永福', '永福县', '中国,广西壮族自治区,桂林市,永福县', '3', 'Yongfu', '0773', '541800');
INSERT INTO `e_r_sys_region` VALUES ('450327', '450300', '灌阳', '灌阳县', '中国,广西壮族自治区,桂林市,灌阳县', '3', 'Guanyang', '0773', '541600');
INSERT INTO `e_r_sys_region` VALUES ('450328', '450300', '龙胜', '龙胜各族自治县', '中国,广西壮族自治区,桂林市,龙胜各族自治县', '3', 'Longsheng', '0773', '541700');
INSERT INTO `e_r_sys_region` VALUES ('450329', '450300', '资源', '资源县', '中国,广西壮族自治区,桂林市,资源县', '3', 'Ziyuan', '0773', '541400');
INSERT INTO `e_r_sys_region` VALUES ('450330', '450300', '平乐', '平乐县', '中国,广西壮族自治区,桂林市,平乐县', '3', 'Pingle', '0773', '542400');
INSERT INTO `e_r_sys_region` VALUES ('450331', '450300', '荔浦', '荔浦县', '中国,广西壮族自治区,桂林市,荔浦县', '3', 'Lipu', '0773', '546600');
INSERT INTO `e_r_sys_region` VALUES ('450332', '450300', '恭城', '恭城瑶族自治县', '中国,广西壮族自治区,桂林市,恭城瑶族自治县', '3', 'Gongcheng', '0773', '542500');
INSERT INTO `e_r_sys_region` VALUES ('450400', '450000', '梧州', '梧州市', '中国,广西壮族自治区,梧州市', '2', 'Wuzhou', '0774', '543002');
INSERT INTO `e_r_sys_region` VALUES ('450403', '450400', '万秀', '万秀区', '中国,广西壮族自治区,梧州市,万秀区', '3', 'Wanxiu', '0774', '543000');
INSERT INTO `e_r_sys_region` VALUES ('450405', '450400', '长洲', '长洲区', '中国,广西壮族自治区,梧州市,长洲区', '3', 'Changzhou', '0774', '543003');
INSERT INTO `e_r_sys_region` VALUES ('450406', '450400', '龙圩', '龙圩区', '中国,广西壮族自治区,梧州市,龙圩区', '3', 'Longxu', '0774', '543002');
INSERT INTO `e_r_sys_region` VALUES ('450421', '450400', '苍梧', '苍梧县', '中国,广西壮族自治区,梧州市,苍梧县', '3', 'Cangwu', '0774', '543100');
INSERT INTO `e_r_sys_region` VALUES ('450422', '450400', '藤县', '藤县', '中国,广西壮族自治区,梧州市,藤县', '3', 'Tengxian', '0774', '543300');
INSERT INTO `e_r_sys_region` VALUES ('450423', '450400', '蒙山', '蒙山县', '中国,广西壮族自治区,梧州市,蒙山县', '3', 'Mengshan', '0774', '546700');
INSERT INTO `e_r_sys_region` VALUES ('450481', '450400', '岑溪', '岑溪市', '中国,广西壮族自治区,梧州市,岑溪市', '3', 'Cenxi', '0774', '543200');
INSERT INTO `e_r_sys_region` VALUES ('450500', '450000', '北海', '北海市', '中国,广西壮族自治区,北海市', '2', 'Beihai', '0779', '536000');
INSERT INTO `e_r_sys_region` VALUES ('450502', '450500', '海城', '海城区', '中国,广西壮族自治区,北海市,海城区', '3', 'Haicheng', '0779', '536000');
INSERT INTO `e_r_sys_region` VALUES ('450503', '450500', '银海', '银海区', '中国,广西壮族自治区,北海市,银海区', '3', 'Yinhai', '0779', '536000');
INSERT INTO `e_r_sys_region` VALUES ('450512', '450500', '铁山港', '铁山港区', '中国,广西壮族自治区,北海市,铁山港区', '3', 'Tieshangang', '0779', '536017');
INSERT INTO `e_r_sys_region` VALUES ('450521', '450500', '合浦', '合浦县', '中国,广西壮族自治区,北海市,合浦县', '3', 'Hepu', '0779', '536100');
INSERT INTO `e_r_sys_region` VALUES ('450600', '450000', '防城港', '防城港市', '中国,广西壮族自治区,防城港市', '2', 'Fangchenggang', '0770', '538001');
INSERT INTO `e_r_sys_region` VALUES ('450602', '450600', '港口', '港口区', '中国,广西壮族自治区,防城港市,港口区', '3', 'Gangkou', '0770', '538001');
INSERT INTO `e_r_sys_region` VALUES ('450603', '450600', '防城', '防城区', '中国,广西壮族自治区,防城港市,防城区', '3', 'Fangcheng', '0770', '538021');
INSERT INTO `e_r_sys_region` VALUES ('450621', '450600', '上思', '上思县', '中国,广西壮族自治区,防城港市,上思县', '3', 'Shangsi', '0770', '535500');
INSERT INTO `e_r_sys_region` VALUES ('450681', '450600', '东兴', '东兴市', '中国,广西壮族自治区,防城港市,东兴市', '3', 'Dongxing', '0770', '538100');
INSERT INTO `e_r_sys_region` VALUES ('450700', '450000', '钦州', '钦州市', '中国,广西壮族自治区,钦州市', '2', 'Qinzhou', '0777', '535099');
INSERT INTO `e_r_sys_region` VALUES ('450702', '450700', '钦南', '钦南区', '中国,广西壮族自治区,钦州市,钦南区', '3', 'Qinnan', '0777', '535099');
INSERT INTO `e_r_sys_region` VALUES ('450703', '450700', '钦北', '钦北区', '中国,广西壮族自治区,钦州市,钦北区', '3', 'Qinbei', '0777', '535099');
INSERT INTO `e_r_sys_region` VALUES ('450721', '450700', '灵山', '灵山县', '中国,广西壮族自治区,钦州市,灵山县', '3', 'Lingshan', '0777', '535099');
INSERT INTO `e_r_sys_region` VALUES ('450722', '450700', '浦北', '浦北县', '中国,广西壮族自治区,钦州市,浦北县', '3', 'Pubei', '0777', '535099');
INSERT INTO `e_r_sys_region` VALUES ('450800', '450000', '贵港', '贵港市', '中国,广西壮族自治区,贵港市', '2', 'Guigang', '0775', '537100');
INSERT INTO `e_r_sys_region` VALUES ('450802', '450800', '港北', '港北区', '中国,广西壮族自治区,贵港市,港北区', '3', 'Gangbei', '0775', '537100');
INSERT INTO `e_r_sys_region` VALUES ('450803', '450800', '港南', '港南区', '中国,广西壮族自治区,贵港市,港南区', '3', 'Gangnan', '0775', '537100');
INSERT INTO `e_r_sys_region` VALUES ('450804', '450800', '覃塘', '覃塘区', '中国,广西壮族自治区,贵港市,覃塘区', '3', 'Qintang', '0775', '537121');
INSERT INTO `e_r_sys_region` VALUES ('450821', '450800', '平南', '平南县', '中国,广西壮族自治区,贵港市,平南县', '3', 'Pingnan', '0775', '537300');
INSERT INTO `e_r_sys_region` VALUES ('450881', '450800', '桂平', '桂平市', '中国,广西壮族自治区,贵港市,桂平市', '3', 'Guiping', '0775', '537200');
INSERT INTO `e_r_sys_region` VALUES ('450900', '450000', '玉林', '玉林市', '中国,广西壮族自治区,玉林市', '2', 'Yulin', '0775', '537000');
INSERT INTO `e_r_sys_region` VALUES ('450902', '450900', '玉州', '玉州区', '中国,广西壮族自治区,玉林市,玉州区', '3', 'Yuzhou', '0775', '537000');
INSERT INTO `e_r_sys_region` VALUES ('450903', '450900', '福绵', '福绵区', '中国,广西壮族自治区,玉林市,福绵区', '3', 'Fumian', '0775', '537023');
INSERT INTO `e_r_sys_region` VALUES ('450904', '450900', '玉东', '玉东新区', '中国,广西壮族自治区,玉林市,玉东新区', '3', 'Yudong', '0775', '537000');
INSERT INTO `e_r_sys_region` VALUES ('450921', '450900', '容县', '容县', '中国,广西壮族自治区,玉林市,容县', '3', 'Rongxian', '0775', '537500');
INSERT INTO `e_r_sys_region` VALUES ('450922', '450900', '陆川', '陆川县', '中国,广西壮族自治区,玉林市,陆川县', '3', 'Luchuan', '0775', '537700');
INSERT INTO `e_r_sys_region` VALUES ('450923', '450900', '博白', '博白县', '中国,广西壮族自治区,玉林市,博白县', '3', 'Bobai', '0775', '537600');
INSERT INTO `e_r_sys_region` VALUES ('450924', '450900', '兴业', '兴业县', '中国,广西壮族自治区,玉林市,兴业县', '3', 'Xingye', '0775', '537800');
INSERT INTO `e_r_sys_region` VALUES ('450981', '450900', '北流', '北流市', '中国,广西壮族自治区,玉林市,北流市', '3', 'Beiliu', '0775', '537400');
INSERT INTO `e_r_sys_region` VALUES ('451000', '450000', '百色', '百色市', '中国,广西壮族自治区,百色市', '2', 'Baise', '0776', '533000');
INSERT INTO `e_r_sys_region` VALUES ('451002', '451000', '右江', '右江区', '中国,广西壮族自治区,百色市,右江区', '3', 'Youjiang', '0776', '533000');
INSERT INTO `e_r_sys_region` VALUES ('451021', '451000', '田阳', '田阳县', '中国,广西壮族自治区,百色市,田阳县', '3', 'Tianyang', '0776', '533600');
INSERT INTO `e_r_sys_region` VALUES ('451022', '451000', '田东', '田东县', '中国,广西壮族自治区,百色市,田东县', '3', 'Tiandong', '0776', '531500');
INSERT INTO `e_r_sys_region` VALUES ('451023', '451000', '平果', '平果县', '中国,广西壮族自治区,百色市,平果县', '3', 'Pingguo', '0776', '531400');
INSERT INTO `e_r_sys_region` VALUES ('451024', '451000', '德保', '德保县', '中国,广西壮族自治区,百色市,德保县', '3', 'Debao', '0776', '533700');
INSERT INTO `e_r_sys_region` VALUES ('451025', '451000', '靖西', '靖西县', '中国,广西壮族自治区,百色市,靖西县', '3', 'Jingxi', '0776', '533800');
INSERT INTO `e_r_sys_region` VALUES ('451026', '451000', '那坡', '那坡县', '中国,广西壮族自治区,百色市,那坡县', '3', 'Napo', '0776', '533900');
INSERT INTO `e_r_sys_region` VALUES ('451027', '451000', '凌云', '凌云县', '中国,广西壮族自治区,百色市,凌云县', '3', 'Lingyun', '0776', '533100');
INSERT INTO `e_r_sys_region` VALUES ('451028', '451000', '乐业', '乐业县', '中国,广西壮族自治区,百色市,乐业县', '3', 'Leye', '0776', '533200');
INSERT INTO `e_r_sys_region` VALUES ('451029', '451000', '田林', '田林县', '中国,广西壮族自治区,百色市,田林县', '3', 'Tianlin', '0776', '533300');
INSERT INTO `e_r_sys_region` VALUES ('451030', '451000', '西林', '西林县', '中国,广西壮族自治区,百色市,西林县', '3', 'Xilin', '0776', '533500');
INSERT INTO `e_r_sys_region` VALUES ('451031', '451000', '隆林', '隆林各族自治县', '中国,广西壮族自治区,百色市,隆林各族自治县', '3', 'Longlin', '0776', '533400');
INSERT INTO `e_r_sys_region` VALUES ('451100', '450000', '贺州', '贺州市', '中国,广西壮族自治区,贺州市', '2', 'Hezhou', '0774', '542800');
INSERT INTO `e_r_sys_region` VALUES ('451102', '451100', '八步', '八步区', '中国,广西壮族自治区,贺州市,八步区', '3', 'Babu', '0774', '542800');
INSERT INTO `e_r_sys_region` VALUES ('451121', '451100', '昭平', '昭平县', '中国,广西壮族自治区,贺州市,昭平县', '3', 'Zhaoping', '0774', '546800');
INSERT INTO `e_r_sys_region` VALUES ('451122', '451100', '钟山', '钟山县', '中国,广西壮族自治区,贺州市,钟山县', '3', 'Zhongshan', '0774', '542600');
INSERT INTO `e_r_sys_region` VALUES ('451123', '451100', '富川', '富川瑶族自治县', '中国,广西壮族自治区,贺州市,富川瑶族自治县', '3', 'Fuchuan', '0774', '542700');
INSERT INTO `e_r_sys_region` VALUES ('451124', '451100', '平桂', '平桂管理区', '中国,广西壮族自治区,贺州市,平桂管理区', '3', 'Pingui', '0774', '542800');
INSERT INTO `e_r_sys_region` VALUES ('451200', '450000', '河池', '河池市', '中国,广西壮族自治区,河池市', '2', 'Hechi', '0778', '547000');
INSERT INTO `e_r_sys_region` VALUES ('451202', '451200', '金城江', '金城江区', '中国,广西壮族自治区,河池市,金城江区', '3', 'Jinchengjiang', '0779', '547000');
INSERT INTO `e_r_sys_region` VALUES ('451221', '451200', '南丹', '南丹县', '中国,广西壮族自治区,河池市,南丹县', '3', 'Nandan', '0781', '547200');
INSERT INTO `e_r_sys_region` VALUES ('451222', '451200', '天峨', '天峨县', '中国,广西壮族自治区,河池市,天峨县', '3', 'Tiane', '0782', '547300');
INSERT INTO `e_r_sys_region` VALUES ('451223', '451200', '凤山', '凤山县', '中国,广西壮族自治区,河池市,凤山县', '3', 'Fengshan', '0783', '547600');
INSERT INTO `e_r_sys_region` VALUES ('451224', '451200', '东兰', '东兰县', '中国,广西壮族自治区,河池市,东兰县', '3', 'Donglan', '0784', '547400');
INSERT INTO `e_r_sys_region` VALUES ('451225', '451200', '罗城', '罗城仫佬族自治县', '中国,广西壮族自治区,河池市,罗城仫佬族自治县', '3', 'Luocheng', '0785', '546400');
INSERT INTO `e_r_sys_region` VALUES ('451226', '451200', '环江', '环江毛南族自治县', '中国,广西壮族自治区,河池市,环江毛南族自治县', '3', 'Huanjiang', '0786', '547100');
INSERT INTO `e_r_sys_region` VALUES ('451227', '451200', '巴马', '巴马瑶族自治县', '中国,广西壮族自治区,河池市,巴马瑶族自治县', '3', 'Bama', '0787', '547500');
INSERT INTO `e_r_sys_region` VALUES ('451228', '451200', '都安', '都安瑶族自治县', '中国,广西壮族自治区,河池市,都安瑶族自治县', '3', 'Du\'an', '0788', '530700');
INSERT INTO `e_r_sys_region` VALUES ('451229', '451200', '大化', '大化瑶族自治县', '中国,广西壮族自治区,河池市,大化瑶族自治县', '3', 'Dahua', '0789', '530800');
INSERT INTO `e_r_sys_region` VALUES ('451281', '451200', '宜州', '宜州市', '中国,广西壮族自治区,河池市,宜州市', '3', 'Yizhou', '0780', '546300');
INSERT INTO `e_r_sys_region` VALUES ('451300', '450000', '来宾', '来宾市', '中国,广西壮族自治区,来宾市', '2', 'Laibin', '0772', '546100');
INSERT INTO `e_r_sys_region` VALUES ('451302', '451300', '兴宾', '兴宾区', '中国,广西壮族自治区,来宾市,兴宾区', '3', 'Xingbin', '0772', '546100');
INSERT INTO `e_r_sys_region` VALUES ('451321', '451300', '忻城', '忻城县', '中国,广西壮族自治区,来宾市,忻城县', '3', 'Xincheng', '0772', '546200');
INSERT INTO `e_r_sys_region` VALUES ('451322', '451300', '象州', '象州县', '中国,广西壮族自治区,来宾市,象州县', '3', 'Xiangzhou', '0772', '545800');
INSERT INTO `e_r_sys_region` VALUES ('451323', '451300', '武宣', '武宣县', '中国,广西壮族自治区,来宾市,武宣县', '3', 'Wuxuan', '0772', '545900');
INSERT INTO `e_r_sys_region` VALUES ('451324', '451300', '金秀', '金秀瑶族自治县', '中国,广西壮族自治区,来宾市,金秀瑶族自治县', '3', 'Jinxiu', '0772', '545799');
INSERT INTO `e_r_sys_region` VALUES ('451381', '451300', '合山', '合山市', '中国,广西壮族自治区,来宾市,合山市', '3', 'Heshan', '0772', '546500');
INSERT INTO `e_r_sys_region` VALUES ('451400', '450000', '崇左', '崇左市', '中国,广西壮族自治区,崇左市', '2', 'Chongzuo', '0771', '532299');
INSERT INTO `e_r_sys_region` VALUES ('451402', '451400', '江州', '江州区', '中国,广西壮族自治区,崇左市,江州区', '3', 'Jiangzhou', '0771', '532299');
INSERT INTO `e_r_sys_region` VALUES ('451421', '451400', '扶绥', '扶绥县', '中国,广西壮族自治区,崇左市,扶绥县', '3', 'Fusui', '0771', '532199');
INSERT INTO `e_r_sys_region` VALUES ('451422', '451400', '宁明', '宁明县', '中国,广西壮族自治区,崇左市,宁明县', '3', 'Ningming', '0771', '532599');
INSERT INTO `e_r_sys_region` VALUES ('451423', '451400', '龙州', '龙州县', '中国,广西壮族自治区,崇左市,龙州县', '3', 'Longzhou', '0771', '532499');
INSERT INTO `e_r_sys_region` VALUES ('451424', '451400', '大新', '大新县', '中国,广西壮族自治区,崇左市,大新县', '3', 'Daxin', '0771', '532399');
INSERT INTO `e_r_sys_region` VALUES ('451425', '451400', '天等', '天等县', '中国,广西壮族自治区,崇左市,天等县', '3', 'Tiandeng', '0771', '532899');
INSERT INTO `e_r_sys_region` VALUES ('451481', '451400', '凭祥', '凭祥市', '中国,广西壮族自治区,崇左市,凭祥市', '3', 'Pingxiang', '0771', '532699');
INSERT INTO `e_r_sys_region` VALUES ('460000', '100000', '海南', '海南省', '中国,海南省', '1', 'Hainan', '', '');
INSERT INTO `e_r_sys_region` VALUES ('460100', '460000', '海口', '海口市', '中国,海南省,海口市', '2', 'Haikou', '0898', '570000');
INSERT INTO `e_r_sys_region` VALUES ('460105', '460100', '秀英', '秀英区', '中国,海南省,海口市,秀英区', '3', 'Xiuying', '0898', '570311');
INSERT INTO `e_r_sys_region` VALUES ('460106', '460100', '龙华', '龙华区', '中国,海南省,海口市,龙华区', '3', 'Longhua', '0898', '570145');
INSERT INTO `e_r_sys_region` VALUES ('460107', '460100', '琼山', '琼山区', '中国,海南省,海口市,琼山区', '3', 'Qiongshan', '0898', '571100');
INSERT INTO `e_r_sys_region` VALUES ('460108', '460100', '美兰', '美兰区', '中国,海南省,海口市,美兰区', '3', 'Meilan', '0898', '570203');
INSERT INTO `e_r_sys_region` VALUES ('460200', '460000', '三亚', '三亚市', '中国,海南省,三亚市', '2', 'Sanya', '0898', '572000');
INSERT INTO `e_r_sys_region` VALUES ('460202', '460200', '海棠', '海棠区', '中国,海南省,三亚市,海棠区', '3', 'Haitang', '0898', '572000');
INSERT INTO `e_r_sys_region` VALUES ('460203', '460200', '吉阳', '吉阳区', '中国,海南省,三亚市,吉阳区', '3', 'Jiyang', '0898', '572000');
INSERT INTO `e_r_sys_region` VALUES ('460204', '460200', '天涯', '天涯区', '中国,海南省,三亚市,天涯区', '3', 'Tianya', '0898', '572000');
INSERT INTO `e_r_sys_region` VALUES ('460205', '460200', '崖州', '崖州区', '中国,海南省,三亚市,崖州区', '3', 'Yazhou', '0898', '572000');
INSERT INTO `e_r_sys_region` VALUES ('460300', '460000', '三沙', '三沙市', '中国,海南省,三沙市', '2', 'Sansha', '0898', '573199');
INSERT INTO `e_r_sys_region` VALUES ('460321', '460300', '西沙', '西沙群岛', '中国,海南省,三沙市,西沙群岛', '3', 'Xisha Islands', '0898', '572000');
INSERT INTO `e_r_sys_region` VALUES ('460322', '460300', '南沙', '南沙群岛', '中国,海南省,三沙市,南沙群岛', '3', 'Nansha Islands', '0898', '573100');
INSERT INTO `e_r_sys_region` VALUES ('460323', '460300', '中沙', '中沙群岛', '中国,海南省,三沙市,中沙群岛', '3', 'Zhongsha Islands', '0898', '573100');
INSERT INTO `e_r_sys_region` VALUES ('469000', '460000', ' ', '直辖县级', '中国,海南省,直辖县级', '2', '', '', '');
INSERT INTO `e_r_sys_region` VALUES ('469001', '469000', '五指山', '五指山市', '中国,海南省,直辖县级,五指山市', '3', 'Wuzhishan', '0898', '572200');
INSERT INTO `e_r_sys_region` VALUES ('469002', '469000', '琼海', '琼海市', '中国,海南省,直辖县级,琼海市', '3', 'Qionghai', '0898', '571400');
INSERT INTO `e_r_sys_region` VALUES ('469003', '469000', '儋州', '儋州市', '中国,海南省,直辖县级,儋州市', '3', 'Danzhou', '0898', '571700');
INSERT INTO `e_r_sys_region` VALUES ('469005', '469000', '文昌', '文昌市', '中国,海南省,直辖县级,文昌市', '3', 'Wenchang', '0898', '571339');
INSERT INTO `e_r_sys_region` VALUES ('469006', '469000', '万宁', '万宁市', '中国,海南省,直辖县级,万宁市', '3', 'Wanning', '0898', '571500');
INSERT INTO `e_r_sys_region` VALUES ('469007', '469000', '东方', '东方市', '中国,海南省,直辖县级,东方市', '3', 'Dongfang', '0898', '572600');
INSERT INTO `e_r_sys_region` VALUES ('469021', '469000', '定安', '定安县', '中国,海南省,直辖县级,定安县', '3', 'Ding\'an', '0898', '571200');
INSERT INTO `e_r_sys_region` VALUES ('469022', '469000', '屯昌', '屯昌县', '中国,海南省,直辖县级,屯昌县', '3', 'Tunchang', '0898', '571600');
INSERT INTO `e_r_sys_region` VALUES ('469023', '469000', '澄迈', '澄迈县', '中国,海南省,直辖县级,澄迈县', '3', 'Chengmai', '0898', '571900');
INSERT INTO `e_r_sys_region` VALUES ('469024', '469000', '临高', '临高县', '中国,海南省,直辖县级,临高县', '3', 'Lingao', '0898', '571800');
INSERT INTO `e_r_sys_region` VALUES ('469025', '469000', '白沙', '白沙黎族自治县', '中国,海南省,直辖县级,白沙黎族自治县', '3', 'Baisha', '0898', '572800');
INSERT INTO `e_r_sys_region` VALUES ('469026', '469000', '昌江', '昌江黎族自治县', '中国,海南省,直辖县级,昌江黎族自治县', '3', 'Changjiang', '0898', '572700');
INSERT INTO `e_r_sys_region` VALUES ('469027', '469000', '乐东', '乐东黎族自治县', '中国,海南省,直辖县级,乐东黎族自治县', '3', 'Ledong', '0898', '572500');
INSERT INTO `e_r_sys_region` VALUES ('469028', '469000', '陵水', '陵水黎族自治县', '中国,海南省,直辖县级,陵水黎族自治县', '3', 'Lingshui', '0898', '572400');
INSERT INTO `e_r_sys_region` VALUES ('469029', '469000', '保亭', '保亭黎族苗族自治县', '中国,海南省,直辖县级,保亭黎族苗族自治县', '3', 'Baoting', '0898', '572300');
INSERT INTO `e_r_sys_region` VALUES ('469030', '469000', '琼中', '琼中黎族苗族自治县', '中国,海南省,直辖县级,琼中黎族苗族自治县', '3', 'Qiongzhong', '0898', '572900');
INSERT INTO `e_r_sys_region` VALUES ('500000', '100000', '重庆', '重庆', '中国,重庆', '1', 'Chongqing', '', '');
INSERT INTO `e_r_sys_region` VALUES ('500100', '500000', '重庆', '重庆市', '中国,重庆,重庆市', '2', 'Chongqing', '023', '400000');
INSERT INTO `e_r_sys_region` VALUES ('500101', '500100', '万州', '万州区', '中国,重庆,重庆市,万州区', '3', 'Wanzhou', '023', '404000');
INSERT INTO `e_r_sys_region` VALUES ('500102', '500100', '涪陵', '涪陵区', '中国,重庆,重庆市,涪陵区', '3', 'Fuling', '023', '408000');
INSERT INTO `e_r_sys_region` VALUES ('500103', '500100', '渝中', '渝中区', '中国,重庆,重庆市,渝中区', '3', 'Yuzhong', '023', '400010');
INSERT INTO `e_r_sys_region` VALUES ('500104', '500100', '大渡口', '大渡口区', '中国,重庆,重庆市,大渡口区', '3', 'Dadukou', '023', '400080');
INSERT INTO `e_r_sys_region` VALUES ('500105', '500100', '江北', '江北区', '中国,重庆,重庆市,江北区', '3', 'Jiangbei', '023', '400020');
INSERT INTO `e_r_sys_region` VALUES ('500106', '500100', '沙坪坝', '沙坪坝区', '中国,重庆,重庆市,沙坪坝区', '3', 'Shapingba', '023', '400030');
INSERT INTO `e_r_sys_region` VALUES ('500107', '500100', '九龙坡', '九龙坡区', '中国,重庆,重庆市,九龙坡区', '3', 'Jiulongpo', '023', '400050');
INSERT INTO `e_r_sys_region` VALUES ('500108', '500100', '南岸', '南岸区', '中国,重庆,重庆市,南岸区', '3', 'Nan\'an', '023', '400064');
INSERT INTO `e_r_sys_region` VALUES ('500109', '500100', '北碚', '北碚区', '中国,重庆,重庆市,北碚区', '3', 'Beibei', '023', '400700');
INSERT INTO `e_r_sys_region` VALUES ('500110', '500100', '綦江', '綦江区', '中国,重庆,重庆市,綦江区', '3', 'Qijiang', '023', '400800');
INSERT INTO `e_r_sys_region` VALUES ('500111', '500100', '大足', '大足区', '中国,重庆,重庆市,大足区', '3', 'Dazu', '023', '400900');
INSERT INTO `e_r_sys_region` VALUES ('500112', '500100', '渝北', '渝北区', '中国,重庆,重庆市,渝北区', '3', 'Yubei', '023', '401120');
INSERT INTO `e_r_sys_region` VALUES ('500113', '500100', '巴南', '巴南区', '中国,重庆,重庆市,巴南区', '3', 'Banan', '023', '401320');
INSERT INTO `e_r_sys_region` VALUES ('500114', '500100', '黔江', '黔江区', '中国,重庆,重庆市,黔江区', '3', 'Qianjiang', '023', '409700');
INSERT INTO `e_r_sys_region` VALUES ('500115', '500100', '长寿', '长寿区', '中国,重庆,重庆市,长寿区', '3', 'Changshou', '023', '401220');
INSERT INTO `e_r_sys_region` VALUES ('500116', '500100', '江津', '江津区', '中国,重庆,重庆市,江津区', '3', 'Jiangjin', '023', '402260');
INSERT INTO `e_r_sys_region` VALUES ('500117', '500100', '合川', '合川区', '中国,重庆,重庆市,合川区', '3', 'Hechuan', '023', '401520');
INSERT INTO `e_r_sys_region` VALUES ('500118', '500100', '永川', '永川区', '中国,重庆,重庆市,永川区', '3', 'Yongchuan', '023', '402160');
INSERT INTO `e_r_sys_region` VALUES ('500119', '500100', '南川', '南川区', '中国,重庆,重庆市,南川区', '3', 'Nanchuan', '023', '408400');
INSERT INTO `e_r_sys_region` VALUES ('500120', '500100', '璧山', '璧山区', '中国,重庆,重庆市,璧山区', '3', 'Bishan', '023', '402760');
INSERT INTO `e_r_sys_region` VALUES ('500151', '500100', '铜梁', '铜梁区', '中国,重庆,重庆市,铜梁区', '3', 'Tongliang', '023', '402560');
INSERT INTO `e_r_sys_region` VALUES ('500223', '500100', '潼南', '潼南县', '中国,重庆,重庆市,潼南县', '3', 'Tongnan', '023', '402660');
INSERT INTO `e_r_sys_region` VALUES ('500226', '500100', '荣昌', '荣昌县', '中国,重庆,重庆市,荣昌县', '3', 'Rongchang', '023', '402460');
INSERT INTO `e_r_sys_region` VALUES ('500228', '500100', '梁平', '梁平县', '中国,重庆,重庆市,梁平县', '3', 'Liangping', '023', '405200');
INSERT INTO `e_r_sys_region` VALUES ('500229', '500100', '城口', '城口县', '中国,重庆,重庆市,城口县', '3', 'Chengkou', '023', '405900');
INSERT INTO `e_r_sys_region` VALUES ('500230', '500100', '丰都', '丰都县', '中国,重庆,重庆市,丰都县', '3', 'Fengdu', '023', '408200');
INSERT INTO `e_r_sys_region` VALUES ('500231', '500100', '垫江', '垫江县', '中国,重庆,重庆市,垫江县', '3', 'Dianjiang', '023', '408300');
INSERT INTO `e_r_sys_region` VALUES ('500232', '500100', '武隆', '武隆县', '中国,重庆,重庆市,武隆县', '3', 'Wulong', '023', '408500');
INSERT INTO `e_r_sys_region` VALUES ('500233', '500100', '忠县', '忠县', '中国,重庆,重庆市,忠县', '3', 'Zhongxian', '023', '404300');
INSERT INTO `e_r_sys_region` VALUES ('500234', '500100', '开县', '开县', '中国,重庆,重庆市,开县', '3', 'Kaixian', '023', '405400');
INSERT INTO `e_r_sys_region` VALUES ('500235', '500100', '云阳', '云阳县', '中国,重庆,重庆市,云阳县', '3', 'Yunyang', '023', '404500');
INSERT INTO `e_r_sys_region` VALUES ('500236', '500100', '奉节', '奉节县', '中国,重庆,重庆市,奉节县', '3', 'Fengjie', '023', '404600');
INSERT INTO `e_r_sys_region` VALUES ('500237', '500100', '巫山', '巫山县', '中国,重庆,重庆市,巫山县', '3', 'Wushan', '023', '404700');
INSERT INTO `e_r_sys_region` VALUES ('500238', '500100', '巫溪', '巫溪县', '中国,重庆,重庆市,巫溪县', '3', 'Wuxi', '023', '405800');
INSERT INTO `e_r_sys_region` VALUES ('500240', '500100', '石柱', '石柱土家族自治县', '中国,重庆,重庆市,石柱土家族自治县', '3', 'Shizhu', '023', '409100');
INSERT INTO `e_r_sys_region` VALUES ('500241', '500100', '秀山', '秀山土家族苗族自治县', '中国,重庆,重庆市,秀山土家族苗族自治县', '3', 'Xiushan', '023', '409900');
INSERT INTO `e_r_sys_region` VALUES ('500242', '500100', '酉阳', '酉阳土家族苗族自治县', '中国,重庆,重庆市,酉阳土家族苗族自治县', '3', 'Youyang', '023', '409800');
INSERT INTO `e_r_sys_region` VALUES ('500243', '500100', '彭水', '彭水苗族土家族自治县', '中国,重庆,重庆市,彭水苗族土家族自治县', '3', 'Pengshui', '023', '409600');
INSERT INTO `e_r_sys_region` VALUES ('500300', '500000', '两江新区', '两江新区', '中国,重庆,两江新区', '2', 'Liangjiangxinqu', '023', '400000');
INSERT INTO `e_r_sys_region` VALUES ('500301', '500300', '北部新区', '北部新区', '中国,重庆,两江新区,北部新区', '3', 'Beibuxinqu', '023', '400000');
INSERT INTO `e_r_sys_region` VALUES ('500302', '500300', '保税港区', '保税港区', '中国,重庆,两江新区,保税港区', '3', 'Baoshuigangqu', '023', '400000');
INSERT INTO `e_r_sys_region` VALUES ('500303', '500300', '工业园区', '工业园区', '中国,重庆,两江新区,工业园区', '3', 'Gongyeyuanqu', '023', '400000');
INSERT INTO `e_r_sys_region` VALUES ('510000', '100000', '四川', '四川省', '中国,四川省', '1', 'Sichuan', '', '');
INSERT INTO `e_r_sys_region` VALUES ('510100', '510000', '成都', '成都市', '中国,四川省,成都市', '2', 'Chengdu', '028', '610015');
INSERT INTO `e_r_sys_region` VALUES ('510104', '510100', '锦江', '锦江区', '中国,四川省,成都市,锦江区', '3', 'Jinjiang', '028', '610021');
INSERT INTO `e_r_sys_region` VALUES ('510105', '510100', '青羊', '青羊区', '中国,四川省,成都市,青羊区', '3', 'Qingyang', '028', '610031');
INSERT INTO `e_r_sys_region` VALUES ('510106', '510100', '金牛', '金牛区', '中国,四川省,成都市,金牛区', '3', 'Jinniu', '028', '610036');
INSERT INTO `e_r_sys_region` VALUES ('510107', '510100', '武侯', '武侯区', '中国,四川省,成都市,武侯区', '3', 'Wuhou', '028', '610041');
INSERT INTO `e_r_sys_region` VALUES ('510108', '510100', '成华', '成华区', '中国,四川省,成都市,成华区', '3', 'Chenghua', '028', '610066');
INSERT INTO `e_r_sys_region` VALUES ('510112', '510100', '龙泉驿', '龙泉驿区', '中国,四川省,成都市,龙泉驿区', '3', 'Longquanyi', '028', '610100');
INSERT INTO `e_r_sys_region` VALUES ('510113', '510100', '青白江', '青白江区', '中国,四川省,成都市,青白江区', '3', 'Qingbaijiang', '028', '610300');
INSERT INTO `e_r_sys_region` VALUES ('510114', '510100', '新都', '新都区', '中国,四川省,成都市,新都区', '3', 'Xindu', '028', '610500');
INSERT INTO `e_r_sys_region` VALUES ('510115', '510100', '温江', '温江区', '中国,四川省,成都市,温江区', '3', 'Wenjiang', '028', '611130');
INSERT INTO `e_r_sys_region` VALUES ('510121', '510100', '金堂', '金堂县', '中国,四川省,成都市,金堂县', '3', 'Jintang', '028', '610400');
INSERT INTO `e_r_sys_region` VALUES ('510122', '510100', '双流', '双流县', '中国,四川省,成都市,双流县', '3', 'Shuangliu', '028', '610200');
INSERT INTO `e_r_sys_region` VALUES ('510124', '510100', '郫县', '郫县', '中国,四川省,成都市,郫县', '3', 'Pixian', '028', '611730');
INSERT INTO `e_r_sys_region` VALUES ('510129', '510100', '大邑', '大邑县', '中国,四川省,成都市,大邑县', '3', 'Dayi', '028', '611330');
INSERT INTO `e_r_sys_region` VALUES ('510131', '510100', '蒲江', '蒲江县', '中国,四川省,成都市,蒲江县', '3', 'Pujiang', '028', '611630');
INSERT INTO `e_r_sys_region` VALUES ('510132', '510100', '新津', '新津县', '中国,四川省,成都市,新津县', '3', 'Xinjin', '028', '611430');
INSERT INTO `e_r_sys_region` VALUES ('510181', '510100', '都江堰', '都江堰市', '中国,四川省,成都市,都江堰市', '3', 'Dujiangyan', '028', '611830');
INSERT INTO `e_r_sys_region` VALUES ('510182', '510100', '彭州', '彭州市', '中国,四川省,成都市,彭州市', '3', 'Pengzhou', '028', '611930');
INSERT INTO `e_r_sys_region` VALUES ('510183', '510100', '邛崃', '邛崃市', '中国,四川省,成都市,邛崃市', '3', 'Qionglai', '028', '611530');
INSERT INTO `e_r_sys_region` VALUES ('510184', '510100', '崇州', '崇州市', '中国,四川省,成都市,崇州市', '3', 'Chongzhou', '028', '611230');
INSERT INTO `e_r_sys_region` VALUES ('510300', '510000', '自贡', '自贡市', '中国,四川省,自贡市', '2', 'Zigong', '0813', '643000');
INSERT INTO `e_r_sys_region` VALUES ('510302', '510300', '自流井', '自流井区', '中国,四川省,自贡市,自流井区', '3', 'Ziliujing', '0813', '643000');
INSERT INTO `e_r_sys_region` VALUES ('510303', '510300', '贡井', '贡井区', '中国,四川省,自贡市,贡井区', '3', 'Gongjing', '0813', '643020');
INSERT INTO `e_r_sys_region` VALUES ('510304', '510300', '大安', '大安区', '中国,四川省,自贡市,大安区', '3', 'Da\'an', '0813', '643010');
INSERT INTO `e_r_sys_region` VALUES ('510311', '510300', '沿滩', '沿滩区', '中国,四川省,自贡市,沿滩区', '3', 'Yantan', '0813', '643030');
INSERT INTO `e_r_sys_region` VALUES ('510321', '510300', '荣县', '荣县', '中国,四川省,自贡市,荣县', '3', 'Rongxian', '0813', '643100');
INSERT INTO `e_r_sys_region` VALUES ('510322', '510300', '富顺', '富顺县', '中国,四川省,自贡市,富顺县', '3', 'Fushun', '0813', '643200');
INSERT INTO `e_r_sys_region` VALUES ('510400', '510000', '攀枝花', '攀枝花市', '中国,四川省,攀枝花市', '2', 'Panzhihua', '0812', '617000');
INSERT INTO `e_r_sys_region` VALUES ('510402', '510400', '东区', '东区', '中国,四川省,攀枝花市,东区', '3', 'Dongqu', '0812', '617067');
INSERT INTO `e_r_sys_region` VALUES ('510403', '510400', '西区', '西区', '中国,四川省,攀枝花市,西区', '3', 'Xiqu', '0812', '617068');
INSERT INTO `e_r_sys_region` VALUES ('510411', '510400', '仁和', '仁和区', '中国,四川省,攀枝花市,仁和区', '3', 'Renhe', '0812', '617061');
INSERT INTO `e_r_sys_region` VALUES ('510421', '510400', '米易', '米易县', '中国,四川省,攀枝花市,米易县', '3', 'Miyi', '0812', '617200');
INSERT INTO `e_r_sys_region` VALUES ('510422', '510400', '盐边', '盐边县', '中国,四川省,攀枝花市,盐边县', '3', 'Yanbian', '0812', '617100');
INSERT INTO `e_r_sys_region` VALUES ('510500', '510000', '泸州', '泸州市', '中国,四川省,泸州市', '2', 'Luzhou', '0830', '646000');
INSERT INTO `e_r_sys_region` VALUES ('510502', '510500', '江阳', '江阳区', '中国,四川省,泸州市,江阳区', '3', 'Jiangyang', '0830', '646000');
INSERT INTO `e_r_sys_region` VALUES ('510503', '510500', '纳溪', '纳溪区', '中国,四川省,泸州市,纳溪区', '3', 'Naxi', '0830', '646300');
INSERT INTO `e_r_sys_region` VALUES ('510504', '510500', '龙马潭', '龙马潭区', '中国,四川省,泸州市,龙马潭区', '3', 'Longmatan', '0830', '646000');
INSERT INTO `e_r_sys_region` VALUES ('510521', '510500', '泸县', '泸县', '中国,四川省,泸州市,泸县', '3', 'Luxian', '0830', '646106');
INSERT INTO `e_r_sys_region` VALUES ('510522', '510500', '合江', '合江县', '中国,四川省,泸州市,合江县', '3', 'Hejiang', '0830', '646200');
INSERT INTO `e_r_sys_region` VALUES ('510524', '510500', '叙永', '叙永县', '中国,四川省,泸州市,叙永县', '3', 'Xuyong', '0830', '646400');
INSERT INTO `e_r_sys_region` VALUES ('510525', '510500', '古蔺', '古蔺县', '中国,四川省,泸州市,古蔺县', '3', 'Gulin', '0830', '646500');
INSERT INTO `e_r_sys_region` VALUES ('510600', '510000', '德阳', '德阳市', '中国,四川省,德阳市', '2', 'Deyang', '0838', '618000');
INSERT INTO `e_r_sys_region` VALUES ('510603', '510600', '旌阳', '旌阳区', '中国,四川省,德阳市,旌阳区', '3', 'Jingyang', '0838', '618000');
INSERT INTO `e_r_sys_region` VALUES ('510623', '510600', '中江', '中江县', '中国,四川省,德阳市,中江县', '3', 'Zhongjiang', '0838', '618100');
INSERT INTO `e_r_sys_region` VALUES ('510626', '510600', '罗江', '罗江县', '中国,四川省,德阳市,罗江县', '3', 'Luojiang', '0838', '618500');
INSERT INTO `e_r_sys_region` VALUES ('510681', '510600', '广汉', '广汉市', '中国,四川省,德阳市,广汉市', '3', 'Guanghan', '0838', '618300');
INSERT INTO `e_r_sys_region` VALUES ('510682', '510600', '什邡', '什邡市', '中国,四川省,德阳市,什邡市', '3', 'Shifang', '0838', '618400');
INSERT INTO `e_r_sys_region` VALUES ('510683', '510600', '绵竹', '绵竹市', '中国,四川省,德阳市,绵竹市', '3', 'Mianzhu', '0838', '618200');
INSERT INTO `e_r_sys_region` VALUES ('510700', '510000', '绵阳', '绵阳市', '中国,四川省,绵阳市', '2', 'Mianyang', '0816', '621000');
INSERT INTO `e_r_sys_region` VALUES ('510703', '510700', '涪城', '涪城区', '中国,四川省,绵阳市,涪城区', '3', 'Fucheng', '0816', '621000');
INSERT INTO `e_r_sys_region` VALUES ('510704', '510700', '游仙', '游仙区', '中国,四川省,绵阳市,游仙区', '3', 'Youxian', '0816', '621022');
INSERT INTO `e_r_sys_region` VALUES ('510722', '510700', '三台', '三台县', '中国,四川省,绵阳市,三台县', '3', 'Santai', '0816', '621100');
INSERT INTO `e_r_sys_region` VALUES ('510723', '510700', '盐亭', '盐亭县', '中国,四川省,绵阳市,盐亭县', '3', 'Yanting', '0816', '621600');
INSERT INTO `e_r_sys_region` VALUES ('510724', '510700', '安县', '安县', '中国,四川省,绵阳市,安县', '3', 'Anxian', '0816', '622650');
INSERT INTO `e_r_sys_region` VALUES ('510725', '510700', '梓潼', '梓潼县', '中国,四川省,绵阳市,梓潼县', '3', 'Zitong', '0816', '622150');
INSERT INTO `e_r_sys_region` VALUES ('510726', '510700', '北川', '北川羌族自治县', '中国,四川省,绵阳市,北川羌族自治县', '3', 'Beichuan', '0816', '622750');
INSERT INTO `e_r_sys_region` VALUES ('510727', '510700', '平武', '平武县', '中国,四川省,绵阳市,平武县', '3', 'Pingwu', '0816', '622550');
INSERT INTO `e_r_sys_region` VALUES ('510781', '510700', '江油', '江油市', '中国,四川省,绵阳市,江油市', '3', 'Jiangyou', '0816', '621700');
INSERT INTO `e_r_sys_region` VALUES ('510800', '510000', '广元', '广元市', '中国,四川省,广元市', '2', 'Guangyuan', '0839', '628000');
INSERT INTO `e_r_sys_region` VALUES ('510802', '510800', '利州', '利州区', '中国,四川省,广元市,利州区', '3', 'Lizhou', '0839', '628017');
INSERT INTO `e_r_sys_region` VALUES ('510811', '510800', '昭化', '昭化区', '中国,四川省,广元市,昭化区', '3', 'Zhaohua', '0839', '628017');
INSERT INTO `e_r_sys_region` VALUES ('510812', '510800', '朝天', '朝天区', '中国,四川省,广元市,朝天区', '3', 'Chaotian', '0839', '628017');
INSERT INTO `e_r_sys_region` VALUES ('510821', '510800', '旺苍', '旺苍县', '中国,四川省,广元市,旺苍县', '3', 'Wangcang', '0839', '628200');
INSERT INTO `e_r_sys_region` VALUES ('510822', '510800', '青川', '青川县', '中国,四川省,广元市,青川县', '3', 'Qingchuan', '0839', '628100');
INSERT INTO `e_r_sys_region` VALUES ('510823', '510800', '剑阁', '剑阁县', '中国,四川省,广元市,剑阁县', '3', 'Jiange', '0839', '628300');
INSERT INTO `e_r_sys_region` VALUES ('510824', '510800', '苍溪', '苍溪县', '中国,四川省,广元市,苍溪县', '3', 'Cangxi', '0839', '628400');
INSERT INTO `e_r_sys_region` VALUES ('510900', '510000', '遂宁', '遂宁市', '中国,四川省,遂宁市', '2', 'Suining', '0825', '629000');
INSERT INTO `e_r_sys_region` VALUES ('510903', '510900', '船山', '船山区', '中国,四川省,遂宁市,船山区', '3', 'Chuanshan', '0825', '629000');
INSERT INTO `e_r_sys_region` VALUES ('510904', '510900', '安居', '安居区', '中国,四川省,遂宁市,安居区', '3', 'Anju', '0825', '629000');
INSERT INTO `e_r_sys_region` VALUES ('510921', '510900', '蓬溪', '蓬溪县', '中国,四川省,遂宁市,蓬溪县', '3', 'Pengxi', '0825', '629100');
INSERT INTO `e_r_sys_region` VALUES ('510922', '510900', '射洪', '射洪县', '中国,四川省,遂宁市,射洪县', '3', 'Shehong', '0825', '629200');
INSERT INTO `e_r_sys_region` VALUES ('510923', '510900', '大英', '大英县', '中国,四川省,遂宁市,大英县', '3', 'Daying', '0825', '629300');
INSERT INTO `e_r_sys_region` VALUES ('511000', '510000', '内江', '内江市', '中国,四川省,内江市', '2', 'Neijiang', '0832', '641000');
INSERT INTO `e_r_sys_region` VALUES ('511002', '511000', '市中区', '市中区', '中国,四川省,内江市,市中区', '3', 'Shizhongqu', '0832', '641000');
INSERT INTO `e_r_sys_region` VALUES ('511011', '511000', '东兴', '东兴区', '中国,四川省,内江市,东兴区', '3', 'Dongxing', '0832', '641100');
INSERT INTO `e_r_sys_region` VALUES ('511024', '511000', '威远', '威远县', '中国,四川省,内江市,威远县', '3', 'Weiyuan', '0832', '642450');
INSERT INTO `e_r_sys_region` VALUES ('511025', '511000', '资中', '资中县', '中国,四川省,内江市,资中县', '3', 'Zizhong', '0832', '641200');
INSERT INTO `e_r_sys_region` VALUES ('511028', '511000', '隆昌', '隆昌县', '中国,四川省,内江市,隆昌县', '3', 'Longchang', '0832', '642150');
INSERT INTO `e_r_sys_region` VALUES ('511100', '510000', '乐山', '乐山市', '中国,四川省,乐山市', '2', 'Leshan', '0833', '614000');
INSERT INTO `e_r_sys_region` VALUES ('511102', '511100', '市中区', '市中区', '中国,四川省,乐山市,市中区', '3', 'Shizhongqu', '0833', '614000');
INSERT INTO `e_r_sys_region` VALUES ('511111', '511100', '沙湾', '沙湾区', '中国,四川省,乐山市,沙湾区', '3', 'Shawan', '0833', '614900');
INSERT INTO `e_r_sys_region` VALUES ('511112', '511100', '五通桥', '五通桥区', '中国,四川省,乐山市,五通桥区', '3', 'Wutongqiao', '0833', '614800');
INSERT INTO `e_r_sys_region` VALUES ('511113', '511100', '金口河', '金口河区', '中国,四川省,乐山市,金口河区', '3', 'Jinkouhe', '0833', '614700');
INSERT INTO `e_r_sys_region` VALUES ('511123', '511100', '犍为', '犍为县', '中国,四川省,乐山市,犍为县', '3', 'Qianwei', '0833', '614400');
INSERT INTO `e_r_sys_region` VALUES ('511124', '511100', '井研', '井研县', '中国,四川省,乐山市,井研县', '3', 'Jingyan', '0833', '613100');
INSERT INTO `e_r_sys_region` VALUES ('511126', '511100', '夹江', '夹江县', '中国,四川省,乐山市,夹江县', '3', 'Jiajiang', '0833', '614100');
INSERT INTO `e_r_sys_region` VALUES ('511129', '511100', '沐川', '沐川县', '中国,四川省,乐山市,沐川县', '3', 'Muchuan', '0833', '614500');
INSERT INTO `e_r_sys_region` VALUES ('511132', '511100', '峨边', '峨边彝族自治县', '中国,四川省,乐山市,峨边彝族自治县', '3', 'Ebian', '0833', '614300');
INSERT INTO `e_r_sys_region` VALUES ('511133', '511100', '马边', '马边彝族自治县', '中国,四川省,乐山市,马边彝族自治县', '3', 'Mabian', '0833', '614600');
INSERT INTO `e_r_sys_region` VALUES ('511181', '511100', '峨眉山', '峨眉山市', '中国,四川省,乐山市,峨眉山市', '3', 'Emeishan', '0833', '614200');
INSERT INTO `e_r_sys_region` VALUES ('511300', '510000', '南充', '南充市', '中国,四川省,南充市', '2', 'Nanchong', '0817', '637000');
INSERT INTO `e_r_sys_region` VALUES ('511302', '511300', '顺庆', '顺庆区', '中国,四川省,南充市,顺庆区', '3', 'Shunqing', '0817', '637000');
INSERT INTO `e_r_sys_region` VALUES ('511303', '511300', '高坪', '高坪区', '中国,四川省,南充市,高坪区', '3', 'Gaoping', '0817', '637100');
INSERT INTO `e_r_sys_region` VALUES ('511304', '511300', '嘉陵', '嘉陵区', '中国,四川省,南充市,嘉陵区', '3', 'Jialing', '0817', '637100');
INSERT INTO `e_r_sys_region` VALUES ('511321', '511300', '南部', '南部县', '中国,四川省,南充市,南部县', '3', 'Nanbu', '0817', '637300');
INSERT INTO `e_r_sys_region` VALUES ('511322', '511300', '营山', '营山县', '中国,四川省,南充市,营山县', '3', 'Yingshan', '0817', '637700');
INSERT INTO `e_r_sys_region` VALUES ('511323', '511300', '蓬安', '蓬安县', '中国,四川省,南充市,蓬安县', '3', 'Peng\'an', '0817', '637800');
INSERT INTO `e_r_sys_region` VALUES ('511324', '511300', '仪陇', '仪陇县', '中国,四川省,南充市,仪陇县', '3', 'Yilong', '0817', '637600');
INSERT INTO `e_r_sys_region` VALUES ('511325', '511300', '西充', '西充县', '中国,四川省,南充市,西充县', '3', 'Xichong', '0817', '637200');
INSERT INTO `e_r_sys_region` VALUES ('511381', '511300', '阆中', '阆中市', '中国,四川省,南充市,阆中市', '3', 'Langzhong', '0817', '637400');
INSERT INTO `e_r_sys_region` VALUES ('511400', '510000', '眉山', '眉山市', '中国,四川省,眉山市', '2', 'Meishan', '028', '620020');
INSERT INTO `e_r_sys_region` VALUES ('511402', '511400', '东坡', '东坡区', '中国,四川省,眉山市,东坡区', '3', 'Dongpo', '028', '620010');
INSERT INTO `e_r_sys_region` VALUES ('511403', '511400', '彭山', '彭山区', '中国,四川省,眉山市,彭山区', '3', 'Pengshan', '028', '620860');
INSERT INTO `e_r_sys_region` VALUES ('511421', '511400', '仁寿', '仁寿县', '中国,四川省,眉山市,仁寿县', '3', 'Renshou', '028', '620500');
INSERT INTO `e_r_sys_region` VALUES ('511423', '511400', '洪雅', '洪雅县', '中国,四川省,眉山市,洪雅县', '3', 'Hongya', '028', '620360');
INSERT INTO `e_r_sys_region` VALUES ('511424', '511400', '丹棱', '丹棱县', '中国,四川省,眉山市,丹棱县', '3', 'Danling', '028', '620200');
INSERT INTO `e_r_sys_region` VALUES ('511425', '511400', '青神', '青神县', '中国,四川省,眉山市,青神县', '3', 'Qingshen', '028', '620460');
INSERT INTO `e_r_sys_region` VALUES ('511500', '510000', '宜宾', '宜宾市', '中国,四川省,宜宾市', '2', 'Yibin', '0831', '644000');
INSERT INTO `e_r_sys_region` VALUES ('511502', '511500', '翠屏', '翠屏区', '中国,四川省,宜宾市,翠屏区', '3', 'Cuiping', '0831', '644000');
INSERT INTO `e_r_sys_region` VALUES ('511503', '511500', '南溪', '南溪区', '中国,四川省,宜宾市,南溪区', '3', 'Nanxi', '0831', '644100');
INSERT INTO `e_r_sys_region` VALUES ('511521', '511500', '宜宾', '宜宾县', '中国,四川省,宜宾市,宜宾县', '3', 'Yibin', '0831', '644600');
INSERT INTO `e_r_sys_region` VALUES ('511523', '511500', '江安', '江安县', '中国,四川省,宜宾市,江安县', '3', 'Jiang\'an', '0831', '644200');
INSERT INTO `e_r_sys_region` VALUES ('511524', '511500', '长宁', '长宁县', '中国,四川省,宜宾市,长宁县', '3', 'Changning', '0831', '644300');
INSERT INTO `e_r_sys_region` VALUES ('511525', '511500', '高县', '高县', '中国,四川省,宜宾市,高县', '3', 'Gaoxian', '0831', '645150');
INSERT INTO `e_r_sys_region` VALUES ('511526', '511500', '珙县', '珙县', '中国,四川省,宜宾市,珙县', '3', 'Gongxian', '0831', '644500');
INSERT INTO `e_r_sys_region` VALUES ('511527', '511500', '筠连', '筠连县', '中国,四川省,宜宾市,筠连县', '3', 'Junlian', '0831', '645250');
INSERT INTO `e_r_sys_region` VALUES ('511528', '511500', '兴文', '兴文县', '中国,四川省,宜宾市,兴文县', '3', 'Xingwen', '0831', '644400');
INSERT INTO `e_r_sys_region` VALUES ('511529', '511500', '屏山', '屏山县', '中国,四川省,宜宾市,屏山县', '3', 'Pingshan', '0831', '645350');
INSERT INTO `e_r_sys_region` VALUES ('511600', '510000', '广安', '广安市', '中国,四川省,广安市', '2', 'Guang\'an', '0826', '638000');
INSERT INTO `e_r_sys_region` VALUES ('511602', '511600', '广安', '广安区', '中国,四川省,广安市,广安区', '3', 'Guang\'an', '0826', '638000');
INSERT INTO `e_r_sys_region` VALUES ('511603', '511600', '前锋', '前锋区', '中国,四川省,广安市,前锋区', '3', 'Qianfeng', '0826', '638019');
INSERT INTO `e_r_sys_region` VALUES ('511621', '511600', '岳池', '岳池县', '中国,四川省,广安市,岳池县', '3', 'Yuechi', '0826', '638300');
INSERT INTO `e_r_sys_region` VALUES ('511622', '511600', '武胜', '武胜县', '中国,四川省,广安市,武胜县', '3', 'Wusheng', '0826', '638400');
INSERT INTO `e_r_sys_region` VALUES ('511623', '511600', '邻水', '邻水县', '中国,四川省,广安市,邻水县', '3', 'Linshui', '0826', '638500');
INSERT INTO `e_r_sys_region` VALUES ('511681', '511600', '华蓥', '华蓥市', '中国,四川省,广安市,华蓥市', '3', 'Huaying', '0826', '638600');
INSERT INTO `e_r_sys_region` VALUES ('511700', '510000', '达州', '达州市', '中国,四川省,达州市', '2', 'Dazhou', '0818', '635000');
INSERT INTO `e_r_sys_region` VALUES ('511702', '511700', '通川', '通川区', '中国,四川省,达州市,通川区', '3', 'Tongchuan', '0818', '635000');
INSERT INTO `e_r_sys_region` VALUES ('511703', '511700', '达川', '达川区', '中国,四川省,达州市,达川区', '3', 'Dachuan', '0818', '635000');
INSERT INTO `e_r_sys_region` VALUES ('511722', '511700', '宣汉', '宣汉县', '中国,四川省,达州市,宣汉县', '3', 'Xuanhan', '0818', '636150');
INSERT INTO `e_r_sys_region` VALUES ('511723', '511700', '开江', '开江县', '中国,四川省,达州市,开江县', '3', 'Kaijiang', '0818', '636250');
INSERT INTO `e_r_sys_region` VALUES ('511724', '511700', '大竹', '大竹县', '中国,四川省,达州市,大竹县', '3', 'Dazhu', '0818', '635100');
INSERT INTO `e_r_sys_region` VALUES ('511725', '511700', '渠县', '渠县', '中国,四川省,达州市,渠县', '3', 'Quxian', '0818', '635200');
INSERT INTO `e_r_sys_region` VALUES ('511781', '511700', '万源', '万源市', '中国,四川省,达州市,万源市', '3', 'Wanyuan', '0818', '636350');
INSERT INTO `e_r_sys_region` VALUES ('511800', '510000', '雅安', '雅安市', '中国,四川省,雅安市', '2', 'Ya\'an', '0835', '625000');
INSERT INTO `e_r_sys_region` VALUES ('511802', '511800', '雨城', '雨城区', '中国,四川省,雅安市,雨城区', '3', 'Yucheng', '0835', '625000');
INSERT INTO `e_r_sys_region` VALUES ('511803', '511800', '名山', '名山区', '中国,四川省,雅安市,名山区', '3', 'Mingshan', '0835', '625100');
INSERT INTO `e_r_sys_region` VALUES ('511822', '511800', '荥经', '荥经县', '中国,四川省,雅安市,荥经县', '3', 'Yingjing', '0835', '625200');
INSERT INTO `e_r_sys_region` VALUES ('511823', '511800', '汉源', '汉源县', '中国,四川省,雅安市,汉源县', '3', 'Hanyuan', '0835', '625300');
INSERT INTO `e_r_sys_region` VALUES ('511824', '511800', '石棉', '石棉县', '中国,四川省,雅安市,石棉县', '3', 'Shimian', '0835', '625400');
INSERT INTO `e_r_sys_region` VALUES ('511825', '511800', '天全', '天全县', '中国,四川省,雅安市,天全县', '3', 'Tianquan', '0835', '625500');
INSERT INTO `e_r_sys_region` VALUES ('511826', '511800', '芦山', '芦山县', '中国,四川省,雅安市,芦山县', '3', 'Lushan', '0835', '625600');
INSERT INTO `e_r_sys_region` VALUES ('511827', '511800', '宝兴', '宝兴县', '中国,四川省,雅安市,宝兴县', '3', 'Baoxing', '0835', '625700');
INSERT INTO `e_r_sys_region` VALUES ('511900', '510000', '巴中', '巴中市', '中国,四川省,巴中市', '2', 'Bazhong', '0827', '636000');
INSERT INTO `e_r_sys_region` VALUES ('511902', '511900', '巴州', '巴州区', '中国,四川省,巴中市,巴州区', '3', 'Bazhou', '0827', '636001');
INSERT INTO `e_r_sys_region` VALUES ('511903', '511900', '恩阳', '恩阳区', '中国,四川省,巴中市,恩阳区', '3', 'Enyang', '0827', '636064');
INSERT INTO `e_r_sys_region` VALUES ('511921', '511900', '通江', '通江县', '中国,四川省,巴中市,通江县', '3', 'Tongjiang', '0827', '636700');
INSERT INTO `e_r_sys_region` VALUES ('511922', '511900', '南江', '南江县', '中国,四川省,巴中市,南江县', '3', 'Nanjiang', '0827', '636600');
INSERT INTO `e_r_sys_region` VALUES ('511923', '511900', '平昌', '平昌县', '中国,四川省,巴中市,平昌县', '3', 'Pingchang', '0827', '636400');
INSERT INTO `e_r_sys_region` VALUES ('512000', '510000', '资阳', '资阳市', '中国,四川省,资阳市', '2', 'Ziyang', '028', '641300');
INSERT INTO `e_r_sys_region` VALUES ('512002', '512000', '雁江', '雁江区', '中国,四川省,资阳市,雁江区', '3', 'Yanjiang', '028', '641300');
INSERT INTO `e_r_sys_region` VALUES ('512021', '512000', '安岳', '安岳县', '中国,四川省,资阳市,安岳县', '3', 'Anyue', '028', '642350');
INSERT INTO `e_r_sys_region` VALUES ('512022', '512000', '乐至', '乐至县', '中国,四川省,资阳市,乐至县', '3', 'Lezhi', '028', '641500');
INSERT INTO `e_r_sys_region` VALUES ('512081', '512000', '简阳', '简阳市', '中国,四川省,资阳市,简阳市', '3', 'Jianyang', '028', '641400');
INSERT INTO `e_r_sys_region` VALUES ('513200', '510000', '阿坝', '阿坝藏族羌族自治州', '中国,四川省,阿坝藏族羌族自治州', '2', 'Aba', '0837', '624000');
INSERT INTO `e_r_sys_region` VALUES ('513221', '513200', '汶川', '汶川县', '中国,四川省,阿坝藏族羌族自治州,汶川县', '3', 'Wenchuan', '0837', '623000');
INSERT INTO `e_r_sys_region` VALUES ('513222', '513200', '理县', '理县', '中国,四川省,阿坝藏族羌族自治州,理县', '3', 'Lixian', '0837', '623100');
INSERT INTO `e_r_sys_region` VALUES ('513223', '513200', '茂县', '茂县', '中国,四川省,阿坝藏族羌族自治州,茂县', '3', 'Maoxian', '0837', '623200');
INSERT INTO `e_r_sys_region` VALUES ('513224', '513200', '松潘', '松潘县', '中国,四川省,阿坝藏族羌族自治州,松潘县', '3', 'Songpan', '0837', '623300');
INSERT INTO `e_r_sys_region` VALUES ('513225', '513200', '九寨沟', '九寨沟县', '中国,四川省,阿坝藏族羌族自治州,九寨沟县', '3', 'Jiuzhaigou', '0837', '623400');
INSERT INTO `e_r_sys_region` VALUES ('513226', '513200', '金川', '金川县', '中国,四川省,阿坝藏族羌族自治州,金川县', '3', 'Jinchuan', '0837', '624100');
INSERT INTO `e_r_sys_region` VALUES ('513227', '513200', '小金', '小金县', '中国,四川省,阿坝藏族羌族自治州,小金县', '3', 'Xiaojin', '0837', '624200');
INSERT INTO `e_r_sys_region` VALUES ('513228', '513200', '黑水', '黑水县', '中国,四川省,阿坝藏族羌族自治州,黑水县', '3', 'Heishui', '0837', '623500');
INSERT INTO `e_r_sys_region` VALUES ('513229', '513200', '马尔康', '马尔康县', '中国,四川省,阿坝藏族羌族自治州,马尔康县', '3', 'Maerkang', '0837', '624000');
INSERT INTO `e_r_sys_region` VALUES ('513230', '513200', '壤塘', '壤塘县', '中国,四川省,阿坝藏族羌族自治州,壤塘县', '3', 'Rangtang', '0837', '624300');
INSERT INTO `e_r_sys_region` VALUES ('513231', '513200', '阿坝', '阿坝县', '中国,四川省,阿坝藏族羌族自治州,阿坝县', '3', 'Aba', '0837', '624600');
INSERT INTO `e_r_sys_region` VALUES ('513232', '513200', '若尔盖', '若尔盖县', '中国,四川省,阿坝藏族羌族自治州,若尔盖县', '3', 'Ruoergai', '0837', '624500');
INSERT INTO `e_r_sys_region` VALUES ('513233', '513200', '红原', '红原县', '中国,四川省,阿坝藏族羌族自治州,红原县', '3', 'Hongyuan', '0837', '624400');
INSERT INTO `e_r_sys_region` VALUES ('513300', '510000', '甘孜', '甘孜藏族自治州', '中国,四川省,甘孜藏族自治州', '2', 'Garze', '0836', '626000');
INSERT INTO `e_r_sys_region` VALUES ('513321', '513300', '康定', '康定县', '中国,四川省,甘孜藏族自治州,康定县', '3', 'Kangding', '0836', '626000');
INSERT INTO `e_r_sys_region` VALUES ('513322', '513300', '泸定', '泸定县', '中国,四川省,甘孜藏族自治州,泸定县', '3', 'Luding', '0836', '626100');
INSERT INTO `e_r_sys_region` VALUES ('513323', '513300', '丹巴', '丹巴县', '中国,四川省,甘孜藏族自治州,丹巴县', '3', 'Danba', '0836', '626300');
INSERT INTO `e_r_sys_region` VALUES ('513324', '513300', '九龙', '九龙县', '中国,四川省,甘孜藏族自治州,九龙县', '3', 'Jiulong', '0836', '626200');
INSERT INTO `e_r_sys_region` VALUES ('513325', '513300', '雅江', '雅江县', '中国,四川省,甘孜藏族自治州,雅江县', '3', 'Yajiang', '0836', '627450');
INSERT INTO `e_r_sys_region` VALUES ('513326', '513300', '道孚', '道孚县', '中国,四川省,甘孜藏族自治州,道孚县', '3', 'Daofu', '0836', '626400');
INSERT INTO `e_r_sys_region` VALUES ('513327', '513300', '炉霍', '炉霍县', '中国,四川省,甘孜藏族自治州,炉霍县', '3', 'Luhuo', '0836', '626500');
INSERT INTO `e_r_sys_region` VALUES ('513328', '513300', '甘孜', '甘孜县', '中国,四川省,甘孜藏族自治州,甘孜县', '3', 'Ganzi', '0836', '626700');
INSERT INTO `e_r_sys_region` VALUES ('513329', '513300', '新龙', '新龙县', '中国,四川省,甘孜藏族自治州,新龙县', '3', 'Xinlong', '0836', '626800');
INSERT INTO `e_r_sys_region` VALUES ('513330', '513300', '德格', '德格县', '中国,四川省,甘孜藏族自治州,德格县', '3', 'Dege', '0836', '627250');
INSERT INTO `e_r_sys_region` VALUES ('513331', '513300', '白玉', '白玉县', '中国,四川省,甘孜藏族自治州,白玉县', '3', 'Baiyu', '0836', '627150');
INSERT INTO `e_r_sys_region` VALUES ('513332', '513300', '石渠', '石渠县', '中国,四川省,甘孜藏族自治州,石渠县', '3', 'Shiqu', '0836', '627350');
INSERT INTO `e_r_sys_region` VALUES ('513333', '513300', '色达', '色达县', '中国,四川省,甘孜藏族自治州,色达县', '3', 'Seda', '0836', '626600');
INSERT INTO `e_r_sys_region` VALUES ('513334', '513300', '理塘', '理塘县', '中国,四川省,甘孜藏族自治州,理塘县', '3', 'Litang', '0836', '627550');
INSERT INTO `e_r_sys_region` VALUES ('513335', '513300', '巴塘', '巴塘县', '中国,四川省,甘孜藏族自治州,巴塘县', '3', 'Batang', '0836', '627650');
INSERT INTO `e_r_sys_region` VALUES ('513336', '513300', '乡城', '乡城县', '中国,四川省,甘孜藏族自治州,乡城县', '3', 'Xiangcheng', '0836', '627850');
INSERT INTO `e_r_sys_region` VALUES ('513337', '513300', '稻城', '稻城县', '中国,四川省,甘孜藏族自治州,稻城县', '3', 'Daocheng', '0836', '627750');
INSERT INTO `e_r_sys_region` VALUES ('513338', '513300', '得荣', '得荣县', '中国,四川省,甘孜藏族自治州,得荣县', '3', 'Derong', '0836', '627950');
INSERT INTO `e_r_sys_region` VALUES ('513400', '510000', '凉山', '凉山彝族自治州', '中国,四川省,凉山彝族自治州', '2', 'Liangshan', '0834', '615000');
INSERT INTO `e_r_sys_region` VALUES ('513401', '513400', '西昌', '西昌市', '中国,四川省,凉山彝族自治州,西昌市', '3', 'Xichang', '0835', '615000');
INSERT INTO `e_r_sys_region` VALUES ('513422', '513400', '木里', '木里藏族自治县', '中国,四川省,凉山彝族自治州,木里藏族自治县', '3', 'Muli', '0851', '615800');
INSERT INTO `e_r_sys_region` VALUES ('513423', '513400', '盐源', '盐源县', '中国,四川省,凉山彝族自治州,盐源县', '3', 'Yanyuan', '0836', '615700');
INSERT INTO `e_r_sys_region` VALUES ('513424', '513400', '德昌', '德昌县', '中国,四川省,凉山彝族自治州,德昌县', '3', 'Dechang', '0837', '615500');
INSERT INTO `e_r_sys_region` VALUES ('513425', '513400', '会理', '会理县', '中国,四川省,凉山彝族自治州,会理县', '3', 'Huili', '0838', '615100');
INSERT INTO `e_r_sys_region` VALUES ('513426', '513400', '会东', '会东县', '中国,四川省,凉山彝族自治州,会东县', '3', 'Huidong', '0839', '615200');
INSERT INTO `e_r_sys_region` VALUES ('513427', '513400', '宁南', '宁南县', '中国,四川省,凉山彝族自治州,宁南县', '3', 'Ningnan', '0840', '615400');
INSERT INTO `e_r_sys_region` VALUES ('513428', '513400', '普格', '普格县', '中国,四川省,凉山彝族自治州,普格县', '3', 'Puge', '0841', '615300');
INSERT INTO `e_r_sys_region` VALUES ('513429', '513400', '布拖', '布拖县', '中国,四川省,凉山彝族自治州,布拖县', '3', 'Butuo', '0842', '616350');
INSERT INTO `e_r_sys_region` VALUES ('513430', '513400', '金阳', '金阳县', '中国,四川省,凉山彝族自治州,金阳县', '3', 'Jinyang', '0843', '616250');
INSERT INTO `e_r_sys_region` VALUES ('513431', '513400', '昭觉', '昭觉县', '中国,四川省,凉山彝族自治州,昭觉县', '3', 'Zhaojue', '0844', '616150');
INSERT INTO `e_r_sys_region` VALUES ('513432', '513400', '喜德', '喜德县', '中国,四川省,凉山彝族自治州,喜德县', '3', 'Xide', '0845', '616750');
INSERT INTO `e_r_sys_region` VALUES ('513433', '513400', '冕宁', '冕宁县', '中国,四川省,凉山彝族自治州,冕宁县', '3', 'Mianning', '0846', '615600');
INSERT INTO `e_r_sys_region` VALUES ('513434', '513400', '越西', '越西县', '中国,四川省,凉山彝族自治州,越西县', '3', 'Yuexi', '0847', '616650');
INSERT INTO `e_r_sys_region` VALUES ('513435', '513400', '甘洛', '甘洛县', '中国,四川省,凉山彝族自治州,甘洛县', '3', 'Ganluo', '0848', '616850');
INSERT INTO `e_r_sys_region` VALUES ('513436', '513400', '美姑', '美姑县', '中国,四川省,凉山彝族自治州,美姑县', '3', 'Meigu', '0849', '616450');
INSERT INTO `e_r_sys_region` VALUES ('513437', '513400', '雷波', '雷波县', '中国,四川省,凉山彝族自治州,雷波县', '3', 'Leibo', '0850', '616550');
INSERT INTO `e_r_sys_region` VALUES ('520000', '100000', '贵州', '贵州省', '中国,贵州省', '1', 'Guizhou', '', '');
INSERT INTO `e_r_sys_region` VALUES ('520100', '520000', '贵阳', '贵阳市', '中国,贵州省,贵阳市', '2', 'Guiyang', '0851', '550001');
INSERT INTO `e_r_sys_region` VALUES ('520102', '520100', '南明', '南明区', '中国,贵州省,贵阳市,南明区', '3', 'Nanming', '0851', '550001');
INSERT INTO `e_r_sys_region` VALUES ('520103', '520100', '云岩', '云岩区', '中国,贵州省,贵阳市,云岩区', '3', 'Yunyan', '0851', '550001');
INSERT INTO `e_r_sys_region` VALUES ('520111', '520100', '花溪', '花溪区', '中国,贵州省,贵阳市,花溪区', '3', 'Huaxi', '0851', '550025');
INSERT INTO `e_r_sys_region` VALUES ('520112', '520100', '乌当', '乌当区', '中国,贵州省,贵阳市,乌当区', '3', 'Wudang', '0851', '550018');
INSERT INTO `e_r_sys_region` VALUES ('520113', '520100', '白云', '白云区', '中国,贵州省,贵阳市,白云区', '3', 'Baiyun', '0851', '550014');
INSERT INTO `e_r_sys_region` VALUES ('520115', '520100', '观山湖', '观山湖区', '中国,贵州省,贵阳市,观山湖区', '3', 'Guanshanhu', '0851', '550009');
INSERT INTO `e_r_sys_region` VALUES ('520121', '520100', '开阳', '开阳县', '中国,贵州省,贵阳市,开阳县', '3', 'Kaiyang', '0851', '550300');
INSERT INTO `e_r_sys_region` VALUES ('520122', '520100', '息烽', '息烽县', '中国,贵州省,贵阳市,息烽县', '3', 'Xifeng', '0851', '551100');
INSERT INTO `e_r_sys_region` VALUES ('520123', '520100', '修文', '修文县', '中国,贵州省,贵阳市,修文县', '3', 'Xiuwen', '0851', '550200');
INSERT INTO `e_r_sys_region` VALUES ('520181', '520100', '清镇', '清镇市', '中国,贵州省,贵阳市,清镇市', '3', 'Qingzhen', '0851', '551400');
INSERT INTO `e_r_sys_region` VALUES ('520200', '520000', '六盘水', '六盘水市', '中国,贵州省,六盘水市', '2', 'Liupanshui', '0858', '553400');
INSERT INTO `e_r_sys_region` VALUES ('520201', '520200', '钟山', '钟山区', '中国,贵州省,六盘水市,钟山区', '3', 'Zhongshan', '0858', '553000');
INSERT INTO `e_r_sys_region` VALUES ('520203', '520200', '六枝', '六枝特区', '中国,贵州省,六盘水市,六枝特区', '3', 'Liuzhi', '0858', '553400');
INSERT INTO `e_r_sys_region` VALUES ('520221', '520200', '水城', '水城县', '中国,贵州省,六盘水市,水城县', '3', 'Shuicheng', '0858', '553000');
INSERT INTO `e_r_sys_region` VALUES ('520222', '520200', '盘县', '盘县', '中国,贵州省,六盘水市,盘县', '3', 'Panxian', '0858', '561601');
INSERT INTO `e_r_sys_region` VALUES ('520300', '520000', '遵义', '遵义市', '中国,贵州省,遵义市', '2', 'Zunyi', '0852', '563000');
INSERT INTO `e_r_sys_region` VALUES ('520302', '520300', '红花岗', '红花岗区', '中国,贵州省,遵义市,红花岗区', '3', 'Honghuagang', '0852', '563000');
INSERT INTO `e_r_sys_region` VALUES ('520303', '520300', '汇川', '汇川区', '中国,贵州省,遵义市,汇川区', '3', 'Huichuan', '0852', '563000');
INSERT INTO `e_r_sys_region` VALUES ('520321', '520300', '遵义', '遵义县', '中国,贵州省,遵义市,遵义县', '3', 'Zunyi', '0852', '563100');
INSERT INTO `e_r_sys_region` VALUES ('520322', '520300', '桐梓', '桐梓县', '中国,贵州省,遵义市,桐梓县', '3', 'Tongzi', '0852', '563200');
INSERT INTO `e_r_sys_region` VALUES ('520323', '520300', '绥阳', '绥阳县', '中国,贵州省,遵义市,绥阳县', '3', 'Suiyang', '0852', '563300');
INSERT INTO `e_r_sys_region` VALUES ('520324', '520300', '正安', '正安县', '中国,贵州省,遵义市,正安县', '3', 'Zheng\'an', '0852', '563400');
INSERT INTO `e_r_sys_region` VALUES ('520325', '520300', '道真', '道真仡佬族苗族自治县', '中国,贵州省,遵义市,道真仡佬族苗族自治县', '3', 'Daozhen', '0852', '563500');
INSERT INTO `e_r_sys_region` VALUES ('520326', '520300', '务川', '务川仡佬族苗族自治县', '中国,贵州省,遵义市,务川仡佬族苗族自治县', '3', 'Wuchuan', '0852', '564300');
INSERT INTO `e_r_sys_region` VALUES ('520327', '520300', '凤冈', '凤冈县', '中国,贵州省,遵义市,凤冈县', '3', 'Fenggang', '0852', '564200');
INSERT INTO `e_r_sys_region` VALUES ('520328', '520300', '湄潭', '湄潭县', '中国,贵州省,遵义市,湄潭县', '3', 'Meitan', '0852', '564100');
INSERT INTO `e_r_sys_region` VALUES ('520329', '520300', '余庆', '余庆县', '中国,贵州省,遵义市,余庆县', '3', 'Yuqing', '0852', '564400');
INSERT INTO `e_r_sys_region` VALUES ('520330', '520300', '习水', '习水县', '中国,贵州省,遵义市,习水县', '3', 'Xishui', '0852', '564600');
INSERT INTO `e_r_sys_region` VALUES ('520381', '520300', '赤水', '赤水市', '中国,贵州省,遵义市,赤水市', '3', 'Chishui', '0852', '564700');
INSERT INTO `e_r_sys_region` VALUES ('520382', '520300', '仁怀', '仁怀市', '中国,贵州省,遵义市,仁怀市', '3', 'Renhuai', '0852', '564500');
INSERT INTO `e_r_sys_region` VALUES ('520400', '520000', '安顺', '安顺市', '中国,贵州省,安顺市', '2', 'Anshun', '0853', '561000');
INSERT INTO `e_r_sys_region` VALUES ('520402', '520400', '西秀', '西秀区', '中国,贵州省,安顺市,西秀区', '3', 'Xixiu', '0853', '561000');
INSERT INTO `e_r_sys_region` VALUES ('520421', '520400', '平坝', '平坝区', '中国,贵州省,安顺市,平坝区', '3', 'Pingba', '0853', '561100');
INSERT INTO `e_r_sys_region` VALUES ('520422', '520400', '普定', '普定县', '中国,贵州省,安顺市,普定县', '3', 'Puding', '0853', '562100');
INSERT INTO `e_r_sys_region` VALUES ('520423', '520400', '镇宁', '镇宁布依族苗族自治县', '中国,贵州省,安顺市,镇宁布依族苗族自治县', '3', 'Zhenning', '0853', '561200');
INSERT INTO `e_r_sys_region` VALUES ('520424', '520400', '关岭', '关岭布依族苗族自治县', '中国,贵州省,安顺市,关岭布依族苗族自治县', '3', 'Guanling', '0853', '561300');
INSERT INTO `e_r_sys_region` VALUES ('520425', '520400', '紫云', '紫云苗族布依族自治县', '中国,贵州省,安顺市,紫云苗族布依族自治县', '3', 'Ziyun', '0853', '550800');
INSERT INTO `e_r_sys_region` VALUES ('520500', '520000', '毕节', '毕节市', '中国,贵州省,毕节市', '2', 'Bijie', '0857', '551700');
INSERT INTO `e_r_sys_region` VALUES ('520502', '520500', '七星关', '七星关区', '中国,贵州省,毕节市,七星关区', '3', 'Qixingguan', '0857', '551700');
INSERT INTO `e_r_sys_region` VALUES ('520521', '520500', '大方', '大方县', '中国,贵州省,毕节市,大方县', '3', 'Dafang', '0857', '551600');
INSERT INTO `e_r_sys_region` VALUES ('520522', '520500', '黔西', '黔西县', '中国,贵州省,毕节市,黔西县', '3', 'Qianxi', '0857', '551500');
INSERT INTO `e_r_sys_region` VALUES ('520523', '520500', '金沙', '金沙县', '中国,贵州省,毕节市,金沙县', '3', 'Jinsha', '0857', '551800');
INSERT INTO `e_r_sys_region` VALUES ('520524', '520500', '织金', '织金县', '中国,贵州省,毕节市,织金县', '3', 'Zhijin', '0857', '552100');
INSERT INTO `e_r_sys_region` VALUES ('520525', '520500', '纳雍', '纳雍县', '中国,贵州省,毕节市,纳雍县', '3', 'Nayong', '0857', '553300');
INSERT INTO `e_r_sys_region` VALUES ('520526', '520500', '威宁', '威宁彝族回族苗族自治县', '中国,贵州省,毕节市,威宁彝族回族苗族自治县', '3', 'Weining', '0857', '553100');
INSERT INTO `e_r_sys_region` VALUES ('520527', '520500', '赫章', '赫章县', '中国,贵州省,毕节市,赫章县', '3', 'Hezhang', '0857', '553200');
INSERT INTO `e_r_sys_region` VALUES ('520600', '520000', '铜仁', '铜仁市', '中国,贵州省,铜仁市', '2', 'Tongren', '0856', '554300');
INSERT INTO `e_r_sys_region` VALUES ('520602', '520600', '碧江', '碧江区', '中国,贵州省,铜仁市,碧江区', '3', 'Bijiang', '0856', '554300');
INSERT INTO `e_r_sys_region` VALUES ('520603', '520600', '万山', '万山区', '中国,贵州省,铜仁市,万山区', '3', 'Wanshan', '0856', '554200');
INSERT INTO `e_r_sys_region` VALUES ('520621', '520600', '江口', '江口县', '中国,贵州省,铜仁市,江口县', '3', 'Jiangkou', '0856', '554400');
INSERT INTO `e_r_sys_region` VALUES ('520622', '520600', '玉屏', '玉屏侗族自治县', '中国,贵州省,铜仁市,玉屏侗族自治县', '3', 'Yuping', '0856', '554004');
INSERT INTO `e_r_sys_region` VALUES ('520623', '520600', '石阡', '石阡县', '中国,贵州省,铜仁市,石阡县', '3', 'Shiqian', '0856', '555100');
INSERT INTO `e_r_sys_region` VALUES ('520624', '520600', '思南', '思南县', '中国,贵州省,铜仁市,思南县', '3', 'Sinan', '0856', '565100');
INSERT INTO `e_r_sys_region` VALUES ('520625', '520600', '印江', '印江土家族苗族自治县', '中国,贵州省,铜仁市,印江土家族苗族自治县', '3', 'Yinjiang', '0856', '555200');
INSERT INTO `e_r_sys_region` VALUES ('520626', '520600', '德江', '德江县', '中国,贵州省,铜仁市,德江县', '3', 'Dejiang', '0856', '565200');
INSERT INTO `e_r_sys_region` VALUES ('520627', '520600', '沿河', '沿河土家族自治县', '中国,贵州省,铜仁市,沿河土家族自治县', '3', 'Yuanhe', '0856', '565300');
INSERT INTO `e_r_sys_region` VALUES ('520628', '520600', '松桃', '松桃苗族自治县', '中国,贵州省,铜仁市,松桃苗族自治县', '3', 'Songtao', '0856', '554100');
INSERT INTO `e_r_sys_region` VALUES ('522300', '520000', '黔西南', '黔西南布依族苗族自治州', '中国,贵州省,黔西南布依族苗族自治州', '2', 'Qianxinan', '0859', '562400');
INSERT INTO `e_r_sys_region` VALUES ('522301', '522300', '兴义', '兴义市 ', '中国,贵州省,黔西南布依族苗族自治州,兴义市 ', '3', 'Xingyi', '0859', '562400');
INSERT INTO `e_r_sys_region` VALUES ('522322', '522300', '兴仁', '兴仁县', '中国,贵州省,黔西南布依族苗族自治州,兴仁县', '3', 'Xingren', '0859', '562300');
INSERT INTO `e_r_sys_region` VALUES ('522323', '522300', '普安', '普安县', '中国,贵州省,黔西南布依族苗族自治州,普安县', '3', 'Pu\'an', '0859', '561500');
INSERT INTO `e_r_sys_region` VALUES ('522324', '522300', '晴隆', '晴隆县', '中国,贵州省,黔西南布依族苗族自治州,晴隆县', '3', 'Qinglong', '0859', '561400');
INSERT INTO `e_r_sys_region` VALUES ('522325', '522300', '贞丰', '贞丰县', '中国,贵州省,黔西南布依族苗族自治州,贞丰县', '3', 'Zhenfeng', '0859', '562200');
INSERT INTO `e_r_sys_region` VALUES ('522326', '522300', '望谟', '望谟县', '中国,贵州省,黔西南布依族苗族自治州,望谟县', '3', 'Wangmo', '0859', '552300');
INSERT INTO `e_r_sys_region` VALUES ('522327', '522300', '册亨', '册亨县', '中国,贵州省,黔西南布依族苗族自治州,册亨县', '3', 'Ceheng', '0859', '552200');
INSERT INTO `e_r_sys_region` VALUES ('522328', '522300', '安龙', '安龙县', '中国,贵州省,黔西南布依族苗族自治州,安龙县', '3', 'Anlong', '0859', '552400');
INSERT INTO `e_r_sys_region` VALUES ('522600', '520000', '黔东南', '黔东南苗族侗族自治州', '中国,贵州省,黔东南苗族侗族自治州', '2', 'Qiandongnan', '0855', '556000');
INSERT INTO `e_r_sys_region` VALUES ('522601', '522600', '凯里', '凯里市', '中国,贵州省,黔东南苗族侗族自治州,凯里市', '3', 'Kaili', '0855', '556000');
INSERT INTO `e_r_sys_region` VALUES ('522622', '522600', '黄平', '黄平县', '中国,贵州省,黔东南苗族侗族自治州,黄平县', '3', 'Huangping', '0855', '556100');
INSERT INTO `e_r_sys_region` VALUES ('522623', '522600', '施秉', '施秉县', '中国,贵州省,黔东南苗族侗族自治州,施秉县', '3', 'Shibing', '0855', '556200');
INSERT INTO `e_r_sys_region` VALUES ('522624', '522600', '三穗', '三穗县', '中国,贵州省,黔东南苗族侗族自治州,三穗县', '3', 'Sansui', '0855', '556500');
INSERT INTO `e_r_sys_region` VALUES ('522625', '522600', '镇远', '镇远县', '中国,贵州省,黔东南苗族侗族自治州,镇远县', '3', 'Zhenyuan', '0855', '557700');
INSERT INTO `e_r_sys_region` VALUES ('522626', '522600', '岑巩', '岑巩县', '中国,贵州省,黔东南苗族侗族自治州,岑巩县', '3', 'Cengong', '0855', '557800');
INSERT INTO `e_r_sys_region` VALUES ('522627', '522600', '天柱', '天柱县', '中国,贵州省,黔东南苗族侗族自治州,天柱县', '3', 'Tianzhu', '0855', '556600');
INSERT INTO `e_r_sys_region` VALUES ('522628', '522600', '锦屏', '锦屏县', '中国,贵州省,黔东南苗族侗族自治州,锦屏县', '3', 'Jinping', '0855', '556700');
INSERT INTO `e_r_sys_region` VALUES ('522629', '522600', '剑河', '剑河县', '中国,贵州省,黔东南苗族侗族自治州,剑河县', '3', 'Jianhe', '0855', '556400');
INSERT INTO `e_r_sys_region` VALUES ('522630', '522600', '台江', '台江县', '中国,贵州省,黔东南苗族侗族自治州,台江县', '3', 'Taijiang', '0855', '556300');
INSERT INTO `e_r_sys_region` VALUES ('522631', '522600', '黎平', '黎平县', '中国,贵州省,黔东南苗族侗族自治州,黎平县', '3', 'Liping', '0855', '557300');
INSERT INTO `e_r_sys_region` VALUES ('522632', '522600', '榕江', '榕江县', '中国,贵州省,黔东南苗族侗族自治州,榕江县', '3', 'Rongjiang', '0855', '557200');
INSERT INTO `e_r_sys_region` VALUES ('522633', '522600', '从江', '从江县', '中国,贵州省,黔东南苗族侗族自治州,从江县', '3', 'Congjiang', '0855', '557400');
INSERT INTO `e_r_sys_region` VALUES ('522634', '522600', '雷山', '雷山县', '中国,贵州省,黔东南苗族侗族自治州,雷山县', '3', 'Leishan', '0855', '557100');
INSERT INTO `e_r_sys_region` VALUES ('522635', '522600', '麻江', '麻江县', '中国,贵州省,黔东南苗族侗族自治州,麻江县', '3', 'Majiang', '0855', '557600');
INSERT INTO `e_r_sys_region` VALUES ('522636', '522600', '丹寨', '丹寨县', '中国,贵州省,黔东南苗族侗族自治州,丹寨县', '3', 'Danzhai', '0855', '557500');
INSERT INTO `e_r_sys_region` VALUES ('522700', '520000', '黔南', '黔南布依族苗族自治州', '中国,贵州省,黔南布依族苗族自治州', '2', 'Qiannan', '0854', '558000');
INSERT INTO `e_r_sys_region` VALUES ('522701', '522700', '都匀', '都匀市', '中国,贵州省,黔南布依族苗族自治州,都匀市', '3', 'Duyun', '0854', '558000');
INSERT INTO `e_r_sys_region` VALUES ('522702', '522700', '福泉', '福泉市', '中国,贵州省,黔南布依族苗族自治州,福泉市', '3', 'Fuquan', '0854', '550500');
INSERT INTO `e_r_sys_region` VALUES ('522722', '522700', '荔波', '荔波县', '中国,贵州省,黔南布依族苗族自治州,荔波县', '3', 'Libo', '0854', '558400');
INSERT INTO `e_r_sys_region` VALUES ('522723', '522700', '贵定', '贵定县', '中国,贵州省,黔南布依族苗族自治州,贵定县', '3', 'Guiding', '0854', '551300');
INSERT INTO `e_r_sys_region` VALUES ('522725', '522700', '瓮安', '瓮安县', '中国,贵州省,黔南布依族苗族自治州,瓮安县', '3', 'Weng\'an', '0854', '550400');
INSERT INTO `e_r_sys_region` VALUES ('522726', '522700', '独山', '独山县', '中国,贵州省,黔南布依族苗族自治州,独山县', '3', 'Dushan', '0854', '558200');
INSERT INTO `e_r_sys_region` VALUES ('522727', '522700', '平塘', '平塘县', '中国,贵州省,黔南布依族苗族自治州,平塘县', '3', 'Pingtang', '0854', '558300');
INSERT INTO `e_r_sys_region` VALUES ('522728', '522700', '罗甸', '罗甸县', '中国,贵州省,黔南布依族苗族自治州,罗甸县', '3', 'Luodian', '0854', '550100');
INSERT INTO `e_r_sys_region` VALUES ('522729', '522700', '长顺', '长顺县', '中国,贵州省,黔南布依族苗族自治州,长顺县', '3', 'Changshun', '0854', '550700');
INSERT INTO `e_r_sys_region` VALUES ('522730', '522700', '龙里', '龙里县', '中国,贵州省,黔南布依族苗族自治州,龙里县', '3', 'Longli', '0854', '551200');
INSERT INTO `e_r_sys_region` VALUES ('522731', '522700', '惠水', '惠水县', '中国,贵州省,黔南布依族苗族自治州,惠水县', '3', 'Huishui', '0854', '550600');
INSERT INTO `e_r_sys_region` VALUES ('522732', '522700', '三都', '三都水族自治县', '中国,贵州省,黔南布依族苗族自治州,三都水族自治县', '3', 'Sandu', '0854', '558100');
INSERT INTO `e_r_sys_region` VALUES ('530000', '100000', '云南', '云南省', '中国,云南省', '1', 'Yunnan', '', '');
INSERT INTO `e_r_sys_region` VALUES ('530100', '530000', '昆明', '昆明市', '中国,云南省,昆明市', '2', 'Kunming', '0871', '650500');
INSERT INTO `e_r_sys_region` VALUES ('530102', '530100', '五华', '五华区', '中国,云南省,昆明市,五华区', '3', 'Wuhua', '0871', '650021');
INSERT INTO `e_r_sys_region` VALUES ('530103', '530100', '盘龙', '盘龙区', '中国,云南省,昆明市,盘龙区', '3', 'Panlong', '0871', '650051');
INSERT INTO `e_r_sys_region` VALUES ('530111', '530100', '官渡', '官渡区', '中国,云南省,昆明市,官渡区', '3', 'Guandu', '0871', '650200');
INSERT INTO `e_r_sys_region` VALUES ('530112', '530100', '西山', '西山区', '中国,云南省,昆明市,西山区', '3', 'Xishan', '0871', '650118');
INSERT INTO `e_r_sys_region` VALUES ('530113', '530100', '东川', '东川区', '中国,云南省,昆明市,东川区', '3', 'Dongchuan', '0871', '654100');
INSERT INTO `e_r_sys_region` VALUES ('530114', '530100', '呈贡', '呈贡区', '中国,云南省,昆明市,呈贡区', '3', 'Chenggong', '0871', '650500');
INSERT INTO `e_r_sys_region` VALUES ('530122', '530100', '晋宁', '晋宁县', '中国,云南省,昆明市,晋宁县', '3', 'Jinning', '0871', '650600');
INSERT INTO `e_r_sys_region` VALUES ('530124', '530100', '富民', '富民县', '中国,云南省,昆明市,富民县', '3', 'Fumin', '0871', '650400');
INSERT INTO `e_r_sys_region` VALUES ('530125', '530100', '宜良', '宜良县', '中国,云南省,昆明市,宜良县', '3', 'Yiliang', '0871', '652100');
INSERT INTO `e_r_sys_region` VALUES ('530126', '530100', '石林', '石林彝族自治县', '中国,云南省,昆明市,石林彝族自治县', '3', 'Shilin', '0871', '652200');
INSERT INTO `e_r_sys_region` VALUES ('530127', '530100', '嵩明', '嵩明县', '中国,云南省,昆明市,嵩明县', '3', 'Songming', '0871', '651700');
INSERT INTO `e_r_sys_region` VALUES ('530128', '530100', '禄劝', '禄劝彝族苗族自治县', '中国,云南省,昆明市,禄劝彝族苗族自治县', '3', 'Luquan', '0871', '651500');
INSERT INTO `e_r_sys_region` VALUES ('530129', '530100', '寻甸', '寻甸回族彝族自治县 ', '中国,云南省,昆明市,寻甸回族彝族自治县 ', '3', 'Xundian', '0871', '655200');
INSERT INTO `e_r_sys_region` VALUES ('530181', '530100', '安宁', '安宁市', '中国,云南省,昆明市,安宁市', '3', 'Anning', '0871', '650300');
INSERT INTO `e_r_sys_region` VALUES ('530300', '530000', '曲靖', '曲靖市', '中国,云南省,曲靖市', '2', 'Qujing', '0874', '655000');
INSERT INTO `e_r_sys_region` VALUES ('530302', '530300', '麒麟', '麒麟区', '中国,云南省,曲靖市,麒麟区', '3', 'Qilin', '0874', '655000');
INSERT INTO `e_r_sys_region` VALUES ('530321', '530300', '马龙', '马龙县', '中国,云南省,曲靖市,马龙县', '3', 'Malong', '0874', '655100');
INSERT INTO `e_r_sys_region` VALUES ('530322', '530300', '陆良', '陆良县', '中国,云南省,曲靖市,陆良县', '3', 'Luliang', '0874', '655600');
INSERT INTO `e_r_sys_region` VALUES ('530323', '530300', '师宗', '师宗县', '中国,云南省,曲靖市,师宗县', '3', 'Shizong', '0874', '655700');
INSERT INTO `e_r_sys_region` VALUES ('530324', '530300', '罗平', '罗平县', '中国,云南省,曲靖市,罗平县', '3', 'Luoping', '0874', '655800');
INSERT INTO `e_r_sys_region` VALUES ('530325', '530300', '富源', '富源县', '中国,云南省,曲靖市,富源县', '3', 'Fuyuan', '0874', '655500');
INSERT INTO `e_r_sys_region` VALUES ('530326', '530300', '会泽', '会泽县', '中国,云南省,曲靖市,会泽县', '3', 'Huize', '0874', '654200');
INSERT INTO `e_r_sys_region` VALUES ('530328', '530300', '沾益', '沾益县', '中国,云南省,曲靖市,沾益县', '3', 'Zhanyi', '0874', '655331');
INSERT INTO `e_r_sys_region` VALUES ('530381', '530300', '宣威', '宣威市', '中国,云南省,曲靖市,宣威市', '3', 'Xuanwei', '0874', '655400');
INSERT INTO `e_r_sys_region` VALUES ('530400', '530000', '玉溪', '玉溪市', '中国,云南省,玉溪市', '2', 'Yuxi', '0877', '653100');
INSERT INTO `e_r_sys_region` VALUES ('530402', '530400', '红塔', '红塔区', '中国,云南省,玉溪市,红塔区', '3', 'Hongta', '0877', '653100');
INSERT INTO `e_r_sys_region` VALUES ('530421', '530400', '江川', '江川县', '中国,云南省,玉溪市,江川县', '3', 'Jiangchuan', '0877', '652600');
INSERT INTO `e_r_sys_region` VALUES ('530422', '530400', '澄江', '澄江县', '中国,云南省,玉溪市,澄江县', '3', 'Chengjiang', '0877', '652500');
INSERT INTO `e_r_sys_region` VALUES ('530423', '530400', '通海', '通海县', '中国,云南省,玉溪市,通海县', '3', 'Tonghai', '0877', '652700');
INSERT INTO `e_r_sys_region` VALUES ('530424', '530400', '华宁', '华宁县', '中国,云南省,玉溪市,华宁县', '3', 'Huaning', '0877', '652800');
INSERT INTO `e_r_sys_region` VALUES ('530425', '530400', '易门', '易门县', '中国,云南省,玉溪市,易门县', '3', 'Yimen', '0877', '651100');
INSERT INTO `e_r_sys_region` VALUES ('530426', '530400', '峨山', '峨山彝族自治县', '中国,云南省,玉溪市,峨山彝族自治县', '3', 'Eshan', '0877', '653200');
INSERT INTO `e_r_sys_region` VALUES ('530427', '530400', '新平', '新平彝族傣族自治县', '中国,云南省,玉溪市,新平彝族傣族自治县', '3', 'Xinping', '0877', '653400');
INSERT INTO `e_r_sys_region` VALUES ('530428', '530400', '元江', '元江哈尼族彝族傣族自治县', '中国,云南省,玉溪市,元江哈尼族彝族傣族自治县', '3', 'Yuanjiang', '0877', '653300');
INSERT INTO `e_r_sys_region` VALUES ('530500', '530000', '保山', '保山市', '中国,云南省,保山市', '2', 'Baoshan', '0875', '678000');
INSERT INTO `e_r_sys_region` VALUES ('530502', '530500', '隆阳', '隆阳区', '中国,云南省,保山市,隆阳区', '3', 'Longyang', '0875', '678000');
INSERT INTO `e_r_sys_region` VALUES ('530521', '530500', '施甸', '施甸县', '中国,云南省,保山市,施甸县', '3', 'Shidian', '0875', '678200');
INSERT INTO `e_r_sys_region` VALUES ('530522', '530500', '腾冲', '腾冲县', '中国,云南省,保山市,腾冲县', '3', 'Tengchong', '0875', '679100');
INSERT INTO `e_r_sys_region` VALUES ('530523', '530500', '龙陵', '龙陵县', '中国,云南省,保山市,龙陵县', '3', 'Longling', '0875', '678300');
INSERT INTO `e_r_sys_region` VALUES ('530524', '530500', '昌宁', '昌宁县', '中国,云南省,保山市,昌宁县', '3', 'Changning', '0875', '678100');
INSERT INTO `e_r_sys_region` VALUES ('530600', '530000', '昭通', '昭通市', '中国,云南省,昭通市', '2', 'Zhaotong', '0870', '657000');
INSERT INTO `e_r_sys_region` VALUES ('530602', '530600', '昭阳', '昭阳区', '中国,云南省,昭通市,昭阳区', '3', 'Zhaoyang', '0870', '657000');
INSERT INTO `e_r_sys_region` VALUES ('530621', '530600', '鲁甸', '鲁甸县', '中国,云南省,昭通市,鲁甸县', '3', 'Ludian', '0870', '657100');
INSERT INTO `e_r_sys_region` VALUES ('530622', '530600', '巧家', '巧家县', '中国,云南省,昭通市,巧家县', '3', 'Qiaojia', '0870', '654600');
INSERT INTO `e_r_sys_region` VALUES ('530623', '530600', '盐津', '盐津县', '中国,云南省,昭通市,盐津县', '3', 'Yanjin', '0870', '657500');
INSERT INTO `e_r_sys_region` VALUES ('530624', '530600', '大关', '大关县', '中国,云南省,昭通市,大关县', '3', 'Daguan', '0870', '657400');
INSERT INTO `e_r_sys_region` VALUES ('530625', '530600', '永善', '永善县', '中国,云南省,昭通市,永善县', '3', 'Yongshan', '0870', '657300');
INSERT INTO `e_r_sys_region` VALUES ('530626', '530600', '绥江', '绥江县', '中国,云南省,昭通市,绥江县', '3', 'Suijiang', '0870', '657700');
INSERT INTO `e_r_sys_region` VALUES ('530627', '530600', '镇雄', '镇雄县', '中国,云南省,昭通市,镇雄县', '3', 'Zhenxiong', '0870', '657200');
INSERT INTO `e_r_sys_region` VALUES ('530628', '530600', '彝良', '彝良县', '中国,云南省,昭通市,彝良县', '3', 'Yiliang', '0870', '657600');
INSERT INTO `e_r_sys_region` VALUES ('530629', '530600', '威信', '威信县', '中国,云南省,昭通市,威信县', '3', 'Weixin', '0870', '657900');
INSERT INTO `e_r_sys_region` VALUES ('530630', '530600', '水富', '水富县', '中国,云南省,昭通市,水富县', '3', 'Shuifu', '0870', '657800');
INSERT INTO `e_r_sys_region` VALUES ('530700', '530000', '丽江', '丽江市', '中国,云南省,丽江市', '2', 'Lijiang', '0888', '674100');
INSERT INTO `e_r_sys_region` VALUES ('530702', '530700', '古城', '古城区', '中国,云南省,丽江市,古城区', '3', 'Gucheng', '0888', '674100');
INSERT INTO `e_r_sys_region` VALUES ('530721', '530700', '玉龙', '玉龙纳西族自治县', '中国,云南省,丽江市,玉龙纳西族自治县', '3', 'Yulong', '0888', '674100');
INSERT INTO `e_r_sys_region` VALUES ('530722', '530700', '永胜', '永胜县', '中国,云南省,丽江市,永胜县', '3', 'Yongsheng', '0888', '674200');
INSERT INTO `e_r_sys_region` VALUES ('530723', '530700', '华坪', '华坪县', '中国,云南省,丽江市,华坪县', '3', 'Huaping', '0888', '674800');
INSERT INTO `e_r_sys_region` VALUES ('530724', '530700', '宁蒗', '宁蒗彝族自治县', '中国,云南省,丽江市,宁蒗彝族自治县', '3', 'Ninglang', '0888', '674300');
INSERT INTO `e_r_sys_region` VALUES ('530800', '530000', '普洱', '普洱市', '中国,云南省,普洱市', '2', 'Pu\'er', '0879', '665000');
INSERT INTO `e_r_sys_region` VALUES ('530802', '530800', '思茅', '思茅区', '中国,云南省,普洱市,思茅区', '3', 'Simao', '0879', '665000');
INSERT INTO `e_r_sys_region` VALUES ('530821', '530800', '宁洱', '宁洱哈尼族彝族自治县', '中国,云南省,普洱市,宁洱哈尼族彝族自治县', '3', 'Ninger', '0879', '665100');
INSERT INTO `e_r_sys_region` VALUES ('530822', '530800', '墨江', '墨江哈尼族自治县', '中国,云南省,普洱市,墨江哈尼族自治县', '3', 'Mojiang', '0879', '654800');
INSERT INTO `e_r_sys_region` VALUES ('530823', '530800', '景东', '景东彝族自治县', '中国,云南省,普洱市,景东彝族自治县', '3', 'Jingdong', '0879', '676200');
INSERT INTO `e_r_sys_region` VALUES ('530824', '530800', '景谷', '景谷傣族彝族自治县', '中国,云南省,普洱市,景谷傣族彝族自治县', '3', 'Jinggu', '0879', '666400');
INSERT INTO `e_r_sys_region` VALUES ('530825', '530800', '镇沅', '镇沅彝族哈尼族拉祜族自治县', '中国,云南省,普洱市,镇沅彝族哈尼族拉祜族自治县', '3', 'Zhenyuan', '0879', '666500');
INSERT INTO `e_r_sys_region` VALUES ('530826', '530800', '江城', '江城哈尼族彝族自治县', '中国,云南省,普洱市,江城哈尼族彝族自治县', '3', 'Jiangcheng', '0879', '665900');
INSERT INTO `e_r_sys_region` VALUES ('530827', '530800', '孟连', '孟连傣族拉祜族佤族自治县', '中国,云南省,普洱市,孟连傣族拉祜族佤族自治县', '3', 'Menglian', '0879', '665800');
INSERT INTO `e_r_sys_region` VALUES ('530828', '530800', '澜沧', '澜沧拉祜族自治县', '中国,云南省,普洱市,澜沧拉祜族自治县', '3', 'Lancang', '0879', '665600');
INSERT INTO `e_r_sys_region` VALUES ('530829', '530800', '西盟', '西盟佤族自治县', '中国,云南省,普洱市,西盟佤族自治县', '3', 'Ximeng', '0879', '665700');
INSERT INTO `e_r_sys_region` VALUES ('530900', '530000', '临沧', '临沧市', '中国,云南省,临沧市', '2', 'Lincang', '0883', '677000');
INSERT INTO `e_r_sys_region` VALUES ('530902', '530900', '临翔', '临翔区', '中国,云南省,临沧市,临翔区', '3', 'Linxiang', '0883', '677000');
INSERT INTO `e_r_sys_region` VALUES ('530921', '530900', '凤庆', '凤庆县', '中国,云南省,临沧市,凤庆县', '3', 'Fengqing', '0883', '675900');
INSERT INTO `e_r_sys_region` VALUES ('530922', '530900', '云县', '云县', '中国,云南省,临沧市,云县', '3', 'Yunxian', '0883', '675800');
INSERT INTO `e_r_sys_region` VALUES ('530923', '530900', '永德', '永德县', '中国,云南省,临沧市,永德县', '3', 'Yongde', '0883', '677600');
INSERT INTO `e_r_sys_region` VALUES ('530924', '530900', '镇康', '镇康县', '中国,云南省,临沧市,镇康县', '3', 'Zhenkang', '0883', '677704');
INSERT INTO `e_r_sys_region` VALUES ('530925', '530900', '双江', '双江拉祜族佤族布朗族傣族自治县', '中国,云南省,临沧市,双江拉祜族佤族布朗族傣族自治县', '3', 'Shuangjiang', '0883', '677300');
INSERT INTO `e_r_sys_region` VALUES ('530926', '530900', '耿马', '耿马傣族佤族自治县', '中国,云南省,临沧市,耿马傣族佤族自治县', '3', 'Gengma', '0883', '677500');
INSERT INTO `e_r_sys_region` VALUES ('530927', '530900', '沧源', '沧源佤族自治县', '中国,云南省,临沧市,沧源佤族自治县', '3', 'Cangyuan', '0883', '677400');
INSERT INTO `e_r_sys_region` VALUES ('532300', '530000', '楚雄', '楚雄彝族自治州', '中国,云南省,楚雄彝族自治州', '2', 'Chuxiong', '0878', '675000');
INSERT INTO `e_r_sys_region` VALUES ('532301', '532300', '楚雄', '楚雄市', '中国,云南省,楚雄彝族自治州,楚雄市', '3', 'Chuxiong', '0878', '675000');
INSERT INTO `e_r_sys_region` VALUES ('532322', '532300', '双柏', '双柏县', '中国,云南省,楚雄彝族自治州,双柏县', '3', 'Shuangbai', '0878', '675100');
INSERT INTO `e_r_sys_region` VALUES ('532323', '532300', '牟定', '牟定县', '中国,云南省,楚雄彝族自治州,牟定县', '3', 'Mouding', '0878', '675500');
INSERT INTO `e_r_sys_region` VALUES ('532324', '532300', '南华', '南华县', '中国,云南省,楚雄彝族自治州,南华县', '3', 'Nanhua', '0878', '675200');
INSERT INTO `e_r_sys_region` VALUES ('532325', '532300', '姚安', '姚安县', '中国,云南省,楚雄彝族自治州,姚安县', '3', 'Yao\'an', '0878', '675300');
INSERT INTO `e_r_sys_region` VALUES ('532326', '532300', '大姚', '大姚县', '中国,云南省,楚雄彝族自治州,大姚县', '3', 'Dayao', '0878', '675400');
INSERT INTO `e_r_sys_region` VALUES ('532327', '532300', '永仁', '永仁县', '中国,云南省,楚雄彝族自治州,永仁县', '3', 'Yongren', '0878', '651400');
INSERT INTO `e_r_sys_region` VALUES ('532328', '532300', '元谋', '元谋县', '中国,云南省,楚雄彝族自治州,元谋县', '3', 'Yuanmou', '0878', '651300');
INSERT INTO `e_r_sys_region` VALUES ('532329', '532300', '武定', '武定县', '中国,云南省,楚雄彝族自治州,武定县', '3', 'Wuding', '0878', '651600');
INSERT INTO `e_r_sys_region` VALUES ('532331', '532300', '禄丰', '禄丰县', '中国,云南省,楚雄彝族自治州,禄丰县', '3', 'Lufeng', '0878', '651200');
INSERT INTO `e_r_sys_region` VALUES ('532500', '530000', '红河', '红河哈尼族彝族自治州', '中国,云南省,红河哈尼族彝族自治州', '2', 'Honghe', '0873', '661400');
INSERT INTO `e_r_sys_region` VALUES ('532501', '532500', '个旧', '个旧市', '中国,云南省,红河哈尼族彝族自治州,个旧市', '3', 'Gejiu', '0873', '661000');
INSERT INTO `e_r_sys_region` VALUES ('532502', '532500', '开远', '开远市', '中国,云南省,红河哈尼族彝族自治州,开远市', '3', 'Kaiyuan', '0873', '661600');
INSERT INTO `e_r_sys_region` VALUES ('532503', '532500', '蒙自', '蒙自市', '中国,云南省,红河哈尼族彝族自治州,蒙自市', '3', 'Mengzi', '0873', '661101');
INSERT INTO `e_r_sys_region` VALUES ('532504', '532500', '弥勒', '弥勒市', '中国,云南省,红河哈尼族彝族自治州,弥勒市', '3', 'Mile ', '0873', '652300');
INSERT INTO `e_r_sys_region` VALUES ('532523', '532500', '屏边', '屏边苗族自治县', '中国,云南省,红河哈尼族彝族自治州,屏边苗族自治县', '3', 'Pingbian', '0873', '661200');
INSERT INTO `e_r_sys_region` VALUES ('532524', '532500', '建水', '建水县', '中国,云南省,红河哈尼族彝族自治州,建水县', '3', 'Jianshui', '0873', '654300');
INSERT INTO `e_r_sys_region` VALUES ('532525', '532500', '石屏', '石屏县', '中国,云南省,红河哈尼族彝族自治州,石屏县', '3', 'Shiping', '0873', '662200');
INSERT INTO `e_r_sys_region` VALUES ('532527', '532500', '泸西', '泸西县', '中国,云南省,红河哈尼族彝族自治州,泸西县', '3', 'Luxi', '0873', '652400');
INSERT INTO `e_r_sys_region` VALUES ('532528', '532500', '元阳', '元阳县', '中国,云南省,红河哈尼族彝族自治州,元阳县', '3', 'Yuanyang', '0873', '662400');
INSERT INTO `e_r_sys_region` VALUES ('532529', '532500', '红河县', '红河县', '中国,云南省,红河哈尼族彝族自治州,红河县', '3', 'Honghexian', '0873', '654400');
INSERT INTO `e_r_sys_region` VALUES ('532530', '532500', '金平', '金平苗族瑶族傣族自治县', '中国,云南省,红河哈尼族彝族自治州,金平苗族瑶族傣族自治县', '3', 'Jinping', '0873', '661500');
INSERT INTO `e_r_sys_region` VALUES ('532531', '532500', '绿春', '绿春县', '中国,云南省,红河哈尼族彝族自治州,绿春县', '3', 'Lvchun', '0873', '662500');
INSERT INTO `e_r_sys_region` VALUES ('532532', '532500', '河口', '河口瑶族自治县', '中国,云南省,红河哈尼族彝族自治州,河口瑶族自治县', '3', 'Hekou', '0873', '661300');
INSERT INTO `e_r_sys_region` VALUES ('532600', '530000', '文山', '文山壮族苗族自治州', '中国,云南省,文山壮族苗族自治州', '2', 'Wenshan', '0876', '663000');
INSERT INTO `e_r_sys_region` VALUES ('532601', '532600', '文山', '文山市', '中国,云南省,文山壮族苗族自治州,文山市', '3', 'Wenshan', '0876', '663000');
INSERT INTO `e_r_sys_region` VALUES ('532622', '532600', '砚山', '砚山县', '中国,云南省,文山壮族苗族自治州,砚山县', '3', 'Yanshan', '0876', '663100');
INSERT INTO `e_r_sys_region` VALUES ('532623', '532600', '西畴', '西畴县', '中国,云南省,文山壮族苗族自治州,西畴县', '3', 'Xichou', '0876', '663500');
INSERT INTO `e_r_sys_region` VALUES ('532624', '532600', '麻栗坡', '麻栗坡县', '中国,云南省,文山壮族苗族自治州,麻栗坡县', '3', 'Malipo', '0876', '663600');
INSERT INTO `e_r_sys_region` VALUES ('532625', '532600', '马关', '马关县', '中国,云南省,文山壮族苗族自治州,马关县', '3', 'Maguan', '0876', '663700');
INSERT INTO `e_r_sys_region` VALUES ('532626', '532600', '丘北', '丘北县', '中国,云南省,文山壮族苗族自治州,丘北县', '3', 'Qiubei', '0876', '663200');
INSERT INTO `e_r_sys_region` VALUES ('532627', '532600', '广南', '广南县', '中国,云南省,文山壮族苗族自治州,广南县', '3', 'Guangnan', '0876', '663300');
INSERT INTO `e_r_sys_region` VALUES ('532628', '532600', '富宁', '富宁县', '中国,云南省,文山壮族苗族自治州,富宁县', '3', 'Funing', '0876', '663400');
INSERT INTO `e_r_sys_region` VALUES ('532800', '530000', '西双版纳', '西双版纳傣族自治州', '中国,云南省,西双版纳傣族自治州', '2', 'Xishuangbanna', '0691', '666100');
INSERT INTO `e_r_sys_region` VALUES ('532801', '532800', '景洪', '景洪市', '中国,云南省,西双版纳傣族自治州,景洪市', '3', 'Jinghong', '0691', '666100');
INSERT INTO `e_r_sys_region` VALUES ('532822', '532800', '勐海', '勐海县', '中国,云南省,西双版纳傣族自治州,勐海县', '3', 'Menghai', '0691', '666200');
INSERT INTO `e_r_sys_region` VALUES ('532823', '532800', '勐腊', '勐腊县', '中国,云南省,西双版纳傣族自治州,勐腊县', '3', 'Mengla', '0691', '666300');
INSERT INTO `e_r_sys_region` VALUES ('532900', '530000', '大理', '大理白族自治州', '中国,云南省,大理白族自治州', '2', 'Dali', '0872', '671000');
INSERT INTO `e_r_sys_region` VALUES ('532901', '532900', '大理', '大理市', '中国,云南省,大理白族自治州,大理市', '3', 'Dali', '0872', '671000');
INSERT INTO `e_r_sys_region` VALUES ('532922', '532900', '漾濞', '漾濞彝族自治县', '中国,云南省,大理白族自治州,漾濞彝族自治县', '3', 'Yangbi', '0872', '672500');
INSERT INTO `e_r_sys_region` VALUES ('532923', '532900', '祥云', '祥云县', '中国,云南省,大理白族自治州,祥云县', '3', 'Xiangyun', '0872', '672100');
INSERT INTO `e_r_sys_region` VALUES ('532924', '532900', '宾川', '宾川县', '中国,云南省,大理白族自治州,宾川县', '3', 'Binchuan', '0872', '671600');
INSERT INTO `e_r_sys_region` VALUES ('532925', '532900', '弥渡', '弥渡县', '中国,云南省,大理白族自治州,弥渡县', '3', 'Midu', '0872', '675600');
INSERT INTO `e_r_sys_region` VALUES ('532926', '532900', '南涧', '南涧彝族自治县', '中国,云南省,大理白族自治州,南涧彝族自治县', '3', 'Nanjian', '0872', '675700');
INSERT INTO `e_r_sys_region` VALUES ('532927', '532900', '巍山', '巍山彝族回族自治县', '中国,云南省,大理白族自治州,巍山彝族回族自治县', '3', 'Weishan', '0872', '672400');
INSERT INTO `e_r_sys_region` VALUES ('532928', '532900', '永平', '永平县', '中国,云南省,大理白族自治州,永平县', '3', 'Yongping', '0872', '672600');
INSERT INTO `e_r_sys_region` VALUES ('532929', '532900', '云龙', '云龙县', '中国,云南省,大理白族自治州,云龙县', '3', 'Yunlong', '0872', '672700');
INSERT INTO `e_r_sys_region` VALUES ('532930', '532900', '洱源', '洱源县', '中国,云南省,大理白族自治州,洱源县', '3', 'Eryuan', '0872', '671200');
INSERT INTO `e_r_sys_region` VALUES ('532931', '532900', '剑川', '剑川县', '中国,云南省,大理白族自治州,剑川县', '3', 'Jianchuan', '0872', '671300');
INSERT INTO `e_r_sys_region` VALUES ('532932', '532900', '鹤庆', '鹤庆县', '中国,云南省,大理白族自治州,鹤庆县', '3', 'Heqing', '0872', '671500');
INSERT INTO `e_r_sys_region` VALUES ('533100', '530000', '德宏', '德宏傣族景颇族自治州', '中国,云南省,德宏傣族景颇族自治州', '2', 'Dehong', '0692', '678400');
INSERT INTO `e_r_sys_region` VALUES ('533102', '533100', '瑞丽', '瑞丽市', '中国,云南省,德宏傣族景颇族自治州,瑞丽市', '3', 'Ruili', '0692', '678600');
INSERT INTO `e_r_sys_region` VALUES ('533103', '533100', '芒市', '芒市', '中国,云南省,德宏傣族景颇族自治州,芒市', '3', 'Mangshi', '0692', '678400');
INSERT INTO `e_r_sys_region` VALUES ('533122', '533100', '梁河', '梁河县', '中国,云南省,德宏傣族景颇族自治州,梁河县', '3', 'Lianghe', '0692', '679200');
INSERT INTO `e_r_sys_region` VALUES ('533123', '533100', '盈江', '盈江县', '中国,云南省,德宏傣族景颇族自治州,盈江县', '3', 'Yingjiang', '0692', '679300');
INSERT INTO `e_r_sys_region` VALUES ('533124', '533100', '陇川', '陇川县', '中国,云南省,德宏傣族景颇族自治州,陇川县', '3', 'Longchuan', '0692', '678700');
INSERT INTO `e_r_sys_region` VALUES ('533300', '530000', '怒江', '怒江傈僳族自治州', '中国,云南省,怒江傈僳族自治州', '2', 'Nujiang', '0886', '673100');
INSERT INTO `e_r_sys_region` VALUES ('533321', '533300', '泸水', '泸水县', '中国,云南省,怒江傈僳族自治州,泸水县', '3', 'Lushui', '0886', '673100');
INSERT INTO `e_r_sys_region` VALUES ('533323', '533300', '福贡', '福贡县', '中国,云南省,怒江傈僳族自治州,福贡县', '3', 'Fugong', '0886', '673400');
INSERT INTO `e_r_sys_region` VALUES ('533324', '533300', '贡山', '贡山独龙族怒族自治县', '中国,云南省,怒江傈僳族自治州,贡山独龙族怒族自治县', '3', 'Gongshan', '0886', '673500');
INSERT INTO `e_r_sys_region` VALUES ('533325', '533300', '兰坪', '兰坪白族普米族自治县', '中国,云南省,怒江傈僳族自治州,兰坪白族普米族自治县', '3', 'Lanping', '0886', '671400');
INSERT INTO `e_r_sys_region` VALUES ('533400', '530000', '迪庆', '迪庆藏族自治州', '中国,云南省,迪庆藏族自治州', '2', 'Deqen', '0887', '674400');
INSERT INTO `e_r_sys_region` VALUES ('533421', '533400', '香格里拉', '香格里拉市', '中国,云南省,迪庆藏族自治州,香格里拉市', '3', 'Xianggelila', '0887', '674400');
INSERT INTO `e_r_sys_region` VALUES ('533422', '533400', '德钦', '德钦县', '中国,云南省,迪庆藏族自治州,德钦县', '3', 'Deqin', '0887', '674500');
INSERT INTO `e_r_sys_region` VALUES ('533423', '533400', '维西', '维西傈僳族自治县', '中国,云南省,迪庆藏族自治州,维西傈僳族自治县', '3', 'Weixi', '0887', '674600');
INSERT INTO `e_r_sys_region` VALUES ('540000', '100000', '西藏', '西藏自治区', '中国,西藏自治区', '1', 'Tibet', '', '');
INSERT INTO `e_r_sys_region` VALUES ('540100', '540000', '拉萨', '拉萨市', '中国,西藏自治区,拉萨市', '2', 'Lhasa', '0891', '850000');
INSERT INTO `e_r_sys_region` VALUES ('540102', '540100', '城关', '城关区', '中国,西藏自治区,拉萨市,城关区', '3', 'Chengguan', '0891', '850000');
INSERT INTO `e_r_sys_region` VALUES ('540121', '540100', '林周', '林周县', '中国,西藏自治区,拉萨市,林周县', '3', 'Linzhou', '0891', '851600');
INSERT INTO `e_r_sys_region` VALUES ('540122', '540100', '当雄', '当雄县', '中国,西藏自治区,拉萨市,当雄县', '3', 'Dangxiong', '0891', '851500');
INSERT INTO `e_r_sys_region` VALUES ('540123', '540100', '尼木', '尼木县', '中国,西藏自治区,拉萨市,尼木县', '3', 'Nimu', '0891', '851300');
INSERT INTO `e_r_sys_region` VALUES ('540124', '540100', '曲水', '曲水县', '中国,西藏自治区,拉萨市,曲水县', '3', 'Qushui', '0891', '850600');
INSERT INTO `e_r_sys_region` VALUES ('540125', '540100', '堆龙德庆', '堆龙德庆县', '中国,西藏自治区,拉萨市,堆龙德庆县', '3', 'Duilongdeqing', '0891', '851400');
INSERT INTO `e_r_sys_region` VALUES ('540126', '540100', '达孜', '达孜县', '中国,西藏自治区,拉萨市,达孜县', '3', 'Dazi', '0891', '850100');
INSERT INTO `e_r_sys_region` VALUES ('540127', '540100', '墨竹工卡', '墨竹工卡县', '中国,西藏自治区,拉萨市,墨竹工卡县', '3', 'Mozhugongka', '0891', '850200');
INSERT INTO `e_r_sys_region` VALUES ('540200', '540000', '日喀则', '日喀则市', '中国,西藏自治区,日喀则市', '2', 'Rikaze', '0892', '857000');
INSERT INTO `e_r_sys_region` VALUES ('540202', '540200', '桑珠孜', '桑珠孜区', '中国,西藏自治区,日喀则市,桑珠孜区', '3', 'Sangzhuzi', '0892', '857000');
INSERT INTO `e_r_sys_region` VALUES ('540221', '540200', '南木林', '南木林县', '中国,西藏自治区,日喀则市,南木林县', '3', 'Nanmulin', '0892', '857100');
INSERT INTO `e_r_sys_region` VALUES ('540222', '540200', '江孜', '江孜县', '中国,西藏自治区,日喀则市,江孜县', '3', 'Jiangzi', '0892', '857400');
INSERT INTO `e_r_sys_region` VALUES ('540223', '540200', '定日', '定日县', '中国,西藏自治区,日喀则市,定日县', '3', 'Dingri', '0892', '858200');
INSERT INTO `e_r_sys_region` VALUES ('540224', '540200', '萨迦', '萨迦县', '中国,西藏自治区,日喀则市,萨迦县', '3', 'Sajia', '0892', '857800');
INSERT INTO `e_r_sys_region` VALUES ('540225', '540200', '拉孜', '拉孜县', '中国,西藏自治区,日喀则市,拉孜县', '3', 'Lazi', '0892', '858100');
INSERT INTO `e_r_sys_region` VALUES ('540226', '540200', '昂仁', '昂仁县', '中国,西藏自治区,日喀则市,昂仁县', '3', 'Angren', '0892', '858500');
INSERT INTO `e_r_sys_region` VALUES ('540227', '540200', '谢通门', '谢通门县', '中国,西藏自治区,日喀则市,谢通门县', '3', 'Xietongmen', '0892', '858900');
INSERT INTO `e_r_sys_region` VALUES ('540228', '540200', '白朗', '白朗县', '中国,西藏自治区,日喀则市,白朗县', '3', 'Bailang', '0892', '857300');
INSERT INTO `e_r_sys_region` VALUES ('540229', '540200', '仁布', '仁布县', '中国,西藏自治区,日喀则市,仁布县', '3', 'Renbu', '0892', '857200');
INSERT INTO `e_r_sys_region` VALUES ('540230', '540200', '康马', '康马县', '中国,西藏自治区,日喀则市,康马县', '3', 'Kangma', '0892', '857500');
INSERT INTO `e_r_sys_region` VALUES ('540231', '540200', '定结', '定结县', '中国,西藏自治区,日喀则市,定结县', '3', 'Dingjie', '0892', '857900');
INSERT INTO `e_r_sys_region` VALUES ('540232', '540200', '仲巴', '仲巴县', '中国,西藏自治区,日喀则市,仲巴县', '3', 'Zhongba', '0892', '858800');
INSERT INTO `e_r_sys_region` VALUES ('540233', '540200', '亚东', '亚东县', '中国,西藏自治区,日喀则市,亚东县', '3', 'Yadong', '0892', '857600');
INSERT INTO `e_r_sys_region` VALUES ('540234', '540200', '吉隆', '吉隆县', '中国,西藏自治区,日喀则市,吉隆县', '3', 'Jilong', '0892', '858700');
INSERT INTO `e_r_sys_region` VALUES ('540235', '540200', '聂拉木', '聂拉木县', '中国,西藏自治区,日喀则市,聂拉木县', '3', 'Nielamu', '0892', '858300');
INSERT INTO `e_r_sys_region` VALUES ('540236', '540200', '萨嘎', '萨嘎县', '中国,西藏自治区,日喀则市,萨嘎县', '3', 'Saga', '0892', '857800');
INSERT INTO `e_r_sys_region` VALUES ('540237', '540200', '岗巴', '岗巴县', '中国,西藏自治区,日喀则市,岗巴县', '3', 'Gangba', '0892', '857700');
INSERT INTO `e_r_sys_region` VALUES ('540300', '540000', '昌都', '昌都市', '中国,西藏自治区,昌都市', '2', 'Qamdo', '0895', '854000');
INSERT INTO `e_r_sys_region` VALUES ('540302', '540300', '昌都', '卡若区', '中国,西藏自治区,昌都市,卡若区', '3', 'Karuo', '0895', '854000');
INSERT INTO `e_r_sys_region` VALUES ('540321', '540300', '江达', '江达县', '中国,西藏自治区,昌都市,江达县', '3', 'Jiangda', '0895', '854100');
INSERT INTO `e_r_sys_region` VALUES ('540322', '540300', '贡觉', '贡觉县', '中国,西藏自治区,昌都市,贡觉县', '3', 'Gongjue', '0895', '854200');
INSERT INTO `e_r_sys_region` VALUES ('540323', '540300', '类乌齐', '类乌齐县', '中国,西藏自治区,昌都市,类乌齐县', '3', 'Leiwuqi', '0895', '855600');
INSERT INTO `e_r_sys_region` VALUES ('540324', '540300', '丁青', '丁青县', '中国,西藏自治区,昌都市,丁青县', '3', 'Dingqing', '0895', '855700');
INSERT INTO `e_r_sys_region` VALUES ('540325', '540300', '察雅', '察雅县', '中国,西藏自治区,昌都市,察雅县', '3', 'Chaya', '0895', '854300');
INSERT INTO `e_r_sys_region` VALUES ('540326', '540300', '八宿', '八宿县', '中国,西藏自治区,昌都市,八宿县', '3', 'Basu', '0895', '854600');
INSERT INTO `e_r_sys_region` VALUES ('540327', '540300', '左贡', '左贡县', '中国,西藏自治区,昌都市,左贡县', '3', 'Zuogong', '0895', '854400');
INSERT INTO `e_r_sys_region` VALUES ('540328', '540300', '芒康', '芒康县', '中国,西藏自治区,昌都市,芒康县', '3', 'Mangkang', '0895', '854500');
INSERT INTO `e_r_sys_region` VALUES ('540329', '540300', '洛隆', '洛隆县', '中国,西藏自治区,昌都市,洛隆县', '3', 'Luolong', '0895', '855400');
INSERT INTO `e_r_sys_region` VALUES ('540330', '540300', '边坝', '边坝县', '中国,西藏自治区,昌都市,边坝县', '3', 'Bianba', '0895', '855500');
INSERT INTO `e_r_sys_region` VALUES ('542200', '540000', '山南', '山南地区', '中国,西藏自治区,山南地区', '2', 'Shannan', '0893', '856000');
INSERT INTO `e_r_sys_region` VALUES ('542221', '542200', '乃东', '乃东县', '中国,西藏自治区,山南地区,乃东县', '3', 'Naidong', '0893', '856100');
INSERT INTO `e_r_sys_region` VALUES ('542222', '542200', '扎囊', '扎囊县', '中国,西藏自治区,山南地区,扎囊县', '3', 'Zhanang', '0893', '850800');
INSERT INTO `e_r_sys_region` VALUES ('542223', '542200', '贡嘎', '贡嘎县', '中国,西藏自治区,山南地区,贡嘎县', '3', 'Gongga', '0893', '850700');
INSERT INTO `e_r_sys_region` VALUES ('542224', '542200', '桑日', '桑日县', '中国,西藏自治区,山南地区,桑日县', '3', 'Sangri', '0893', '856200');
INSERT INTO `e_r_sys_region` VALUES ('542225', '542200', '琼结', '琼结县', '中国,西藏自治区,山南地区,琼结县', '3', 'Qiongjie', '0893', '856800');
INSERT INTO `e_r_sys_region` VALUES ('542226', '542200', '曲松', '曲松县', '中国,西藏自治区,山南地区,曲松县', '3', 'Qusong', '0893', '856300');
INSERT INTO `e_r_sys_region` VALUES ('542227', '542200', '措美', '措美县', '中国,西藏自治区,山南地区,措美县', '3', 'Cuomei', '0893', '856900');
INSERT INTO `e_r_sys_region` VALUES ('542228', '542200', '洛扎', '洛扎县', '中国,西藏自治区,山南地区,洛扎县', '3', 'Luozha', '0893', '856600');
INSERT INTO `e_r_sys_region` VALUES ('542229', '542200', '加查', '加查县', '中国,西藏自治区,山南地区,加查县', '3', 'Jiacha', '0893', '856400');
INSERT INTO `e_r_sys_region` VALUES ('542231', '542200', '隆子', '隆子县', '中国,西藏自治区,山南地区,隆子县', '3', 'Longzi', '0893', '856600');
INSERT INTO `e_r_sys_region` VALUES ('542232', '542200', '错那', '错那县', '中国,西藏自治区,山南地区,错那县', '3', 'Cuona', '0893', '856700');
INSERT INTO `e_r_sys_region` VALUES ('542233', '542200', '浪卡子', '浪卡子县', '中国,西藏自治区,山南地区,浪卡子县', '3', 'Langkazi', '0893', '851100');
INSERT INTO `e_r_sys_region` VALUES ('542400', '540000', '那曲', '那曲地区', '中国,西藏自治区,那曲地区', '2', 'Nagqu', '0896', '852000');
INSERT INTO `e_r_sys_region` VALUES ('542421', '542400', '那曲', '那曲县', '中国,西藏自治区,那曲地区,那曲县', '3', 'Naqu', '0896', '852000');
INSERT INTO `e_r_sys_region` VALUES ('542422', '542400', '嘉黎', '嘉黎县', '中国,西藏自治区,那曲地区,嘉黎县', '3', 'Jiali', '0896', '852400');
INSERT INTO `e_r_sys_region` VALUES ('542423', '542400', '比如', '比如县', '中国,西藏自治区,那曲地区,比如县', '3', 'Biru', '0896', '852300');
INSERT INTO `e_r_sys_region` VALUES ('542424', '542400', '聂荣', '聂荣县', '中国,西藏自治区,那曲地区,聂荣县', '3', 'Nierong', '0896', '853500');
INSERT INTO `e_r_sys_region` VALUES ('542425', '542400', '安多', '安多县', '中国,西藏自治区,那曲地区,安多县', '3', 'Anduo', '0896', '853400');
INSERT INTO `e_r_sys_region` VALUES ('542426', '542400', '申扎', '申扎县', '中国,西藏自治区,那曲地区,申扎县', '3', 'Shenzha', '0896', '853100');
INSERT INTO `e_r_sys_region` VALUES ('542427', '542400', '索县', '索县', '中国,西藏自治区,那曲地区,索县', '3', 'Suoxian', '0896', '852200');
INSERT INTO `e_r_sys_region` VALUES ('542428', '542400', '班戈', '班戈县', '中国,西藏自治区,那曲地区,班戈县', '3', 'Bange', '0896', '852500');
INSERT INTO `e_r_sys_region` VALUES ('542429', '542400', '巴青', '巴青县', '中国,西藏自治区,那曲地区,巴青县', '3', 'Baqing', '0896', '852100');
INSERT INTO `e_r_sys_region` VALUES ('542430', '542400', '尼玛', '尼玛县', '中国,西藏自治区,那曲地区,尼玛县', '3', 'Nima', '0896', '852600');
INSERT INTO `e_r_sys_region` VALUES ('542431', '542400', '双湖', '双湖县', '中国,西藏自治区,那曲地区,双湖县', '3', 'Shuanghu', '0896', '852600');
INSERT INTO `e_r_sys_region` VALUES ('542500', '540000', '阿里', '阿里地区', '中国,西藏自治区,阿里地区', '2', 'Ngari', '0897', '859000');
INSERT INTO `e_r_sys_region` VALUES ('542521', '542500', '普兰', '普兰县', '中国,西藏自治区,阿里地区,普兰县', '3', 'Pulan', '0897', '859500');
INSERT INTO `e_r_sys_region` VALUES ('542522', '542500', '札达', '札达县', '中国,西藏自治区,阿里地区,札达县', '3', 'Zhada', '0897', '859600');
INSERT INTO `e_r_sys_region` VALUES ('542523', '542500', '噶尔', '噶尔县', '中国,西藏自治区,阿里地区,噶尔县', '3', 'Gaer', '0897', '859400');
INSERT INTO `e_r_sys_region` VALUES ('542524', '542500', '日土', '日土县', '中国,西藏自治区,阿里地区,日土县', '3', 'Ritu', '0897', '859700');
INSERT INTO `e_r_sys_region` VALUES ('542525', '542500', '革吉', '革吉县', '中国,西藏自治区,阿里地区,革吉县', '3', 'Geji', '0897', '859100');
INSERT INTO `e_r_sys_region` VALUES ('542526', '542500', '改则', '改则县', '中国,西藏自治区,阿里地区,改则县', '3', 'Gaize', '0897', '859200');
INSERT INTO `e_r_sys_region` VALUES ('542527', '542500', '措勤', '措勤县', '中国,西藏自治区,阿里地区,措勤县', '3', 'Cuoqin', '0897', '859300');
INSERT INTO `e_r_sys_region` VALUES ('542600', '540000', '林芝', '林芝地区', '中国,西藏自治区,林芝地区', '2', 'Nyingchi', '0894', '850400');
INSERT INTO `e_r_sys_region` VALUES ('542621', '542600', '林芝', '林芝县', '中国,西藏自治区,林芝地区,林芝县', '3', 'Linzhi', '0894', '850400');
INSERT INTO `e_r_sys_region` VALUES ('542622', '542600', '工布江达', '工布江达县', '中国,西藏自治区,林芝地区,工布江达县', '3', 'Gongbujiangda', '0894', '850300');
INSERT INTO `e_r_sys_region` VALUES ('542623', '542600', '米林', '米林县', '中国,西藏自治区,林芝地区,米林县', '3', 'Milin', '0894', '850500');
INSERT INTO `e_r_sys_region` VALUES ('542624', '542600', '墨脱', '墨脱县', '中国,西藏自治区,林芝地区,墨脱县', '3', 'Motuo', '0894', '855300');
INSERT INTO `e_r_sys_region` VALUES ('542625', '542600', '波密', '波密县', '中国,西藏自治区,林芝地区,波密县', '3', 'Bomi', '0894', '855200');
INSERT INTO `e_r_sys_region` VALUES ('542626', '542600', '察隅', '察隅县', '中国,西藏自治区,林芝地区,察隅县', '3', 'Chayu', '0894', '855100');
INSERT INTO `e_r_sys_region` VALUES ('542627', '542600', '朗县', '朗县', '中国,西藏自治区,林芝地区,朗县', '3', 'Langxian', '0894', '856500');
INSERT INTO `e_r_sys_region` VALUES ('610000', '100000', '陕西', '陕西省', '中国,陕西省', '1', 'Shaanxi', '', '');
INSERT INTO `e_r_sys_region` VALUES ('610100', '610000', '西安', '西安市', '中国,陕西省,西安市', '2', 'Xi\'an', '029', '710003');
INSERT INTO `e_r_sys_region` VALUES ('610102', '610100', '新城', '新城区', '中国,陕西省,西安市,新城区', '3', 'Xincheng', '029', '710004');
INSERT INTO `e_r_sys_region` VALUES ('610103', '610100', '碑林', '碑林区', '中国,陕西省,西安市,碑林区', '3', 'Beilin', '029', '710001');
INSERT INTO `e_r_sys_region` VALUES ('610104', '610100', '莲湖', '莲湖区', '中国,陕西省,西安市,莲湖区', '3', 'Lianhu', '029', '710003');
INSERT INTO `e_r_sys_region` VALUES ('610111', '610100', '灞桥', '灞桥区', '中国,陕西省,西安市,灞桥区', '3', 'Baqiao', '029', '710038');
INSERT INTO `e_r_sys_region` VALUES ('610112', '610100', '未央', '未央区', '中国,陕西省,西安市,未央区', '3', 'Weiyang', '029', '710014');
INSERT INTO `e_r_sys_region` VALUES ('610113', '610100', '雁塔', '雁塔区', '中国,陕西省,西安市,雁塔区', '3', 'Yanta', '029', '710061');
INSERT INTO `e_r_sys_region` VALUES ('610114', '610100', '阎良', '阎良区', '中国,陕西省,西安市,阎良区', '3', 'Yanliang', '029', '710087');
INSERT INTO `e_r_sys_region` VALUES ('610115', '610100', '临潼', '临潼区', '中国,陕西省,西安市,临潼区', '3', 'Lintong', '029', '710600');
INSERT INTO `e_r_sys_region` VALUES ('610116', '610100', '长安', '长安区', '中国,陕西省,西安市,长安区', '3', 'Chang\'an', '029', '710100');
INSERT INTO `e_r_sys_region` VALUES ('610122', '610100', '蓝田', '蓝田县', '中国,陕西省,西安市,蓝田县', '3', 'Lantian', '029', '710500');
INSERT INTO `e_r_sys_region` VALUES ('610124', '610100', '周至', '周至县', '中国,陕西省,西安市,周至县', '3', 'Zhouzhi', '029', '710400');
INSERT INTO `e_r_sys_region` VALUES ('610125', '610100', '户县', '户县', '中国,陕西省,西安市,户县', '3', 'Huxian', '029', '710300');
INSERT INTO `e_r_sys_region` VALUES ('610126', '610100', '高陵', '高陵区', '中国,陕西省,西安市,高陵区', '3', 'Gaoling', '029', '710200');
INSERT INTO `e_r_sys_region` VALUES ('610200', '610000', '铜川', '铜川市', '中国,陕西省,铜川市', '2', 'Tongchuan', '0919', '727100');
INSERT INTO `e_r_sys_region` VALUES ('610202', '610200', '王益', '王益区', '中国,陕西省,铜川市,王益区', '3', 'Wangyi', '0919', '727000');
INSERT INTO `e_r_sys_region` VALUES ('610203', '610200', '印台', '印台区', '中国,陕西省,铜川市,印台区', '3', 'Yintai', '0919', '727007');
INSERT INTO `e_r_sys_region` VALUES ('610204', '610200', '耀州', '耀州区', '中国,陕西省,铜川市,耀州区', '3', 'Yaozhou', '0919', '727100');
INSERT INTO `e_r_sys_region` VALUES ('610222', '610200', '宜君', '宜君县', '中国,陕西省,铜川市,宜君县', '3', 'Yijun', '0919', '727200');
INSERT INTO `e_r_sys_region` VALUES ('610300', '610000', '宝鸡', '宝鸡市', '中国,陕西省,宝鸡市', '2', 'Baoji', '0917', '721000');
INSERT INTO `e_r_sys_region` VALUES ('610302', '610300', '渭滨', '渭滨区', '中国,陕西省,宝鸡市,渭滨区', '3', 'Weibin', '0917', '721000');
INSERT INTO `e_r_sys_region` VALUES ('610303', '610300', '金台', '金台区', '中国,陕西省,宝鸡市,金台区', '3', 'Jintai', '0917', '721000');
INSERT INTO `e_r_sys_region` VALUES ('610304', '610300', '陈仓', '陈仓区', '中国,陕西省,宝鸡市,陈仓区', '3', 'Chencang', '0917', '721300');
INSERT INTO `e_r_sys_region` VALUES ('610322', '610300', '凤翔', '凤翔县', '中国,陕西省,宝鸡市,凤翔县', '3', 'Fengxiang', '0917', '721400');
INSERT INTO `e_r_sys_region` VALUES ('610323', '610300', '岐山', '岐山县', '中国,陕西省,宝鸡市,岐山县', '3', 'Qishan', '0917', '722400');
INSERT INTO `e_r_sys_region` VALUES ('610324', '610300', '扶风', '扶风县', '中国,陕西省,宝鸡市,扶风县', '3', 'Fufeng', '0917', '722200');
INSERT INTO `e_r_sys_region` VALUES ('610326', '610300', '眉县', '眉县', '中国,陕西省,宝鸡市,眉县', '3', 'Meixian', '0917', '722300');
INSERT INTO `e_r_sys_region` VALUES ('610327', '610300', '陇县', '陇县', '中国,陕西省,宝鸡市,陇县', '3', 'Longxian', '0917', '721200');
INSERT INTO `e_r_sys_region` VALUES ('610328', '610300', '千阳', '千阳县', '中国,陕西省,宝鸡市,千阳县', '3', 'Qianyang', '0917', '721100');
INSERT INTO `e_r_sys_region` VALUES ('610329', '610300', '麟游', '麟游县', '中国,陕西省,宝鸡市,麟游县', '3', 'Linyou', '0917', '721500');
INSERT INTO `e_r_sys_region` VALUES ('610330', '610300', '凤县', '凤县', '中国,陕西省,宝鸡市,凤县', '3', 'Fengxian', '0917', '721700');
INSERT INTO `e_r_sys_region` VALUES ('610331', '610300', '太白', '太白县', '中国,陕西省,宝鸡市,太白县', '3', 'Taibai', '0917', '721600');
INSERT INTO `e_r_sys_region` VALUES ('610400', '610000', '咸阳', '咸阳市', '中国,陕西省,咸阳市', '2', 'Xianyang', '029', '712000');
INSERT INTO `e_r_sys_region` VALUES ('610402', '610400', '秦都', '秦都区', '中国,陕西省,咸阳市,秦都区', '3', 'Qindu', '029', '712000');
INSERT INTO `e_r_sys_region` VALUES ('610403', '610400', '杨陵', '杨陵区', '中国,陕西省,咸阳市,杨陵区', '3', 'Yangling', '029', '712100');
INSERT INTO `e_r_sys_region` VALUES ('610404', '610400', '渭城', '渭城区', '中国,陕西省,咸阳市,渭城区', '3', 'Weicheng', '029', '712000');
INSERT INTO `e_r_sys_region` VALUES ('610422', '610400', '三原', '三原县', '中国,陕西省,咸阳市,三原县', '3', 'Sanyuan', '029', '713800');
INSERT INTO `e_r_sys_region` VALUES ('610423', '610400', '泾阳', '泾阳县', '中国,陕西省,咸阳市,泾阳县', '3', 'Jingyang', '029', '713700');
INSERT INTO `e_r_sys_region` VALUES ('610424', '610400', '乾县', '乾县', '中国,陕西省,咸阳市,乾县', '3', 'Qianxian', '029', '713300');
INSERT INTO `e_r_sys_region` VALUES ('610425', '610400', '礼泉', '礼泉县', '中国,陕西省,咸阳市,礼泉县', '3', 'Liquan', '029', '713200');
INSERT INTO `e_r_sys_region` VALUES ('610426', '610400', '永寿', '永寿县', '中国,陕西省,咸阳市,永寿县', '3', 'Yongshou', '029', '713400');
INSERT INTO `e_r_sys_region` VALUES ('610427', '610400', '彬县', '彬县', '中国,陕西省,咸阳市,彬县', '3', 'Binxian', '029', '713500');
INSERT INTO `e_r_sys_region` VALUES ('610428', '610400', '长武', '长武县', '中国,陕西省,咸阳市,长武县', '3', 'Changwu', '029', '713600');
INSERT INTO `e_r_sys_region` VALUES ('610429', '610400', '旬邑', '旬邑县', '中国,陕西省,咸阳市,旬邑县', '3', 'Xunyi', '029', '711300');
INSERT INTO `e_r_sys_region` VALUES ('610430', '610400', '淳化', '淳化县', '中国,陕西省,咸阳市,淳化县', '3', 'Chunhua', '029', '711200');
INSERT INTO `e_r_sys_region` VALUES ('610431', '610400', '武功', '武功县', '中国,陕西省,咸阳市,武功县', '3', 'Wugong', '029', '712200');
INSERT INTO `e_r_sys_region` VALUES ('610481', '610400', '兴平', '兴平市', '中国,陕西省,咸阳市,兴平市', '3', 'Xingping', '029', '713100');
INSERT INTO `e_r_sys_region` VALUES ('610500', '610000', '渭南', '渭南市', '中国,陕西省,渭南市', '2', 'Weinan', '0913', '714000');
INSERT INTO `e_r_sys_region` VALUES ('610502', '610500', '临渭', '临渭区', '中国,陕西省,渭南市,临渭区', '3', 'Linwei', '0913', '714000');
INSERT INTO `e_r_sys_region` VALUES ('610521', '610500', '华县', '华县', '中国,陕西省,渭南市,华县', '3', 'Huaxian', '0913', '714100');
INSERT INTO `e_r_sys_region` VALUES ('610522', '610500', '潼关', '潼关县', '中国,陕西省,渭南市,潼关县', '3', 'Tongguan', '0913', '714300');
INSERT INTO `e_r_sys_region` VALUES ('610523', '610500', '大荔', '大荔县', '中国,陕西省,渭南市,大荔县', '3', 'Dali', '0913', '715100');
INSERT INTO `e_r_sys_region` VALUES ('610524', '610500', '合阳', '合阳县', '中国,陕西省,渭南市,合阳县', '3', 'Heyang', '0913', '715300');
INSERT INTO `e_r_sys_region` VALUES ('610525', '610500', '澄城', '澄城县', '中国,陕西省,渭南市,澄城县', '3', 'Chengcheng', '0913', '715200');
INSERT INTO `e_r_sys_region` VALUES ('610526', '610500', '蒲城', '蒲城县', '中国,陕西省,渭南市,蒲城县', '3', 'Pucheng', '0913', '715500');
INSERT INTO `e_r_sys_region` VALUES ('610527', '610500', '白水', '白水县', '中国,陕西省,渭南市,白水县', '3', 'Baishui', '0913', '715600');
INSERT INTO `e_r_sys_region` VALUES ('610528', '610500', '富平', '富平县', '中国,陕西省,渭南市,富平县', '3', 'Fuping', '0913', '711700');
INSERT INTO `e_r_sys_region` VALUES ('610581', '610500', '韩城', '韩城市', '中国,陕西省,渭南市,韩城市', '3', 'Hancheng', '0913', '715400');
INSERT INTO `e_r_sys_region` VALUES ('610582', '610500', '华阴', '华阴市', '中国,陕西省,渭南市,华阴市', '3', 'Huayin', '0913', '714200');
INSERT INTO `e_r_sys_region` VALUES ('610600', '610000', '延安', '延安市', '中国,陕西省,延安市', '2', 'Yan\'an', '0911', '716000');
INSERT INTO `e_r_sys_region` VALUES ('610602', '610600', '宝塔', '宝塔区', '中国,陕西省,延安市,宝塔区', '3', 'Baota', '0911', '716000');
INSERT INTO `e_r_sys_region` VALUES ('610621', '610600', '延长', '延长县', '中国,陕西省,延安市,延长县', '3', 'Yanchang', '0911', '717100');
INSERT INTO `e_r_sys_region` VALUES ('610622', '610600', '延川', '延川县', '中国,陕西省,延安市,延川县', '3', 'Yanchuan', '0911', '717200');
INSERT INTO `e_r_sys_region` VALUES ('610623', '610600', '子长', '子长县', '中国,陕西省,延安市,子长县', '3', 'Zichang', '0911', '717300');
INSERT INTO `e_r_sys_region` VALUES ('610624', '610600', '安塞', '安塞县', '中国,陕西省,延安市,安塞县', '3', 'Ansai', '0911', '717400');
INSERT INTO `e_r_sys_region` VALUES ('610625', '610600', '志丹', '志丹县', '中国,陕西省,延安市,志丹县', '3', 'Zhidan', '0911', '717500');
INSERT INTO `e_r_sys_region` VALUES ('610626', '610600', '吴起', '吴起县', '中国,陕西省,延安市,吴起县', '3', 'Wuqi', '0911', '717600');
INSERT INTO `e_r_sys_region` VALUES ('610627', '610600', '甘泉', '甘泉县', '中国,陕西省,延安市,甘泉县', '3', 'Ganquan', '0911', '716100');
INSERT INTO `e_r_sys_region` VALUES ('610628', '610600', '富县', '富县', '中国,陕西省,延安市,富县', '3', 'Fuxian', '0911', '727500');
INSERT INTO `e_r_sys_region` VALUES ('610629', '610600', '洛川', '洛川县', '中国,陕西省,延安市,洛川县', '3', 'Luochuan', '0911', '727400');
INSERT INTO `e_r_sys_region` VALUES ('610630', '610600', '宜川', '宜川县', '中国,陕西省,延安市,宜川县', '3', 'Yichuan', '0911', '716200');
INSERT INTO `e_r_sys_region` VALUES ('610631', '610600', '黄龙', '黄龙县', '中国,陕西省,延安市,黄龙县', '3', 'Huanglong', '0911', '715700');
INSERT INTO `e_r_sys_region` VALUES ('610632', '610600', '黄陵', '黄陵县', '中国,陕西省,延安市,黄陵县', '3', 'Huangling', '0911', '727300');
INSERT INTO `e_r_sys_region` VALUES ('610700', '610000', '汉中', '汉中市', '中国,陕西省,汉中市', '2', 'Hanzhong', '0916', '723000');
INSERT INTO `e_r_sys_region` VALUES ('610702', '610700', '汉台', '汉台区', '中国,陕西省,汉中市,汉台区', '3', 'Hantai', '0916', '723000');
INSERT INTO `e_r_sys_region` VALUES ('610721', '610700', '南郑', '南郑县', '中国,陕西省,汉中市,南郑县', '3', 'Nanzheng', '0916', '723100');
INSERT INTO `e_r_sys_region` VALUES ('610722', '610700', '城固', '城固县', '中国,陕西省,汉中市,城固县', '3', 'Chenggu', '0916', '723200');
INSERT INTO `e_r_sys_region` VALUES ('610723', '610700', '洋县', '洋县', '中国,陕西省,汉中市,洋县', '3', 'Yangxian', '0916', '723300');
INSERT INTO `e_r_sys_region` VALUES ('610724', '610700', '西乡', '西乡县', '中国,陕西省,汉中市,西乡县', '3', 'Xixiang', '0916', '723500');
INSERT INTO `e_r_sys_region` VALUES ('610725', '610700', '勉县', '勉县', '中国,陕西省,汉中市,勉县', '3', 'Mianxian', '0916', '724200');
INSERT INTO `e_r_sys_region` VALUES ('610726', '610700', '宁强', '宁强县', '中国,陕西省,汉中市,宁强县', '3', 'Ningqiang', '0916', '724400');
INSERT INTO `e_r_sys_region` VALUES ('610727', '610700', '略阳', '略阳县', '中国,陕西省,汉中市,略阳县', '3', 'Lueyang', '0916', '724300');
INSERT INTO `e_r_sys_region` VALUES ('610728', '610700', '镇巴', '镇巴县', '中国,陕西省,汉中市,镇巴县', '3', 'Zhenba', '0916', '723600');
INSERT INTO `e_r_sys_region` VALUES ('610729', '610700', '留坝', '留坝县', '中国,陕西省,汉中市,留坝县', '3', 'Liuba', '0916', '724100');
INSERT INTO `e_r_sys_region` VALUES ('610730', '610700', '佛坪', '佛坪县', '中国,陕西省,汉中市,佛坪县', '3', 'Foping', '0916', '723400');
INSERT INTO `e_r_sys_region` VALUES ('610800', '610000', '榆林', '榆林市', '中国,陕西省,榆林市', '2', 'Yulin', '0912', '719000');
INSERT INTO `e_r_sys_region` VALUES ('610802', '610800', '榆阳', '榆阳区', '中国,陕西省,榆林市,榆阳区', '3', 'Yuyang', '0912', '719000');
INSERT INTO `e_r_sys_region` VALUES ('610821', '610800', '神木', '神木县', '中国,陕西省,榆林市,神木县', '3', 'Shenmu', '0912', '719300');
INSERT INTO `e_r_sys_region` VALUES ('610822', '610800', '府谷', '府谷县', '中国,陕西省,榆林市,府谷县', '3', 'Fugu', '0912', '719400');
INSERT INTO `e_r_sys_region` VALUES ('610823', '610800', '横山', '横山县', '中国,陕西省,榆林市,横山县', '3', 'Hengshan', '0912', '719100');
INSERT INTO `e_r_sys_region` VALUES ('610824', '610800', '靖边', '靖边县', '中国,陕西省,榆林市,靖边县', '3', 'Jingbian', '0912', '718500');
INSERT INTO `e_r_sys_region` VALUES ('610825', '610800', '定边', '定边县', '中国,陕西省,榆林市,定边县', '3', 'Dingbian', '0912', '718600');
INSERT INTO `e_r_sys_region` VALUES ('610826', '610800', '绥德', '绥德县', '中国,陕西省,榆林市,绥德县', '3', 'Suide', '0912', '718000');
INSERT INTO `e_r_sys_region` VALUES ('610827', '610800', '米脂', '米脂县', '中国,陕西省,榆林市,米脂县', '3', 'Mizhi', '0912', '718100');
INSERT INTO `e_r_sys_region` VALUES ('610828', '610800', '佳县', '佳县', '中国,陕西省,榆林市,佳县', '3', 'Jiaxian', '0912', '719200');
INSERT INTO `e_r_sys_region` VALUES ('610829', '610800', '吴堡', '吴堡县', '中国,陕西省,榆林市,吴堡县', '3', 'Wubu', '0912', '718200');
INSERT INTO `e_r_sys_region` VALUES ('610830', '610800', '清涧', '清涧县', '中国,陕西省,榆林市,清涧县', '3', 'Qingjian', '0912', '718300');
INSERT INTO `e_r_sys_region` VALUES ('610831', '610800', '子洲', '子洲县', '中国,陕西省,榆林市,子洲县', '3', 'Zizhou', '0912', '718400');
INSERT INTO `e_r_sys_region` VALUES ('610900', '610000', '安康', '安康市', '中国,陕西省,安康市', '2', 'Ankang', '0915', '725000');
INSERT INTO `e_r_sys_region` VALUES ('610902', '610900', '汉滨', '汉滨区', '中国,陕西省,安康市,汉滨区', '3', 'Hanbin', '0915', '725000');
INSERT INTO `e_r_sys_region` VALUES ('610921', '610900', '汉阴', '汉阴县', '中国,陕西省,安康市,汉阴县', '3', 'Hanyin', '0915', '725100');
INSERT INTO `e_r_sys_region` VALUES ('610922', '610900', '石泉', '石泉县', '中国,陕西省,安康市,石泉县', '3', 'Shiquan', '0915', '725200');
INSERT INTO `e_r_sys_region` VALUES ('610923', '610900', '宁陕', '宁陕县', '中国,陕西省,安康市,宁陕县', '3', 'Ningshan', '0915', '711600');
INSERT INTO `e_r_sys_region` VALUES ('610924', '610900', '紫阳', '紫阳县', '中国,陕西省,安康市,紫阳县', '3', 'Ziyang', '0915', '725300');
INSERT INTO `e_r_sys_region` VALUES ('610925', '610900', '岚皋', '岚皋县', '中国,陕西省,安康市,岚皋县', '3', 'Langao', '0915', '725400');
INSERT INTO `e_r_sys_region` VALUES ('610926', '610900', '平利', '平利县', '中国,陕西省,安康市,平利县', '3', 'Pingli', '0915', '725500');
INSERT INTO `e_r_sys_region` VALUES ('610927', '610900', '镇坪', '镇坪县', '中国,陕西省,安康市,镇坪县', '3', 'Zhenping', '0915', '725600');
INSERT INTO `e_r_sys_region` VALUES ('610928', '610900', '旬阳', '旬阳县', '中国,陕西省,安康市,旬阳县', '3', 'Xunyang', '0915', '725700');
INSERT INTO `e_r_sys_region` VALUES ('610929', '610900', '白河', '白河县', '中国,陕西省,安康市,白河县', '3', 'Baihe', '0915', '725800');
INSERT INTO `e_r_sys_region` VALUES ('611000', '610000', '商洛', '商洛市', '中国,陕西省,商洛市', '2', 'Shangluo', '0914', '726000');
INSERT INTO `e_r_sys_region` VALUES ('611002', '611000', '商州', '商州区', '中国,陕西省,商洛市,商州区', '3', 'Shangzhou', '0914', '726000');
INSERT INTO `e_r_sys_region` VALUES ('611021', '611000', '洛南', '洛南县', '中国,陕西省,商洛市,洛南县', '3', 'Luonan', '0914', '726100');
INSERT INTO `e_r_sys_region` VALUES ('611022', '611000', '丹凤', '丹凤县', '中国,陕西省,商洛市,丹凤县', '3', 'Danfeng', '0914', '726200');
INSERT INTO `e_r_sys_region` VALUES ('611023', '611000', '商南', '商南县', '中国,陕西省,商洛市,商南县', '3', 'Shangnan', '0914', '726300');
INSERT INTO `e_r_sys_region` VALUES ('611024', '611000', '山阳', '山阳县', '中国,陕西省,商洛市,山阳县', '3', 'Shanyang', '0914', '726400');
INSERT INTO `e_r_sys_region` VALUES ('611025', '611000', '镇安', '镇安县', '中国,陕西省,商洛市,镇安县', '3', 'Zhen\'an', '0914', '711500');
INSERT INTO `e_r_sys_region` VALUES ('611026', '611000', '柞水', '柞水县', '中国,陕西省,商洛市,柞水县', '3', 'Zhashui', '0914', '711400');
INSERT INTO `e_r_sys_region` VALUES ('611100', '610000', '西咸', '西咸新区', '中国,陕西省,西咸新区', '2', 'Xixian', '029', '712000');
INSERT INTO `e_r_sys_region` VALUES ('611101', '611100', '空港', '空港新城', '中国,陕西省,西咸新区,空港新城', '3', 'Konggang', '0374', '461000');
INSERT INTO `e_r_sys_region` VALUES ('611102', '611100', '沣东', '沣东新城', '中国,陕西省,西咸新区,沣东新城', '3', 'Fengdong', '029', '710000');
INSERT INTO `e_r_sys_region` VALUES ('611103', '611100', '秦汉', '秦汉新城', '中国,陕西省,西咸新区,秦汉新城', '3', 'Qinhan', '029', '712000');
INSERT INTO `e_r_sys_region` VALUES ('611104', '611100', '沣西', '沣西新城', '中国,陕西省,西咸新区,沣西新城', '3', 'Fengxi', '029', '710000');
INSERT INTO `e_r_sys_region` VALUES ('611105', '611100', '泾河', '泾河新城', '中国,陕西省,西咸新区,泾河新城', '3', 'Jinghe', '029', '713700');
INSERT INTO `e_r_sys_region` VALUES ('620000', '100000', '甘肃', '甘肃省', '中国,甘肃省', '1', 'Gansu', '', '');
INSERT INTO `e_r_sys_region` VALUES ('620100', '620000', '兰州', '兰州市', '中国,甘肃省,兰州市', '2', 'Lanzhou', '0931', '730030');
INSERT INTO `e_r_sys_region` VALUES ('620102', '620100', '城关', '城关区', '中国,甘肃省,兰州市,城关区', '3', 'Chengguan', '0931', '730030');
INSERT INTO `e_r_sys_region` VALUES ('620103', '620100', '七里河', '七里河区', '中国,甘肃省,兰州市,七里河区', '3', 'Qilihe', '0931', '730050');
INSERT INTO `e_r_sys_region` VALUES ('620104', '620100', '西固', '西固区', '中国,甘肃省,兰州市,西固区', '3', 'Xigu', '0931', '730060');
INSERT INTO `e_r_sys_region` VALUES ('620105', '620100', '安宁', '安宁区', '中国,甘肃省,兰州市,安宁区', '3', 'Anning', '0931', '730070');
INSERT INTO `e_r_sys_region` VALUES ('620111', '620100', '红古', '红古区', '中国,甘肃省,兰州市,红古区', '3', 'Honggu', '0931', '730084');
INSERT INTO `e_r_sys_region` VALUES ('620121', '620100', '永登', '永登县', '中国,甘肃省,兰州市,永登县', '3', 'Yongdeng', '0931', '730300');
INSERT INTO `e_r_sys_region` VALUES ('620122', '620100', '皋兰', '皋兰县', '中国,甘肃省,兰州市,皋兰县', '3', 'Gaolan', '0931', '730200');
INSERT INTO `e_r_sys_region` VALUES ('620123', '620100', '榆中', '榆中县', '中国,甘肃省,兰州市,榆中县', '3', 'Yuzhong', '0931', '730100');
INSERT INTO `e_r_sys_region` VALUES ('620200', '620000', '嘉峪关', '嘉峪关市', '中国,甘肃省,嘉峪关市', '2', 'Jiayuguan', '0937', '735100');
INSERT INTO `e_r_sys_region` VALUES ('620201', '620200', '雄关', '雄关区', '中国,甘肃省,嘉峪关市,雄关区', '3', 'Xiongguan', '0937', '735100');
INSERT INTO `e_r_sys_region` VALUES ('620202', '620200', '长城', '长城区', '中国,甘肃省,嘉峪关市,长城区', '3', 'Changcheng', '0937', '735106');
INSERT INTO `e_r_sys_region` VALUES ('620203', '620200', '镜铁', '镜铁区', '中国,甘肃省,嘉峪关市,镜铁区', '3', 'Jingtie', '0937', '735100');
INSERT INTO `e_r_sys_region` VALUES ('620300', '620000', '金昌', '金昌市', '中国,甘肃省,金昌市', '2', 'Jinchang', '0935', '737100');
INSERT INTO `e_r_sys_region` VALUES ('620302', '620300', '金川', '金川区', '中国,甘肃省,金昌市,金川区', '3', 'Jinchuan', '0935', '737100');
INSERT INTO `e_r_sys_region` VALUES ('620321', '620300', '永昌', '永昌县', '中国,甘肃省,金昌市,永昌县', '3', 'Yongchang', '0935', '737200');
INSERT INTO `e_r_sys_region` VALUES ('620400', '620000', '白银', '白银市', '中国,甘肃省,白银市', '2', 'Baiyin', '0943', '730900');
INSERT INTO `e_r_sys_region` VALUES ('620402', '620400', '白银', '白银区', '中国,甘肃省,白银市,白银区', '3', 'Baiyin', '0943', '730900');
INSERT INTO `e_r_sys_region` VALUES ('620403', '620400', '平川', '平川区', '中国,甘肃省,白银市,平川区', '3', 'Pingchuan', '0943', '730913');
INSERT INTO `e_r_sys_region` VALUES ('620421', '620400', '靖远', '靖远县', '中国,甘肃省,白银市,靖远县', '3', 'Jingyuan', '0943', '730600');
INSERT INTO `e_r_sys_region` VALUES ('620422', '620400', '会宁', '会宁县', '中国,甘肃省,白银市,会宁县', '3', 'Huining', '0943', '730700');
INSERT INTO `e_r_sys_region` VALUES ('620423', '620400', '景泰', '景泰县', '中国,甘肃省,白银市,景泰县', '3', 'Jingtai', '0943', '730400');
INSERT INTO `e_r_sys_region` VALUES ('620500', '620000', '天水', '天水市', '中国,甘肃省,天水市', '2', 'Tianshui', '0938', '741000');
INSERT INTO `e_r_sys_region` VALUES ('620502', '620500', '秦州', '秦州区', '中国,甘肃省,天水市,秦州区', '3', 'Qinzhou', '0938', '741000');
INSERT INTO `e_r_sys_region` VALUES ('620503', '620500', '麦积', '麦积区', '中国,甘肃省,天水市,麦积区', '3', 'Maiji', '0938', '741020');
INSERT INTO `e_r_sys_region` VALUES ('620521', '620500', '清水', '清水县', '中国,甘肃省,天水市,清水县', '3', 'Qingshui', '0938', '741400');
INSERT INTO `e_r_sys_region` VALUES ('620522', '620500', '秦安', '秦安县', '中国,甘肃省,天水市,秦安县', '3', 'Qin\'an', '0938', '741600');
INSERT INTO `e_r_sys_region` VALUES ('620523', '620500', '甘谷', '甘谷县', '中国,甘肃省,天水市,甘谷县', '3', 'Gangu', '0938', '741200');
INSERT INTO `e_r_sys_region` VALUES ('620524', '620500', '武山', '武山县', '中国,甘肃省,天水市,武山县', '3', 'Wushan', '0938', '741300');
INSERT INTO `e_r_sys_region` VALUES ('620525', '620500', '张家川', '张家川回族自治县', '中国,甘肃省,天水市,张家川回族自治县', '3', 'Zhangjiachuan', '0938', '741500');
INSERT INTO `e_r_sys_region` VALUES ('620600', '620000', '武威', '武威市', '中国,甘肃省,武威市', '2', 'Wuwei', '0935', '733000');
INSERT INTO `e_r_sys_region` VALUES ('620602', '620600', '凉州', '凉州区', '中国,甘肃省,武威市,凉州区', '3', 'Liangzhou', '0935', '733000');
INSERT INTO `e_r_sys_region` VALUES ('620621', '620600', '民勤', '民勤县', '中国,甘肃省,武威市,民勤县', '3', 'Minqin', '0935', '733300');
INSERT INTO `e_r_sys_region` VALUES ('620622', '620600', '古浪', '古浪县', '中国,甘肃省,武威市,古浪县', '3', 'Gulang', '0935', '733100');
INSERT INTO `e_r_sys_region` VALUES ('620623', '620600', '天祝', '天祝藏族自治县', '中国,甘肃省,武威市,天祝藏族自治县', '3', 'Tianzhu', '0935', '733200');
INSERT INTO `e_r_sys_region` VALUES ('620700', '620000', '张掖', '张掖市', '中国,甘肃省,张掖市', '2', 'Zhangye', '0936', '734000');
INSERT INTO `e_r_sys_region` VALUES ('620702', '620700', '甘州', '甘州区', '中国,甘肃省,张掖市,甘州区', '3', 'Ganzhou', '0936', '734000');
INSERT INTO `e_r_sys_region` VALUES ('620721', '620700', '肃南', '肃南裕固族自治县', '中国,甘肃省,张掖市,肃南裕固族自治县', '3', 'Sunan', '0936', '734400');
INSERT INTO `e_r_sys_region` VALUES ('620722', '620700', '民乐', '民乐县', '中国,甘肃省,张掖市,民乐县', '3', 'Minle', '0936', '734500');
INSERT INTO `e_r_sys_region` VALUES ('620723', '620700', '临泽', '临泽县', '中国,甘肃省,张掖市,临泽县', '3', 'Linze', '0936', '734200');
INSERT INTO `e_r_sys_region` VALUES ('620724', '620700', '高台', '高台县', '中国,甘肃省,张掖市,高台县', '3', 'Gaotai', '0936', '734300');
INSERT INTO `e_r_sys_region` VALUES ('620725', '620700', '山丹', '山丹县', '中国,甘肃省,张掖市,山丹县', '3', 'Shandan', '0936', '734100');
INSERT INTO `e_r_sys_region` VALUES ('620800', '620000', '平凉', '平凉市', '中国,甘肃省,平凉市', '2', 'Pingliang', '0933', '744000');
INSERT INTO `e_r_sys_region` VALUES ('620802', '620800', '崆峒', '崆峒区', '中国,甘肃省,平凉市,崆峒区', '3', 'Kongtong', '0933', '744000');
INSERT INTO `e_r_sys_region` VALUES ('620821', '620800', '泾川', '泾川县', '中国,甘肃省,平凉市,泾川县', '3', 'Jingchuan', '0933', '744300');
INSERT INTO `e_r_sys_region` VALUES ('620822', '620800', '灵台', '灵台县', '中国,甘肃省,平凉市,灵台县', '3', 'Lingtai', '0933', '744400');
INSERT INTO `e_r_sys_region` VALUES ('620823', '620800', '崇信', '崇信县', '中国,甘肃省,平凉市,崇信县', '3', 'Chongxin', '0933', '744200');
INSERT INTO `e_r_sys_region` VALUES ('620824', '620800', '华亭', '华亭县', '中国,甘肃省,平凉市,华亭县', '3', 'Huating', '0933', '744100');
INSERT INTO `e_r_sys_region` VALUES ('620825', '620800', '庄浪', '庄浪县', '中国,甘肃省,平凉市,庄浪县', '3', 'Zhuanglang', '0933', '744600');
INSERT INTO `e_r_sys_region` VALUES ('620826', '620800', '静宁', '静宁县', '中国,甘肃省,平凉市,静宁县', '3', 'Jingning', '0933', '743400');
INSERT INTO `e_r_sys_region` VALUES ('620900', '620000', '酒泉', '酒泉市', '中国,甘肃省,酒泉市', '2', 'Jiuquan', '0937', '735000');
INSERT INTO `e_r_sys_region` VALUES ('620902', '620900', '肃州', '肃州区', '中国,甘肃省,酒泉市,肃州区', '3', 'Suzhou', '0937', '735000');
INSERT INTO `e_r_sys_region` VALUES ('620921', '620900', '金塔', '金塔县', '中国,甘肃省,酒泉市,金塔县', '3', 'Jinta', '0937', '735300');
INSERT INTO `e_r_sys_region` VALUES ('620922', '620900', '瓜州', '瓜州县', '中国,甘肃省,酒泉市,瓜州县', '3', 'Guazhou', '0937', '736100');
INSERT INTO `e_r_sys_region` VALUES ('620923', '620900', '肃北', '肃北蒙古族自治县', '中国,甘肃省,酒泉市,肃北蒙古族自治县', '3', 'Subei', '0937', '736300');
INSERT INTO `e_r_sys_region` VALUES ('620924', '620900', '阿克塞', '阿克塞哈萨克族自治县', '中国,甘肃省,酒泉市,阿克塞哈萨克族自治县', '3', 'Akesai', '0937', '736400');
INSERT INTO `e_r_sys_region` VALUES ('620981', '620900', '玉门', '玉门市', '中国,甘肃省,酒泉市,玉门市', '3', 'Yumen', '0937', '735200');
INSERT INTO `e_r_sys_region` VALUES ('620982', '620900', '敦煌', '敦煌市', '中国,甘肃省,酒泉市,敦煌市', '3', 'Dunhuang', '0937', '736200');
INSERT INTO `e_r_sys_region` VALUES ('621000', '620000', '庆阳', '庆阳市', '中国,甘肃省,庆阳市', '2', 'Qingyang', '0934', '745000');
INSERT INTO `e_r_sys_region` VALUES ('621002', '621000', '西峰', '西峰区', '中国,甘肃省,庆阳市,西峰区', '3', 'Xifeng', '0934', '745000');
INSERT INTO `e_r_sys_region` VALUES ('621021', '621000', '庆城', '庆城县', '中国,甘肃省,庆阳市,庆城县', '3', 'Qingcheng', '0934', '745100');
INSERT INTO `e_r_sys_region` VALUES ('621022', '621000', '环县', '环县', '中国,甘肃省,庆阳市,环县', '3', 'Huanxian', '0934', '745700');
INSERT INTO `e_r_sys_region` VALUES ('621023', '621000', '华池', '华池县', '中国,甘肃省,庆阳市,华池县', '3', 'Huachi', '0934', '745600');
INSERT INTO `e_r_sys_region` VALUES ('621024', '621000', '合水', '合水县', '中国,甘肃省,庆阳市,合水县', '3', 'Heshui', '0934', '745400');
INSERT INTO `e_r_sys_region` VALUES ('621025', '621000', '正宁', '正宁县', '中国,甘肃省,庆阳市,正宁县', '3', 'Zhengning', '0934', '745300');
INSERT INTO `e_r_sys_region` VALUES ('621026', '621000', '宁县', '宁县', '中国,甘肃省,庆阳市,宁县', '3', 'Ningxian', '0934', '745200');
INSERT INTO `e_r_sys_region` VALUES ('621027', '621000', '镇原', '镇原县', '中国,甘肃省,庆阳市,镇原县', '3', 'Zhenyuan', '0934', '744500');
INSERT INTO `e_r_sys_region` VALUES ('621100', '620000', '定西', '定西市', '中国,甘肃省,定西市', '2', 'Dingxi', '0932', '743000');
INSERT INTO `e_r_sys_region` VALUES ('621102', '621100', '安定', '安定区', '中国,甘肃省,定西市,安定区', '3', 'Anding', '0932', '743000');
INSERT INTO `e_r_sys_region` VALUES ('621121', '621100', '通渭', '通渭县', '中国,甘肃省,定西市,通渭县', '3', 'Tongwei', '0932', '743300');
INSERT INTO `e_r_sys_region` VALUES ('621122', '621100', '陇西', '陇西县', '中国,甘肃省,定西市,陇西县', '3', 'Longxi', '0932', '748100');
INSERT INTO `e_r_sys_region` VALUES ('621123', '621100', '渭源', '渭源县', '中国,甘肃省,定西市,渭源县', '3', 'Weiyuan', '0932', '748200');
INSERT INTO `e_r_sys_region` VALUES ('621124', '621100', '临洮', '临洮县', '中国,甘肃省,定西市,临洮县', '3', 'Lintao', '0932', '730500');
INSERT INTO `e_r_sys_region` VALUES ('621125', '621100', '漳县', '漳县', '中国,甘肃省,定西市,漳县', '3', 'Zhangxian', '0932', '748300');
INSERT INTO `e_r_sys_region` VALUES ('621126', '621100', '岷县', '岷县', '中国,甘肃省,定西市,岷县', '3', 'Minxian', '0932', '748400');
INSERT INTO `e_r_sys_region` VALUES ('621200', '620000', '陇南', '陇南市', '中国,甘肃省,陇南市', '2', 'Longnan', '0939', '746000');
INSERT INTO `e_r_sys_region` VALUES ('621202', '621200', '武都', '武都区', '中国,甘肃省,陇南市,武都区', '3', 'Wudu', '0939', '746000');
INSERT INTO `e_r_sys_region` VALUES ('621221', '621200', '成县', '成县', '中国,甘肃省,陇南市,成县', '3', 'Chengxian', '0939', '742500');
INSERT INTO `e_r_sys_region` VALUES ('621222', '621200', '文县', '文县', '中国,甘肃省,陇南市,文县', '3', 'Wenxian', '0939', '746400');
INSERT INTO `e_r_sys_region` VALUES ('621223', '621200', '宕昌', '宕昌县', '中国,甘肃省,陇南市,宕昌县', '3', 'Dangchang', '0939', '748500');
INSERT INTO `e_r_sys_region` VALUES ('621224', '621200', '康县', '康县', '中国,甘肃省,陇南市,康县', '3', 'Kangxian', '0939', '746500');
INSERT INTO `e_r_sys_region` VALUES ('621225', '621200', '西和', '西和县', '中国,甘肃省,陇南市,西和县', '3', 'Xihe', '0939', '742100');
INSERT INTO `e_r_sys_region` VALUES ('621226', '621200', '礼县', '礼县', '中国,甘肃省,陇南市,礼县', '3', 'Lixian', '0939', '742200');
INSERT INTO `e_r_sys_region` VALUES ('621227', '621200', '徽县', '徽县', '中国,甘肃省,陇南市,徽县', '3', 'Huixian', '0939', '742300');
INSERT INTO `e_r_sys_region` VALUES ('621228', '621200', '两当', '两当县', '中国,甘肃省,陇南市,两当县', '3', 'Liangdang', '0939', '742400');
INSERT INTO `e_r_sys_region` VALUES ('622900', '620000', '临夏', '临夏回族自治州', '中国,甘肃省,临夏回族自治州', '2', 'Linxia', '0930', '731100');
INSERT INTO `e_r_sys_region` VALUES ('622901', '622900', '临夏', '临夏市', '中国,甘肃省,临夏回族自治州,临夏市', '3', 'Linxia', '0930', '731100');
INSERT INTO `e_r_sys_region` VALUES ('622921', '622900', '临夏', '临夏县', '中国,甘肃省,临夏回族自治州,临夏县', '3', 'Linxia', '0930', '731800');
INSERT INTO `e_r_sys_region` VALUES ('622922', '622900', '康乐', '康乐县', '中国,甘肃省,临夏回族自治州,康乐县', '3', 'Kangle', '0930', '731500');
INSERT INTO `e_r_sys_region` VALUES ('622923', '622900', '永靖', '永靖县', '中国,甘肃省,临夏回族自治州,永靖县', '3', 'Yongjing', '0930', '731600');
INSERT INTO `e_r_sys_region` VALUES ('622924', '622900', '广河', '广河县', '中国,甘肃省,临夏回族自治州,广河县', '3', 'Guanghe', '0930', '731300');
INSERT INTO `e_r_sys_region` VALUES ('622925', '622900', '和政', '和政县', '中国,甘肃省,临夏回族自治州,和政县', '3', 'Hezheng', '0930', '731200');
INSERT INTO `e_r_sys_region` VALUES ('622926', '622900', '东乡族', '东乡族自治县', '中国,甘肃省,临夏回族自治州,东乡族自治县', '3', 'Dongxiangzu', '0930', '731400');
INSERT INTO `e_r_sys_region` VALUES ('622927', '622900', '积石山', '积石山保安族东乡族撒拉族自治县', '中国,甘肃省,临夏回族自治州,积石山保安族东乡族撒拉族自治县', '3', 'Jishishan', '0930', '731700');
INSERT INTO `e_r_sys_region` VALUES ('623000', '620000', '甘南', '甘南藏族自治州', '中国,甘肃省,甘南藏族自治州', '2', 'Gannan', '0941', '747000');
INSERT INTO `e_r_sys_region` VALUES ('623001', '623000', '合作', '合作市', '中国,甘肃省,甘南藏族自治州,合作市', '3', 'Hezuo', '0941', '747000');
INSERT INTO `e_r_sys_region` VALUES ('623021', '623000', '临潭', '临潭县', '中国,甘肃省,甘南藏族自治州,临潭县', '3', 'Lintan', '0941', '747500');
INSERT INTO `e_r_sys_region` VALUES ('623022', '623000', '卓尼', '卓尼县', '中国,甘肃省,甘南藏族自治州,卓尼县', '3', 'Zhuoni', '0941', '747600');
INSERT INTO `e_r_sys_region` VALUES ('623023', '623000', '舟曲', '舟曲县', '中国,甘肃省,甘南藏族自治州,舟曲县', '3', 'Zhouqu', '0941', '746300');
INSERT INTO `e_r_sys_region` VALUES ('623024', '623000', '迭部', '迭部县', '中国,甘肃省,甘南藏族自治州,迭部县', '3', 'Diebu', '0941', '747400');
INSERT INTO `e_r_sys_region` VALUES ('623025', '623000', '玛曲', '玛曲县', '中国,甘肃省,甘南藏族自治州,玛曲县', '3', 'Maqu', '0941', '747300');
INSERT INTO `e_r_sys_region` VALUES ('623026', '623000', '碌曲', '碌曲县', '中国,甘肃省,甘南藏族自治州,碌曲县', '3', 'Luqu', '0941', '747200');
INSERT INTO `e_r_sys_region` VALUES ('623027', '623000', '夏河', '夏河县', '中国,甘肃省,甘南藏族自治州,夏河县', '3', 'Xiahe', '0941', '747100');
INSERT INTO `e_r_sys_region` VALUES ('630000', '100000', '青海', '青海省', '中国,青海省', '1', 'Qinghai', '', '');
INSERT INTO `e_r_sys_region` VALUES ('630100', '630000', '西宁', '西宁市', '中国,青海省,西宁市', '2', 'Xining', '0971', '810000');
INSERT INTO `e_r_sys_region` VALUES ('630102', '630100', '城东', '城东区', '中国,青海省,西宁市,城东区', '3', 'Chengdong', '0971', '810007');
INSERT INTO `e_r_sys_region` VALUES ('630103', '630100', '城中', '城中区', '中国,青海省,西宁市,城中区', '3', 'Chengzhong', '0971', '810000');
INSERT INTO `e_r_sys_region` VALUES ('630104', '630100', '城西', '城西区', '中国,青海省,西宁市,城西区', '3', 'Chengxi', '0971', '810001');
INSERT INTO `e_r_sys_region` VALUES ('630105', '630100', '城北', '城北区', '中国,青海省,西宁市,城北区', '3', 'Chengbei', '0971', '810003');
INSERT INTO `e_r_sys_region` VALUES ('630121', '630100', '大通', '大通回族土族自治县', '中国,青海省,西宁市,大通回族土族自治县', '3', 'Datong', '0971', '810100');
INSERT INTO `e_r_sys_region` VALUES ('630122', '630100', '湟中', '湟中县', '中国,青海省,西宁市,湟中县', '3', 'Huangzhong', '0971', '811600');
INSERT INTO `e_r_sys_region` VALUES ('630123', '630100', '湟源', '湟源县', '中国,青海省,西宁市,湟源县', '3', 'Huangyuan', '0971', '812100');
INSERT INTO `e_r_sys_region` VALUES ('630200', '630000', '海东', '海东市', '中国,青海省,海东市', '2', 'Haidong', '0972', '810700');
INSERT INTO `e_r_sys_region` VALUES ('630202', '630200', '乐都', '乐都区', '中国,青海省,海东市,乐都区', '3', 'Ledu', '0972', '810700');
INSERT INTO `e_r_sys_region` VALUES ('630221', '630200', '平安', '平安县', '中国,青海省,海东市,平安县', '3', 'Ping\'an', '0972', '810600');
INSERT INTO `e_r_sys_region` VALUES ('630222', '630200', '民和', '民和回族土族自治县', '中国,青海省,海东市,民和回族土族自治县', '3', 'Minhe', '0972', '810800');
INSERT INTO `e_r_sys_region` VALUES ('630223', '630200', '互助', '互助土族自治县', '中国,青海省,海东市,互助土族自治县', '3', 'Huzhu', '0972', '810500');
INSERT INTO `e_r_sys_region` VALUES ('630224', '630200', '化隆', '化隆回族自治县', '中国,青海省,海东市,化隆回族自治县', '3', 'Hualong', '0972', '810900');
INSERT INTO `e_r_sys_region` VALUES ('630225', '630200', '循化', '循化撒拉族自治县', '中国,青海省,海东市,循化撒拉族自治县', '3', 'Xunhua', '0972', '811100');
INSERT INTO `e_r_sys_region` VALUES ('632200', '630000', '海北', '海北藏族自治州', '中国,青海省,海北藏族自治州', '2', 'Haibei', '0970', '812200');
INSERT INTO `e_r_sys_region` VALUES ('632221', '632200', '门源', '门源回族自治县', '中国,青海省,海北藏族自治州,门源回族自治县', '3', 'Menyuan', '0970', '810300');
INSERT INTO `e_r_sys_region` VALUES ('632222', '632200', '祁连', '祁连县', '中国,青海省,海北藏族自治州,祁连县', '3', 'Qilian', '0970', '810400');
INSERT INTO `e_r_sys_region` VALUES ('632223', '632200', '海晏', '海晏县', '中国,青海省,海北藏族自治州,海晏县', '3', 'Haiyan', '0970', '812200');
INSERT INTO `e_r_sys_region` VALUES ('632224', '632200', '刚察', '刚察县', '中国,青海省,海北藏族自治州,刚察县', '3', 'Gangcha', '0970', '812300');
INSERT INTO `e_r_sys_region` VALUES ('632300', '630000', '黄南', '黄南藏族自治州', '中国,青海省,黄南藏族自治州', '2', 'Huangnan', '0973', '811300');
INSERT INTO `e_r_sys_region` VALUES ('632321', '632300', '同仁', '同仁县', '中国,青海省,黄南藏族自治州,同仁县', '3', 'Tongren', '0973', '811300');
INSERT INTO `e_r_sys_region` VALUES ('632322', '632300', '尖扎', '尖扎县', '中国,青海省,黄南藏族自治州,尖扎县', '3', 'Jianzha', '0973', '811200');
INSERT INTO `e_r_sys_region` VALUES ('632323', '632300', '泽库', '泽库县', '中国,青海省,黄南藏族自治州,泽库县', '3', 'Zeku', '0973', '811400');
INSERT INTO `e_r_sys_region` VALUES ('632324', '632300', '河南', '河南蒙古族自治县', '中国,青海省,黄南藏族自治州,河南蒙古族自治县', '3', 'Henan', '0973', '811500');
INSERT INTO `e_r_sys_region` VALUES ('632500', '630000', '海南', '海南藏族自治州', '中国,青海省,海南藏族自治州', '2', 'Hainan', '0974', '813000');
INSERT INTO `e_r_sys_region` VALUES ('632521', '632500', '共和', '共和县', '中国,青海省,海南藏族自治州,共和县', '3', 'Gonghe', '0974', '813000');
INSERT INTO `e_r_sys_region` VALUES ('632522', '632500', '同德', '同德县', '中国,青海省,海南藏族自治州,同德县', '3', 'Tongde', '0974', '813200');
INSERT INTO `e_r_sys_region` VALUES ('632523', '632500', '贵德', '贵德县', '中国,青海省,海南藏族自治州,贵德县', '3', 'Guide', '0974', '811700');
INSERT INTO `e_r_sys_region` VALUES ('632524', '632500', '兴海', '兴海县', '中国,青海省,海南藏族自治州,兴海县', '3', 'Xinghai', '0974', '813300');
INSERT INTO `e_r_sys_region` VALUES ('632525', '632500', '贵南', '贵南县', '中国,青海省,海南藏族自治州,贵南县', '3', 'Guinan', '0974', '813100');
INSERT INTO `e_r_sys_region` VALUES ('632600', '630000', '果洛', '果洛藏族自治州', '中国,青海省,果洛藏族自治州', '2', 'Golog', '0975', '814000');
INSERT INTO `e_r_sys_region` VALUES ('632621', '632600', '玛沁', '玛沁县', '中国,青海省,果洛藏族自治州,玛沁县', '3', 'Maqin', '0975', '814000');
INSERT INTO `e_r_sys_region` VALUES ('632622', '632600', '班玛', '班玛县', '中国,青海省,果洛藏族自治州,班玛县', '3', 'Banma', '0975', '814300');
INSERT INTO `e_r_sys_region` VALUES ('632623', '632600', '甘德', '甘德县', '中国,青海省,果洛藏族自治州,甘德县', '3', 'Gande', '0975', '814100');
INSERT INTO `e_r_sys_region` VALUES ('632624', '632600', '达日', '达日县', '中国,青海省,果洛藏族自治州,达日县', '3', 'Dari', '0975', '814200');
INSERT INTO `e_r_sys_region` VALUES ('632625', '632600', '久治', '久治县', '中国,青海省,果洛藏族自治州,久治县', '3', 'Jiuzhi', '0975', '624700');
INSERT INTO `e_r_sys_region` VALUES ('632626', '632600', '玛多', '玛多县', '中国,青海省,果洛藏族自治州,玛多县', '3', 'Maduo', '0975', '813500');
INSERT INTO `e_r_sys_region` VALUES ('632700', '630000', '玉树', '玉树藏族自治州', '中国,青海省,玉树藏族自治州', '2', 'Yushu', '0976', '815000');
INSERT INTO `e_r_sys_region` VALUES ('632701', '632700', '玉树', '玉树市', '中国,青海省,玉树藏族自治州,玉树市', '3', 'Yushu', '0976', '815000');
INSERT INTO `e_r_sys_region` VALUES ('632722', '632700', '杂多', '杂多县', '中国,青海省,玉树藏族自治州,杂多县', '3', 'Zaduo', '0976', '815300');
INSERT INTO `e_r_sys_region` VALUES ('632723', '632700', '称多', '称多县', '中国,青海省,玉树藏族自治州,称多县', '3', 'Chenduo', '0976', '815100');
INSERT INTO `e_r_sys_region` VALUES ('632724', '632700', '治多', '治多县', '中国,青海省,玉树藏族自治州,治多县', '3', 'Zhiduo', '0976', '815400');
INSERT INTO `e_r_sys_region` VALUES ('632725', '632700', '囊谦', '囊谦县', '中国,青海省,玉树藏族自治州,囊谦县', '3', 'Nangqian', '0976', '815200');
INSERT INTO `e_r_sys_region` VALUES ('632726', '632700', '曲麻莱', '曲麻莱县', '中国,青海省,玉树藏族自治州,曲麻莱县', '3', 'Qumalai', '0976', '815500');
INSERT INTO `e_r_sys_region` VALUES ('632800', '630000', '海西', '海西蒙古族藏族自治州', '中国,青海省,海西蒙古族藏族自治州', '2', 'Haixi', '0977', '817000');
INSERT INTO `e_r_sys_region` VALUES ('632801', '632800', '格尔木', '格尔木市', '中国,青海省,海西蒙古族藏族自治州,格尔木市', '3', 'Geermu', '0977', '816000');
INSERT INTO `e_r_sys_region` VALUES ('632802', '632800', '德令哈', '德令哈市', '中国,青海省,海西蒙古族藏族自治州,德令哈市', '3', 'Delingha', '0977', '817000');
INSERT INTO `e_r_sys_region` VALUES ('632821', '632800', '乌兰', '乌兰县', '中国,青海省,海西蒙古族藏族自治州,乌兰县', '3', 'Wulan', '0977', '817100');
INSERT INTO `e_r_sys_region` VALUES ('632822', '632800', '都兰', '都兰县', '中国,青海省,海西蒙古族藏族自治州,都兰县', '3', 'Dulan', '0977', '816100');
INSERT INTO `e_r_sys_region` VALUES ('632823', '632800', '天峻', '天峻县', '中国,青海省,海西蒙古族藏族自治州,天峻县', '3', 'Tianjun', '0977', '817200');
INSERT INTO `e_r_sys_region` VALUES ('640000', '100000', '宁夏', '宁夏回族自治区', '中国,宁夏回族自治区', '1', 'Ningxia', '', '');
INSERT INTO `e_r_sys_region` VALUES ('640100', '640000', '银川', '银川市', '中国,宁夏回族自治区,银川市', '2', 'Yinchuan', '0951', '750004');
INSERT INTO `e_r_sys_region` VALUES ('640104', '640100', '兴庆', '兴庆区', '中国,宁夏回族自治区,银川市,兴庆区', '3', 'Xingqing', '0951', '750001');
INSERT INTO `e_r_sys_region` VALUES ('640105', '640100', '西夏', '西夏区', '中国,宁夏回族自治区,银川市,西夏区', '3', 'Xixia', '0951', '750021');
INSERT INTO `e_r_sys_region` VALUES ('640106', '640100', '金凤', '金凤区', '中国,宁夏回族自治区,银川市,金凤区', '3', 'Jinfeng', '0951', '750011');
INSERT INTO `e_r_sys_region` VALUES ('640121', '640100', '永宁', '永宁县', '中国,宁夏回族自治区,银川市,永宁县', '3', 'Yongning', '0951', '750100');
INSERT INTO `e_r_sys_region` VALUES ('640122', '640100', '贺兰', '贺兰县', '中国,宁夏回族自治区,银川市,贺兰县', '3', 'Helan', '0951', '750200');
INSERT INTO `e_r_sys_region` VALUES ('640181', '640100', '灵武', '灵武市', '中国,宁夏回族自治区,银川市,灵武市', '3', 'Lingwu', '0951', '750004');
INSERT INTO `e_r_sys_region` VALUES ('640200', '640000', '石嘴山', '石嘴山市', '中国,宁夏回族自治区,石嘴山市', '2', 'Shizuishan', '0952', '753000');
INSERT INTO `e_r_sys_region` VALUES ('640202', '640200', '大武口', '大武口区', '中国,宁夏回族自治区,石嘴山市,大武口区', '3', 'Dawukou', '0952', '753000');
INSERT INTO `e_r_sys_region` VALUES ('640205', '640200', '惠农', '惠农区', '中国,宁夏回族自治区,石嘴山市,惠农区', '3', 'Huinong', '0952', '753600');
INSERT INTO `e_r_sys_region` VALUES ('640221', '640200', '平罗', '平罗县', '中国,宁夏回族自治区,石嘴山市,平罗县', '3', 'Pingluo', '0952', '753400');
INSERT INTO `e_r_sys_region` VALUES ('640300', '640000', '吴忠', '吴忠市', '中国,宁夏回族自治区,吴忠市', '2', 'Wuzhong', '0953', '751100');
INSERT INTO `e_r_sys_region` VALUES ('640302', '640300', '利通', '利通区', '中国,宁夏回族自治区,吴忠市,利通区', '3', 'Litong', '0953', '751100');
INSERT INTO `e_r_sys_region` VALUES ('640303', '640300', '红寺堡', '红寺堡区', '中国,宁夏回族自治区,吴忠市,红寺堡区', '3', 'Hongsibao', '0953', '751900');
INSERT INTO `e_r_sys_region` VALUES ('640323', '640300', '盐池', '盐池县', '中国,宁夏回族自治区,吴忠市,盐池县', '3', 'Yanchi', '0953', '751500');
INSERT INTO `e_r_sys_region` VALUES ('640324', '640300', '同心', '同心县', '中国,宁夏回族自治区,吴忠市,同心县', '3', 'Tongxin', '0953', '751300');
INSERT INTO `e_r_sys_region` VALUES ('640381', '640300', '青铜峡', '青铜峡市', '中国,宁夏回族自治区,吴忠市,青铜峡市', '3', 'Qingtongxia', '0953', '751600');
INSERT INTO `e_r_sys_region` VALUES ('640400', '640000', '固原', '固原市', '中国,宁夏回族自治区,固原市', '2', 'Guyuan', '0954', '756000');
INSERT INTO `e_r_sys_region` VALUES ('640402', '640400', '原州', '原州区', '中国,宁夏回族自治区,固原市,原州区', '3', 'Yuanzhou', '0954', '756000');
INSERT INTO `e_r_sys_region` VALUES ('640422', '640400', '西吉', '西吉县', '中国,宁夏回族自治区,固原市,西吉县', '3', 'Xiji', '0954', '756200');
INSERT INTO `e_r_sys_region` VALUES ('640423', '640400', '隆德', '隆德县', '中国,宁夏回族自治区,固原市,隆德县', '3', 'Longde', '0954', '756300');
INSERT INTO `e_r_sys_region` VALUES ('640424', '640400', '泾源', '泾源县', '中国,宁夏回族自治区,固原市,泾源县', '3', 'Jingyuan', '0954', '756400');
INSERT INTO `e_r_sys_region` VALUES ('640425', '640400', '彭阳', '彭阳县', '中国,宁夏回族自治区,固原市,彭阳县', '3', 'Pengyang', '0954', '756500');
INSERT INTO `e_r_sys_region` VALUES ('640500', '640000', '中卫', '中卫市', '中国,宁夏回族自治区,中卫市', '2', 'Zhongwei', '0955', '751700');
INSERT INTO `e_r_sys_region` VALUES ('640502', '640500', '沙坡头', '沙坡头区', '中国,宁夏回族自治区,中卫市,沙坡头区', '3', 'Shapotou', '0955', '755000');
INSERT INTO `e_r_sys_region` VALUES ('640521', '640500', '中宁', '中宁县', '中国,宁夏回族自治区,中卫市,中宁县', '3', 'Zhongning', '0955', '751200');
INSERT INTO `e_r_sys_region` VALUES ('640522', '640500', '海原', '海原县', '中国,宁夏回族自治区,中卫市,海原县', '3', 'Haiyuan', '0955', '751800');
INSERT INTO `e_r_sys_region` VALUES ('650000', '100000', '新疆', '新疆维吾尔自治区', '中国,新疆维吾尔自治区', '1', 'Xinjiang', '', '');
INSERT INTO `e_r_sys_region` VALUES ('650100', '650000', '乌鲁木齐', '乌鲁木齐市', '中国,新疆维吾尔自治区,乌鲁木齐市', '2', 'Urumqi', '0991', '830002');
INSERT INTO `e_r_sys_region` VALUES ('650102', '650100', '天山', '天山区', '中国,新疆维吾尔自治区,乌鲁木齐市,天山区', '3', 'Tianshan', '0991', '830002');
INSERT INTO `e_r_sys_region` VALUES ('650103', '650100', '沙依巴克', '沙依巴克区', '中国,新疆维吾尔自治区,乌鲁木齐市,沙依巴克区', '3', 'Shayibake', '0991', '830000');
INSERT INTO `e_r_sys_region` VALUES ('650104', '650100', '新市', '新市区', '中国,新疆维吾尔自治区,乌鲁木齐市,新市区', '3', 'Xinshi', '0991', '830011');
INSERT INTO `e_r_sys_region` VALUES ('650105', '650100', '水磨沟', '水磨沟区', '中国,新疆维吾尔自治区,乌鲁木齐市,水磨沟区', '3', 'Shuimogou', '0991', '830017');
INSERT INTO `e_r_sys_region` VALUES ('650106', '650100', '头屯河', '头屯河区', '中国,新疆维吾尔自治区,乌鲁木齐市,头屯河区', '3', 'Toutunhe', '0991', '830022');
INSERT INTO `e_r_sys_region` VALUES ('650107', '650100', '达坂城', '达坂城区', '中国,新疆维吾尔自治区,乌鲁木齐市,达坂城区', '3', 'Dabancheng', '0991', '830039');
INSERT INTO `e_r_sys_region` VALUES ('650109', '650100', '米东', '米东区', '中国,新疆维吾尔自治区,乌鲁木齐市,米东区', '3', 'Midong', '0991', '830019');
INSERT INTO `e_r_sys_region` VALUES ('650121', '650100', '乌鲁木齐', '乌鲁木齐县', '中国,新疆维吾尔自治区,乌鲁木齐市,乌鲁木齐县', '3', 'Wulumuqi', '0991', '830063');
INSERT INTO `e_r_sys_region` VALUES ('650200', '650000', '克拉玛依', '克拉玛依市', '中国,新疆维吾尔自治区,克拉玛依市', '2', 'Karamay', '0990', '834000');
INSERT INTO `e_r_sys_region` VALUES ('650202', '650200', '独山子', '独山子区', '中国,新疆维吾尔自治区,克拉玛依市,独山子区', '3', 'Dushanzi', '0992', '834021');
INSERT INTO `e_r_sys_region` VALUES ('650203', '650200', '克拉玛依', '克拉玛依区', '中国,新疆维吾尔自治区,克拉玛依市,克拉玛依区', '3', 'Kelamayi', '0990', '834000');
INSERT INTO `e_r_sys_region` VALUES ('650204', '650200', '白碱滩', '白碱滩区', '中国,新疆维吾尔自治区,克拉玛依市,白碱滩区', '3', 'Baijiantan', '0990', '834008');
INSERT INTO `e_r_sys_region` VALUES ('650205', '650200', '乌尔禾', '乌尔禾区', '中国,新疆维吾尔自治区,克拉玛依市,乌尔禾区', '3', 'Wuerhe', '0990', '834012');
INSERT INTO `e_r_sys_region` VALUES ('652100', '650000', '吐鲁番', '吐鲁番地区', '中国,新疆维吾尔自治区,吐鲁番地区', '2', 'Turpan', '0995', '838000');
INSERT INTO `e_r_sys_region` VALUES ('652101', '652100', '吐鲁番', '吐鲁番市', '中国,新疆维吾尔自治区,吐鲁番地区,吐鲁番市', '3', 'Tulufan', '0995', '838000');
INSERT INTO `e_r_sys_region` VALUES ('652122', '652100', '鄯善', '鄯善县', '中国,新疆维吾尔自治区,吐鲁番地区,鄯善县', '3', 'Shanshan', '0995', '838200');
INSERT INTO `e_r_sys_region` VALUES ('652123', '652100', '托克逊', '托克逊县', '中国,新疆维吾尔自治区,吐鲁番地区,托克逊县', '3', 'Tuokexun', '0995', '838100');
INSERT INTO `e_r_sys_region` VALUES ('652200', '650000', '哈密', '哈密地区', '中国,新疆维吾尔自治区,哈密地区', '2', 'Hami', '0902', '839000');
INSERT INTO `e_r_sys_region` VALUES ('652201', '652200', '哈密', '哈密市', '中国,新疆维吾尔自治区,哈密地区,哈密市', '3', 'Hami', '0902', '839000');
INSERT INTO `e_r_sys_region` VALUES ('652222', '652200', '巴里坤', '巴里坤哈萨克自治县', '中国,新疆维吾尔自治区,哈密地区,巴里坤哈萨克自治县', '3', 'Balikun', '0902', '839200');
INSERT INTO `e_r_sys_region` VALUES ('652223', '652200', '伊吾', '伊吾县', '中国,新疆维吾尔自治区,哈密地区,伊吾县', '3', 'Yiwu', '0902', '839300');
INSERT INTO `e_r_sys_region` VALUES ('652300', '650000', '昌吉', '昌吉回族自治州', '中国,新疆维吾尔自治区,昌吉回族自治州', '2', 'Changji', '0994', '831100');
INSERT INTO `e_r_sys_region` VALUES ('652301', '652300', '昌吉', '昌吉市', '中国,新疆维吾尔自治区,昌吉回族自治州,昌吉市', '3', 'Changji', '0994', '831100');
INSERT INTO `e_r_sys_region` VALUES ('652302', '652300', '阜康', '阜康市', '中国,新疆维吾尔自治区,昌吉回族自治州,阜康市', '3', 'Fukang', '0994', '831500');
INSERT INTO `e_r_sys_region` VALUES ('652323', '652300', '呼图壁', '呼图壁县', '中国,新疆维吾尔自治区,昌吉回族自治州,呼图壁县', '3', 'Hutubi', '0994', '831200');
INSERT INTO `e_r_sys_region` VALUES ('652324', '652300', '玛纳斯', '玛纳斯县', '中国,新疆维吾尔自治区,昌吉回族自治州,玛纳斯县', '3', 'Manasi', '0994', '832200');
INSERT INTO `e_r_sys_region` VALUES ('652325', '652300', '奇台', '奇台县', '中国,新疆维吾尔自治区,昌吉回族自治州,奇台县', '3', 'Qitai', '0994', '831800');
INSERT INTO `e_r_sys_region` VALUES ('652327', '652300', '吉木萨尔', '吉木萨尔县', '中国,新疆维吾尔自治区,昌吉回族自治州,吉木萨尔县', '3', 'Jimusaer', '0994', '831700');
INSERT INTO `e_r_sys_region` VALUES ('652328', '652300', '木垒', '木垒哈萨克自治县', '中国,新疆维吾尔自治区,昌吉回族自治州,木垒哈萨克自治县', '3', 'Mulei', '0994', '831900');
INSERT INTO `e_r_sys_region` VALUES ('652700', '650000', '博尔塔拉', '博尔塔拉蒙古自治州', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州', '2', 'Bortala', '0909', '833400');
INSERT INTO `e_r_sys_region` VALUES ('652701', '652700', '博乐', '博乐市', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,博乐市', '3', 'Bole', '0909', '833400');
INSERT INTO `e_r_sys_region` VALUES ('652702', '652700', '阿拉山口', '阿拉山口市', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市', '3', 'Alashankou', '0909', '833400');
INSERT INTO `e_r_sys_region` VALUES ('652722', '652700', '精河', '精河县', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,精河县', '3', 'Jinghe', '0909', '833300');
INSERT INTO `e_r_sys_region` VALUES ('652723', '652700', '温泉', '温泉县', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,温泉县', '3', 'Wenquan', '0909', '833500');
INSERT INTO `e_r_sys_region` VALUES ('652800', '650000', '巴音郭楞', '巴音郭楞蒙古自治州', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州', '2', 'Bayingol', '0996', '841000');
INSERT INTO `e_r_sys_region` VALUES ('652801', '652800', '库尔勒', '库尔勒市', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,库尔勒市', '3', 'Kuerle', '0996', '841000');
INSERT INTO `e_r_sys_region` VALUES ('652822', '652800', '轮台', '轮台县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,轮台县', '3', 'Luntai', '0996', '841600');
INSERT INTO `e_r_sys_region` VALUES ('652823', '652800', '尉犁', '尉犁县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,尉犁县', '3', 'Yuli', '0996', '841500');
INSERT INTO `e_r_sys_region` VALUES ('652824', '652800', '若羌', '若羌县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,若羌县', '3', 'Ruoqiang', '0996', '841800');
INSERT INTO `e_r_sys_region` VALUES ('652825', '652800', '且末', '且末县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,且末县', '3', 'Qiemo', '0996', '841900');
INSERT INTO `e_r_sys_region` VALUES ('652826', '652800', '焉耆', '焉耆回族自治县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,焉耆回族自治县', '3', 'Yanqi', '0996', '841100');
INSERT INTO `e_r_sys_region` VALUES ('652827', '652800', '和静', '和静县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和静县', '3', 'Hejing', '0996', '841300');
INSERT INTO `e_r_sys_region` VALUES ('652828', '652800', '和硕', '和硕县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和硕县', '3', 'Heshuo', '0996', '841200');
INSERT INTO `e_r_sys_region` VALUES ('652829', '652800', '博湖', '博湖县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,博湖县', '3', 'Bohu', '0996', '841400');
INSERT INTO `e_r_sys_region` VALUES ('652900', '650000', '阿克苏', '阿克苏地区', '中国,新疆维吾尔自治区,阿克苏地区', '2', 'Aksu', '0997', '843000');
INSERT INTO `e_r_sys_region` VALUES ('652901', '652900', '阿克苏', '阿克苏市', '中国,新疆维吾尔自治区,阿克苏地区,阿克苏市', '3', 'Akesu', '0997', '843000');
INSERT INTO `e_r_sys_region` VALUES ('652922', '652900', '温宿', '温宿县', '中国,新疆维吾尔自治区,阿克苏地区,温宿县', '3', 'Wensu', '0997', '843100');
INSERT INTO `e_r_sys_region` VALUES ('652923', '652900', '库车', '库车县', '中国,新疆维吾尔自治区,阿克苏地区,库车县', '3', 'Kuche', '0997', '842000');
INSERT INTO `e_r_sys_region` VALUES ('652924', '652900', '沙雅', '沙雅县', '中国,新疆维吾尔自治区,阿克苏地区,沙雅县', '3', 'Shaya', '0997', '842200');
INSERT INTO `e_r_sys_region` VALUES ('652925', '652900', '新和', '新和县', '中国,新疆维吾尔自治区,阿克苏地区,新和县', '3', 'Xinhe', '0997', '842100');
INSERT INTO `e_r_sys_region` VALUES ('652926', '652900', '拜城', '拜城县', '中国,新疆维吾尔自治区,阿克苏地区,拜城县', '3', 'Baicheng', '0997', '842300');
INSERT INTO `e_r_sys_region` VALUES ('652927', '652900', '乌什', '乌什县', '中国,新疆维吾尔自治区,阿克苏地区,乌什县', '3', 'Wushi', '0997', '843400');
INSERT INTO `e_r_sys_region` VALUES ('652928', '652900', '阿瓦提', '阿瓦提县', '中国,新疆维吾尔自治区,阿克苏地区,阿瓦提县', '3', 'Awati', '0997', '843200');
INSERT INTO `e_r_sys_region` VALUES ('652929', '652900', '柯坪', '柯坪县', '中国,新疆维吾尔自治区,阿克苏地区,柯坪县', '3', 'Keping', '0997', '843600');
INSERT INTO `e_r_sys_region` VALUES ('653000', '650000', '克孜勒苏', '克孜勒苏柯尔克孜自治州', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州', '2', 'Kizilsu', '0908', '845350');
INSERT INTO `e_r_sys_region` VALUES ('653001', '653000', '阿图什', '阿图什市', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿图什市', '3', 'Atushi', '0908', '845350');
INSERT INTO `e_r_sys_region` VALUES ('653022', '653000', '阿克陶', '阿克陶县', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿克陶县', '3', 'Aketao', '0908', '845550');
INSERT INTO `e_r_sys_region` VALUES ('653023', '653000', '阿合奇', '阿合奇县', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿合奇县', '3', 'Aheqi', '0997', '843500');
INSERT INTO `e_r_sys_region` VALUES ('653024', '653000', '乌恰', '乌恰县', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,乌恰县', '3', 'Wuqia', '0908', '845450');
INSERT INTO `e_r_sys_region` VALUES ('653100', '650000', '喀什', '喀什地区', '中国,新疆维吾尔自治区,喀什地区', '2', 'Kashgar', '0998', '844000');
INSERT INTO `e_r_sys_region` VALUES ('653101', '653100', '喀什', '喀什市', '中国,新疆维吾尔自治区,喀什地区,喀什市', '3', 'Kashi', '0998', '844000');
INSERT INTO `e_r_sys_region` VALUES ('653121', '653100', '疏附', '疏附县', '中国,新疆维吾尔自治区,喀什地区,疏附县', '3', 'Shufu', '0998', '844100');
INSERT INTO `e_r_sys_region` VALUES ('653122', '653100', '疏勒', '疏勒县', '中国,新疆维吾尔自治区,喀什地区,疏勒县', '3', 'Shule', '0998', '844200');
INSERT INTO `e_r_sys_region` VALUES ('653123', '653100', '英吉沙', '英吉沙县', '中国,新疆维吾尔自治区,喀什地区,英吉沙县', '3', 'Yingjisha', '0998', '844500');
INSERT INTO `e_r_sys_region` VALUES ('653124', '653100', '泽普', '泽普县', '中国,新疆维吾尔自治区,喀什地区,泽普县', '3', 'Zepu', '0998', '844800');
INSERT INTO `e_r_sys_region` VALUES ('653125', '653100', '莎车', '莎车县', '中国,新疆维吾尔自治区,喀什地区,莎车县', '3', 'Shache', '0998', '844700');
INSERT INTO `e_r_sys_region` VALUES ('653126', '653100', '叶城', '叶城县', '中国,新疆维吾尔自治区,喀什地区,叶城县', '3', 'Yecheng', '0998', '844900');
INSERT INTO `e_r_sys_region` VALUES ('653127', '653100', '麦盖提', '麦盖提县', '中国,新疆维吾尔自治区,喀什地区,麦盖提县', '3', 'Maigaiti', '0998', '844600');
INSERT INTO `e_r_sys_region` VALUES ('653128', '653100', '岳普湖', '岳普湖县', '中国,新疆维吾尔自治区,喀什地区,岳普湖县', '3', 'Yuepuhu', '0998', '844400');
INSERT INTO `e_r_sys_region` VALUES ('653129', '653100', '伽师', '伽师县', '中国,新疆维吾尔自治区,喀什地区,伽师县', '3', 'Jiashi', '0998', '844300');
INSERT INTO `e_r_sys_region` VALUES ('653130', '653100', '巴楚', '巴楚县', '中国,新疆维吾尔自治区,喀什地区,巴楚县', '3', 'Bachu', '0998', '843800');
INSERT INTO `e_r_sys_region` VALUES ('653131', '653100', '塔什库尔干塔吉克', '塔什库尔干塔吉克自治县', '中国,新疆维吾尔自治区,喀什地区,塔什库尔干塔吉克自治县', '3', 'Tashikuergantajike', '0998', '845250');
INSERT INTO `e_r_sys_region` VALUES ('653200', '650000', '和田', '和田地区', '中国,新疆维吾尔自治区,和田地区', '2', 'Hotan', '0903', '848000');
INSERT INTO `e_r_sys_region` VALUES ('653201', '653200', '和田市', '和田市', '中国,新疆维吾尔自治区,和田地区,和田市', '3', 'Hetianshi', '0903', '848000');
INSERT INTO `e_r_sys_region` VALUES ('653221', '653200', '和田县', '和田县', '中国,新疆维吾尔自治区,和田地区,和田县', '3', 'Hetianxian', '0903', '848000');
INSERT INTO `e_r_sys_region` VALUES ('653222', '653200', '墨玉', '墨玉县', '中国,新疆维吾尔自治区,和田地区,墨玉县', '3', 'Moyu', '0903', '848100');
INSERT INTO `e_r_sys_region` VALUES ('653223', '653200', '皮山', '皮山县', '中国,新疆维吾尔自治区,和田地区,皮山县', '3', 'Pishan', '0903', '845150');
INSERT INTO `e_r_sys_region` VALUES ('653224', '653200', '洛浦', '洛浦县', '中国,新疆维吾尔自治区,和田地区,洛浦县', '3', 'Luopu', '0903', '848200');
INSERT INTO `e_r_sys_region` VALUES ('653225', '653200', '策勒', '策勒县', '中国,新疆维吾尔自治区,和田地区,策勒县', '3', 'Cele', '0903', '848300');
INSERT INTO `e_r_sys_region` VALUES ('653226', '653200', '于田', '于田县', '中国,新疆维吾尔自治区,和田地区,于田县', '3', 'Yutian', '0903', '848400');
INSERT INTO `e_r_sys_region` VALUES ('653227', '653200', '民丰', '民丰县', '中国,新疆维吾尔自治区,和田地区,民丰县', '3', 'Minfeng', '0903', '848500');
INSERT INTO `e_r_sys_region` VALUES ('654000', '650000', '伊犁', '伊犁哈萨克自治州', '中国,新疆维吾尔自治区,伊犁哈萨克自治州', '2', 'Ili', '0999', '835100');
INSERT INTO `e_r_sys_region` VALUES ('654002', '654000', '伊宁', '伊宁市', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁市', '3', 'Yining', '0999', '835000');
INSERT INTO `e_r_sys_region` VALUES ('654003', '654000', '奎屯', '奎屯市', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,奎屯市', '3', 'Kuitun', '0992', '833200');
INSERT INTO `e_r_sys_region` VALUES ('654004', '654000', '霍尔果斯', '霍尔果斯市', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍尔果斯市', '3', 'Huoerguosi', '0999', '835221');
INSERT INTO `e_r_sys_region` VALUES ('654021', '654000', '伊宁', '伊宁县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁县', '3', 'Yining', '0999', '835100');
INSERT INTO `e_r_sys_region` VALUES ('654022', '654000', '察布查尔锡伯', '察布查尔锡伯自治县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,察布查尔锡伯自治县', '3', 'Chabuchaerxibo', '0999', '835300');
INSERT INTO `e_r_sys_region` VALUES ('654023', '654000', '霍城', '霍城县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍城县', '3', 'Huocheng', '0999', '835200');
INSERT INTO `e_r_sys_region` VALUES ('654024', '654000', '巩留', '巩留县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,巩留县', '3', 'Gongliu', '0999', '835400');
INSERT INTO `e_r_sys_region` VALUES ('654025', '654000', '新源', '新源县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,新源县', '3', 'Xinyuan', '0999', '835800');
INSERT INTO `e_r_sys_region` VALUES ('654026', '654000', '昭苏', '昭苏县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,昭苏县', '3', 'Zhaosu', '0999', '835600');
INSERT INTO `e_r_sys_region` VALUES ('654027', '654000', '特克斯', '特克斯县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,特克斯县', '3', 'Tekesi', '0999', '835500');
INSERT INTO `e_r_sys_region` VALUES ('654028', '654000', '尼勒克', '尼勒克县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,尼勒克县', '3', 'Nileke', '0999', '835700');
INSERT INTO `e_r_sys_region` VALUES ('654200', '650000', '塔城', '塔城地区', '中国,新疆维吾尔自治区,塔城地区', '2', 'Qoqek', '0901', '834700');
INSERT INTO `e_r_sys_region` VALUES ('654201', '654200', '塔城', '塔城市', '中国,新疆维吾尔自治区,塔城地区,塔城市', '3', 'Tacheng', '0901', '834700');
INSERT INTO `e_r_sys_region` VALUES ('654202', '654200', '乌苏', '乌苏市', '中国,新疆维吾尔自治区,塔城地区,乌苏市', '3', 'Wusu', '0992', '833000');
INSERT INTO `e_r_sys_region` VALUES ('654221', '654200', '额敏', '额敏县', '中国,新疆维吾尔自治区,塔城地区,额敏县', '3', 'Emin', '0901', '834600');
INSERT INTO `e_r_sys_region` VALUES ('654223', '654200', '沙湾', '沙湾县', '中国,新疆维吾尔自治区,塔城地区,沙湾县', '3', 'Shawan', '0993', '832100');
INSERT INTO `e_r_sys_region` VALUES ('654224', '654200', '托里', '托里县', '中国,新疆维吾尔自治区,塔城地区,托里县', '3', 'Tuoli', '0901', '834500');
INSERT INTO `e_r_sys_region` VALUES ('654225', '654200', '裕民', '裕民县', '中国,新疆维吾尔自治区,塔城地区,裕民县', '3', 'Yumin', '0901', '834800');
INSERT INTO `e_r_sys_region` VALUES ('654226', '654200', '和布克赛尔', '和布克赛尔蒙古自治县', '中国,新疆维吾尔自治区,塔城地区,和布克赛尔蒙古自治县', '3', 'Hebukesaier', '0990', '834400');
INSERT INTO `e_r_sys_region` VALUES ('654300', '650000', '阿勒泰', '阿勒泰地区', '中国,新疆维吾尔自治区,阿勒泰地区', '2', 'Altay', '0906', '836500');
INSERT INTO `e_r_sys_region` VALUES ('654301', '654300', '阿勒泰', '阿勒泰市', '中国,新疆维吾尔自治区,阿勒泰地区,阿勒泰市', '3', 'Aletai', '0906', '836500');
INSERT INTO `e_r_sys_region` VALUES ('654321', '654300', '布尔津', '布尔津县', '中国,新疆维吾尔自治区,阿勒泰地区,布尔津县', '3', 'Buerjin', '0906', '836600');
INSERT INTO `e_r_sys_region` VALUES ('654322', '654300', '富蕴', '富蕴县', '中国,新疆维吾尔自治区,阿勒泰地区,富蕴县', '3', 'Fuyun', '0906', '836100');
INSERT INTO `e_r_sys_region` VALUES ('654323', '654300', '福海', '福海县', '中国,新疆维吾尔自治区,阿勒泰地区,福海县', '3', 'Fuhai', '0906', '836400');
INSERT INTO `e_r_sys_region` VALUES ('654324', '654300', '哈巴河', '哈巴河县', '中国,新疆维吾尔自治区,阿勒泰地区,哈巴河县', '3', 'Habahe', '0906', '836700');
INSERT INTO `e_r_sys_region` VALUES ('654325', '654300', '青河', '青河县', '中国,新疆维吾尔自治区,阿勒泰地区,青河县', '3', 'Qinghe', '0906', '836200');
INSERT INTO `e_r_sys_region` VALUES ('654326', '654300', '吉木乃', '吉木乃县', '中国,新疆维吾尔自治区,阿勒泰地区,吉木乃县', '3', 'Jimunai', '0906', '836800');
INSERT INTO `e_r_sys_region` VALUES ('659000', '650000', ' ', '直辖县级', '中国,新疆维吾尔自治区,直辖县级', '2', '', '', '');
INSERT INTO `e_r_sys_region` VALUES ('659001', '659000', '石河子', '石河子市', '中国,新疆维吾尔自治区,直辖县级,石河子市', '3', 'Shihezi', '0993', '832000');
INSERT INTO `e_r_sys_region` VALUES ('659002', '659000', '阿拉尔', '阿拉尔市', '中国,新疆维吾尔自治区,直辖县级,阿拉尔市', '3', 'Aral', '0997', '843300');
INSERT INTO `e_r_sys_region` VALUES ('659003', '659000', '图木舒克', '图木舒克市', '中国,新疆维吾尔自治区,直辖县级,图木舒克市', '3', 'Tumxuk', '0998', '843806');
INSERT INTO `e_r_sys_region` VALUES ('659004', '659000', '五家渠', '五家渠市', '中国,新疆维吾尔自治区,直辖县级,五家渠市', '3', 'Wujiaqu', '0994', '831300');
INSERT INTO `e_r_sys_region` VALUES ('659005', '659000', '北屯', '北屯市', '中国,新疆维吾尔自治区,直辖县级,北屯市', '3', 'Beitun', '0906', '836000');
INSERT INTO `e_r_sys_region` VALUES ('659006', '659000', '铁门关', '铁门关市', '中国,新疆维吾尔自治区,直辖县级,铁门关市', '3', 'Tiemenguan', '0906', '836000');
INSERT INTO `e_r_sys_region` VALUES ('659007', '659000', '双河', '双河市', '中国,新疆维吾尔自治区,直辖县级,双河市', '3', 'Shuanghe', '0909', '833408');
INSERT INTO `e_r_sys_region` VALUES ('710000', '100000', '台湾', '台湾', '中国,台湾', '1', 'Taiwan', '', '');
INSERT INTO `e_r_sys_region` VALUES ('710100', '710000', '台北', '台北市', '中国,台湾,台北市', '2', 'Taipei', '02', '1');
INSERT INTO `e_r_sys_region` VALUES ('710101', '710100', '松山', '松山区', '中国,台湾,台北市,松山区', '3', 'Songshan', '02', '105');
INSERT INTO `e_r_sys_region` VALUES ('710102', '710100', '信义', '信义区', '中国,台湾,台北市,信义区', '3', 'Xinyi', '02', '110');
INSERT INTO `e_r_sys_region` VALUES ('710103', '710100', '大安', '大安区', '中国,台湾,台北市,大安区', '3', 'Da\'an', '02', '106');
INSERT INTO `e_r_sys_region` VALUES ('710104', '710100', '中山', '中山区', '中国,台湾,台北市,中山区', '3', 'Zhongshan', '02', '104');
INSERT INTO `e_r_sys_region` VALUES ('710105', '710100', '中正', '中正区', '中国,台湾,台北市,中正区', '3', 'Zhongzheng', '02', '100');
INSERT INTO `e_r_sys_region` VALUES ('710106', '710100', '大同', '大同区', '中国,台湾,台北市,大同区', '3', 'Datong', '02', '103');
INSERT INTO `e_r_sys_region` VALUES ('710107', '710100', '万华', '万华区', '中国,台湾,台北市,万华区', '3', 'Wanhua', '02', '108');
INSERT INTO `e_r_sys_region` VALUES ('710108', '710100', '文山', '文山区', '中国,台湾,台北市,文山区', '3', 'Wenshan', '02', '116');
INSERT INTO `e_r_sys_region` VALUES ('710109', '710100', '南港', '南港区', '中国,台湾,台北市,南港区', '3', 'Nangang', '02', '115');
INSERT INTO `e_r_sys_region` VALUES ('710110', '710100', '内湖', '内湖区', '中国,台湾,台北市,内湖区', '3', 'Nahu', '02', '114');
INSERT INTO `e_r_sys_region` VALUES ('710111', '710100', '士林', '士林区', '中国,台湾,台北市,士林区', '3', 'Shilin', '02', '111');
INSERT INTO `e_r_sys_region` VALUES ('710112', '710100', '北投', '北投区', '中国,台湾,台北市,北投区', '3', 'Beitou', '02', '112');
INSERT INTO `e_r_sys_region` VALUES ('710200', '710000', '高雄', '高雄市', '中国,台湾,高雄市', '2', 'Kaohsiung', '07', '8');
INSERT INTO `e_r_sys_region` VALUES ('710201', '710200', '盐埕', '盐埕区', '中国,台湾,高雄市,盐埕区', '3', 'Yancheng', '07', '803');
INSERT INTO `e_r_sys_region` VALUES ('710202', '710200', '鼓山', '鼓山区', '中国,台湾,高雄市,鼓山区', '3', 'Gushan', '07', '804');
INSERT INTO `e_r_sys_region` VALUES ('710203', '710200', '左营', '左营区', '中国,台湾,高雄市,左营区', '3', 'Zuoying', '07', '813');
INSERT INTO `e_r_sys_region` VALUES ('710204', '710200', '楠梓', '楠梓区', '中国,台湾,高雄市,楠梓区', '3', 'Nanzi', '07', '811');
INSERT INTO `e_r_sys_region` VALUES ('710205', '710200', '三民', '三民区', '中国,台湾,高雄市,三民区', '3', 'Sanmin', '07', '807');
INSERT INTO `e_r_sys_region` VALUES ('710206', '710200', '新兴', '新兴区', '中国,台湾,高雄市,新兴区', '3', 'Xinxing', '07', '800');
INSERT INTO `e_r_sys_region` VALUES ('710207', '710200', '前金', '前金区', '中国,台湾,高雄市,前金区', '3', 'Qianjin', '07', '801');
INSERT INTO `e_r_sys_region` VALUES ('710208', '710200', '苓雅', '苓雅区', '中国,台湾,高雄市,苓雅区', '3', 'Lingya', '07', '802');
INSERT INTO `e_r_sys_region` VALUES ('710209', '710200', '前镇', '前镇区', '中国,台湾,高雄市,前镇区', '3', 'Qianzhen', '07', '806');
INSERT INTO `e_r_sys_region` VALUES ('710210', '710200', '旗津', '旗津区', '中国,台湾,高雄市,旗津区', '3', 'Qijin', '07', '805');
INSERT INTO `e_r_sys_region` VALUES ('710211', '710200', '小港', '小港区', '中国,台湾,高雄市,小港区', '3', 'Xiaogang', '07', '812');
INSERT INTO `e_r_sys_region` VALUES ('710212', '710200', '凤山', '凤山区', '中国,台湾,高雄市,凤山区', '3', 'Fengshan', '07', '830');
INSERT INTO `e_r_sys_region` VALUES ('710213', '710200', '林园', '林园区', '中国,台湾,高雄市,林园区', '3', 'Linyuan', '07', '832');
INSERT INTO `e_r_sys_region` VALUES ('710214', '710200', '大寮', '大寮区', '中国,台湾,高雄市,大寮区', '3', 'Daliao', '07', '831');
INSERT INTO `e_r_sys_region` VALUES ('710215', '710200', '大树', '大树区', '中国,台湾,高雄市,大树区', '3', 'Dashu', '07', '840');
INSERT INTO `e_r_sys_region` VALUES ('710216', '710200', '大社', '大社区', '中国,台湾,高雄市,大社区', '3', 'Dashe', '07', '815');
INSERT INTO `e_r_sys_region` VALUES ('710217', '710200', '仁武', '仁武区', '中国,台湾,高雄市,仁武区', '3', 'Renwu', '07', '814');
INSERT INTO `e_r_sys_region` VALUES ('710218', '710200', '鸟松', '鸟松区', '中国,台湾,高雄市,鸟松区', '3', 'Niaosong', '07', '833');
INSERT INTO `e_r_sys_region` VALUES ('710219', '710200', '冈山', '冈山区', '中国,台湾,高雄市,冈山区', '3', 'Gangshan', '07', '820');
INSERT INTO `e_r_sys_region` VALUES ('710220', '710200', '桥头', '桥头区', '中国,台湾,高雄市,桥头区', '3', 'Qiaotou', '07', '825');
INSERT INTO `e_r_sys_region` VALUES ('710221', '710200', '燕巢', '燕巢区', '中国,台湾,高雄市,燕巢区', '3', 'Yanchao', '07', '824');
INSERT INTO `e_r_sys_region` VALUES ('710222', '710200', '田寮', '田寮区', '中国,台湾,高雄市,田寮区', '3', 'Tianliao', '07', '823');
INSERT INTO `e_r_sys_region` VALUES ('710223', '710200', '阿莲', '阿莲区', '中国,台湾,高雄市,阿莲区', '3', 'Alian', '07', '822');
INSERT INTO `e_r_sys_region` VALUES ('710224', '710200', '路竹', '路竹区', '中国,台湾,高雄市,路竹区', '3', 'Luzhu', '07', '821');
INSERT INTO `e_r_sys_region` VALUES ('710225', '710200', '湖内', '湖内区', '中国,台湾,高雄市,湖内区', '3', 'Huna', '07', '829');
INSERT INTO `e_r_sys_region` VALUES ('710226', '710200', '茄萣', '茄萣区', '中国,台湾,高雄市,茄萣区', '3', 'Qieding', '07', '852');
INSERT INTO `e_r_sys_region` VALUES ('710227', '710200', '永安', '永安区', '中国,台湾,高雄市,永安区', '3', 'Yong\'an', '07', '828');
INSERT INTO `e_r_sys_region` VALUES ('710228', '710200', '弥陀', '弥陀区', '中国,台湾,高雄市,弥陀区', '3', 'Mituo', '07', '827');
INSERT INTO `e_r_sys_region` VALUES ('710229', '710200', '梓官', '梓官区', '中国,台湾,高雄市,梓官区', '3', 'Ziguan', '07', '826');
INSERT INTO `e_r_sys_region` VALUES ('710230', '710200', '旗山', '旗山区', '中国,台湾,高雄市,旗山区', '3', 'Qishan', '07', '842');
INSERT INTO `e_r_sys_region` VALUES ('710231', '710200', '美浓', '美浓区', '中国,台湾,高雄市,美浓区', '3', 'Meinong', '07', '843');
INSERT INTO `e_r_sys_region` VALUES ('710232', '710200', '六龟', '六龟区', '中国,台湾,高雄市,六龟区', '3', 'Liugui', '07', '844');
INSERT INTO `e_r_sys_region` VALUES ('710233', '710200', '甲仙', '甲仙区', '中国,台湾,高雄市,甲仙区', '3', 'Jiaxian', '07', '847');
INSERT INTO `e_r_sys_region` VALUES ('710234', '710200', '杉林', '杉林区', '中国,台湾,高雄市,杉林区', '3', 'Shanlin', '07', '846');
INSERT INTO `e_r_sys_region` VALUES ('710235', '710200', '内门', '内门区', '中国,台湾,高雄市,内门区', '3', 'Namen', '07', '845');
INSERT INTO `e_r_sys_region` VALUES ('710236', '710200', '茂林', '茂林区', '中国,台湾,高雄市,茂林区', '3', 'Maolin', '07', '851');
INSERT INTO `e_r_sys_region` VALUES ('710237', '710200', '桃源', '桃源区', '中国,台湾,高雄市,桃源区', '3', 'Taoyuan', '07', '848');
INSERT INTO `e_r_sys_region` VALUES ('710238', '710200', '那玛夏', '那玛夏区', '中国,台湾,高雄市,那玛夏区', '3', 'Namaxia', '07', '849');
INSERT INTO `e_r_sys_region` VALUES ('710300', '710000', '基隆', '基隆市', '中国,台湾,基隆市', '2', 'Keelung', '02', '2');
INSERT INTO `e_r_sys_region` VALUES ('710301', '710300', '中正', '中正区', '中国,台湾,基隆市,中正区', '3', 'Zhongzheng', '02', '202');
INSERT INTO `e_r_sys_region` VALUES ('710302', '710300', '七堵', '七堵区', '中国,台湾,基隆市,七堵区', '3', 'Qidu', '02', '206');
INSERT INTO `e_r_sys_region` VALUES ('710303', '710300', '暖暖', '暖暖区', '中国,台湾,基隆市,暖暖区', '3', 'Nuannuan', '02', '205');
INSERT INTO `e_r_sys_region` VALUES ('710304', '710300', '仁爱', '仁爱区', '中国,台湾,基隆市,仁爱区', '3', 'Renai', '02', '200');
INSERT INTO `e_r_sys_region` VALUES ('710305', '710300', '中山', '中山区', '中国,台湾,基隆市,中山区', '3', 'Zhongshan', '02', '203');
INSERT INTO `e_r_sys_region` VALUES ('710306', '710300', '安乐', '安乐区', '中国,台湾,基隆市,安乐区', '3', 'Anle', '02', '204');
INSERT INTO `e_r_sys_region` VALUES ('710307', '710300', '信义', '信义区', '中国,台湾,基隆市,信义区', '3', 'Xinyi', '02', '201');
INSERT INTO `e_r_sys_region` VALUES ('710400', '710000', '台中', '台中市', '中国,台湾,台中市', '2', 'Taichung', '04', '4');
INSERT INTO `e_r_sys_region` VALUES ('710401', '710400', '中区', '中区', '中国,台湾,台中市,中区', '3', 'Zhongqu', '04', '400');
INSERT INTO `e_r_sys_region` VALUES ('710402', '710400', '东区', '东区', '中国,台湾,台中市,东区', '3', 'Dongqu', '04', '401');
INSERT INTO `e_r_sys_region` VALUES ('710403', '710400', '南区', '南区', '中国,台湾,台中市,南区', '3', 'Nanqu', '04', '402');
INSERT INTO `e_r_sys_region` VALUES ('710404', '710400', '西区', '西区', '中国,台湾,台中市,西区', '3', 'Xiqu', '04', '403');
INSERT INTO `e_r_sys_region` VALUES ('710405', '710400', '北区', '北区', '中国,台湾,台中市,北区', '3', 'Beiqu', '04', '404');
INSERT INTO `e_r_sys_region` VALUES ('710406', '710400', '西屯', '西屯区', '中国,台湾,台中市,西屯区', '3', 'Xitun', '04', '407');
INSERT INTO `e_r_sys_region` VALUES ('710407', '710400', '南屯', '南屯区', '中国,台湾,台中市,南屯区', '3', 'Nantun', '04', '408');
INSERT INTO `e_r_sys_region` VALUES ('710408', '710400', '北屯', '北屯区', '中国,台湾,台中市,北屯区', '3', 'Beitun', '04', '406');
INSERT INTO `e_r_sys_region` VALUES ('710409', '710400', '丰原', '丰原区', '中国,台湾,台中市,丰原区', '3', 'Fengyuan', '04', '420');
INSERT INTO `e_r_sys_region` VALUES ('710410', '710400', '东势', '东势区', '中国,台湾,台中市,东势区', '3', 'Dongshi', '04', '423');
INSERT INTO `e_r_sys_region` VALUES ('710411', '710400', '大甲', '大甲区', '中国,台湾,台中市,大甲区', '3', 'Dajia', '04', '437');
INSERT INTO `e_r_sys_region` VALUES ('710412', '710400', '清水', '清水区', '中国,台湾,台中市,清水区', '3', 'Qingshui', '04', '436');
INSERT INTO `e_r_sys_region` VALUES ('710413', '710400', '沙鹿', '沙鹿区', '中国,台湾,台中市,沙鹿区', '3', 'Shalu', '04', '433');
INSERT INTO `e_r_sys_region` VALUES ('710414', '710400', '梧栖', '梧栖区', '中国,台湾,台中市,梧栖区', '3', 'Wuqi', '04', '435');
INSERT INTO `e_r_sys_region` VALUES ('710415', '710400', '后里', '后里区', '中国,台湾,台中市,后里区', '3', 'Houli', '04', '421');
INSERT INTO `e_r_sys_region` VALUES ('710416', '710400', '神冈', '神冈区', '中国,台湾,台中市,神冈区', '3', 'Shengang', '04', '429');
INSERT INTO `e_r_sys_region` VALUES ('710417', '710400', '潭子', '潭子区', '中国,台湾,台中市,潭子区', '3', 'Tanzi', '04', '427');
INSERT INTO `e_r_sys_region` VALUES ('710418', '710400', '大雅', '大雅区', '中国,台湾,台中市,大雅区', '3', 'Daya', '04', '428');
INSERT INTO `e_r_sys_region` VALUES ('710419', '710400', '新社', '新社区', '中国,台湾,台中市,新社区', '3', 'Xinshe', '04', '426');
INSERT INTO `e_r_sys_region` VALUES ('710420', '710400', '石冈', '石冈区', '中国,台湾,台中市,石冈区', '3', 'Shigang', '04', '422');
INSERT INTO `e_r_sys_region` VALUES ('710421', '710400', '外埔', '外埔区', '中国,台湾,台中市,外埔区', '3', 'Waipu', '04', '438');
INSERT INTO `e_r_sys_region` VALUES ('710422', '710400', '大安', '大安区', '中国,台湾,台中市,大安区', '3', 'Da\'an', '04', '439');
INSERT INTO `e_r_sys_region` VALUES ('710423', '710400', '乌日', '乌日区', '中国,台湾,台中市,乌日区', '3', 'Wuri', '04', '414');
INSERT INTO `e_r_sys_region` VALUES ('710424', '710400', '大肚', '大肚区', '中国,台湾,台中市,大肚区', '3', 'Dadu', '04', '432');
INSERT INTO `e_r_sys_region` VALUES ('710425', '710400', '龙井', '龙井区', '中国,台湾,台中市,龙井区', '3', 'Longjing', '04', '434');
INSERT INTO `e_r_sys_region` VALUES ('710426', '710400', '雾峰', '雾峰区', '中国,台湾,台中市,雾峰区', '3', 'Wufeng', '04', '413');
INSERT INTO `e_r_sys_region` VALUES ('710427', '710400', '太平', '太平区', '中国,台湾,台中市,太平区', '3', 'Taiping', '04', '411');
INSERT INTO `e_r_sys_region` VALUES ('710428', '710400', '大里', '大里区', '中国,台湾,台中市,大里区', '3', 'Dali', '04', '412');
INSERT INTO `e_r_sys_region` VALUES ('710429', '710400', '和平', '和平区', '中国,台湾,台中市,和平区', '3', 'Heping', '04', '424');
INSERT INTO `e_r_sys_region` VALUES ('710500', '710000', '台南', '台南市', '中国,台湾,台南市', '2', 'Tainan', '06', '7');
INSERT INTO `e_r_sys_region` VALUES ('710501', '710500', '东区', '东区', '中国,台湾,台南市,东区', '3', 'Dongqu', '06', '701');
INSERT INTO `e_r_sys_region` VALUES ('710502', '710500', '南区', '南区', '中国,台湾,台南市,南区', '3', 'Nanqu', '06', '702');
INSERT INTO `e_r_sys_region` VALUES ('710504', '710500', '北区', '北区', '中国,台湾,台南市,北区', '3', 'Beiqu', '06', '704');
INSERT INTO `e_r_sys_region` VALUES ('710506', '710500', '安南', '安南区', '中国,台湾,台南市,安南区', '3', 'Annan', '06', '709');
INSERT INTO `e_r_sys_region` VALUES ('710507', '710500', '安平', '安平区', '中国,台湾,台南市,安平区', '3', 'Anping', '06', '708');
INSERT INTO `e_r_sys_region` VALUES ('710508', '710500', '中西', '中西区', '中国,台湾,台南市,中西区', '3', 'Zhongxi', '06', '700');
INSERT INTO `e_r_sys_region` VALUES ('710509', '710500', '新营', '新营区', '中国,台湾,台南市,新营区', '3', 'Xinying', '06', '730');
INSERT INTO `e_r_sys_region` VALUES ('710510', '710500', '盐水', '盐水区', '中国,台湾,台南市,盐水区', '3', 'Yanshui', '06', '737');
INSERT INTO `e_r_sys_region` VALUES ('710511', '710500', '白河', '白河区', '中国,台湾,台南市,白河区', '3', 'Baihe', '06', '732');
INSERT INTO `e_r_sys_region` VALUES ('710512', '710500', '柳营', '柳营区', '中国,台湾,台南市,柳营区', '3', 'Liuying', '06', '736');
INSERT INTO `e_r_sys_region` VALUES ('710513', '710500', '后壁', '后壁区', '中国,台湾,台南市,后壁区', '3', 'Houbi', '06', '731');
INSERT INTO `e_r_sys_region` VALUES ('710514', '710500', '东山', '东山区', '中国,台湾,台南市,东山区', '3', 'Dongshan', '06', '733');
INSERT INTO `e_r_sys_region` VALUES ('710515', '710500', '麻豆', '麻豆区', '中国,台湾,台南市,麻豆区', '3', 'Madou', '06', '721');
INSERT INTO `e_r_sys_region` VALUES ('710516', '710500', '下营', '下营区', '中国,台湾,台南市,下营区', '3', 'Xiaying', '06', '735');
INSERT INTO `e_r_sys_region` VALUES ('710517', '710500', '六甲', '六甲区', '中国,台湾,台南市,六甲区', '3', 'Liujia', '06', '734');
INSERT INTO `e_r_sys_region` VALUES ('710518', '710500', '官田', '官田区', '中国,台湾,台南市,官田区', '3', 'Guantian', '06', '720');
INSERT INTO `e_r_sys_region` VALUES ('710519', '710500', '大内', '大内区', '中国,台湾,台南市,大内区', '3', 'Dana', '06', '742');
INSERT INTO `e_r_sys_region` VALUES ('710520', '710500', '佳里', '佳里区', '中国,台湾,台南市,佳里区', '3', 'Jiali', '06', '722');
INSERT INTO `e_r_sys_region` VALUES ('710521', '710500', '学甲', '学甲区', '中国,台湾,台南市,学甲区', '3', 'Xuejia', '06', '726');
INSERT INTO `e_r_sys_region` VALUES ('710522', '710500', '西港', '西港区', '中国,台湾,台南市,西港区', '3', 'Xigang', '06', '723');
INSERT INTO `e_r_sys_region` VALUES ('710523', '710500', '七股', '七股区', '中国,台湾,台南市,七股区', '3', 'Qigu', '06', '724');
INSERT INTO `e_r_sys_region` VALUES ('710524', '710500', '将军', '将军区', '中国,台湾,台南市,将军区', '3', 'Jiangjun', '06', '725');
INSERT INTO `e_r_sys_region` VALUES ('710525', '710500', '北门', '北门区', '中国,台湾,台南市,北门区', '3', 'Beimen', '06', '727');
INSERT INTO `e_r_sys_region` VALUES ('710526', '710500', '新化', '新化区', '中国,台湾,台南市,新化区', '3', 'Xinhua', '06', '712');
INSERT INTO `e_r_sys_region` VALUES ('710527', '710500', '善化', '善化区', '中国,台湾,台南市,善化区', '3', 'Shanhua', '06', '741');
INSERT INTO `e_r_sys_region` VALUES ('710528', '710500', '新市', '新市区', '中国,台湾,台南市,新市区', '3', 'Xinshi', '06', '744');
INSERT INTO `e_r_sys_region` VALUES ('710529', '710500', '安定', '安定区', '中国,台湾,台南市,安定区', '3', 'Anding', '06', '745');
INSERT INTO `e_r_sys_region` VALUES ('710530', '710500', '山上', '山上区', '中国,台湾,台南市,山上区', '3', 'Shanshang', '06', '743');
INSERT INTO `e_r_sys_region` VALUES ('710531', '710500', '玉井', '玉井区', '中国,台湾,台南市,玉井区', '3', 'Yujing', '06', '714');
INSERT INTO `e_r_sys_region` VALUES ('710532', '710500', '楠西', '楠西区', '中国,台湾,台南市,楠西区', '3', 'Nanxi', '06', '715');
INSERT INTO `e_r_sys_region` VALUES ('710533', '710500', '南化', '南化区', '中国,台湾,台南市,南化区', '3', 'Nanhua', '06', '716');
INSERT INTO `e_r_sys_region` VALUES ('710534', '710500', '左镇', '左镇区', '中国,台湾,台南市,左镇区', '3', 'Zuozhen', '06', '713');
INSERT INTO `e_r_sys_region` VALUES ('710535', '710500', '仁德', '仁德区', '中国,台湾,台南市,仁德区', '3', 'Rende', '06', '717');
INSERT INTO `e_r_sys_region` VALUES ('710536', '710500', '归仁', '归仁区', '中国,台湾,台南市,归仁区', '3', 'Guiren', '06', '711');
INSERT INTO `e_r_sys_region` VALUES ('710537', '710500', '关庙', '关庙区', '中国,台湾,台南市,关庙区', '3', 'Guanmiao', '06', '718');
INSERT INTO `e_r_sys_region` VALUES ('710538', '710500', '龙崎', '龙崎区', '中国,台湾,台南市,龙崎区', '3', 'Longqi', '06', '719');
INSERT INTO `e_r_sys_region` VALUES ('710539', '710500', '永康', '永康区', '中国,台湾,台南市,永康区', '3', 'Yongkang', '06', '710');
INSERT INTO `e_r_sys_region` VALUES ('710600', '710000', '新竹', '新竹市', '中国,台湾,新竹市', '2', 'Hsinchu', '03', '3');
INSERT INTO `e_r_sys_region` VALUES ('710601', '710600', '东区', '东区', '中国,台湾,新竹市,东区', '3', 'Dongqu', '03', '300');
INSERT INTO `e_r_sys_region` VALUES ('710602', '710600', '北区', '北区', '中国,台湾,新竹市,北区', '3', 'Beiqu', '03', '');
INSERT INTO `e_r_sys_region` VALUES ('710603', '710600', '香山', '香山区', '中国,台湾,新竹市,香山区', '3', 'Xiangshan', '03', '');
INSERT INTO `e_r_sys_region` VALUES ('710700', '710000', '嘉义', '嘉义市', '中国,台湾,嘉义市', '2', 'Chiayi', '05', '6');
INSERT INTO `e_r_sys_region` VALUES ('710701', '710700', '东区', '东区', '中国,台湾,嘉义市,东区', '3', 'Dongqu', '05', '600');
INSERT INTO `e_r_sys_region` VALUES ('710702', '710700', '西区', '西区', '中国,台湾,嘉义市,西区', '3', 'Xiqu', '05', '600');
INSERT INTO `e_r_sys_region` VALUES ('710800', '710000', '新北', '新北市', '中国,台湾,新北市', '2', 'New Taipei', '02', '2');
INSERT INTO `e_r_sys_region` VALUES ('710801', '710800', '板桥', '板桥区', '中国,台湾,新北市,板桥区', '3', 'Banqiao', '02', '220');
INSERT INTO `e_r_sys_region` VALUES ('710802', '710800', '三重', '三重区', '中国,台湾,新北市,三重区', '3', 'Sanzhong', '02', '241');
INSERT INTO `e_r_sys_region` VALUES ('710803', '710800', '中和', '中和区', '中国,台湾,新北市,中和区', '3', 'Zhonghe', '02', '235');
INSERT INTO `e_r_sys_region` VALUES ('710804', '710800', '永和', '永和区', '中国,台湾,新北市,永和区', '3', 'Yonghe', '02', '234');
INSERT INTO `e_r_sys_region` VALUES ('710805', '710800', '新庄', '新庄区', '中国,台湾,新北市,新庄区', '3', 'Xinzhuang', '02', '242');
INSERT INTO `e_r_sys_region` VALUES ('710806', '710800', '新店', '新店区', '中国,台湾,新北市,新店区', '3', 'Xindian', '02', '231');
INSERT INTO `e_r_sys_region` VALUES ('710807', '710800', '树林', '树林区', '中国,台湾,新北市,树林区', '3', 'Shulin', '02', '238');
INSERT INTO `e_r_sys_region` VALUES ('710808', '710800', '莺歌', '莺歌区', '中国,台湾,新北市,莺歌区', '3', 'Yingge', '02', '239');
INSERT INTO `e_r_sys_region` VALUES ('710809', '710800', '三峡', '三峡区', '中国,台湾,新北市,三峡区', '3', 'Sanxia', '02', '237');
INSERT INTO `e_r_sys_region` VALUES ('710810', '710800', '淡水', '淡水区', '中国,台湾,新北市,淡水区', '3', 'Danshui', '02', '251');
INSERT INTO `e_r_sys_region` VALUES ('710811', '710800', '汐止', '汐止区', '中国,台湾,新北市,汐止区', '3', 'Xizhi', '02', '221');
INSERT INTO `e_r_sys_region` VALUES ('710812', '710800', '瑞芳', '瑞芳区', '中国,台湾,新北市,瑞芳区', '3', 'Ruifang', '02', '224');
INSERT INTO `e_r_sys_region` VALUES ('710813', '710800', '土城', '土城区', '中国,台湾,新北市,土城区', '3', 'Tucheng', '02', '236');
INSERT INTO `e_r_sys_region` VALUES ('710814', '710800', '芦洲', '芦洲区', '中国,台湾,新北市,芦洲区', '3', 'Luzhou', '02', '247');
INSERT INTO `e_r_sys_region` VALUES ('710815', '710800', '五股', '五股区', '中国,台湾,新北市,五股区', '3', 'Wugu', '02', '248');
INSERT INTO `e_r_sys_region` VALUES ('710816', '710800', '泰山', '泰山区', '中国,台湾,新北市,泰山区', '3', 'Taishan', '02', '243');
INSERT INTO `e_r_sys_region` VALUES ('710817', '710800', '林口', '林口区', '中国,台湾,新北市,林口区', '3', 'Linkou', '02', '244');
INSERT INTO `e_r_sys_region` VALUES ('710818', '710800', '深坑', '深坑区', '中国,台湾,新北市,深坑区', '3', 'Shenkeng', '02', '222');
INSERT INTO `e_r_sys_region` VALUES ('710819', '710800', '石碇', '石碇区', '中国,台湾,新北市,石碇区', '3', 'Shiding', '02', '223');
INSERT INTO `e_r_sys_region` VALUES ('710820', '710800', '坪林', '坪林区', '中国,台湾,新北市,坪林区', '3', 'Pinglin', '02', '232');
INSERT INTO `e_r_sys_region` VALUES ('710821', '710800', '三芝', '三芝区', '中国,台湾,新北市,三芝区', '3', 'Sanzhi', '02', '252');
INSERT INTO `e_r_sys_region` VALUES ('710822', '710800', '石门', '石门区', '中国,台湾,新北市,石门区', '3', 'Shimen', '02', '253');
INSERT INTO `e_r_sys_region` VALUES ('710823', '710800', '八里', '八里区', '中国,台湾,新北市,八里区', '3', 'Bali', '02', '249');
INSERT INTO `e_r_sys_region` VALUES ('710824', '710800', '平溪', '平溪区', '中国,台湾,新北市,平溪区', '3', 'Pingxi', '02', '226');
INSERT INTO `e_r_sys_region` VALUES ('710825', '710800', '双溪', '双溪区', '中国,台湾,新北市,双溪区', '3', 'Shuangxi', '02', '227');
INSERT INTO `e_r_sys_region` VALUES ('710826', '710800', '贡寮', '贡寮区', '中国,台湾,新北市,贡寮区', '3', 'Gongliao', '02', '228');
INSERT INTO `e_r_sys_region` VALUES ('710827', '710800', '金山', '金山区', '中国,台湾,新北市,金山区', '3', 'Jinshan', '02', '208');
INSERT INTO `e_r_sys_region` VALUES ('710828', '710800', '万里', '万里区', '中国,台湾,新北市,万里区', '3', 'Wanli', '02', '207');
INSERT INTO `e_r_sys_region` VALUES ('710829', '710800', '乌来', '乌来区', '中国,台湾,新北市,乌来区', '3', 'Wulai', '02', '233');
INSERT INTO `e_r_sys_region` VALUES ('712200', '710000', '宜兰', '宜兰县', '中国,台湾,宜兰县', '2', 'Yilan', '03', '2');
INSERT INTO `e_r_sys_region` VALUES ('712201', '712200', '宜兰', '宜兰市', '中国,台湾,宜兰县,宜兰市', '3', 'Yilan', '03', '260');
INSERT INTO `e_r_sys_region` VALUES ('712221', '712200', '罗东', '罗东镇', '中国,台湾,宜兰县,罗东镇', '3', 'Luodong', '03', '265');
INSERT INTO `e_r_sys_region` VALUES ('712222', '712200', '苏澳', '苏澳镇', '中国,台湾,宜兰县,苏澳镇', '3', 'Suao', '03', '270');
INSERT INTO `e_r_sys_region` VALUES ('712223', '712200', '头城', '头城镇', '中国,台湾,宜兰县,头城镇', '3', 'Toucheng', '03', '261');
INSERT INTO `e_r_sys_region` VALUES ('712224', '712200', '礁溪', '礁溪乡', '中国,台湾,宜兰县,礁溪乡', '3', 'Jiaoxi', '03', '262');
INSERT INTO `e_r_sys_region` VALUES ('712225', '712200', '壮围', '壮围乡', '中国,台湾,宜兰县,壮围乡', '3', 'Zhuangwei', '03', '263');
INSERT INTO `e_r_sys_region` VALUES ('712226', '712200', '员山', '员山乡', '中国,台湾,宜兰县,员山乡', '3', 'Yuanshan', '03', '264');
INSERT INTO `e_r_sys_region` VALUES ('712227', '712200', '冬山', '冬山乡', '中国,台湾,宜兰县,冬山乡', '3', 'Dongshan', '03', '269');
INSERT INTO `e_r_sys_region` VALUES ('712228', '712200', '五结', '五结乡', '中国,台湾,宜兰县,五结乡', '3', 'Wujie', '03', '268');
INSERT INTO `e_r_sys_region` VALUES ('712229', '712200', '三星', '三星乡', '中国,台湾,宜兰县,三星乡', '3', 'Sanxing', '03', '266');
INSERT INTO `e_r_sys_region` VALUES ('712230', '712200', '大同', '大同乡', '中国,台湾,宜兰县,大同乡', '3', 'Datong', '03', '267');
INSERT INTO `e_r_sys_region` VALUES ('712231', '712200', '南澳', '南澳乡', '中国,台湾,宜兰县,南澳乡', '3', 'Nanao', '03', '272');
INSERT INTO `e_r_sys_region` VALUES ('712300', '710000', '桃园', '桃园县', '中国,台湾,桃园县', '2', 'Taoyuan', '03', '3');
INSERT INTO `e_r_sys_region` VALUES ('712301', '712300', '桃园', '桃园市', '中国,台湾,桃园县,桃园市', '3', 'Taoyuan', '03', '330');
INSERT INTO `e_r_sys_region` VALUES ('712302', '712300', '中坜', '中坜市', '中国,台湾,桃园县,中坜市', '3', 'Zhongli', '03', '320');
INSERT INTO `e_r_sys_region` VALUES ('712303', '712300', '平镇', '平镇市', '中国,台湾,桃园县,平镇市', '3', 'Pingzhen', '03', '324');
INSERT INTO `e_r_sys_region` VALUES ('712304', '712300', '八德', '八德市', '中国,台湾,桃园县,八德市', '3', 'Bade', '03', '334');
INSERT INTO `e_r_sys_region` VALUES ('712305', '712300', '杨梅', '杨梅市', '中国,台湾,桃园县,杨梅市', '3', 'Yangmei', '03', '326');
INSERT INTO `e_r_sys_region` VALUES ('712306', '712300', '芦竹', '芦竹市', '中国,台湾,桃园县,芦竹市', '3', 'Luzhu', '03', '338');
INSERT INTO `e_r_sys_region` VALUES ('712321', '712300', '大溪', '大溪镇', '中国,台湾,桃园县,大溪镇', '3', 'Daxi', '03', '335');
INSERT INTO `e_r_sys_region` VALUES ('712324', '712300', '大园', '大园乡', '中国,台湾,桃园县,大园乡', '3', 'Dayuan', '03', '337');
INSERT INTO `e_r_sys_region` VALUES ('712325', '712300', '龟山', '龟山乡', '中国,台湾,桃园县,龟山乡', '3', 'Guishan', '03', '333');
INSERT INTO `e_r_sys_region` VALUES ('712327', '712300', '龙潭', '龙潭乡', '中国,台湾,桃园县,龙潭乡', '3', 'Longtan', '03', '325');
INSERT INTO `e_r_sys_region` VALUES ('712329', '712300', '新屋', '新屋乡', '中国,台湾,桃园县,新屋乡', '3', 'Xinwu', '03', '327');
INSERT INTO `e_r_sys_region` VALUES ('712330', '712300', '观音', '观音乡', '中国,台湾,桃园县,观音乡', '3', 'Guanyin', '03', '328');
INSERT INTO `e_r_sys_region` VALUES ('712331', '712300', '复兴', '复兴乡', '中国,台湾,桃园县,复兴乡', '3', 'Fuxing', '03', '336');
INSERT INTO `e_r_sys_region` VALUES ('712400', '710000', '新竹', '新竹县', '中国,台湾,新竹县', '2', 'Hsinchu', '03', '3');
INSERT INTO `e_r_sys_region` VALUES ('712401', '712400', '竹北', '竹北市', '中国,台湾,新竹县,竹北市', '3', 'Zhubei', '03', '302');
INSERT INTO `e_r_sys_region` VALUES ('712421', '712400', '竹东', '竹东镇', '中国,台湾,新竹县,竹东镇', '3', 'Zhudong', '03', '310');
INSERT INTO `e_r_sys_region` VALUES ('712422', '712400', '新埔', '新埔镇', '中国,台湾,新竹县,新埔镇', '3', 'Xinpu', '03', '305');
INSERT INTO `e_r_sys_region` VALUES ('712423', '712400', '关西', '关西镇', '中国,台湾,新竹县,关西镇', '3', 'Guanxi', '03', '306');
INSERT INTO `e_r_sys_region` VALUES ('712424', '712400', '湖口', '湖口乡', '中国,台湾,新竹县,湖口乡', '3', 'Hukou', '03', '303');
INSERT INTO `e_r_sys_region` VALUES ('712425', '712400', '新丰', '新丰乡', '中国,台湾,新竹县,新丰乡', '3', 'Xinfeng', '03', '304');
INSERT INTO `e_r_sys_region` VALUES ('712426', '712400', '芎林', '芎林乡', '中国,台湾,新竹县,芎林乡', '3', 'Xionglin', '03', '307');
INSERT INTO `e_r_sys_region` VALUES ('712427', '712400', '横山', '横山乡', '中国,台湾,新竹县,横山乡', '3', 'Hengshan', '03', '312');
INSERT INTO `e_r_sys_region` VALUES ('712428', '712400', '北埔', '北埔乡', '中国,台湾,新竹县,北埔乡', '3', 'Beipu', '03', '314');
INSERT INTO `e_r_sys_region` VALUES ('712429', '712400', '宝山', '宝山乡', '中国,台湾,新竹县,宝山乡', '3', 'Baoshan', '03', '308');
INSERT INTO `e_r_sys_region` VALUES ('712430', '712400', '峨眉', '峨眉乡', '中国,台湾,新竹县,峨眉乡', '3', 'Emei', '03', '315');
INSERT INTO `e_r_sys_region` VALUES ('712431', '712400', '尖石', '尖石乡', '中国,台湾,新竹县,尖石乡', '3', 'Jianshi', '03', '313');
INSERT INTO `e_r_sys_region` VALUES ('712432', '712400', '五峰', '五峰乡', '中国,台湾,新竹县,五峰乡', '3', 'Wufeng', '03', '311');
INSERT INTO `e_r_sys_region` VALUES ('712500', '710000', '苗栗', '苗栗县', '中国,台湾,苗栗县', '2', 'Miaoli', '037', '3');
INSERT INTO `e_r_sys_region` VALUES ('712501', '712500', '苗栗', '苗栗市', '中国,台湾,苗栗县,苗栗市', '3', 'Miaoli', '037', '360');
INSERT INTO `e_r_sys_region` VALUES ('712521', '712500', '苑里', '苑里镇', '中国,台湾,苗栗县,苑里镇', '3', 'Yuanli', '037', '358');
INSERT INTO `e_r_sys_region` VALUES ('712522', '712500', '通霄', '通霄镇', '中国,台湾,苗栗县,通霄镇', '3', 'Tongxiao', '037', '357');
INSERT INTO `e_r_sys_region` VALUES ('712523', '712500', '竹南', '竹南镇', '中国,台湾,苗栗县,竹南镇', '3', 'Zhunan', '037', '350');
INSERT INTO `e_r_sys_region` VALUES ('712524', '712500', '头份', '头份镇', '中国,台湾,苗栗县,头份镇', '3', 'Toufen', '037', '351');
INSERT INTO `e_r_sys_region` VALUES ('712525', '712500', '后龙', '后龙镇', '中国,台湾,苗栗县,后龙镇', '3', 'Houlong', '037', '356');
INSERT INTO `e_r_sys_region` VALUES ('712526', '712500', '卓兰', '卓兰镇', '中国,台湾,苗栗县,卓兰镇', '3', 'Zhuolan', '037', '369');
INSERT INTO `e_r_sys_region` VALUES ('712527', '712500', '大湖', '大湖乡', '中国,台湾,苗栗县,大湖乡', '3', 'Dahu', '037', '364');
INSERT INTO `e_r_sys_region` VALUES ('712528', '712500', '公馆', '公馆乡', '中国,台湾,苗栗县,公馆乡', '3', 'Gongguan', '037', '363');
INSERT INTO `e_r_sys_region` VALUES ('712529', '712500', '铜锣', '铜锣乡', '中国,台湾,苗栗县,铜锣乡', '3', 'Tongluo', '037', '366');
INSERT INTO `e_r_sys_region` VALUES ('712530', '712500', '南庄', '南庄乡', '中国,台湾,苗栗县,南庄乡', '3', 'Nanzhuang', '037', '353');
INSERT INTO `e_r_sys_region` VALUES ('712531', '712500', '头屋', '头屋乡', '中国,台湾,苗栗县,头屋乡', '3', 'Touwu', '037', '362');
INSERT INTO `e_r_sys_region` VALUES ('712532', '712500', '三义', '三义乡', '中国,台湾,苗栗县,三义乡', '3', 'Sanyi', '037', '367');
INSERT INTO `e_r_sys_region` VALUES ('712533', '712500', '西湖', '西湖乡', '中国,台湾,苗栗县,西湖乡', '3', 'Xihu', '037', '368');
INSERT INTO `e_r_sys_region` VALUES ('712534', '712500', '造桥', '造桥乡', '中国,台湾,苗栗县,造桥乡', '3', 'Zaoqiao', '037', '361');
INSERT INTO `e_r_sys_region` VALUES ('712535', '712500', '三湾', '三湾乡', '中国,台湾,苗栗县,三湾乡', '3', 'Sanwan', '037', '352');
INSERT INTO `e_r_sys_region` VALUES ('712536', '712500', '狮潭', '狮潭乡', '中国,台湾,苗栗县,狮潭乡', '3', 'Shitan', '037', '354');
INSERT INTO `e_r_sys_region` VALUES ('712537', '712500', '泰安', '泰安乡', '中国,台湾,苗栗县,泰安乡', '3', 'Tai\'an', '037', '365');
INSERT INTO `e_r_sys_region` VALUES ('712700', '710000', '彰化', '彰化县', '中国,台湾,彰化县', '2', 'Changhua', '04', '5');
INSERT INTO `e_r_sys_region` VALUES ('712701', '712700', '彰化市', '彰化市', '中国,台湾,彰化县,彰化市', '3', 'Zhanghuashi', '04', '500');
INSERT INTO `e_r_sys_region` VALUES ('712721', '712700', '鹿港', '鹿港镇', '中国,台湾,彰化县,鹿港镇', '3', 'Lugang', '04', '505');
INSERT INTO `e_r_sys_region` VALUES ('712722', '712700', '和美', '和美镇', '中国,台湾,彰化县,和美镇', '3', 'Hemei', '04', '508');
INSERT INTO `e_r_sys_region` VALUES ('712723', '712700', '线西', '线西乡', '中国,台湾,彰化县,线西乡', '3', 'Xianxi', '04', '507');
INSERT INTO `e_r_sys_region` VALUES ('712724', '712700', '伸港', '伸港乡', '中国,台湾,彰化县,伸港乡', '3', 'Shengang', '04', '509');
INSERT INTO `e_r_sys_region` VALUES ('712725', '712700', '福兴', '福兴乡', '中国,台湾,彰化县,福兴乡', '3', 'Fuxing', '04', '506');
INSERT INTO `e_r_sys_region` VALUES ('712726', '712700', '秀水', '秀水乡', '中国,台湾,彰化县,秀水乡', '3', 'Xiushui', '04', '504');
INSERT INTO `e_r_sys_region` VALUES ('712727', '712700', '花坛', '花坛乡', '中国,台湾,彰化县,花坛乡', '3', 'Huatan', '04', '503');
INSERT INTO `e_r_sys_region` VALUES ('712728', '712700', '芬园', '芬园乡', '中国,台湾,彰化县,芬园乡', '3', 'Fenyuan', '04', '502');
INSERT INTO `e_r_sys_region` VALUES ('712729', '712700', '员林', '员林镇', '中国,台湾,彰化县,员林镇', '3', 'Yuanlin', '04', '510');
INSERT INTO `e_r_sys_region` VALUES ('712730', '712700', '溪湖', '溪湖镇', '中国,台湾,彰化县,溪湖镇', '3', 'Xihu', '04', '514');
INSERT INTO `e_r_sys_region` VALUES ('712731', '712700', '田中', '田中镇', '中国,台湾,彰化县,田中镇', '3', 'Tianzhong', '04', '520');
INSERT INTO `e_r_sys_region` VALUES ('712732', '712700', '大村', '大村乡', '中国,台湾,彰化县,大村乡', '3', 'Dacun', '04', '515');
INSERT INTO `e_r_sys_region` VALUES ('712733', '712700', '埔盐', '埔盐乡', '中国,台湾,彰化县,埔盐乡', '3', 'Puyan', '04', '516');
INSERT INTO `e_r_sys_region` VALUES ('712734', '712700', '埔心', '埔心乡', '中国,台湾,彰化县,埔心乡', '3', 'Puxin', '04', '513');
INSERT INTO `e_r_sys_region` VALUES ('712735', '712700', '永靖', '永靖乡', '中国,台湾,彰化县,永靖乡', '3', 'Yongjing', '04', '512');
INSERT INTO `e_r_sys_region` VALUES ('712736', '712700', '社头', '社头乡', '中国,台湾,彰化县,社头乡', '3', 'Shetou', '04', '511');
INSERT INTO `e_r_sys_region` VALUES ('712737', '712700', '二水', '二水乡', '中国,台湾,彰化县,二水乡', '3', 'Ershui', '04', '530');
INSERT INTO `e_r_sys_region` VALUES ('712738', '712700', '北斗', '北斗镇', '中国,台湾,彰化县,北斗镇', '3', 'Beidou', '04', '521');
INSERT INTO `e_r_sys_region` VALUES ('712739', '712700', '二林', '二林镇', '中国,台湾,彰化县,二林镇', '3', 'Erlin', '04', '526');
INSERT INTO `e_r_sys_region` VALUES ('712740', '712700', '田尾', '田尾乡', '中国,台湾,彰化县,田尾乡', '3', 'Tianwei', '04', '522');
INSERT INTO `e_r_sys_region` VALUES ('712741', '712700', '埤头', '埤头乡', '中国,台湾,彰化县,埤头乡', '3', 'Pitou', '04', '523');
INSERT INTO `e_r_sys_region` VALUES ('712742', '712700', '芳苑', '芳苑乡', '中国,台湾,彰化县,芳苑乡', '3', 'Fangyuan', '04', '528');
INSERT INTO `e_r_sys_region` VALUES ('712743', '712700', '大城', '大城乡', '中国,台湾,彰化县,大城乡', '3', 'Dacheng', '04', '527');
INSERT INTO `e_r_sys_region` VALUES ('712744', '712700', '竹塘', '竹塘乡', '中国,台湾,彰化县,竹塘乡', '3', 'Zhutang', '04', '525');
INSERT INTO `e_r_sys_region` VALUES ('712745', '712700', '溪州', '溪州乡', '中国,台湾,彰化县,溪州乡', '3', 'Xizhou', '04', '524');
INSERT INTO `e_r_sys_region` VALUES ('712800', '710000', '南投', '南投县', '中国,台湾,南投县', '2', 'Nantou', '049', '5');
INSERT INTO `e_r_sys_region` VALUES ('712801', '712800', '南投市', '南投市', '中国,台湾,南投县,南投市', '3', 'Nantoushi', '049', '540');
INSERT INTO `e_r_sys_region` VALUES ('712821', '712800', '埔里', '埔里镇', '中国,台湾,南投县,埔里镇', '3', 'Puli', '049', '545');
INSERT INTO `e_r_sys_region` VALUES ('712822', '712800', '草屯', '草屯镇', '中国,台湾,南投县,草屯镇', '3', 'Caotun', '049', '542');
INSERT INTO `e_r_sys_region` VALUES ('712823', '712800', '竹山', '竹山镇', '中国,台湾,南投县,竹山镇', '3', 'Zhushan', '049', '557');
INSERT INTO `e_r_sys_region` VALUES ('712824', '712800', '集集', '集集镇', '中国,台湾,南投县,集集镇', '3', 'Jiji', '049', '552');
INSERT INTO `e_r_sys_region` VALUES ('712825', '712800', '名间', '名间乡', '中国,台湾,南投县,名间乡', '3', 'Mingjian', '049', '551');
INSERT INTO `e_r_sys_region` VALUES ('712826', '712800', '鹿谷', '鹿谷乡', '中国,台湾,南投县,鹿谷乡', '3', 'Lugu', '049', '558');
INSERT INTO `e_r_sys_region` VALUES ('712827', '712800', '中寮', '中寮乡', '中国,台湾,南投县,中寮乡', '3', 'Zhongliao', '049', '541');
INSERT INTO `e_r_sys_region` VALUES ('712828', '712800', '鱼池', '鱼池乡', '中国,台湾,南投县,鱼池乡', '3', 'Yuchi', '049', '555');
INSERT INTO `e_r_sys_region` VALUES ('712829', '712800', '国姓', '国姓乡', '中国,台湾,南投县,国姓乡', '3', 'Guoxing', '049', '544');
INSERT INTO `e_r_sys_region` VALUES ('712830', '712800', '水里', '水里乡', '中国,台湾,南投县,水里乡', '3', 'Shuili', '049', '553');
INSERT INTO `e_r_sys_region` VALUES ('712831', '712800', '信义', '信义乡', '中国,台湾,南投县,信义乡', '3', 'Xinyi', '049', '556');
INSERT INTO `e_r_sys_region` VALUES ('712832', '712800', '仁爱', '仁爱乡', '中国,台湾,南投县,仁爱乡', '3', 'Renai', '049', '546');
INSERT INTO `e_r_sys_region` VALUES ('712900', '710000', '云林', '云林县', '中国,台湾,云林县', '2', 'Yunlin', '05', '6');
INSERT INTO `e_r_sys_region` VALUES ('712901', '712900', '斗六', '斗六市', '中国,台湾,云林县,斗六市', '3', 'Douliu', '05', '640');
INSERT INTO `e_r_sys_region` VALUES ('712921', '712900', '斗南', '斗南镇', '中国,台湾,云林县,斗南镇', '3', 'Dounan', '05', '630');
INSERT INTO `e_r_sys_region` VALUES ('712922', '712900', '虎尾', '虎尾镇', '中国,台湾,云林县,虎尾镇', '3', 'Huwei', '05', '632');
INSERT INTO `e_r_sys_region` VALUES ('712923', '712900', '西螺', '西螺镇', '中国,台湾,云林县,西螺镇', '3', 'Xiluo', '05', '648');
INSERT INTO `e_r_sys_region` VALUES ('712924', '712900', '土库', '土库镇', '中国,台湾,云林县,土库镇', '3', 'Tuku', '05', '633');
INSERT INTO `e_r_sys_region` VALUES ('712925', '712900', '北港', '北港镇', '中国,台湾,云林县,北港镇', '3', 'Beigang', '05', '651');
INSERT INTO `e_r_sys_region` VALUES ('712926', '712900', '古坑', '古坑乡', '中国,台湾,云林县,古坑乡', '3', 'Gukeng', '05', '646');
INSERT INTO `e_r_sys_region` VALUES ('712927', '712900', '大埤', '大埤乡', '中国,台湾,云林县,大埤乡', '3', 'Dapi', '05', '631');
INSERT INTO `e_r_sys_region` VALUES ('712928', '712900', '莿桐', '莿桐乡', '中国,台湾,云林县,莿桐乡', '3', 'Citong', '05', '647');
INSERT INTO `e_r_sys_region` VALUES ('712929', '712900', '林内', '林内乡', '中国,台湾,云林县,林内乡', '3', 'Linna', '05', '643');
INSERT INTO `e_r_sys_region` VALUES ('712930', '712900', '二仑', '二仑乡', '中国,台湾,云林县,二仑乡', '3', 'Erlun', '05', '649');
INSERT INTO `e_r_sys_region` VALUES ('712931', '712900', '仑背', '仑背乡', '中国,台湾,云林县,仑背乡', '3', 'Lunbei', '05', '637');
INSERT INTO `e_r_sys_region` VALUES ('712932', '712900', '麦寮', '麦寮乡', '中国,台湾,云林县,麦寮乡', '3', 'Mailiao', '05', '638');
INSERT INTO `e_r_sys_region` VALUES ('712933', '712900', '东势', '东势乡', '中国,台湾,云林县,东势乡', '3', 'Dongshi', '05', '635');
INSERT INTO `e_r_sys_region` VALUES ('712934', '712900', '褒忠', '褒忠乡', '中国,台湾,云林县,褒忠乡', '3', 'Baozhong', '05', '634');
INSERT INTO `e_r_sys_region` VALUES ('712935', '712900', '台西', '台西乡', '中国,台湾,云林县,台西乡', '3', 'Taixi', '05', '636');
INSERT INTO `e_r_sys_region` VALUES ('712936', '712900', '元长', '元长乡', '中国,台湾,云林县,元长乡', '3', 'Yuanchang', '05', '655');
INSERT INTO `e_r_sys_region` VALUES ('712937', '712900', '四湖', '四湖乡', '中国,台湾,云林县,四湖乡', '3', 'Sihu', '05', '654');
INSERT INTO `e_r_sys_region` VALUES ('712938', '712900', '口湖', '口湖乡', '中国,台湾,云林县,口湖乡', '3', 'Kouhu', '05', '653');
INSERT INTO `e_r_sys_region` VALUES ('712939', '712900', '水林', '水林乡', '中国,台湾,云林县,水林乡', '3', 'Shuilin', '05', '652');
INSERT INTO `e_r_sys_region` VALUES ('713000', '710000', '嘉义', '嘉义县', '中国,台湾,嘉义县', '2', 'Chiayi', '05', '6');
INSERT INTO `e_r_sys_region` VALUES ('713001', '713000', '太保', '太保市', '中国,台湾,嘉义县,太保市', '3', 'Taibao', '05', '612');
INSERT INTO `e_r_sys_region` VALUES ('713002', '713000', '朴子', '朴子市', '中国,台湾,嘉义县,朴子市', '3', 'Puzi', '05', '613');
INSERT INTO `e_r_sys_region` VALUES ('713023', '713000', '布袋', '布袋镇', '中国,台湾,嘉义县,布袋镇', '3', 'Budai', '05', '625');
INSERT INTO `e_r_sys_region` VALUES ('713024', '713000', '大林', '大林镇', '中国,台湾,嘉义县,大林镇', '3', 'Dalin', '05', '622');
INSERT INTO `e_r_sys_region` VALUES ('713025', '713000', '民雄', '民雄乡', '中国,台湾,嘉义县,民雄乡', '3', 'Minxiong', '05', '621');
INSERT INTO `e_r_sys_region` VALUES ('713026', '713000', '溪口', '溪口乡', '中国,台湾,嘉义县,溪口乡', '3', 'Xikou', '05', '623');
INSERT INTO `e_r_sys_region` VALUES ('713027', '713000', '新港', '新港乡', '中国,台湾,嘉义县,新港乡', '3', 'Xingang', '05', '616');
INSERT INTO `e_r_sys_region` VALUES ('713028', '713000', '六脚', '六脚乡', '中国,台湾,嘉义县,六脚乡', '3', 'Liujiao', '05', '615');
INSERT INTO `e_r_sys_region` VALUES ('713029', '713000', '东石', '东石乡', '中国,台湾,嘉义县,东石乡', '3', 'Dongshi', '05', '614');
INSERT INTO `e_r_sys_region` VALUES ('713030', '713000', '义竹', '义竹乡', '中国,台湾,嘉义县,义竹乡', '3', 'Yizhu', '05', '624');
INSERT INTO `e_r_sys_region` VALUES ('713031', '713000', '鹿草', '鹿草乡', '中国,台湾,嘉义县,鹿草乡', '3', 'Lucao', '05', '611');
INSERT INTO `e_r_sys_region` VALUES ('713032', '713000', '水上', '水上乡', '中国,台湾,嘉义县,水上乡', '3', 'Shuishang', '05', '608');
INSERT INTO `e_r_sys_region` VALUES ('713033', '713000', '中埔', '中埔乡', '中国,台湾,嘉义县,中埔乡', '3', 'Zhongpu', '05', '606');
INSERT INTO `e_r_sys_region` VALUES ('713034', '713000', '竹崎', '竹崎乡', '中国,台湾,嘉义县,竹崎乡', '3', 'Zhuqi', '05', '604');
INSERT INTO `e_r_sys_region` VALUES ('713035', '713000', '梅山', '梅山乡', '中国,台湾,嘉义县,梅山乡', '3', 'Meishan', '05', '603');
INSERT INTO `e_r_sys_region` VALUES ('713036', '713000', '番路', '番路乡', '中国,台湾,嘉义县,番路乡', '3', 'Fanlu', '05', '602');
INSERT INTO `e_r_sys_region` VALUES ('713037', '713000', '大埔', '大埔乡', '中国,台湾,嘉义县,大埔乡', '3', 'Dapu', '05', '607');
INSERT INTO `e_r_sys_region` VALUES ('713038', '713000', '阿里山', '阿里山乡', '中国,台湾,嘉义县,阿里山乡', '3', 'Alishan', '05', '605');
INSERT INTO `e_r_sys_region` VALUES ('713300', '710000', '屏东', '屏东县', '中国,台湾,屏东县', '2', 'Pingtung', '08', '9');
INSERT INTO `e_r_sys_region` VALUES ('713301', '713300', '屏东', '屏东市', '中国,台湾,屏东县,屏东市', '3', 'Pingdong', '08', '900');
INSERT INTO `e_r_sys_region` VALUES ('713321', '713300', '潮州', '潮州镇', '中国,台湾,屏东县,潮州镇', '3', 'Chaozhou', '08', '920');
INSERT INTO `e_r_sys_region` VALUES ('713322', '713300', '东港', '东港镇', '中国,台湾,屏东县,东港镇', '3', 'Donggang', '08', '928');
INSERT INTO `e_r_sys_region` VALUES ('713323', '713300', '恒春', '恒春镇', '中国,台湾,屏东县,恒春镇', '3', 'Hengchun', '08', '946');
INSERT INTO `e_r_sys_region` VALUES ('713324', '713300', '万丹', '万丹乡', '中国,台湾,屏东县,万丹乡', '3', 'Wandan', '08', '913');
INSERT INTO `e_r_sys_region` VALUES ('713325', '713300', '长治', '长治乡', '中国,台湾,屏东县,长治乡', '3', 'Changzhi', '08', '908');
INSERT INTO `e_r_sys_region` VALUES ('713326', '713300', '麟洛', '麟洛乡', '中国,台湾,屏东县,麟洛乡', '3', 'Linluo', '08', '909');
INSERT INTO `e_r_sys_region` VALUES ('713327', '713300', '九如', '九如乡', '中国,台湾,屏东县,九如乡', '3', 'Jiuru', '08', '904');
INSERT INTO `e_r_sys_region` VALUES ('713328', '713300', '里港', '里港乡', '中国,台湾,屏东县,里港乡', '3', 'Ligang', '08', '905');
INSERT INTO `e_r_sys_region` VALUES ('713329', '713300', '盐埔', '盐埔乡', '中国,台湾,屏东县,盐埔乡', '3', 'Yanpu', '08', '907');
INSERT INTO `e_r_sys_region` VALUES ('713330', '713300', '高树', '高树乡', '中国,台湾,屏东县,高树乡', '3', 'Gaoshu', '08', '906');
INSERT INTO `e_r_sys_region` VALUES ('713331', '713300', '万峦', '万峦乡', '中国,台湾,屏东县,万峦乡', '3', 'Wanluan', '08', '923');
INSERT INTO `e_r_sys_region` VALUES ('713332', '713300', '内埔', '内埔乡', '中国,台湾,屏东县,内埔乡', '3', 'Napu', '08', '912');
INSERT INTO `e_r_sys_region` VALUES ('713333', '713300', '竹田', '竹田乡', '中国,台湾,屏东县,竹田乡', '3', 'Zhutian', '08', '911');
INSERT INTO `e_r_sys_region` VALUES ('713334', '713300', '新埤', '新埤乡', '中国,台湾,屏东县,新埤乡', '3', 'Xinpi', '08', '925');
INSERT INTO `e_r_sys_region` VALUES ('713335', '713300', '枋寮', '枋寮乡', '中国,台湾,屏东县,枋寮乡', '3', 'Fangliao', '08', '940');
INSERT INTO `e_r_sys_region` VALUES ('713336', '713300', '新园', '新园乡', '中国,台湾,屏东县,新园乡', '3', 'Xinyuan', '08', '932');
INSERT INTO `e_r_sys_region` VALUES ('713337', '713300', '崁顶', '崁顶乡', '中国,台湾,屏东县,崁顶乡', '3', 'Kanding', '08', '924');
INSERT INTO `e_r_sys_region` VALUES ('713338', '713300', '林边', '林边乡', '中国,台湾,屏东县,林边乡', '3', 'Linbian', '08', '927');
INSERT INTO `e_r_sys_region` VALUES ('713339', '713300', '南州', '南州乡', '中国,台湾,屏东县,南州乡', '3', 'Nanzhou', '08', '926');
INSERT INTO `e_r_sys_region` VALUES ('713340', '713300', '佳冬', '佳冬乡', '中国,台湾,屏东县,佳冬乡', '3', 'Jiadong', '08', '931');
INSERT INTO `e_r_sys_region` VALUES ('713341', '713300', '琉球', '琉球乡', '中国,台湾,屏东县,琉球乡', '3', 'Liuqiu', '08', '929');
INSERT INTO `e_r_sys_region` VALUES ('713342', '713300', '车城', '车城乡', '中国,台湾,屏东县,车城乡', '3', 'Checheng', '08', '944');
INSERT INTO `e_r_sys_region` VALUES ('713343', '713300', '满州', '满州乡', '中国,台湾,屏东县,满州乡', '3', 'Manzhou', '08', '947');
INSERT INTO `e_r_sys_region` VALUES ('713344', '713300', '枋山', '枋山乡', '中国,台湾,屏东县,枋山乡', '3', 'Fangshan', '08', '941');
INSERT INTO `e_r_sys_region` VALUES ('713345', '713300', '三地门', '三地门乡', '中国,台湾,屏东县,三地门乡', '3', 'Sandimen', '08', '901');
INSERT INTO `e_r_sys_region` VALUES ('713346', '713300', '雾台', '雾台乡', '中国,台湾,屏东县,雾台乡', '3', 'Wutai', '08', '902');
INSERT INTO `e_r_sys_region` VALUES ('713347', '713300', '玛家', '玛家乡', '中国,台湾,屏东县,玛家乡', '3', 'Majia', '08', '903');
INSERT INTO `e_r_sys_region` VALUES ('713348', '713300', '泰武', '泰武乡', '中国,台湾,屏东县,泰武乡', '3', 'Taiwu', '08', '921');
INSERT INTO `e_r_sys_region` VALUES ('713349', '713300', '来义', '来义乡', '中国,台湾,屏东县,来义乡', '3', 'Laiyi', '08', '922');
INSERT INTO `e_r_sys_region` VALUES ('713350', '713300', '春日', '春日乡', '中国,台湾,屏东县,春日乡', '3', 'Chunri', '08', '942');
INSERT INTO `e_r_sys_region` VALUES ('713351', '713300', '狮子', '狮子乡', '中国,台湾,屏东县,狮子乡', '3', 'Shizi', '08', '943');
INSERT INTO `e_r_sys_region` VALUES ('713352', '713300', '牡丹', '牡丹乡', '中国,台湾,屏东县,牡丹乡', '3', 'Mudan', '08', '945');
INSERT INTO `e_r_sys_region` VALUES ('713400', '710000', '台东', '台东县', '中国,台湾,台东县', '2', 'Taitung', '089', '9');
INSERT INTO `e_r_sys_region` VALUES ('713401', '713400', '台东', '台东市', '中国,台湾,台东县,台东市', '3', 'Taidong', '089', '950');
INSERT INTO `e_r_sys_region` VALUES ('713421', '713400', '成功', '成功镇', '中国,台湾,台东县,成功镇', '3', 'Chenggong', '089', '961');
INSERT INTO `e_r_sys_region` VALUES ('713422', '713400', '关山', '关山镇', '中国,台湾,台东县,关山镇', '3', 'Guanshan', '089', '956');
INSERT INTO `e_r_sys_region` VALUES ('713423', '713400', '卑南', '卑南乡', '中国,台湾,台东县,卑南乡', '3', 'Beinan', '089', '954');
INSERT INTO `e_r_sys_region` VALUES ('713424', '713400', '鹿野', '鹿野乡', '中国,台湾,台东县,鹿野乡', '3', 'Luye', '089', '955');
INSERT INTO `e_r_sys_region` VALUES ('713425', '713400', '池上', '池上乡', '中国,台湾,台东县,池上乡', '3', 'Chishang', '089', '958');
INSERT INTO `e_r_sys_region` VALUES ('713426', '713400', '东河', '东河乡', '中国,台湾,台东县,东河乡', '3', 'Donghe', '089', '959');
INSERT INTO `e_r_sys_region` VALUES ('713427', '713400', '长滨', '长滨乡', '中国,台湾,台东县,长滨乡', '3', 'Changbin', '089', '962');
INSERT INTO `e_r_sys_region` VALUES ('713428', '713400', '太麻里', '太麻里乡', '中国,台湾,台东县,太麻里乡', '3', 'Taimali', '089', '963');
INSERT INTO `e_r_sys_region` VALUES ('713429', '713400', '大武', '大武乡', '中国,台湾,台东县,大武乡', '3', 'Dawu', '089', '965');
INSERT INTO `e_r_sys_region` VALUES ('713430', '713400', '绿岛', '绿岛乡', '中国,台湾,台东县,绿岛乡', '3', 'Lvdao', '089', '951');
INSERT INTO `e_r_sys_region` VALUES ('713431', '713400', '海端', '海端乡', '中国,台湾,台东县,海端乡', '3', 'Haiduan', '089', '957');
INSERT INTO `e_r_sys_region` VALUES ('713432', '713400', '延平', '延平乡', '中国,台湾,台东县,延平乡', '3', 'Yanping', '089', '953');
INSERT INTO `e_r_sys_region` VALUES ('713433', '713400', '金峰', '金峰乡', '中国,台湾,台东县,金峰乡', '3', 'Jinfeng', '089', '964');
INSERT INTO `e_r_sys_region` VALUES ('713434', '713400', '达仁', '达仁乡', '中国,台湾,台东县,达仁乡', '3', 'Daren', '089', '966');
INSERT INTO `e_r_sys_region` VALUES ('713435', '713400', '兰屿', '兰屿乡', '中国,台湾,台东县,兰屿乡', '3', 'Lanyu', '089', '952');
INSERT INTO `e_r_sys_region` VALUES ('713500', '710000', '花莲', '花莲县', '中国,台湾,花莲县', '2', 'Hualien', '03', '9');
INSERT INTO `e_r_sys_region` VALUES ('713501', '713500', '花莲', '花莲市', '中国,台湾,花莲县,花莲市', '3', 'Hualian', '03', '970');
INSERT INTO `e_r_sys_region` VALUES ('713521', '713500', '凤林', '凤林镇', '中国,台湾,花莲县,凤林镇', '3', 'Fenglin', '03', '975');
INSERT INTO `e_r_sys_region` VALUES ('713522', '713500', '玉里', '玉里镇', '中国,台湾,花莲县,玉里镇', '3', 'Yuli', '03', '981');
INSERT INTO `e_r_sys_region` VALUES ('713523', '713500', '新城', '新城乡', '中国,台湾,花莲县,新城乡', '3', 'Xincheng', '03', '971');
INSERT INTO `e_r_sys_region` VALUES ('713524', '713500', '吉安', '吉安乡', '中国,台湾,花莲县,吉安乡', '3', 'Ji\'an', '03', '973');
INSERT INTO `e_r_sys_region` VALUES ('713525', '713500', '寿丰', '寿丰乡', '中国,台湾,花莲县,寿丰乡', '3', 'Shoufeng', '03', '974');
INSERT INTO `e_r_sys_region` VALUES ('713526', '713500', '光复', '光复乡', '中国,台湾,花莲县,光复乡', '3', 'Guangfu', '03', '976');
INSERT INTO `e_r_sys_region` VALUES ('713527', '713500', '丰滨', '丰滨乡', '中国,台湾,花莲县,丰滨乡', '3', 'Fengbin', '03', '977');
INSERT INTO `e_r_sys_region` VALUES ('713528', '713500', '瑞穗', '瑞穗乡', '中国,台湾,花莲县,瑞穗乡', '3', 'Ruisui', '03', '978');
INSERT INTO `e_r_sys_region` VALUES ('713529', '713500', '富里', '富里乡', '中国,台湾,花莲县,富里乡', '3', 'Fuli', '03', '983');
INSERT INTO `e_r_sys_region` VALUES ('713530', '713500', '秀林', '秀林乡', '中国,台湾,花莲县,秀林乡', '3', 'Xiulin', '03', '972');
INSERT INTO `e_r_sys_region` VALUES ('713531', '713500', '万荣', '万荣乡', '中国,台湾,花莲县,万荣乡', '3', 'Wanrong', '03', '979');
INSERT INTO `e_r_sys_region` VALUES ('713532', '713500', '卓溪', '卓溪乡', '中国,台湾,花莲县,卓溪乡', '3', 'Zhuoxi', '03', '982');
INSERT INTO `e_r_sys_region` VALUES ('713600', '710000', '澎湖', '澎湖县', '中国,台湾,澎湖县', '2', 'Penghu', '06', '8');
INSERT INTO `e_r_sys_region` VALUES ('713601', '713600', '马公', '马公市', '中国,台湾,澎湖县,马公市', '3', 'Magong', '06', '880');
INSERT INTO `e_r_sys_region` VALUES ('713621', '713600', '湖西', '湖西乡', '中国,台湾,澎湖县,湖西乡', '3', 'Huxi', '06', '885');
INSERT INTO `e_r_sys_region` VALUES ('713622', '713600', '白沙', '白沙乡', '中国,台湾,澎湖县,白沙乡', '3', 'Baisha', '06', '884');
INSERT INTO `e_r_sys_region` VALUES ('713623', '713600', '西屿', '西屿乡', '中国,台湾,澎湖县,西屿乡', '3', 'Xiyu', '06', '881');
INSERT INTO `e_r_sys_region` VALUES ('713624', '713600', '望安', '望安乡', '中国,台湾,澎湖县,望安乡', '3', 'Wang\'an', '06', '882');
INSERT INTO `e_r_sys_region` VALUES ('713625', '713600', '七美', '七美乡', '中国,台湾,澎湖县,七美乡', '3', 'Qimei', '06', '883');
INSERT INTO `e_r_sys_region` VALUES ('713700', '710000', '金门', '金门县', '中国,台湾,金门县', '2', 'Jinmen', '082', '8');
INSERT INTO `e_r_sys_region` VALUES ('713701', '713700', '金城', '金城镇', '中国,台湾,金门县,金城镇', '3', 'Jincheng', '082', '893');
INSERT INTO `e_r_sys_region` VALUES ('713702', '713700', '金湖', '金湖镇', '中国,台湾,金门县,金湖镇', '3', 'Jinhu', '082', '891');
INSERT INTO `e_r_sys_region` VALUES ('713703', '713700', '金沙', '金沙镇', '中国,台湾,金门县,金沙镇', '3', 'Jinsha', '082', '890');
INSERT INTO `e_r_sys_region` VALUES ('713704', '713700', '金宁', '金宁乡', '中国,台湾,金门县,金宁乡', '3', 'Jinning', '082', '892');
INSERT INTO `e_r_sys_region` VALUES ('713705', '713700', '烈屿', '烈屿乡', '中国,台湾,金门县,烈屿乡', '3', 'Lieyu', '082', '894');
INSERT INTO `e_r_sys_region` VALUES ('713706', '713700', '乌丘', '乌丘乡', '中国,台湾,金门县,乌丘乡', '3', 'Wuqiu', '082', '896');
INSERT INTO `e_r_sys_region` VALUES ('713800', '710000', '连江', '连江县', '中国,台湾,连江县', '2', 'Lienchiang', '0836', '2');
INSERT INTO `e_r_sys_region` VALUES ('713801', '713800', '南竿', '南竿乡', '中国,台湾,连江县,南竿乡', '3', 'Nangan', '0836', '209');
INSERT INTO `e_r_sys_region` VALUES ('713802', '713800', '北竿', '北竿乡', '中国,台湾,连江县,北竿乡', '3', 'Beigan', '0836', '210');
INSERT INTO `e_r_sys_region` VALUES ('713803', '713800', '莒光', '莒光乡', '中国,台湾,连江县,莒光乡', '3', 'Juguang', '0836', '211');
INSERT INTO `e_r_sys_region` VALUES ('713804', '713800', '东引', '东引乡', '中国,台湾,连江县,东引乡', '3', 'Dongyin', '0836', '212');
INSERT INTO `e_r_sys_region` VALUES ('810000', '100000', '香港', '香港特别行政区', '中国,香港特别行政区', '1', 'Hong Kong', '', '');
INSERT INTO `e_r_sys_region` VALUES ('810100', '810000', '香港岛', '香港岛', '中国,香港特别行政区,香港岛', '2', 'Hong Kong Island', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810101', '810100', '中西区', '中西区', '中国,香港特别行政区,香港岛,中西区', '3', 'Central and Western District', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810102', '810100', '湾仔区', '湾仔区', '中国,香港特别行政区,香港岛,湾仔区', '3', 'Wan Chai District', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810103', '810100', '东区', '东区', '中国,香港特别行政区,香港岛,东区', '3', 'Eastern District', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810104', '810100', '南区', '南区', '中国,香港特别行政区,香港岛,南区', '3', 'Southern District', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810200', '810000', '九龙', '九龙', '中国,香港特别行政区,九龙', '2', 'Kowloon', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810201', '810200', '油尖旺', '油尖旺区', '中国,香港特别行政区,九龙,油尖旺区', '3', 'Yau Tsim Mong', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810202', '810200', '深水埗', '深水埗区', '中国,香港特别行政区,九龙,深水埗区', '3', 'Sham Shui Po', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810203', '810200', '九龙城', '九龙城区', '中国,香港特别行政区,九龙,九龙城区', '3', 'Jiulongcheng', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810204', '810200', '黄大仙', '黄大仙区', '中国,香港特别行政区,九龙,黄大仙区', '3', 'Wong Tai Sin', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810205', '810200', '观塘', '观塘区', '中国,香港特别行政区,九龙,观塘区', '3', 'Kwun Tong', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810300', '810000', '新界', '新界', '中国,香港特别行政区,新界', '2', 'New Territories', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810301', '810300', '荃湾', '荃湾区', '中国,香港特别行政区,新界,荃湾区', '3', 'Tsuen Wan', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810302', '810300', '屯门', '屯门区', '中国,香港特别行政区,新界,屯门区', '3', 'Tuen Mun', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810303', '810300', '元朗', '元朗区', '中国,香港特别行政区,新界,元朗区', '3', 'Yuen Long', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810304', '810300', '北区', '北区', '中国,香港特别行政区,新界,北区', '3', 'North District', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810305', '810300', '大埔', '大埔区', '中国,香港特别行政区,新界,大埔区', '3', 'Tai Po', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810306', '810300', '西贡', '西贡区', '中国,香港特别行政区,新界,西贡区', '3', 'Sai Kung', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810307', '810300', '沙田', '沙田区', '中国,香港特别行政区,新界,沙田区', '3', 'Sha Tin', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810308', '810300', '葵青', '葵青区', '中国,香港特别行政区,新界,葵青区', '3', 'Kwai Tsing', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('810309', '810300', '离岛', '离岛区', '中国,香港特别行政区,新界,离岛区', '3', 'Outlying Islands', '00852', '999077');
INSERT INTO `e_r_sys_region` VALUES ('820000', '100000', '澳门', '澳门特别行政区', '中国,澳门特别行政区', '1', 'Macau', '', '');
INSERT INTO `e_r_sys_region` VALUES ('820100', '820000', '澳门半岛', '澳门半岛', '中国,澳门特别行政区,澳门半岛', '2', 'MacauPeninsula', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820101', '820100', '花地玛堂区', '花地玛堂区', '中国,澳门特别行政区,澳门半岛,花地玛堂区', '3', 'Nossa Senhora de Fatima', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820102', '820100', '圣安多尼堂区', '圣安多尼堂区', '中国,澳门特别行政区,澳门半岛,圣安多尼堂区', '3', 'Santo Antonio', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820103', '820100', '大堂', '大堂区', '中国,澳门特别行政区,澳门半岛,大堂区', '3', 'Sé', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820104', '820100', '望德堂区', '望德堂区', '中国,澳门特别行政区,澳门半岛,望德堂区', '3', 'Sao Lazaro', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820105', '820100', '风顺堂区', '风顺堂区', '中国,澳门特别行政区,澳门半岛,风顺堂区', '3', 'Sao Lourenco', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820200', '820000', '氹仔岛', '氹仔岛', '中国,澳门特别行政区,氹仔岛', '2', 'Taipa', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820201', '820200', '嘉模堂区', '嘉模堂区', '中国,澳门特别行政区,氹仔岛,嘉模堂区', '3', 'Our Lady Of Carmel\'s Parish', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820300', '820000', '路环岛', '路环岛', '中国,澳门特别行政区,路环岛', '2', 'Coloane', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('820301', '820300', '圣方济各堂区', '圣方济各堂区', '中国,澳门特别行政区,路环岛,圣方济各堂区', '3', 'St Francis Xavier\'s Parish', '00853', '999078');
INSERT INTO `e_r_sys_region` VALUES ('900000', '100000', '钓鱼岛', '钓鱼岛', '中国,钓鱼岛', '1', 'DiaoyuDao', '', '');

-- ----------------------------
-- Table structure for e_r_target
-- ----------------------------
DROP TABLE IF EXISTS `e_r_target`;
CREATE TABLE `e_r_target` (
  `target_id` bigint(20) NOT NULL COMMENT '目标ID',
  `semester` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `target_amount` int(11) DEFAULT NULL COMMENT '目标数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `modify_id` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `modify_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  `recruit_school_id` bigint(20) DEFAULT NULL COMMENT '招生学校ID',
  PRIMARY KEY (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='目标';

-- ----------------------------
-- Records of e_r_target
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_target_decomposition
-- ----------------------------
DROP TABLE IF EXISTS `e_r_target_decomposition`;
CREATE TABLE `e_r_target_decomposition` (
  `target_decomposition_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标分解ID',
  `target_id` bigint(20) DEFAULT NULL COMMENT '目标ID',
  `parent_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父节点ID',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型（0：渠道，1：专业）',
  `node_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点ID（平台接口ID）',
  `node_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点名称',
  `target_amount` int(11) DEFAULT NULL COMMENT '目标数量',
  `comment` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`target_decomposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生目标分解(树形表) ';

-- ----------------------------
-- Records of e_r_target_decomposition
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_task
-- ----------------------------
DROP TABLE IF EXISTS `e_r_task`;
CREATE TABLE `e_r_task` (
  `task_id` bigint(20) NOT NULL COMMENT '招生任务ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态（0：未完成，1：完成）',
  `title` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `task_type` tinyint(4) DEFAULT NULL COMMENT '类型（0：维护学校，1：维护宣讲，2：宣讲任务，3：诉求，4：咨询，5：入学通知）',
  `jump_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转页面',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  `related_id` bigint(20) DEFAULT NULL COMMENT '相关ID',
  `report_type` tinyint(4) DEFAULT NULL COMMENT '上报方式（0：系统上报，1：用户填报）',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '发布人员ID',
  `creator_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人员名称',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型（0：任务，1：学生信息）',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='招生任务表';

-- ----------------------------
-- Records of e_r_task
-- ----------------------------

-- ----------------------------
-- Table structure for e_r_task_receiver
-- ----------------------------
DROP TABLE IF EXISTS `e_r_task_receiver`;
CREATE TABLE `e_r_task_receiver` (
  `task_receiver_id` bigint(20) NOT NULL COMMENT '任务接收信息ID',
  `task_id` bigint(20) DEFAULT NULL COMMENT '招生任务ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态（0：未完成，1：完成）',
  `receiver_id` bigint(20) DEFAULT NULL COMMENT '接收人ID',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '学期ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `read_status` tinyint(4) DEFAULT '0' COMMENT '查看状态（0：未读，1：已读）',
  PRIMARY KEY (`task_receiver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='任务接收人表';

-- ----------------------------
-- Records of e_r_task_receiver
-- ----------------------------

-- ----------------------------
-- View structure for e_r_v_duty_plan
-- ----------------------------
DROP VIEW IF EXISTS `e_r_v_duty_plan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `e_r_v_duty_plan` AS select `e_r_preach_plan`.`preach_plan_id` AS `id`,1 AS `type`,`e_r_preach_plan`.`preach_time` AS `start_time`,`e_r_preach_plan`.`end_time` AS `end_time`,`e_r_preach_plan`.`speaker_id` AS `user_id`,`e_r_preach_plan`.`speaker_name` AS `user_name` from `e_r_preach_plan` where (`e_r_preach_plan`.`status` <> 0) union all select `e_r_consultation`.`consultation_id` AS `id`,2 AS `type`,`e_r_consultation`.`start_time` AS `start_time`,`e_r_consultation`.`end_time` AS `end_time`,`e_r_consultation`.`daily_receptionist_id` AS `user_id`,`e_r_consultation`.`daily_receptionist_name` AS `user_name` from `e_r_consultation` ;

-- ----------------------------
-- View structure for e_r_v_student_public_relation
-- ----------------------------
DROP VIEW IF EXISTS `e_r_v_student_public_relation`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `e_r_v_student_public_relation` AS (select `r`.`student_public_relation_id` AS `student_public_relation_id`,`i`.`student_name` AS `student_name`,`i`.`student_info` AS `student_info`,`i`.`student_telephone` AS `student_telephone` from (`e_r_student_public_relation` `r` left join `e_r_student_info` `i` on((`r`.`student_info` = `i`.`student_info`)))) ;

-- ----------------------------
-- Procedure structure for create_calendar
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_calendar`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_calendar`(s_date DATE, e_date DATE)
BEGIN
  
  -- 生成一个日历表
    SET @createSql = 'CREATE TABLE IF NOT EXISTS calendar_custom (
                      `date` date NOT NULL,
               UNIQUE KEY `unique_date` (`date`) USING BTREE
                   )ENGINE=InnoDB DEFAULT CHARSET=utf8';
    prepare stmt from @createSql;
    execute stmt;
  
    WHILE s_date <= e_date DO
        INSERT IGNORE INTO calendar_custom VALUES (DATE(s_date)) ;
        SET s_date = s_date + INTERVAL 1 DAY ;
    END WHILE ;
  
END
;;
DELIMITER ;
