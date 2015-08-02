/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02/08/2015 8:03:04 CH                        */
/*==============================================================*/
drop database if exists vattu;
create database if not exists vattu;
CREATE SCHEMA IF NOT EXISTS vattu DEFAULT CHARACTER SET utf8 ;
use vattu;

drop table if exists CHATLUONG;

drop table if exists CHUCDANH;

drop table if exists CONGVAN;

drop table if exists CTNGUOIDUNG;

drop table if exists CTVATTU;

drop table if exists DONVI;

drop table if exists FILE;

drop table if exists MUCDICH;

drop table if exists NGUOIDUNG;

drop table if exists NOISANXUAT;

drop table if exists PHIEUNHAP;

drop table if exists PHIEUXUAT;

drop table if exists TRANGTHAI;

drop table if exists VAITRO;

drop table if exists VATTU;

drop table if exists VATTUNHAP;

drop table if exists VATTUXUAT;

drop table if exists VTCONGVAN;

drop table if exists YEUCAU;

/*==============================================================*/
/* Table: CHATLUONG                                             */
/*==============================================================*/
create table CHATLUONG
(
   CLMA                 char(3) not null,
   CLTEN                varchar(20),
   primary key (CLMA)
);

/*==============================================================*/
/* Table: CHUCDANH                                              */
/*==============================================================*/
create table CHUCDANH
(
   CDMA                 varchar(10) not null,
   CDTEN                varchar(30),
   primary key (CDMA)
);

/*==============================================================*/
/* Table: CONGVAN                                               */
/*==============================================================*/
create table CONGVAN
(
   CVID                 int not null,
   FILEID               int not null,
   DVMA                 varchar(10) not null,
   TTMA                 varchar(10) not null,
   MDMA                 char(3) not null,
   SODEN                int,
   CVNGAYNHAN           date,
   CVSO                 varchar(10),
   CVNGAYDI             date,
   TRICHYEU             text,
   BUTPHE               text,
   primary key (CVID)
);

/*==============================================================*/
/* Table: CTNGUOIDUNG                                           */
/*==============================================================*/
create table CTNGUOIDUNG
(
   MSNV                 varchar(10),
   MATKHAU              varchar(20)
);

/*==============================================================*/
/* Table: CTVATTU                                               */
/*==============================================================*/
create table CTVATTU
(
   NSXMA                char(3) not null,
   CLMA                 char(3) not null,
   VTMA                 char(16) not null,
   DINHMUC              int,
   SOLUONGTON           int,
   primary key (NSXMA, CLMA, VTMA)
);

/*==============================================================*/
/* Table: DONVI                                                 */
/*==============================================================*/
create table DONVI
(
   DVMA                 varchar(10) not null,
   DVTEN                varchar(30),
   SDT                  varchar(12),
   EMAIL                varchar(50),
   DIACHI               varchar(100),
   primary key (DVMA)
);

/*==============================================================*/
/* Table: FILE                                                  */
/*==============================================================*/
create table FILE
(
   FILEID               int not null,
   DIACHI               varchar(100),
   MOTA                 text,
   primary key (FILEID)
);

/*==============================================================*/
/* Table: MUCDICH                                               */
/*==============================================================*/
create table MUCDICH
(
   MDMA                 char(3) not null,
   MDTEN                varchar(50),
   primary key (MDMA)
);

/*==============================================================*/
/* Table: NGUOIDUNG                                             */
/*==============================================================*/
create table NGUOIDUNG
(
   MSNV                 varchar(10) not null,
   CDMA                 varchar(10) not null,
   HOTEN                varchar(50),
   DIACHI               varchar(100),
   EMAIL                varchar(50),
   SDT                  varchar(12),
   primary key (MSNV)
);

/*==============================================================*/
/* Table: NOISANXUAT                                            */
/*==============================================================*/
create table NOISANXUAT
(
   NSXMA                char(3) not null,
   NSXTEN               varchar(20),
   primary key (NSXMA)
);

/*==============================================================*/
/* Table: PHIEUNHAP                                             */
/*==============================================================*/
create table PHIEUNHAP
(
   PNID                 int not null,
   CVID                 int not null,
   MSNV                 varchar(10) not null,
   VTID                 int not null,
   PNNGAY               date not null,
   primary key (PNID)
);

/*==============================================================*/
/* Table: PHIEUXUAT                                             */
/*==============================================================*/
create table PHIEUXUAT
(
   PXID                 int not null,
   CVID                 int not null,
   MSNV                 varchar(10) not null,
   VTID                 int not null,
   PXNGAY               date,
   primary key (PXID)
);

/*==============================================================*/
/* Table: TRANGTHAI                                             */
/*==============================================================*/
create table TRANGTHAI
(
   TTMA                 varchar(10) not null,
   TTTEN                varchar(20),
   primary key (TTMA)
);

/*==============================================================*/
/* Table: VAITRO                                                */
/*==============================================================*/
create table VAITRO
(
   VTID                 int not null,
   VTTEN                varchar(50),
   primary key (VTID)
);

