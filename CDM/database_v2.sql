/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     29/07/2015 9:16:20 CH                        */
/*==============================================================*/
drop database if exists vattu ;
create database if not exists vattu ;
use vattu;

drop table if exists CHAT_LUONG;

drop table if exists CHI_TIET_PHIEU_NHAP;

drop table if exists CHI_TIET_VAT_TU;

drop table if exists CHUC_DANH;

drop table if exists CONG_VAN;

drop table if exists DON_VI;

drop table if exists FILE;

drop table if exists LAP_PHIEU_XUAT;

drop table if exists MUC_DICH;

drop table if exists NGUOI_DUNG;

drop table if exists NGUOI_LAP_PHIEU_NHAP;

drop table if exists NGUOI_XU_LY_CV;

drop table if exists NOI_SAN_XUAT;

drop table if exists PHIEU_NHAP;

drop table if exists PHIEU_XUAT;

drop table if exists TRANG_THAI;

drop table if exists VAI_TRO;

drop table if exists VAT_TU;

drop table if exists VAT_TU_XUAT;

drop table if exists XU_LY_CHI_TIET;

drop table if exists YEU_CAU;

/*==============================================================*/
/* Table: CHAT_LUONG                                            */
/*==============================================================*/
create table CHAT_LUONG
(
   CL_MA                char(3) not null,
   CL_VATTU             varchar(20),
   primary key (CL_MA)
);

/*==============================================================*/
/* Table: CHI_TIET_PHIEU_NHAP                                   */
/*==============================================================*/
create table CHI_TIET_PHIEU_NHAP
(
   PHIEUNHAP_ID        int,
   NSX_MA               char(3),
   CL_MA                char(3),
   VT_MA                char(16),
   SO_LUONG             int
);

/*==============================================================*/
/* Table: CHI_TIET_VAT_TU                                       */
/*==============================================================*/
create table CHI_TIET_VAT_TU
(
   NSX_MA               char(3) not null,
   CL_MA                char(3) not null,
   VT_MA                char(16) not null,
   DINH_MUC             int,
   SO_LUONG_TON         int,
   primary key (NSX_MA, CL_MA, VT_MA)
);

/*==============================================================*/
/* Table: CHUC_DANH                                             */
/*==============================================================*/
create table CHUC_DANH
(
   CD_MA                varchar(10) not null,
   CV_TEN               varchar(30),
   primary key (CD_MA)
);

/*==============================================================*/
/* Table: CONG_VAN                                              */
/*==============================================================*/
create table CONG_VAN
(
   CV_ID               int not null,
   FILE_ID             int not null,
   DV_MA                varchar(10) not null,
   TT_MA                varchar(10) not null,
   MUC_DICH_MA          char(3) not null,
   SO_DEN               int,
   CV_NGAY_NHAN         date,
   CV_SO                varchar(10),
   CV_NGAY_DI           date,
   TRICH_YEU            text,
   BUT_PHE              text,
   primary key (CV_ID)
);

/*==============================================================*/
/* Table: DON_VI                                                */
/*==============================================================*/
create table DON_VI
(
   DV_MA                varchar(10) not null,
   DV_TEN               varchar(30),
   SDT                  VA(12),
   EMAIL                VA(50),
   primary key (DV_MA)
);

/*==============================================================*/
/* Table: FILE                                                  */
/*==============================================================*/
create table FILE
(
   FILE_ID             int not null,
   FILE_DIA_CHI         varchar(100),
   FILE_MO_TA           text,
   primary key (FILE_ID)
);

/*==============================================================*/
/* Table: LAP_PHIEU_XUAT                                        */
/*==============================================================*/
create table LAP_PHIEU_XUAT
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   PHIEUXUAT_ID        int not null,
   primary key (CV_ID, MSNV, PHIEUXUAT_ID)
);

/*==============================================================*/
/* Table: MUC_DICH                                              */
/*==============================================================*/
create table MUC_DICH
(
   MUC_DICH_MA          char(3) not null,
   NOI_DUNG             varchar(50),
   primary key (MUC_DICH_MA)
);

