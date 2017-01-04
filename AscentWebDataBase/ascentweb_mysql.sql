DROP DATABASE IF EXISTS ascentweb;
CREATE DATABASE ascentweb DEFAULT CHARSET=gbk;

use ascentweb ;

set names gbk ;

DROP TABLE IF EXISTS mailtb;
CREATE TABLE mailtb (
  id int NOT NULL auto_increment COMMENT '电子邮件表ID',
  fromaddress varchar(50) default NULL COMMENT '发送者邮件地址',
  frompassword varchar(30) default NULL COMMENT '发送者邮件密码',
  toaddress varchar(50) default NULL COMMENT '接收者邮件地址',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='电子邮件表';

INSERT INTO mailtb VALUES(1,'admin@163.com','C2008119521','guest@163.com');

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id int NOT NULL auto_increment COMMENT '订单ID',
  ordernumber varchar(50) default NULL COMMENT '订单编号',
  usrid int default NULL COMMENT '用户ID',
  createtime datetime default NULL COMMENT '订单创建时间',
  delsoft varchar(2) default NULL COMMENT '软删除标志',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='订单表';

DROP TABLE IF EXISTS product;
CREATE TABLE product (
  id int NOT NULL auto_increment COMMENT '商品ID',
  productnumber varchar(50) default NULL COMMENT '商品编号',
  productname varchar(32) default NULL COMMENT '商品名称',
  categoryno varchar(50) default NULL COMMENT '商品分类编号',
  category varchar(32) default NULL COMMENT '商品分类名称',
  imagepath varchar(100) default NULL COMMENT '商品图片名称',
  isnewproduct varchar(2) default NULL COMMENT '是否新商品1-true,0-false',
  price1 float default NULL COMMENT '价格',
  price2 float default NULL COMMENT '会员价格',
  realstock varchar(50) default NULL COMMENT '库存量',
  stock varchar(50) default NULL COMMENT '剩余量',
  cas varchar(32) default NULL COMMENT '药品摘要',
  mdlint varchar(50) default NULL COMMENT 'mdl编号',
  formula varchar(255) default NULL COMMENT '化学方程式',
  weight varchar(50) default NULL COMMENT '重量',
  delsoft varchar(2) default NULL COMMENT '软删除标志',
  note varchar(255) default NULL COMMENT '备注',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='商品表';

INSERT INTO product VALUES (1,'101','白加黑','10','感冒药','ss.jpg','1',12.5,10.5,'123','100','177900-48-1','C12H22N2O1','C2H5OH','30g','0','good');
INSERT INTO product VALUES (2,'102','速效感冒胶囊','10','感冒药','ss.jpg','1',12.5,10.5,'123','100','177900-48-2','C12H22N2O2','NaOH Ca(OH)2 Ba(OH)2 ','30g','0','good');
INSERT INTO product VALUES (3,'111','二甲双胍片','11','西药','ss.jpg','1',12.5,10.5,'123','100','177900-48-3','C12H22N2O3','CH4 C2H2 CH3OH C2H5OH CH3COOH ','30g','0','good');
INSERT INTO product VALUES (4,'112','达美康','11','西药','ss.jpg','1',12.5,10.5,'123','100','177900-48-4','C12H22N2O4','CH4','30g','0','good');
INSERT INTO product VALUES (5,'113','迪沙片','11','西药','ss.jpg','1',12.5,10.5,'123','40','177900-48-5','C12H22N2O5','CH3OH','30g','0','good');
INSERT INTO product VALUES (6,'114','美吡哒','11','西药','ss.jpg','1',12.5,10.5,'423','300','177900-48-6','C12H22N2O6','CH3OH','30g','1','good');
INSERT INTO product VALUES (7,'121','白芍','14','中药','ss.jpg','1',12.5,10.5,'123','100','177900-48-7','C12H22N2O7','CH3OH','30g','0','good');
INSERT INTO product VALUES (8,'122','何首乌','14','中药','ss.jpg','1',12.5,10.5,'123','100','177900-48-8','C12H22N2O8','CH3OH','30g','0','good');
INSERT INTO product VALUES (9,'123','枸杞','14','中药','ss.jpg','1',12.5,10.5,'123','100','177900-48-9','C12H22N2O9','CH3OH','30g','0','good');

DROP TABLE IF EXISTS orderitem;
CREATE TABLE orderitem (
  id int NOT NULL auto_increment COMMENT '主键编号',
  ordersid int default NULL COMMENT '外键引用订单ID',
  productid int default NULL COMMENT '外键引用商品ID',
  quantity varchar(50) default NULL COMMENT '每个商品所购买数量',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='订单与商品中间表';

DROP TABLE IF EXISTS usr;
CREATE TABLE usr (
  id int NOT NULL auto_increment COMMENT '用户ID',
  username varchar(32) default NULL COMMENT '用户名',
  password varchar(32) default NULL COMMENT '密码',
  fullname varchar(64) default NULL COMMENT '用户全称',
  title varchar(32) default NULL COMMENT '职称级别',
  companyname varchar(32) default NULL COMMENT '公司名称',
  companyaddress varchar(100) default NULL COMMENT '公司地址',
  city varchar(32) default NULL COMMENT '城市',
  job varchar(32) default NULL COMMENT '工作职位',
  tel varchar(32) default NULL COMMENT '联系电话',
  email varchar(64) default NULL COMMENT '电子邮件',
  country varchar(32) default NULL COMMENT '国家',
  zip varchar(6) default NULL COMMENT '邮政编号',
  superuser varchar(2) default NULL COMMENT '用户角色权限3超级用户,2管理员,1普通用户',
  delsoft varchar(2) default NULL COMMENT '软删除标志1软删除,0正常',
  note varchar(255) default NULL COMMENT '备注',
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户表';

INSERT INTO usr VALUES (1,'admin','123456','administrator','manager','ascent','501B','beijing','admin','13315266854','admin@163.com','china','100085','3','0','good');
INSERT INTO usr VALUES (2,'lixin','lixin','lianglixin','leader','ascent','501B','beijing','manager','13315266853','lixin@163.com','china','100085','2','1','good');
INSERT INTO usr VALUES (3,'ascent','ascent','test','test','ascent','501B','beijing','test','13315266852','ascent@163.com','china','100085','1','0','good');
INSERT INTO usr VALUES (4,'shang','shang','shangshang','test','ascent','501B','beijing','test','13315266851','test@163.com','china','100085','1','0','good');

DROP TABLE IF EXISTS user_product;
CREATE TABLE user_product (
  id int NOT NULL auto_increment COMMENT '主键编号',
  usrid int default NULL COMMENT '外键,引用用户id',
  productid int default NULL COMMENT '外键,引用商品id',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户与商品中间表';


alter table user_product add constraint user_product__usrid_fk foreign key(usrid) references usr(id);
alter table user_product add constraint user_product__productid_fk foreign key(productid) references product(id);

alter table orderitem add constraint orderitem_orders__ordersid_fk foreign key(ordersid) references orders(id);
alter table orderitem add constraint orderitem_product_productid_fk foreign key(productid) references product(id);

alter table orders add constraint orders_usr_id_fk foreign key(usrid) references usr(id);

commit ;