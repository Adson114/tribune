drop database tribune;

CREATE database tribune default charset=utf8;
use tribune;

CREATE TABLE user (
userId INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'id',
userName VARCHAR(255) UNIQUE COMMENT '用户名',
trueName VARCHAR(255) not null COMMENT '真实姓名',
password VARCHAR(255) COMMENT '密码',
sex VARCHAR(255) COMMENT '性别',
face VARCHAR(255) DEFAULT 'head.png' COMMENT '头像',
regTime timestamp NULL DEFAULT NULL COMMENT '注册时间',
updateTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
delUserTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
email VARCHAR(255) COMMENT '邮箱',
mobile VARCHAR(255) COMMENT '手机号码',
declaration TEXT COMMENT '个性签名',
userState INT(11) DEFAULT '0' COMMENT '是否删除',
type INT(11) DEFAULT '0' COMMENT '用户类型')ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into user (userId,userName,trueName,password,sex,regTime,email,mobile,userState,type)values(1,'admin','admin','111111','男','2020-1-29','222@222.com','22222222222',0,1);
insert into user (userId,userName,trueName,password,sex,regTime,email,mobile,userState,type)values(2,'nick','张三','111111','男','2020-1-29','222@222.com','22222222222',0,0);
insert into user (userId,userName,trueName,password,sex,regTime,email,mobile,userState,type)values(3,'Mike','李四','111111','男','2020-1-29','222@222.com','22222222222',0,0);


CREATE TABLE reply(
replyId INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'id',
modifyTime timestamp NULL DEFAULT NULL COMMENT '修改时间',
publishTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
delReplyTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
topicId INT(11) COMMENT '回复的帖子id',
userId INT(11) COMMENT '答复人的id',
replyState INT(11) DEFAULT '0' COMMENT '是否删除',
content TEXT COMMENT '回复内容'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into reply(replyId,publishTime,modifyTime,topicId,userId,content) values(1,"2020-2-1","2020-2-1",2,1,"你好你家你急进");
insert into reply(replyId,publishTime,modifyTime,topicId,userId,content) values(2,"2020-2-1","2020-2-1",3,1,"驱蚊器群群群");



CREATE TABLE topic(
topicId INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'id',
content TEXT COMMENT '帖子内容',
modifyTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
delTopicTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
publishTime timestamp NULL DEFAULT NULL COMMENT '发布时间',
title VARCHAR(255) COMMENT '标题',
topUserId INT(11) COMMENT '用户id',
click INT(11) NOT NULL DEFAULT '0' COMMENT '点击量',
tabId INT(11) NOT NULL DEFAULT '0' COMMENT '发布板块',
good INT(11) not null DEFAULT '0' COMMENT '是否精华',
topicState INT(11) not null DEFAULT '0' COMMENT '是否删除'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(1,"测试语言11111111111","2020-1-30","2020-1-30","测试",1,10,1);
insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(2,"测试语言22222","2020-1-30","2020-1-30","测试2",1,10,2);
insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(3,"测试语言33333","2020-1-30","2020-1-30","测试3",1,10,3);
insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(4,"测试语言44444","2020-1-30","2020-1-30","测试4",1,10,4);
insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(5,"测试语言55555","2020-1-30","2020-1-30","测试5",1,10,5);
insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(6,"测试语言66666","2020-1-30","2020-1-30","测试6",1,10,4);
insert into topic (topicId,content,publishTime,modifyTime,title,topUserId,click,tabId) values(7,"11111111111","2020-1-30","2020-1-30","测试7",1,10,1);


CREATE TABLE tab(
tabId INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'id',
createTime timestamp NULL DEFAULT NULL COMMENT '发布时间',
delTabTime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
tabState INT(11) not null DEFAULT '0' COMMENT '是否删除',
tabName VARCHAR(255) not null UNIQUE COMMENT '板块名',
tabNameEn VARCHAR(255) UNIQUE COMMENT '板块名英文'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into tab (tabId,createTime,tabName,tabNameEn) values(1,"2019-12-12",'手机','phone');
insert into tab (tabId,createTime,tabName,tabNameEn) values(2,"2019-12-12",'电脑','computer');
insert into tab (tabId,createTime,tabName,tabNameEn) values(3,"2019-12-12",'新闻','news');
insert into tab (tabId,createTime,tabName,tabNameEn) values(4,"2019-12-12",'城市','city');
insert into tab (tabId,createTime,tabName,tabNameEn) values(5,"2019-12-12",'学习','study');