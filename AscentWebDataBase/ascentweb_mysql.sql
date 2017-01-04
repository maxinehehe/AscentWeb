DROP DATABASE IF EXISTS ascentweb;
CREATE DATABASE ascentweb DEFAULT CHARSET=gbk;

use ascentweb ;

set names gbk ;

DROP TABLE IF EXISTS mailtb;
CREATE TABLE mailtb (
  id int NOT NULL auto_increment COMMENT '�����ʼ���ID',
  fromaddress varchar(50) default NULL COMMENT '�������ʼ���ַ',
  frompassword varchar(30) default NULL COMMENT '�������ʼ�����',
  toaddress varchar(50) default NULL COMMENT '�������ʼ���ַ',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�����ʼ���';

INSERT INTO mailtb VALUES(1,'admin@163.com','C2008119521','guest@163.com');

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id int NOT NULL auto_increment COMMENT '����ID',
  ordernumber varchar(50) default NULL COMMENT '�������',
  usrid int default NULL COMMENT '�û�ID',
  createtime datetime default NULL COMMENT '��������ʱ��',
  delsoft varchar(2) default NULL COMMENT '��ɾ����־',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='������';

DROP TABLE IF EXISTS product;
CREATE TABLE product (
  id int NOT NULL auto_increment COMMENT '��ƷID',
  productnumber varchar(50) default NULL COMMENT '��Ʒ���',
  productname varchar(32) default NULL COMMENT '��Ʒ����',
  categoryno varchar(50) default NULL COMMENT '��Ʒ������',
  category varchar(32) default NULL COMMENT '��Ʒ��������',
  imagepath varchar(100) default NULL COMMENT '��ƷͼƬ����',
  isnewproduct varchar(2) default NULL COMMENT '�Ƿ�����Ʒ1-true,0-false',
  price1 float default NULL COMMENT '�۸�',
  price2 float default NULL COMMENT '��Ա�۸�',
  realstock varchar(50) default NULL COMMENT '�����',
  stock varchar(50) default NULL COMMENT 'ʣ����',
  cas varchar(32) default NULL COMMENT 'ҩƷժҪ',
  mdlint varchar(50) default NULL COMMENT 'mdl���',
  formula varchar(255) default NULL COMMENT '��ѧ����ʽ',
  weight varchar(50) default NULL COMMENT '����',
  delsoft varchar(2) default NULL COMMENT '��ɾ����־',
  note varchar(255) default NULL COMMENT '��ע',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ��';

INSERT INTO product VALUES (1,'101','�׼Ӻ�','10','��ðҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-1','C12H22N2O1','C2H5OH','30g','0','good');
INSERT INTO product VALUES (2,'102','��Ч��ð����','10','��ðҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-2','C12H22N2O2','NaOH Ca(OH)2 Ba(OH)2 ','30g','0','good');
INSERT INTO product VALUES (3,'111','����˫��Ƭ','11','��ҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-3','C12H22N2O3','CH4 C2H2 CH3OH C2H5OH CH3COOH ','30g','0','good');
INSERT INTO product VALUES (4,'112','������','11','��ҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-4','C12H22N2O4','CH4','30g','0','good');
INSERT INTO product VALUES (5,'113','��ɳƬ','11','��ҩ','ss.jpg','1',12.5,10.5,'123','40','177900-48-5','C12H22N2O5','CH3OH','30g','0','good');
INSERT INTO product VALUES (6,'114','������','11','��ҩ','ss.jpg','1',12.5,10.5,'423','300','177900-48-6','C12H22N2O6','CH3OH','30g','1','good');
INSERT INTO product VALUES (7,'121','����','14','��ҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-7','C12H22N2O7','CH3OH','30g','0','good');
INSERT INTO product VALUES (8,'122','������','14','��ҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-8','C12H22N2O8','CH3OH','30g','0','good');
INSERT INTO product VALUES (9,'123','���','14','��ҩ','ss.jpg','1',12.5,10.5,'123','100','177900-48-9','C12H22N2O9','CH3OH','30g','0','good');

DROP TABLE IF EXISTS orderitem;
CREATE TABLE orderitem (
  id int NOT NULL auto_increment COMMENT '�������',
  ordersid int default NULL COMMENT '������ö���ID',
  productid int default NULL COMMENT '���������ƷID',
  quantity varchar(50) default NULL COMMENT 'ÿ����Ʒ����������',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��������Ʒ�м��';

DROP TABLE IF EXISTS usr;
CREATE TABLE usr (
  id int NOT NULL auto_increment COMMENT '�û�ID',
  username varchar(32) default NULL COMMENT '�û���',
  password varchar(32) default NULL COMMENT '����',
  fullname varchar(64) default NULL COMMENT '�û�ȫ��',
  title varchar(32) default NULL COMMENT 'ְ�Ƽ���',
  companyname varchar(32) default NULL COMMENT '��˾����',
  companyaddress varchar(100) default NULL COMMENT '��˾��ַ',
  city varchar(32) default NULL COMMENT '����',
  job varchar(32) default NULL COMMENT '����ְλ',
  tel varchar(32) default NULL COMMENT '��ϵ�绰',
  email varchar(64) default NULL COMMENT '�����ʼ�',
  country varchar(32) default NULL COMMENT '����',
  zip varchar(6) default NULL COMMENT '�������',
  superuser varchar(2) default NULL COMMENT '�û���ɫȨ��3�����û�,2����Ա,1��ͨ�û�',
  delsoft varchar(2) default NULL COMMENT '��ɾ����־1��ɾ��,0����',
  note varchar(255) default NULL COMMENT '��ע',
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�û���';

INSERT INTO usr VALUES (1,'admin','123456','administrator','manager','ascent','501B','beijing','admin','13315266854','admin@163.com','china','100085','3','0','good');
INSERT INTO usr VALUES (2,'lixin','lixin','lianglixin','leader','ascent','501B','beijing','manager','13315266853','lixin@163.com','china','100085','2','1','good');
INSERT INTO usr VALUES (3,'ascent','ascent','test','test','ascent','501B','beijing','test','13315266852','ascent@163.com','china','100085','1','0','good');
INSERT INTO usr VALUES (4,'shang','shang','shangshang','test','ascent','501B','beijing','test','13315266851','test@163.com','china','100085','1','0','good');

DROP TABLE IF EXISTS user_product;
CREATE TABLE user_product (
  id int NOT NULL auto_increment COMMENT '�������',
  usrid int default NULL COMMENT '���,�����û�id',
  productid int default NULL COMMENT '���,������Ʒid',
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�û�����Ʒ�м��';


alter table user_product add constraint user_product__usrid_fk foreign key(usrid) references usr(id);
alter table user_product add constraint user_product__productid_fk foreign key(productid) references product(id);

alter table orderitem add constraint orderitem_orders__ordersid_fk foreign key(ordersid) references orders(id);
alter table orderitem add constraint orderitem_product_productid_fk foreign key(productid) references product(id);

alter table orders add constraint orders_usr_id_fk foreign key(usrid) references usr(id);

commit ;