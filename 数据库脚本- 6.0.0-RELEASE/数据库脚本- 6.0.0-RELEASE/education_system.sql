# Host: localhost  (Version 5.7.27)
# Date: 2020-01-14 12:11:47
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "msg"
#

CREATE TABLE `msg` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `msg_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '短信类型(1系统消息,2其他)',
  `msg_title` varchar(255) NOT NULL COMMENT '短信标题',
  `msg_text` text COMMENT '短信内容',
  `is_time_send` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否定时发送（1是，0否）',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_send` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已发送(1是;0否)',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶(1是;0否)',
  `back_remark` varchar(255) DEFAULT NULL COMMENT '后台备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站内信息表';

#
# Data for table "msg"
#

INSERT INTO `msg` VALUES (1103192777748422657,'2019-03-06 15:18:39','2019-03-06 15:18:39',1,1,1,'测试1','<p>测试1<br /></p>',0,NULL,0,0,NULL);

#
# Structure for table "msg_template"
#

CREATE TABLE `msg_template` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(1023) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息模板';

#
# Data for table "msg_template"
#

INSERT INTO `msg_template` VALUES (1102813675380137986,'2019-03-05 14:12:14','2019-03-05 14:12:14',1,'','尊敬的{{name}}用户，您有一个{{courseName}}课程抵用券即将过期',1);

#
# Structure for table "msg_user"
#

CREATE TABLE `msg_user` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `msg_id` bigint(20) NOT NULL COMMENT '短信ID',
  `user_no` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户编号',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `msg_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '短信类型(1系统消息,2其他)',
  `msg_title` varchar(255) NOT NULL COMMENT '短信标题',
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否阅读(1是;0否)',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶(1是;0否)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站内信用户记录表';

#
# Data for table "msg_user"
#


#
# Structure for table "nav_bar"
#

CREATE TABLE `nav_bar` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `nav_title` varchar(255) DEFAULT NULL COMMENT '导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '导航url',
  `target` varchar(255) DEFAULT NULL COMMENT '跳转方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='头部导航';

#
# Data for table "nav_bar"
#

INSERT INTO `nav_bar` VALUES (1060096588522270722,'2018-11-07 17:09:32','2018-11-07 17:09:32',1,2,'课程中心','/list','_self'),(1064696486139854849,'2018-11-20 09:47:57','2018-11-20 09:47:57',1,3,'首页','/index','_self'),(1085443582223257601,'2019-01-16 15:49:36','2019-01-16 15:49:36',1,1,'讲师招募','/recruit','_self');

#
# Structure for table "sys"
#

CREATE TABLE `sys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `video_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '视频存储平台（1保利威视，2七牛）',
  `polyv_useid` varchar(512) DEFAULT NULL COMMENT 'useid',
  `polyv_writetoken` varchar(255) DEFAULT NULL COMMENT 'writetoken',
  `polyv_readtoken` varchar(255) DEFAULT NULL COMMENT 'readtoken',
  `polyv_secretkey` varchar(255) DEFAULT NULL COMMENT 'secretkey',
  `file_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '文件存储类型（1阿里云，2七牛）',
  `aliyun_access_key_id` varchar(255) DEFAULT NULL COMMENT 'access_key_id',
  `aliyun_access_key_secret` varchar(255) DEFAULT NULL COMMENT 'access_key_secret',
  `aliyun_oss_url` varchar(255) DEFAULT NULL COMMENT 'oss_url',
  `aliyun_oss_bucket` varchar(255) DEFAULT NULL COMMENT 'oss_bucket',
  `aliyun_oas_vault` varchar(255) DEFAULT NULL COMMENT 'oas_vault',
  `pay_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '支付通道（1龙果支付，2其他）',
  `pay_url` varchar(255) DEFAULT NULL COMMENT '支付请求',
  `pay_key` varchar(255) DEFAULT NULL COMMENT 'roncoo_key',
  `pay_secret` varchar(255) DEFAULT NULL COMMENT 'roncoo_secret',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sms_code` varchar(50) DEFAULT NULL COMMENT 'sms_code',
  `sign_name` varchar(255) DEFAULT NULL COMMENT '短信签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

#
# Data for table "sys"
#

INSERT INTO `sys` VALUES (1,'1899-12-30 01:00:00','1899-12-30 01:00:00',1,1,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "sys_log"
#

CREATE TABLE `sys_log` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_no` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `ip` varchar(255) DEFAULT '' COMMENT 'IP地址',
  `operation` varchar(255) DEFAULT '' COMMENT '用户操作',
  `method` varchar(255) DEFAULT '' COMMENT '请求方法',
  `path` varchar(255) DEFAULT '' COMMENT '请求路径',
  `content` varchar(5000) DEFAULT '' COMMENT '请求参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='后台操作日志表';

#
# Data for table "sys_log"
#