/*==============================================================*/
/* Table: NGUOI_DUNG                                            */
/*==============================================================*/
create table NGUOI_DUNG
(
   MSNV                 varchar(10) not null,
   CD_MA                varchar(10) not null,
   MAT_KHAU             varchar(20),
   HO_TEN               varchar(50),
   DIA_CHI              varchar(50),
   EMAIL                VA(50),
   SDT                  VA(12),
   primary key (MSNV)
);

/*==============================================================*/
/* Table: NGUOI_LAP_PHIEU_NHAP                                  */
/*==============================================================*/
create table NGUOI_LAP_PHIEU_NHAP
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   PHIEUNHAP_ID        int not null,
   primary key (CV_ID, MSNV, PHIEUNHAP_ID)
);

/*==============================================================*/
/* Table: NGUOI_XU_LY_CV                                        */
/*==============================================================*/
create table NGUOI_XU_LY_CV
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   primary key (CV_ID, MSNV)
);

/*==============================================================*/
/* Table: NOI_SAN_XUAT                                          */
/*==============================================================*/
create table NOI_SAN_XUAT
(
   NSX_MA               char(3) not null,
   NSX_TEN              varchar(20),
   primary key (NSX_MA)
);

/*==============================================================*/
/* Table: PHIEU_NHAP                                            */
/*==============================================================*/
create table PHIEU_NHAP
(
   PHIEUNHAP_ID        int not null,
   PN_NGAY              date not null,
   primary key (PHIEUNHAP_ID)
);

/*==============================================================*/
/* Table: PHIEU_XUAT                                            */
/*==============================================================*/
create table PHIEU_XUAT
(
   PHIEUXUAT_ID        int not null,
   PHIEU_XUAT_NGAY      date,
   primary key (PHIEUXUAT_ID)
);

/*==============================================================*/
/* Table: TRANG_THAI                                            */
/*==============================================================*/
create table TRANG_THAI
(
   TT_MA                varchar(10) not null,
   TT_TEN               varchar(20),
   primary key (TT_MA)
);

/*==============================================================*/
/* Table: VAI_TRO                                               */
/*==============================================================*/
create table VAI_TRO
(
   VAI_TRO_ID           int not null,
   VAI_TRO_TEN          varchar(50),
   primary key (VAI_TRO_ID)
);

/*==============================================================*/
/* Table: VAT_TU                                                */
/*==============================================================*/
create table VAT_TU
(
   VT_MA                char(16) not null,
   VT_TEN               int,
   DVT                  int,
   primary key (VT_MA)
);

/*==============================================================*/
/* Table: VAT_TU_XUAT                                           */
/*==============================================================*/
create table VAT_TU_XUAT
(
   NSX_MA               char(3) not null,
   CL_MA                char(3) not null,
   VT_MA                char(16) not null,
   CV_ID               int not null,
   PHIEUXUAT_ID        int not null,
   SO_LUONG             int,
   primary key (NSX_MA, CL_MA, VT_MA, CV_ID, PHIEUXUAT_ID)
);

/*==============================================================*/
/* Table: XU_LY_CHI_TIET                                        */
/*==============================================================*/
create table XU_LY_CHI_TIET
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   VAI_TRO_ID           int not null,
   primary key (CV_ID, MSNV, VAI_TRO_ID)
);

/*==============================================================*/
/* Table: YEU_CAU                                               */
/*==============================================================*/
create table YEU_CAU
(
   NSX_MA               char(3) not null,
   CL_MA                char(3) not null,
   VT_MA                char(16) not null,
   CV_ID               int not null,
   DA_XOA               bool,
   YEU_CAU_SO_LUONG     int,
   primary key (NSX_MA, CL_MA, VT_MA, CV_ID)
);

alter table CHI_TIET_PHIEU_NHAP add constraint FK_CHITIET_VATTU_NHAP foreign key (NSX_MA, CL_MA, VT_MA)
      references CHI_TIET_VAT_TU (NSX_MA, CL_MA, VT_MA) on delete cascade;

alter table CHI_TIET_PHIEU_NHAP add constraint FK_VATTU_NHAP2 foreign key (PHIEUNHAP_ID)
      references PHIEU_NHAP (PHIEUNHAP_ID) on delete cascade;