/*==============================================================*/
/* Table: VATTU                                                 */
/*==============================================================*/
create table VATTU
(
   VTMA                 char(16) not null,
   VTTEN                varchar(50),
   DVT                  varchar(10),
   primary key (VTMA)
);

/*==============================================================*/
/* Table: VATTUNHAP                                             */
/*==============================================================*/
create table VATTUNHAP
(
   NSXMA                char(3) not null,
   CLMA                 char(3) not null,
   VTMA                 char(16) not null,
   PNID                 int not null,
   SOLUONG              int,
   primary key (NSXMA, CLMA, VTMA, PNID)
);

/*==============================================================*/
/* Table: VATTUXUAT                                             */
/*==============================================================*/
create table VATTUXUAT
(
   NSXMA                char(3) not null,
   CLMA                 char(3) not null,
   VTMA                 char(16) not null,
   CVID                 int not null,
   PXID                 int not null,
   SOLUONG              int,
   primary key (NSXMA, CLMA, VTMA, CVID, PXID)
);

/*==============================================================*/
/* Table: VTCONGVAN                                             */
/*==============================================================*/
create table VTCONGVAN
(
   CVID                 int not null,
   MSNV                 varchar(10) not null,
   VTID                 int not null,
   primary key (CVID, MSNV, VTID)
);

/*==============================================================*/
/* Table: YEUCAU                                                */
/*==============================================================*/
create table YEUCAU
(
   NSXMA                char(3) not null,
   CLMA                 char(3) not null,
   VTMA                 char(16) not null,
   CVID                 int not null,
   DAXOA                bool,
   YCSOLUONG            int,
   primary key (NSXMA, CLMA, VTMA, CVID)
);

alter table CONGVAN add constraint FK_DONVI_CONGVAN2 foreign key (DVMA)
      references DONVI (DVMA) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_FILE_CONGVAN2 foreign key (FILEID)
      references FILE (FILEID) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_MUCDICH2 foreign key (MDMA)
      references MUCDICH (MDMA) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_RELATIONSHIP_11 foreign key (TTMA)
      references TRANGTHAI (TTMA) on delete restrict on update restrict;

alter table CTNGUOIDUNG add constraint FK_CHI_TIET_NGUOIDUNG foreign key (MSNV)
      references NGUOIDUNG (MSNV) on delete restrict on update restrict;

alter table CTVATTU add constraint FK_CHATLUONG_YEUCAU2 foreign key (CLMA)
      references CHATLUONG (CLMA) on delete restrict on update restrict;

alter table CTVATTU add constraint FK_RELATIONSHIP_15 foreign key (VTMA)
      references VATTU (VTMA) on delete restrict on update restrict;

alter table CTVATTU add constraint FK_SANXUAT2 foreign key (NSXMA)
      references NOISANXUAT (NSXMA) on delete restrict on update restrict;

alter table NGUOIDUNG add constraint FK_RELATIONSHIP_2 foreign key (CDMA)
      references CHUCDANH (CDMA) on delete restrict on update restrict;

alter table PHIEUNHAP add constraint FK_LAP_PHIEUNHAP foreign key (CVID, MSNV, VTID)
      references VTCONGVAN (CVID, MSNV, VTID) on delete restrict on update restrict;

alter table PHIEUXUAT add constraint FK_LAP_PHIEU_XUAT foreign key (CVID, MSNV, VTID)
      references VTCONGVAN (CVID, MSNV, VTID) on delete restrict on update restrict;

alter table VATTUNHAP add constraint FK_CHITIET_VATTU_NHAP foreign key (NSXMA, CLMA, VTMA)
      references CTVATTU (NSXMA, CLMA, VTMA) on delete restrict on update restrict;

alter table VATTUNHAP add constraint FK_VATTU_NHAP2 foreign key (PNID)
      references PHIEUNHAP (PNID) on delete restrict on update restrict;

alter table VATTUXUAT add constraint FK_RELATIONSHIP_21 foreign key (PXID)
      references PHIEUXUAT (PXID) on delete restrict on update restrict;

alter table VATTUXUAT add constraint FK_VATTU_DUOCXUAT foreign key (NSXMA, CLMA, VTMA, CVID)
      references YEUCAU (NSXMA, CLMA, VTMA, CVID) on delete restrict on update restrict;

alter table VTCONGVAN add constraint FK_RELATIONSHIP_14 foreign key (MSNV)
      references NGUOIDUNG (MSNV) on delete restrict on update restrict;

alter table VTCONGVAN add constraint FK_VAI_TRO_NGUOI_XU_LY foreign key (VTID)
      references VAITRO (VTID) on delete restrict on update restrict;

alter table VTCONGVAN add constraint FK_XULY2 foreign key (CVID)
      references CONGVAN (CVID) on delete restrict on update restrict;

alter table YEUCAU add constraint FK_RELATIONSHIP_13 foreign key (CVID)
      references CONGVAN (CVID) on delete restrict on update restrict;

alter table YEUCAU add constraint FK_RELATIONSHIP_7 foreign key (NSXMA, CLMA, VTMA)
      references CTVATTU (NSXMA, CLMA, VTMA) on delete restrict on update restrict;