INSERT INTO `sys_log` VALUES (1087612566293417986,'2019-01-22 15:26:55',2018033111202589416,'超级管理员','113.111.55.245','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1085453180200448002,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1087983955948609537,'2019-01-23 16:04:09',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','站点信息更新','POST','/system/website/updateWebsite','{\"pageCurrent\":0,\"pageSize\":0,\"id\":934374967448227841,\"websiteTitle\":\"领课教育1\",\"websiteKeyword\":\"领课教育,领课网络,在线教育\",\"websiteDesc\":\"领课在线教育开源系统是基于领课团队多年的在线教育开发和运营经验的产品\",\"copyright\":\"Copyright &copy; 2018-2023 领课教育 版权所有\",\"icp\":\"粤ICP备16009964号-1\",\"prn\":\"粤公网安备 44010602005774号\",\"isEnableStatistics\":1,\"isShowService\":1,\"service1\":\"297115770\",\"service2\":\"3155237748\"}'),(1102816207228772353,'2019-03-05 14:20:45',2018033111202589416,'超级管理员','113.111.48.159','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1085453180200448002,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102867757029478401,'2019-03-05 17:47:08',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080752794290032642,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102868619776831490,'2019-03-05 17:50:34',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1085453180200448002,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102869835911081986,'2019-03-05 17:55:24',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1085453180200448002,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102870024788979713,'2019-03-05 17:56:09',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1085453180200448002,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102871704779698178,'2019-03-05 18:02:50',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080759557655564289,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102872414426574849,'2019-03-05 18:05:39',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080759102707798018,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102877039468818433,'2019-03-05 18:24:01',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080758482462511106,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102877626100953090,'2019-03-05 18:26:21',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080757537695535105,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102878378311626753,'2019-03-05 18:29:21',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080757024136564738,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102879222457249793,'2019-03-05 18:32:42',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080753909630963714,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102879370209996802,'2019-03-05 18:33:17',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080749913478467586,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1102879702436622337,'2019-03-05 18:34:36',2018033111202589416,'超级管理员','0:0:0:0:0:0:0:1','录播课程审核','POST','/course/courseAudit/audit','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1080748086536114177,\"auditStatus\":1,\"auditOpinion\":\"系统默认通过\"}'),(1103602638478073857,'2019-03-07 18:25:45',2018033111202589416,'超级管理员','116.21.1.86','系统配置更新','POST','/system/sys/updateSys','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1,\"videoType\":1,\"polyvUseid\":\"e2fe557cf3\",\"polyvWritetoken\":\"e2e795e5-1129-4a26-adb3-0e962473aa94\",\"polyvReadtoken\":\"18dc4295-adcb-44a8-a989-f5c8402e798d\",\"polyvSecretkey\":\"b9c1rGiA5Y\",\"fileType\":1,\"aliyunAccessKeyId\":\"n3qRxyH2JyF6pFJN\",\"aliyunAccessKeySecret\":\"VUjoE6qO9H7qYKD78YyfF1kgzy6Gun\",\"payType\":1,\"aliyunOssUrl\":\"http://static-dev.roncoo.com/\",\"aliyunOssBucket\":\"roncoo-dev\",\"aliyunOasVault\":\"roncoo_college\",\"payUrl\":\"http://47.101.63.159:6001/cnpPay/initPay\",\"payKey\":\"3de903c57ffa4534ad62d134a504a685\",\"paySecret\":\"7a299f1c72ae466cae161cbcd60060a4\",\"notifyUrl\":\"http://roncoo.vicp.net/api/callback/order/roncoo\"}'),(1103603270001844225,'2019-03-07 18:28:16',2018033111202589416,'超级管理员','116.21.1.86','系统配置更新','POST','/system/sys/updateSys','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1,\"videoType\":1,\"polyvUseid\":\"e2fe557cf3\",\"polyvWritetoken\":\"e2e795e5-1129-4a26-adb3-0e962473aa94\",\"polyvReadtoken\":\"18dc4295-adcb-44a8-a989-f5c8402e798d\",\"polyvSecretkey\":\"b9c1rGiA5Y\",\"fileType\":1,\"aliyunAccessKeyId\":\"n3qRxyH2JyF6pFJN\",\"aliyunAccessKeySecret\":\"VUjoE6qO9H7qYKD78YyfF1kgzy6Gun\",\"payType\":1,\"aliyunOssUrl\":\"http://static-dev.roncoo.com/\",\"aliyunOssBucket\":\"roncoo-dev\",\"aliyunOasVault\":\"roncoo_college\",\"payUrl\":\"http://47.101.63.159:6001/cnpPay/initPay\",\"payKey\":\"3de903c57ffa4534ad62d134a504a685\",\"paySecret\":\"7a299f1c72ae466cae161cbcd60060a4\",\"notifyUrl\":\"http://roncoo.vicp.net/api/callback/order/roncoo\"}'),(1103603626370883586,'2019-03-07 18:29:41',2018033111202589416,'超级管理员','116.21.1.86','修改状态','POST','/user/userExt/updateStatusId','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1098848357166346241,\"statusId\":0}'),(1103603651440238594,'2019-03-07 18:29:47',2018033111202589416,'超级管理员','116.21.1.86','修改状态','POST','/user/userExt/updateStatusId','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1098848357166346241,\"statusId\":1}'),(1103603807459958785,'2019-03-07 18:30:24',2018033111202589416,'超级管理员','116.21.1.86','讲师信息修改','POST','/user/lecturerAudit/update','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1100757103337525250,\"sort\":1,\"lecturerUserNo\":2019022721353527,\"lecturerName\":\"88\",\"lecturerEmail\":\"163services@163.com\",\"introduce\":\"<p>qqqq</p>\",\"lecturerProportion\":70}'),(1103841871046336513,'2019-03-08 10:16:23',2018033111202589416,'超级管理员','116.21.1.86','站点信息更新','POST','/system/website/updateWebsite','{\"pageCurrent\":0,\"pageSize\":0,\"id\":934374967448227841,\"websiteTitle\":\"领课教育\",\"websiteKeyword\":\"领课教育,领课网络,在线教育\",\"websiteDesc\":\"领课在线教育开源系统是基于领课团队多年的在线教育开发和运营经验的产品\",\"copyright\":\"Copyright &copy; 2018-2023 领课教育 版权所有\",\"icp\":\"粤ICP备16009964号-1\",\"prn\":\"粤公网安备 44010602005774号\",\"isEnableStatistics\":1,\"isShowService\":1,\"service1\":\"297115770\",\"service2\":\"3155237748\",\"userAgreement\":\"<p></p>\\n<p></p>\\n<p></p>\\n<p></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\",\"recruitInfo\":\"<p></p>\\n<p></p>\\n<p></p>\\n<p></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\",\"entryAgreement\":\"<p></p>\\n<p></p>\\n<p></p>\\n<p></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\\n<p></p>\\n<p><br /></p>\"}'),(1103842782971912193,'2019-03-08 10:20:00',2018033111202589416,'超级管理员','116.21.1.86','系统配置更新','POST','/system/sys/updateSys','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1,\"videoType\":1,\"polyvUseid\":\"e2fe557cf3\",\"polyvWritetoken\":\"e2e795e5-1129-4a26-adb3-0e962473aa94\",\"polyvReadtoken\":\"18dc4295-adcb-44a8-a989-f5c8402e798d\",\"polyvSecretkey\":\"b9c1rGiA5Y\",\"fileType\":1,\"aliyunAccessKeyId\":\"n3qRxyH2JyF6pFJN\",\"aliyunAccessKeySecret\":\"VUjoE6qO9H7qYKD78YyfF1kgzy6Gun\",\"payType\":1,\"aliyunOssUrl\":\"http://static-dev.roncoo.com/\",\"aliyunOssBucket\":\"roncoo-dev\",\"aliyunOasVault\":\"roncoo_college\",\"payUrl\":\"http://47.101.63.159:6001/cnpPay/initPay\",\"payKey\":\"3de903c57ffa4534ad62d134a504a685\",\"paySecret\":\"7a299f1c72ae466cae161cbcd60060a4\",\"notifyUrl\":\"http://roncoo.vicp.net/api/callback/order/roncoo\"}'),(1103843308497231874,'2019-03-08 10:22:06',2018033111202589416,'超级管理员','116.21.1.86','讲师信息修改','POST','/user/lecturerAudit/update','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1100757103337525250,\"sort\":1,\"lecturerUserNo\":2019022721353527,\"lecturerName\":\"88\",\"lecturerEmail\":\"163services@163.com\",\"introduce\":\"<p>qqqq</p>\",\"lecturerProportion\":70}'),(1141232745800654849,'2019-06-19 14:36:09',2018033111202589416,'超级管理员','192.168.1.253','修改状态','POST','/user/userExt/updateStatusId','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1103275392542380034,\"statusId\":0}'),(1141232798531444738,'2019-06-19 14:36:22',2018033111202589416,'超级管理员','192.168.1.253','修改状态','POST','/user/userExt/updateStatusId','{\"pageCurrent\":0,\"pageSize\":0,\"id\":1103275392542380034,\"statusId\":1}');

#
# Structure for table "sys_menu"
#

CREATE TABLE `sys_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `parent_id` bigint(20) unsigned NOT NULL COMMENT '父ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT '' COMMENT '路由路径',
  `api_url` varchar(255) DEFAULT '' COMMENT '接口URL',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `menu_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '菜单类型(1：目录   2：菜单   3：按钮)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1160851552827351042 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单信息';

#
# Data for table "sys_menu"
#

INSERT INTO `sys_menu` VALUES (1153478139284656129,'2019-07-23 09:33:11','2019-07-23 09:33:11',1,6,0,'订单管理','order','',NULL,'订单管理',1),(1153478416205189122,'2019-07-23 09:34:17','2019-07-23 09:34:17',1,5,0,'首页管理','homepage','',NULL,'首页管理',1),(1153478559176429569,'2019-07-23 09:34:51','2019-07-23 09:34:51',1,4,0,'课程管理','course','',NULL,'课程管理',1),(1153478694937661442,'2019-07-23 09:35:23','2019-07-23 09:35:23',1,3,0,'讲师管理','lecturer','',NULL,'讲师管理',1),(1153478801917579265,'2019-07-23 09:35:49','2019-07-23 09:35:49',1,2,0,'学员管理','user','',NULL,'学员管理',1),(1153478911053369345,'2019-07-23 09:36:15','2019-07-23 09:36:15',1,1,0,'系统管理','sys','',NULL,'系统管理111',1),(1153493010483089409,'2019-07-23 10:32:17','2019-07-23 10:32:17',1,1,1153478139284656129,'订单列表','/order/orderInfo','/course/pc/order/info/list',NULL,'订单列表',2),(1153493592497295362,'2019-07-23 10:34:35','2019-07-23 10:34:35',1,3,1153478416205189122,'首页轮播','/adv','',NULL,'首页轮播',1),(1153493835884367873,'2019-07-23 10:35:33','2019-07-23 10:35:33',1,1,1153493592497295362,'PC端设置','/homepage/adv/pc','/course/pc/adv/list',NULL,'PC端设置',2),(1153494219218587650,'2019-07-23 10:37:05','2019-07-23 10:37:05',1,2,1153478416205189122,'专区管理','/zone','',NULL,'专区管理',1),(1153494438295474177,'2019-07-23 10:37:57','2019-07-23 10:37:57',1,1,1153494219218587650,'PC端设置','/homepage/zone/pc','/course/pc/zone/list',NULL,'PC端设置',2),(1153494698514288641,'2019-07-23 10:38:59','2019-07-23 10:38:59',1,1,1153478416205189122,'站点管理','/website','',NULL,'站点管理',1),(1153494935626682369,'2019-07-23 10:39:56','2019-07-23 10:39:56',1,3,1153494698514288641,'头部导航','/homepage/website/navBar','/system/pc/nav/bar/list',NULL,'头部导航列表接口',2),(1153495031810461697,'2019-07-23 10:40:18','2019-07-23 10:40:18',1,2,1153494698514288641,'底部导航','/homepage/website/websiteNav','/system/pc/website/nav/list',NULL,'底部导航',2),(1153495155055890433,'2019-07-23 10:40:48','2019-07-23 10:40:48',1,1,1153494698514288641,'友情链接','/homepage/website/websiteLink','/system/pc/website/link/list',NULL,'友情链接',2),(1153495582782623746,'2019-07-23 10:42:30','2019-07-23 10:42:30',1,2,1153478559176429569,'课程管理','/course','',NULL,'课程管理',1),(1153495768179249153,'2019-07-23 10:43:14','2019-07-23 10:43:14',1,1,1153478559176429569,'分类管理','/category','',NULL,'分类管理',1),(1153495948102307842,'2019-07-23 10:43:57','2019-07-23 10:43:57',1,2,1153495582782623746,'课程列表','/course/course/course','/course/pc/course/list',NULL,'课程列表',2),(1153496094022144002,'2019-07-23 10:44:32','2019-07-23 10:44:32',1,1,1153495582782623746,'课程审核列表','/course/course/audit','/course/pc/course/audit/list',NULL,'课程审核列表',2),(1153496241066053634,'2019-07-23 10:45:07','2019-07-23 10:45:07',1,1,1153495768179249153,'分类列表','/course/category/category','/course/pc/course/category/list',NULL,'分类列表',2),(1153496406875279362,'2019-07-23 10:45:46','2019-07-23 10:45:46',1,2,1153478694937661442,'讲师管理','/lecturer','',NULL,'讲师管理',1),(1153496706587660289,'2019-07-23 10:46:58','2019-07-23 10:46:58',1,1,1153478694937661442,'讲师分润','/profit','',NULL,'讲师分润',1),(1153496795896975361,'2019-07-23 10:47:19','2019-07-23 10:47:19',1,2,1153496406875279362,'讲师列表','/lecturer/lecturer/lecturer','/user/pc/lecturer/list',NULL,'讲师列表',2),(1153497106191585282,'2019-07-23 10:48:33','2019-07-23 10:48:33',1,1,1153496406875279362,'讲师审核列表','/lecturer/lecturer/audit','/user/pc/lecturer/audit/list',NULL,'讲师审核列表',2),(1153497221941792770,'2019-07-23 10:49:01','2019-07-23 10:49:01',1,1,1153496706587660289,'分润列表','/lecturer/profit/profit','/user/pc/lecturer/profit/list',NULL,'分润列表',2),(1153498121905213442,'2019-07-23 10:52:35','2019-07-23 10:52:35',1,5,1153478911053369345,'权限管理','/pms','',NULL,'权限管理',1),(1153498480237187073,'2019-07-23 10:54:01','2019-07-23 10:54:01',1,3,1153478911053369345,'站点管理','/website','',NULL,'站点管理',1),(1153498652677607425,'2019-07-23 10:54:42','2019-07-23 10:54:42',1,2,1153478911053369345,'平台管理','/platform','',NULL,'平台管理',1),(1153498794638020609,'2019-07-23 10:55:16','2019-07-23 10:55:16',1,1,1153478911053369345,'日志查看','/log','',NULL,'日志查看',1),(1153498940276838401,'2019-07-23 10:55:50','2019-07-23 10:55:50',1,3,1153498121905213442,'用户管理','/sys/pms/user','/system/pc/sys/user/list',NULL,'用户管理',2),(1153499292782923778,'2019-07-23 10:57:14','2019-07-23 10:57:14',1,2,1153498121905213442,'角色管理','/sys/pms/role','/system/pc/sys/role/list',NULL,'角色管理',2),(1153499423880089601,'2019-07-23 10:57:46','2019-07-23 10:57:46',1,1,1153498121905213442,'菜单管理','/sys/pms/menu','/system/pc/menu/list',NULL,'菜单管理',2),(1153500580878848001,'2019-07-23 11:02:21','2019-07-23 11:02:21',1,5,1153498480237187073,'站点设置','/sys/website/website','/system/pc/website/view',NULL,'站点设置',2),(1153500772986359810,'2019-07-23 11:03:07','2019-07-23 11:03:07',1,2,1153498480237187073,'系统设置','/sys/website/sys','/system/pc/sys/view',NULL,'系统设置',2),(1153501173945044993,'2019-07-23 11:04:43','2019-07-23 11:04:43',1,1,1153498652677607425,'应用管理','/sys/platform/platform','/user/pc/platform/list',NULL,'应用管理',2),(1153501424605040641,'2019-07-23 11:05:43','2019-07-23 11:05:43',1,2,1153498794638020609,'操作日志','/sys/log/sys','/system/pc/sys/log/list',NULL,'操作日志',2),(1153501541194108929,'2019-07-23 11:06:10','2019-07-23 11:06:10',1,1,1153498794638020609,'支付日志','/sys/log/orderPay','/course/pc/order/pay/list',NULL,'支付日志',2),(1154683387156230146,'2019-07-26 17:22:25','2019-07-26 17:22:25',1,1,1153493010483089409,'订单查看','','/course/pc/order/info/view',NULL,'订单查看',3),(1154683761573359618,'2019-07-26 17:23:54','2019-07-26 17:23:54',1,1,1153493010483089409,'统计订单收入情况','','/course/pc/order/info/statistical',NULL,NULL,3),(1156030262547324930,'2019-07-30 10:34:26','2019-07-30 10:34:26',1,1,1153493835884367873,'添加','','/course/pc/adv/add',NULL,'跳添加页面弹窗',3),(1156030361037971458,'2019-07-30 10:34:49','2019-07-30 10:34:49',1,1,1153493835884367873,'保存','','/course/pc/adv/save',NULL,'保存接口',3),(1156030992003899394,'2019-07-30 10:37:20','2019-07-30 10:37:20',1,1,1153493835884367873,'更新','','/course/pc/adv/update',NULL,'更新接口',3),(1156032108988997634,'2019-07-30 10:41:46','2019-07-30 10:41:46',1,1,1153494438295474177,'添加','','/course/pc/zone/add',NULL,'添加页面',3),(1156032296088510465,'2019-07-30 10:42:31','2019-07-30 10:42:31',1,1,1153494438295474177,'保存','','/course/pc/zone/save',NULL,'保存接口',3),(1156032474489036801,'2019-07-30 10:43:13','2019-07-30 10:43:13',1,1,1153494438295474177,'删除','','/course/pc/zone/delete',NULL,'删除',3),(1156033449756991490,'2019-07-30 10:47:06','2019-07-30 10:47:06',1,1,1153494438295474177,'修改','','/course/pc/zone/view',NULL,'修改页面',3),(1156033853009960961,'2019-07-30 10:48:42','2019-07-30 10:48:42',1,1,1153494438295474177,'更新','','/course/pc/zone/update',NULL,'更新接口',3),(1156035023040421889,'2019-07-30 10:53:21','2019-07-30 10:53:21',1,1,1153494438295474177,'专区课程',NULL,'/course/pc/zone/course/list',NULL,'专区课程新窗口打开',3),(1156035443800416257,'2019-07-30 10:55:01','2019-07-30 10:55:01',1,1,1156035023040421889,'添加','','/course/pc/course/list',NULL,'添加课程列出接口',3),(1156035689204948994,'2019-07-30 10:56:00','2019-07-30 10:56:00',1,1,1156035023040421889,'保存','','/course/pc/zone/course/save',NULL,'保存添加',3),(1156036045850812417,'2019-07-30 10:57:25','2019-07-30 10:57:25',1,1,1156035023040421889,'删除','','/course/pc/zone/course/delete',NULL,'专区课程删除接口',3),(1156036539059019777,'2019-07-30 10:59:22','2019-07-30 10:59:22',1,1,1156035023040421889,'修改','','/course/pc/zone/course/edit',NULL,'修改弹窗页面',3),(1156036653299277825,'2019-07-30 10:59:49','2019-07-30 10:59:49',1,1,1156035023040421889,'更新','','/course/pc/zone/course/update',NULL,'专区课程接口',3),(1156036831607529473,'2019-07-30 11:00:32','2019-07-30 11:00:32',1,1,1153493835884367873,'修改','','/course/pc/adv/edit',NULL,'修改页面弹窗',3),(1156037020263129089,'2019-07-30 11:01:17','2019-07-30 11:01:17',1,1,1153493835884367873,'删除','','/course/pc/zone/delete',NULL,'删除接口',3),(1156039623340466178,'2019-07-30 11:11:38','2019-07-30 11:11:38',1,1,1153494935626682369,'添加','','/system/pc/nav/bar/add',NULL,'添加弹窗',3),(1156039959035781122,'2019-07-30 11:12:58','2019-07-30 11:12:58',1,1,1153494935626682369,'保存','','/system/pc/nav/bar/save',NULL,'保存接口',3),(1156040289144283137,'2019-07-30 11:14:16','2019-07-30 11:14:16',1,1,1153494935626682369,'删除','','/system/pc/nav/bar/delete',NULL,'删除接口',3),(1156040630476742658,'2019-07-30 11:15:38','2019-07-30 11:15:38',1,1,1153494935626682369,'修改','','/system/pc/nav/bar/edit',NULL,'修改弹窗',3),(1156040868612546562,'2019-07-30 11:16:34','2019-07-30 11:16:34',1,1,1153494935626682369,'更新','','/system/pc/nav/bar/update',NULL,'更新接口',3),(1156041685298061313,'2019-07-30 11:19:49','2019-07-30 11:19:49',1,7,1153495031810461697,'添加','','/system/pc/website/nav/add',NULL,'添加弹窗',3),(1156042299306418177,'2019-07-30 11:22:16','2019-07-30 11:22:16',1,6,1153495031810461697,'保存','','/system/pc/website/nav/save',NULL,'保存接口',3),(1156042595428474882,'2019-07-30 11:23:26','2019-07-30 11:23:26',1,5,1153495031810461697,'删除','','/system/pc/website/nav/delete',NULL,'删除',3),(1156043168856940545,'2019-07-30 11:25:43','2019-07-30 11:25:43',1,4,1153495031810461697,'修改','','/system/pc/website/nav/edit',NULL,'修改弹窗',3),(1156043234770427905,'2019-07-30 11:25:59','2019-07-30 11:25:59',1,3,1153495031810461697,'更新','','/system/pc/website/nav/update',NULL,'更新接口',3),(1156045293838147585,'2019-07-30 11:34:10','2019-07-30 11:34:10',1,2,1153495031810461697,'文章管理',NULL,'/system/pc/website/nav/article/view',NULL,'文章管理新窗口',3),(1156099141575385090,'2019-07-30 15:08:08','2019-07-30 15:08:08',1,1,1153495155055890433,'添加','','/system/pc/website/link/add',NULL,'添加弹窗',3),(1156099301554528257,'2019-07-30 15:08:46','2019-07-30 15:08:46',1,1,1153495155055890433,'保存','','/system/pc/website/link/save',NULL,'保存接口',3),(1156099420307857410,'2019-07-30 15:09:14','2019-07-30 15:09:14',1,1,1153495155055890433,'删除','','/system/pc/website/link/delete',NULL,'删除接口',3),(1156099620929806338,'2019-07-30 15:10:02','2019-07-30 15:10:02',1,1,1153495155055890433,'修改','','/system/pc/website/link/edit',NULL,'修改弹窗',3),(1156099736667430914,'2019-07-30 15:10:30','2019-07-30 15:10:30',1,1,1153495155055890433,'更新','','/system/pc/website/link/update',NULL,'更新接口',3),(1156102063474352129,'2019-07-30 15:19:44','2019-07-30 15:19:44',1,1,1153495948102307842,'修改','','/course/pc/course/get',NULL,'修改弹窗',3),(1156102212472807425,'2019-07-30 15:20:20','2019-07-30 15:20:20',1,1,1153495948102307842,'更新','','/course/pc/course/update',NULL,'更新接口',3),(1156106290552643585,'2019-07-30 15:36:32','2019-07-30 15:36:32',1,1,1153496094022144002,'修改、审核','','/course/pc/course/audit/view',NULL,'修改、弹窗',3),(1156106778274701314,'2019-07-30 15:38:29','2019-07-30 15:38:29',1,1,1153496094022144002,'审核课程','','/course/pc/course/audit/audit',NULL,'审核课程',3),(1156106947468730369,'2019-07-30 15:39:09','2019-07-30 15:39:09',1,1,1153496094022144002,'更新','','/course/pc/course/audit/update',NULL,'更新',3),(1156389609588662274,'2019-07-31 10:22:21','2019-07-31 10:22:21',1,1,1153496241066053634,'添加','','/course/pc/course/category/add',NULL,'添加弹窗',3),(1156389834885701634,'2019-07-31 10:23:15','2019-07-31 10:23:15',1,1,1153496241066053634,'保存','','/course/pc/course/category/save',NULL,'保存接口',3),(1156390300390531073,'2019-07-31 10:25:06','2019-07-31 10:25:06',1,1,1153496241066053634,'修改','','/course/pc/course/category/view',NULL,'修改弹窗',3),(1156390387736911873,'2019-07-31 10:25:26','2019-07-31 10:25:26',1,1,1153496241066053634,'更新','','/course/pc/course/category/update',NULL,'更新',3),(1156390708198514689,'2019-07-31 10:26:43','2019-07-31 10:26:43',1,1,1153496241066053634,'删除','','/course/pc/course/category/delete',NULL,'删除',3),(1156393404230017026,'2019-07-31 10:37:26','2019-07-31 10:37:26',1,1,1153496795896975361,'修改','','/user/pc/lecturer/view',NULL,'修改、查看、设置分成弹窗',3),(1156393596735987714,'2019-07-31 10:38:11','2019-07-31 10:38:11',1,1,1153496795896975361,'更新','','/user/pc/lecturer/update',NULL,'更新',3),(1156394505545195522,'2019-07-31 10:41:48','2019-07-31 10:41:48',1,1,1153497106191585282,'添加','','/user/pc/lecturer/audit/add',NULL,'添加弹窗',3),(1156395045071101953,'2019-07-31 10:43:57','2019-07-31 10:43:57',1,1,1153497106191585282,'保存','','/user/pc/lecturer/audit/save',NULL,'保存接口',3),(1156395484629966849,'2019-07-31 10:45:42','2019-07-31 10:45:42',1,1,1153497106191585282,'修改','','/user/pc/lecturer/audit/view',NULL,'修改、查看弹窗',3),(1156395794031190017,'2019-07-31 10:46:55','2019-07-31 10:46:55',1,1,1153497106191585282,'校验讲师是否存在','','/user/pc/lecturer/audit/check',NULL,'校验讲师是否存在',3),(1156395965360119810,'2019-07-31 10:47:36','2019-07-31 10:47:36',1,1,1153497106191585282,'更新','','/user/pc/lecturer/audit/update',NULL,'更新弹窗',3),(1156396502923091970,'2019-07-31 10:49:44','2019-07-31 10:49:44',1,1,1153497106191585282,'审核页面','','/user/pc/lecturer/audit/isAudit',NULL,'审核弹窗',3),(1156396635052056577,'2019-07-31 10:50:16','2019-07-31 10:50:16',1,1,1153497106191585282,'审核更新','','/user/pc/lecturer/audit/audit',NULL,'审核更新',3),(1156452734279098369,'2019-07-31 14:33:11','2019-07-31 14:33:11',1,1,1153497221941792770,'批量标记为已打款','','/user/pc/lecturer/profit/batch',NULL,'批量标记为已打款',3),(1156453190803922945,'2019-07-31 14:35:00','2019-07-31 14:35:00',1,1,1153497221941792770,'打款跳页面','','/user/pc/lecturer/profit/edit',NULL,'打款跳页面',3),(1156453747622944769,'2019-07-31 14:37:13','2019-07-31 14:37:13',1,1,1153497221941792770,'更新讲师打款状态','','/user/pc/lecturer/profit/update',NULL,'更新讲师打款状态',3),(1156467834150985729,'2019-07-31 15:33:11','2019-07-31 15:33:11',1,1,1153498940276838401,'添加','','/system/pc/sys/user/add',NULL,'添加弹窗',3),(1156467976803459073,'2019-07-31 15:33:45','2019-07-31 15:33:45',1,1,1153498940276838401,'保存','','/system/pc/sys/user/save',NULL,'保存接口',3),(1156468115706224642,'2019-07-31 15:34:18','2019-07-31 15:34:18',1,1,1153498940276838401,'删除','','/system/pc/sys/user/delete',NULL,'删除接口',3),(1156471160762540033,'2019-07-31 15:46:24','2019-07-31 15:46:24',1,1,1153498940276838401,'修改','','/system/pc/sys/user/view',NULL,'修改弹窗',3),(1156471428245889026,'2019-07-31 15:47:28','2019-07-31 15:47:28',1,1,1153498940276838401,'更新','','/system/pc/sys/user/update',NULL,'更新接口',3),(1156471546990829570,'2019-07-31 15:47:56','2019-07-31 15:47:56',1,1,1153498940276838401,'更新密码弹窗','','/system/pc/sys/user/password',NULL,'更新密码弹窗',3),(1156471749651210241,'2019-07-31 15:48:45','2019-07-31 15:48:45',1,1,1153498940276838401,'更新密码','','/system/pc/sys/user/update/password',NULL,'更新密码接口',3),(1156472210034794497,'2019-07-31 15:50:34','2019-07-31 15:50:34',1,1,1153498940276838401,'设置角色','','/system/pc/sys/role/list',NULL,'设置角色弹窗',3),(1156472470257803266,'2019-07-31 15:51:36','2019-07-31 15:51:36',1,1,1153498940276838401,'保存用户角色','','/system/pc/sys/role/user/save',NULL,'保存用户角色接口',3),(1156472761619324929,'2019-07-31 15:52:46','2019-07-31 15:52:46',1,1,1153498940276838401,'用户关联的角色','','/system/pc/sys/role/user/list',NULL,'获取用户关联的角色',3),(1156473195461353473,'2019-07-31 15:54:29','2019-07-31 15:54:29',1,1,1153498940276838401,'列出用户','','/user/pc/user/list',NULL,'列出用户',3),(1156473846425722881,'2019-07-31 15:57:04','2019-07-31 15:57:04',1,1,1153499292782923778,'添加','','/system/pc/sys/role/add',NULL,'添加弹窗',3),(1156473962389839874,'2019-07-31 15:57:32','2019-07-31 15:57:32',1,1,1153499292782923778,'保存','','/system/pc/sys/role/save',NULL,'保存接口',3),(1156474159387910146,'2019-07-31 15:58:19','2019-07-31 15:58:19',1,1,1153499292782923778,'删除','','/system/pc/sys/role/delete',NULL,'删除接口',3),(1156475549820657665,'2019-07-31 16:03:51','2019-07-31 16:03:51',1,1,1153499292782923778,'修改','','/system/pc/sys/role/view',NULL,'修改修改弹窗',3),(1156475705584525314,'2019-07-31 16:04:28','2019-07-31 16:04:28',1,1,1153499292782923778,'更新','','/system/pc/sys/role/update',NULL,'更新接口',3),(1156475975043391490,'2019-07-31 16:05:32','2019-07-31 16:05:32',1,1,1153499292782923778,'设置权限','','/system/pc/menu/list',NULL,'设置权限弹窗',3),(1156476159274000386,'2019-07-31 16:06:16','2019-07-31 16:06:16',1,1,1153499292782923778,'菜单角色关联','','/system/pc/menu/role/list',NULL,'菜单角色关联',3),(1156476414988132353,'2019-07-31 16:07:17','2019-07-31 16:07:17',1,1,1153499292782923778,'保存角色菜单关联','','/system/pc/menu/role/save',NULL,'角色菜单关联接口',3),(1156477233678524418,'2019-07-31 16:10:32','2019-07-31 16:10:32',1,1,1153499423880089601,'添加','','/system/pc/menu/add',NULL,'添加弹窗',3),(1156477357225943042,'2019-07-31 16:11:01','2019-07-31 16:11:01',1,1,1153499423880089601,'保存','','/system/pc/menu/save',NULL,'保存接口',3),(1156477431565787138,'2019-07-31 16:11:19','2019-07-31 16:11:19',1,1,1153499423880089601,'删除','','/system/pc/menu/delete',NULL,'删除接口',3),(1156478453679923201,'2019-07-31 16:15:23','2019-07-31 16:15:23',1,1,1153499423880089601,'修改','','/system/pc/menu/view',NULL,'修改弹窗',3),(1156478738817097730,'2019-07-31 16:16:31','2019-07-31 16:16:31',1,1,1153499423880089601,'更新','','/system/pc/menu/update',NULL,'更新',3),(1156763603487694849,'2019-08-01 11:08:28','2019-08-01 11:08:28',1,1,1153501173945044993,'添加','','/user/pc/platform/add',NULL,'添加弹窗',3),(1156763684647477250,'2019-08-01 11:08:47','2019-08-01 11:08:47',1,1,1153501173945044993,'保存','','/user/pc/platform/save',NULL,'保存接口',3),(1156763793531609089,'2019-08-01 11:09:13','2019-08-01 11:09:13',1,1,1153501173945044993,'修改','','/user/pc/platform/view',NULL,'修改、查看弹窗',3),(1156763879334486018,'2019-08-01 11:09:34','2019-08-01 11:09:34',1,1,1153501173945044993,'更新','','/user/pc/platform/update',NULL,'更新',3),(1156766341252521985,'2019-08-01 11:19:21','2019-08-01 11:19:21',1,1,1153493010483089409,'讲师查看','','/user/pc/lecturer/view',NULL,'讲师查看',3),(1156767833694937090,'2019-08-01 11:25:16','2019-08-01 11:25:16',1,1,1153493010483089409,'更新备注','','/course/pc/order/info/update',NULL,'更新接口',3),(1156770628078673921,'2019-08-01 11:36:23','2019-08-01 11:36:23',1,1,1153498480237187073,'系统更新','','/system/pc/sys/update',NULL,'系统更新接口',3),(1156770804654678017,'2019-08-01 11:37:05','2019-08-01 11:37:05',1,4,1153498480237187073,'站点富文本上传图片','','/course/pc/upload/pic',NULL,'站点富文本上传图片接口',3),(1156770958275256321,'2019-08-01 11:37:41','2019-08-01 11:37:41',1,3,1153498480237187073,'站点更新','','/system/pc/website/update',NULL,'站点更新接口',3),(1156771497591447553,'2019-08-01 11:39:50','2019-08-01 11:39:50',1,1,1153495031810461697,'导航文章更新','','/system/pc/website/nav/article/update',NULL,'导航文章更新',3),(1156846769674223617,'2019-08-01 16:38:56','2019-08-01 16:38:56',1,7,0,'首页','dashboard','',NULL,'首页',1),(1158305741493071874,'2019-08-05 17:16:22','2019-08-05 17:16:22',1,1,1153493010483089409,'用户查看','','/user/pc/user/ext/view',NULL,'用户查看',3),(1158310111785873409,'2019-08-05 17:33:44','2019-08-05 17:33:44',1,1,1153493010483089409,'修改备注',NULL,'/course/pc/order/info/edit',NULL,'修改备注',3),(1158323404529299458,'2019-08-05 18:26:33','2019-08-05 18:26:33',1,1,1153501173945044993,'删除','','/user/pc/platform/delete',NULL,'删除接口',3),(1160850528846749698,'2019-08-12 17:48:27','2019-08-12 17:48:27',1,1,1153478801917579265,'学员列表','/user/ext','/user/pc/user/ext/list',NULL,'学员列表',2),(1160851003339972610,'2019-08-12 17:50:20','2019-08-12 17:50:20',1,1,1160850528846749698,'修改','','/user/pc/user/ext/view',NULL,'修改、查看弹窗',3),(1160851295330639874,'2019-08-12 17:51:29','2019-08-12 17:51:29',1,1,1160850528846749698,'更新','','/user/pc/user/ext/update',NULL,'更新接口',3),(1160851552827351041,'2019-08-12 17:52:31','2019-08-12 17:52:31',1,1,1160850528846749698,'学习记录','/user/ext/studyLog','/course/pc/course/user/study/log/list',NULL,'用户学习记录',3);

#
# Structure for table "sys_menu_role"
#

CREATE TABLE `sys_menu_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `menu_id` bigint(20) unsigned NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1160853765293350915 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单角色关联表';

#
# Data for table "sys_menu_role"
#

INSERT INTO `sys_menu_role` VALUES (1160853719512522754,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156846769674223617,1),(1160853719520911362,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153478139284656129,1),(1160853719529299970,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153493010483089409,1),(1160853719533494274,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1158310111785873409,1),(1160853719537688577,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1158305741493071874,1),(1160853719546077185,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156767833694937090,1),(1160853719550271489,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156766341252521985,1),(1160853719554465794,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1154683761573359618,1),(1160853719558660097,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1154683387156230146,1),(1160853719567048706,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153478416205189122,1),(1160853719571243009,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153493592497295362,1),(1160853719575437314,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153493835884367873,1),(1160853719579631618,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156037020263129089,1),(1160853719588020225,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156036831607529473,1),(1160853719592214530,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156030992003899394,1),(1160853719600603137,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156030361037971458,1),(1160853719608991745,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156030262547324930,1),(1160853719613186050,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153494219218587650,1),(1160853719621574658,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153494438295474177,1),(1160853719625768961,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156035023040421889,1),(1160853719625768962,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156036653299277825,1),(1160853719625768963,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156036539059019777,1),(1160853719625768964,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156036045850812417,1),(1160853719625768965,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156035689204948994,1),(1160853719642546177,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156035443800416257,1),(1160853719650934785,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156033853009960961,1),(1160853719655129090,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156033449756991490,1),(1160853719659323394,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156032474489036801,1),(1160853719663517698,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156032296088510465,1),(1160853719667712001,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156032108988997634,1),(1160853719671906305,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153494698514288641,1),(1160853719671906306,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153494935626682369,1),(1160853719671906307,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156040868612546562,1),(1160853719671906308,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156040630476742658,1),(1160853719671906309,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156040289144283137,1),(1160853719671906310,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156039959035781122,1),(1160853719671906311,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156039623340466178,1),(1160853719671906312,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153495031810461697,1),(1160853719671906313,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156041685298061313,1),(1160853719671906314,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156042299306418177,1),(1160853719671906315,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156042595428474882,1),(1160853719718043649,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156043168856940545,1),(1160853719718043650,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156043234770427905,1),(1160853719718043651,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156045293838147585,1),(1160853719718043652,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156771497591447553,1),(1160853719718043653,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153495155055890433,1),(1160853719718043654,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156099736667430914,1),(1160853719718043655,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156099620929806338,1),(1160853719718043656,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156099420307857410,1),(1160853719718043657,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156099301554528257,1),(1160853719755792385,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156099141575385090,1),(1160853719755792386,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153478559176429569,1),(1160853719755792387,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153495582782623746,1),(1160853719755792388,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153495948102307842,1),(1160853719755792389,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156102212472807425,1),(1160853719755792390,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156102063474352129,1),(1160853719780958209,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153496094022144002,1),(1160853719785152514,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156106947468730369,1),(1160853719789346818,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156106778274701314,1),(1160853719793541122,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156106290552643585,1),(1160853719797735426,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153495768179249153,1),(1160853719801929729,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153496241066053634,1),(1160853719806124033,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156390708198514689,1),(1160853719810318338,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156390387736911873,1),(1160853719814512642,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156390300390531073,1),(1160853719818706945,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156389834885701634,1),(1160853719822901250,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156389609588662274,1),(1160853719827095553,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153478694937661442,1),(1160853719831289857,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153496406875279362,1),(1160853719835484161,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153496795896975361,1),(1160853719839678465,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156393596735987714,1),(1160853719843872769,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156393404230017026,1),(1160853719848067074,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153497106191585282,1),(1160853719852261377,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156396635052056577,1),(1160853719856455682,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156396502923091970,1),(1160853719860649986,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156395965360119810,1),(1160853719864844289,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156395794031190017,1),(1160853719869038593,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156395484629966849,1),(1160853719873232897,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156395045071101953,1),(1160853719877427201,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156394505545195522,1),(1160853719881621506,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153496706587660289,1),(1160853719885815809,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153497221941792770,1),(1160853719885815810,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156453747622944769,1),(1160853719890010114,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156453190803922945,1),(1160853719894204417,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156452734279098369,1),(1160853719898398721,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153478801917579265,1),(1160853719902593025,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1160850528846749698,1),(1160853719906787329,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1160851552827351041,1),(1160853719910981633,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1160851295330639874,1),(1160853719915175938,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1160851003339972610,1),(1160853719919370242,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153478911053369345,1),(1160853719923564545,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153498121905213442,1),(1160853719927758850,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153498940276838401,1),(1160853719931953154,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156473195461353473,1),(1160853719936147457,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156472761619324929,1),(1160853719940341762,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156472470257803266,1),(1160853719944536065,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156472210034794497,1),(1160853719952924673,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156471749651210241,1),(1160853719957118977,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156471546990829570,1),(1160853719957118978,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156471428245889026,1),(1160853719961313281,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156471160762540033,1),(1160853719965507586,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156468115706224642,1),(1160853719969701890,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156467976803459073,1),(1160853719973896194,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156467834150985729,1),(1160853719978090497,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153499292782923778,1),(1160853719982284801,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156476414988132353,1),(1160853719986479106,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156476159274000386,1),(1160853719990673409,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156475975043391490,1),(1160853719994867714,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156475705584525314,1),(1160853719999062018,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156475549820657665,1),(1160853720003256322,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156474159387910146,1),(1160853720007450625,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156473962389839874,1),(1160853720007450626,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156473846425722881,1),(1160853720007450627,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153499423880089601,1),(1160853720007450628,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156478738817097730,1),(1160853720024227841,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156478453679923201,1),(1160853720028422145,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156477431565787138,1),(1160853720032616449,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156477357225943042,1),(1160853720036810753,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156477233678524418,1),(1160853720041005058,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153498480237187073,1),(1160853720061976578,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153500580878848001,1),(1160853720066170881,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156770804654678017,1),(1160853720078753793,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156770958275256321,1),(1160853720082948097,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153500772986359810,1),(1160853720087142402,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156770628078673921,1),(1160853720095531010,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153498652677607425,1),(1160853720099725314,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153501173945044993,1),(1160853720103919618,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1158323404529299458,1),(1160853720108113922,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156763879334486018,1),(1160853720112308225,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156763793531609089,1),(1160853720116502530,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156763684647477250,1),(1160853720120696833,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1156763603487694849,1),(1160853720124891137,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153498794638020609,1),(1160853720129085441,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153501424605040641,1),(1160853720133279745,'2019-08-12 18:01:07','2019-08-12 18:01:07',1,1,1153501541194108929,1),(1160853764957806594,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156846769674223617,3),(1160853764962000897,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1158310111785873409,3),(1160853764966195201,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1158305741493071874,3),(1160853764970389506,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156766341252521985,3),(1160853764974583810,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1154683761573359618,3),(1160853764978778114,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1154683387156230146,3),(1160853764982972417,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156036831607529473,3),(1160853764987166722,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156030262547324930,3),(1160853764991361026,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156036539059019777,3),(1160853764995555330,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156035443800416257,3),(1160853764999749634,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156033449756991490,3),(1160853765003943938,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156032108988997634,3),(1160853765008138241,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156040630476742658,3),(1160853765012332546,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156039623340466178,3),(1160853765016526849,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156041685298061313,3),(1160853765020721153,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156043168856940545,3),(1160853765024915457,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156045293838147585,3),(1160853765024915458,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156099620929806338,3),(1160853765029109761,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156099141575385090,3),(1160853765033304065,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156102063474352129,3),(1160853765037498370,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156106290552643585,3),(1160853765041692673,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156390300390531073,3),(1160853765045886977,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156389609588662274,3),(1160853765050081281,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156393404230017026,3),(1160853765054275586,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156396502923091970,3),(1160853765058469890,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156395794031190017,3),(1160853765062664194,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156395484629966849,3),(1160853765066858497,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156394505545195522,3),(1160853765071052801,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156453190803922945,3),(1160853765071052802,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1160851552827351041,3),(1160853765075247106,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1160851003339972610,3),(1160853765079441410,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156473195461353473,3),(1160853765083635714,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156472761619324929,3),(1160853765087830018,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156472210034794497,3),(1160853765092024322,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156471546990829570,3),(1160853765096218626,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156471160762540033,3),(1160853765100412930,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156467834150985729,3),(1160853765104607234,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156476159274000386,3),(1160853765108801538,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156475975043391490,3),(1160853765112995841,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156475549820657665,3),(1160853765117190146,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156473846425722881,3),(1160853765121384450,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156478453679923201,3),(1160853765125578753,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156477233678524418,3),(1160853765129773057,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153500580878848001,3),(1160853765133967361,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153500772986359810,3),(1160853765138161665,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156763793531609089,3),(1160853765142355969,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156763603487694849,3),(1160853765146550273,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153498794638020609,3),(1160853765150744577,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153501424605040641,3),(1160853765154938881,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153501541194108929,3),(1160853765159133185,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153478139284656129,3),(1160853765167521794,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153493010483089409,3),(1160853765171716098,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153478416205189122,3),(1160853765175910401,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153493592497295362,3),(1160853765180104705,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153493835884367873,3),(1160853765184299010,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153494219218587650,3),(1160853765184299011,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153494438295474177,3),(1160853765188493314,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1156035023040421889,3),(1160853765192687617,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153494698514288641,3),(1160853765196881922,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153494935626682369,3),(1160853765201076226,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153495031810461697,3),(1160853765205270530,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153495155055890433,3),(1160853765209464833,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153478559176429569,3),(1160853765213659138,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153495582782623746,3),(1160853765217853442,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153495948102307842,3),(1160853765222047745,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153496094022144002,3),(1160853765226242050,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153495768179249153,3),(1160853765230436353,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153496241066053634,3),(1160853765234630657,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153478694937661442,3),(1160853765238824961,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153496406875279362,3),(1160853765243019265,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153496795896975361,3),(1160853765247213570,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153497106191585282,3),(1160853765251407873,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153496706587660289,3),(1160853765255602177,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153497221941792770,3),(1160853765259796481,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153478801917579265,3),(1160853765259796482,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1160850528846749698,3),(1160853765263990785,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153478911053369345,3),(1160853765268185089,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153498121905213442,3),(1160853765272379393,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153498940276838401,3),(1160853765276573698,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153499292782923778,3),(1160853765280768001,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153499423880089601,3),(1160853765284962305,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153498480237187073,3),(1160853765289156610,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153498652677607425,3),(1160853765293350914,'2019-08-12 18:01:18','2019-08-12 18:01:18',1,1,1153501173945044993,3);

#
# Structure for table "sys_role"
#

CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `role_name` varchar(50) NOT NULL COMMENT '名称',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色信息';

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES (1,'2018-02-06 15:47:52','2018-03-30 15:12:07',1,2,'超级管理员','管理后台全部权限'),(3,'2018-12-28 18:23:38','2018-12-28 18:23:38',1,1,'测试人员','该用户仅有查看功能');

#
# Structure for table "sys_role_user"
#

CREATE TABLE `sys_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1145889062897147907 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色用户关联表';

#
# Data for table "sys_role_user"
#

INSERT INTO `sys_role_user` VALUES (1145639840180342785,'2019-07-01 18:28:22','2019-07-01 18:28:22',1,1,1,1),(1145639840188731394,'2019-07-01 18:28:22','2019-07-01 18:28:22',1,1,3,1),(1145889062897147906,'2019-07-02 10:58:42','2019-07-02 10:58:42',1,1,3,2);

#
# Structure for table "sys_user"
#

CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `user_no` bigint(20) NOT NULL COMMENT '用户编号',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `AK_phone` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='后台用户信息';

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES (1,'2018-03-31 11:22:37','2018-05-10 15:28:40',1,1,2018033111202589416,'18800000000','超级管理员','超级管理员'),(2,'2018-12-28 16:57:47','2018-12-28 16:57:47',1,1,2018112209531803,'13800000000','普通用户','测试demo用户');

#
# Structure for table "website"
#

CREATE TABLE `website` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `logo_ico` varchar(255) DEFAULT NULL COMMENT 'org_logo_ico',
  `logo_img` varchar(255) DEFAULT NULL COMMENT 'org_logo_img',
  `website_title` varchar(255) DEFAULT NULL COMMENT '站点标题',
  `website_keyword` varchar(255) DEFAULT NULL COMMENT '站点关键词',
  `website_desc` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `copyright` varchar(255) DEFAULT NULL COMMENT '站点版权',
  `icp` varchar(255) DEFAULT NULL COMMENT '备案号',
  `prn` varchar(255) DEFAULT NULL COMMENT '公安备案号',
  `weixin` varchar(255) DEFAULT NULL COMMENT '站点微信',
  `weixin_xcx` varchar(255) DEFAULT NULL COMMENT '小程序二维码',
  `weibo` varchar(255) DEFAULT NULL COMMENT '站点微博',
  `is_enable_statistics` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启统计',
  `statistics_code` varchar(255) DEFAULT NULL COMMENT '统计代码',
  `is_show_service` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示客服信息',
  `service1` varchar(50) DEFAULT NULL COMMENT '客服信息1',
  `service2` varchar(50) DEFAULT NULL COMMENT '客服信息2',
  `user_agreement` text COMMENT '用户协议',
  `recruit_title` varchar(255) DEFAULT '' COMMENT '招募标题',
  `recruit_info` text COMMENT '招募信息',
  `entry_agreement` text COMMENT '入驻协议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点信息';

#
# Data for table "website"
#

INSERT INTO `website` VALUES (934374967448227841,'2018-11-09 17:36:44','1899-12-30 01:00:00',1,1,'http://static-dev.roncoo.com/system/d73a99a804a14f0d8ddb2c2f6fd80e39.ico','http://static-dev.roncoo.com/system/028912caa6af43f1be9929c60e093d84.png','领课教育-1','领课教育-2','领课教育-3','Copyright &copy; 2018-2023 领课教育 版权所有','粤ICP备号-1','粤公网安备号','http://static-dev.roncoo.com/system/e66eedab4c6641a19fe74a55a47a4d76.jpg','http://static-dev.roncoo.com/system/d1abbf37031a470dab1ce7b2ca641d55.jpg','',1,'',1,'297115770','3155237748','领课网络','','领课网络','领课网络');

#
# Structure for table "website_link"
#

CREATE TABLE `website_link` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `link_name` varchar(50) NOT NULL COMMENT '名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接',
  `link_target` varchar(50) NOT NULL COMMENT '跳转方式(_blank，_self)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点友情链接';

#
# Data for table "website_link"
#

INSERT INTO `website_link` VALUES (1060350851601158145,'2018-11-08 09:59:52','2018-11-08 09:59:52',1,1,'龙果学院','https://www.roncoo.com','_blank'),(1060353540380708865,'2018-11-08 10:10:33','2018-11-08 10:10:33',1,1,'领课网络','http://www.roncoo.net/','_blank');

#
# Structure for table "website_nav"
#

CREATE TABLE `website_nav` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `parent_id` bigint(20) unsigned NOT NULL COMMENT '父ID',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点导航';

#
# Data for table "website_nav"
#

INSERT INTO `website_nav` VALUES (1060100633685209089,'2018-11-07 17:25:36','2018-11-07 17:25:36',1,2,0,'商务合作'),(1060107291291365377,'2018-11-07 17:52:03','2018-11-07 17:52:03',1,1,1060100633685209089,'课程合作'),(1060115285643177985,'2018-11-07 18:23:49','2018-11-07 18:23:49',1,1,1060100633685209089,'项目合作'),(1060708747425882114,'2018-11-09 09:42:04','2018-11-09 09:42:04',1,1,0,'协议相关'),(1060708775632576514,'2018-11-09 09:42:11','2018-11-09 09:42:11',1,1,1060708747425882114,'用户协议'),(1080719070034886658,'2019-01-03 14:54:38','2019-01-03 14:54:38',1,1,1060708747425882114,'讲师协议');

#
# Structure for table "website_nav_article"
#

CREATE TABLE `website_nav_article` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `nav_id` bigint(20) NOT NULL COMMENT '导航ID',
  `art_title` varchar(255) NOT NULL COMMENT '文章标题',
  `art_pic` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `art_desc` text NOT NULL COMMENT '文章描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点导航文章';

#
# Data for table "website_nav_article"
#

INSERT INTO `website_nav_article` VALUES (1060123213131111,'1899-12-30 01:00:00','1899-12-30 01:00:00',1,1,1060107291291365400,'用户协议','http://static-dev.roncoo.com/course/ec0ae2ff117c4cd7b63e42c1110e25f2.png','领课网络'),(1060233213232111,'1899-12-30 01:00:00','1899-12-30 01:00:00',1,1,1060708775632576500,'平台合作','http://static-dev.roncoo.com/course/8fdd0e9ebe83416fa35e9eb8f25426b5.jpg','领课网络\n'),(1060354353322411,'1899-12-30 01:00:00','1899-12-30 01:00:00',1,1,1060115285643178000,'商务合作','http://static-dev.roncoo.com/course/b290902a59294ec1885df4a381dd51fd.jpg','领课网络'),(1060109903055106050,'2018-11-07 18:02:26','2018-11-07 18:02:26',1,1,1060107291291365377,'讲师招募','http://static-dev.roncoo.com/course/8fdd0e9ebe83416fa35e9eb8f25426b5.jpg','领课网络'),(1060342529602899969,'2018-11-08 09:26:48','2018-11-08 09:26:48',1,1,1060115285643177985,'项目合作','http://static-dev.roncoo.com/course/b290902a59294ec1885df4a381dd51fd.jpg','领课网络'),(1060708890749444097,'2018-11-09 09:42:38','2018-11-09 09:42:38',1,1,1060708775632576514,'用户协议','http://static-dev.roncoo.com/course/ec0ae2ff117c4cd7b63e42c1110e25f2.png','领课网络'),(1080719257771933698,'2019-01-03 14:55:22','2019-01-03 14:55:22',1,1,1080719070034886658,'讲师协议',NULL,'领课网络');