alter table CHI_TIET_VAT_TU add constraint FK_CHATLUONG_YEUCAU2 foreign key (CL_MA)
      references CHAT_LUONG (CL_MA) on delete cascade;

alter table CHI_TIET_VAT_TU add constraint FK_RELATIONSHIP_15 foreign key (VT_MA)
      references VAT_TU (VT_MA) on delete cascade;

alter table CHI_TIET_VAT_TU add constraint FK_SANXUAT2 foreign key (NSX_MA)
      references NOI_SAN_XUAT (NSX_MA) on delete cascade;

alter table CONG_VAN add constraint FK_DONVI_CONGVAN2 foreign key (DV_MA)
      references DON_VI (DV_MA) on delete cascade;

alter table CONG_VAN add constraint FK_FILE_CONGVAN2 foreign key (FILE_ID)
      references FILE (FILE_ID) on delete cascade;

alter table CONG_VAN add constraint FK_MUCDICH2 foreign key (MUC_DICH_MA)
      references MUC_DICH (MUC_DICH_MA) on delete cascade;

alter table CONG_VAN add constraint FK_RELATIONSHIP_11 foreign key (TT_MA)
      references TRANG_THAI (TT_MA) on delete cascade;

alter table LAP_PHIEU_XUAT add constraint FK_PHIEUXUAT_VATTU2 foreign key (PHIEUXUAT_ID)
      references PHIEU_XUAT (PHIEUXUAT_ID) on delete cascade;

alter table LAP_PHIEU_XUAT add constraint FK_VT_XUAT2 foreign key (CV_ID, MSNV)
      references NGUOI_XU_LY_CV (CV_ID, MSNV) on delete cascade;

alter table NGUOI_DUNG add constraint FK_RELATIONSHIP_2 foreign key (CD_MA)
      references CHUC_DANH (CD_MA) on delete cascade;

alter table NGUOI_LAP_PHIEU_NHAP add constraint FK_NGUOILAP_PHIEUNHAP foreign key (CV_ID, MSNV)
      references NGUOI_XU_LY_CV (CV_ID, MSNV) on delete cascade;

alter table NGUOI_LAP_PHIEU_NHAP add constraint FK_NHAP_VATTU2 foreign key (PHIEUNHAP_ID)
      references PHIEU_NHAP (PHIEUNHAP_ID) on delete cascade;

alter table NGUOI_XU_LY_CV add constraint FK_RELATIONSHIP_14 foreign key (MSNV)
      references NGUOI_DUNG (MSNV) on delete cascade;

alter table NGUOI_XU_LY_CV add constraint FK_XULY2 foreign key (CV_ID)
      references CONG_VAN (CV_ID) on delete cascade;

alter table VAT_TU_XUAT add constraint FK_RELATIONSHIP_21 foreign key (PHIEUXUAT_ID)
      references PHIEU_XUAT (PHIEUXUAT_ID) on delete cascade;

alter table VAT_TU_XUAT add constraint FK_VATTU_DUOCXUAT foreign key (NSX_MA, CL_MA, VT_MA, CV_ID)
      references YEU_CAU (NSX_MA, CL_MA, VT_MA, CV_ID) on delete cascade;

alter table XU_LY_CHI_TIET add constraint FK_VAITRO_CANXULY foreign key (VAI_TRO_ID)
      references VAI_TRO (VAI_TRO_ID) on delete cascade;

alter table XU_LY_CHI_TIET add constraint FK_XULYCHO foreign key (CV_ID, MSNV)
      references NGUOI_XU_LY_CV (CV_ID, MSNV) on delete cascade;

alter table YEU_CAU add constraint FK_RELATIONSHIP_13 foreign key (CV_ID)
      references CONG_VAN (CV_ID) on delete cascade;

alter table YEU_CAU add constraint FK_RELATIONSHIP_7 foreign key (NSX_MA, CL_MA, VT_MA)
      references CHI_TIET_VAT_TU (NSX_MA, CL_MA, VT_MA) on delete cascade;

