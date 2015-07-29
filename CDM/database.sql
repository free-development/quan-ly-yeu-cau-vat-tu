/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     28/07/2015 8:06:16 CH                        */
/*==============================================================*/


drop table if exists CHATLUONG;

drop table if exists CHITIET_PHIEUNHAP;

drop table if exists CHITIET_VATTU;

drop table if exists CHUCDANH;

drop table if exists CONGVAN;

drop table if exists DONVI;

drop table if exists FILE;

drop table if exists LAP_PHIEUNHAP;

drop table if exists LAP_PHIEUXUAT;

drop table if exists MUCDICH;

drop table if exists NGUOIDUNG;

drop table if exists NGUOIXULY_CV;

drop table if exists NOISANXUAT;

drop table if exists PHIEUNHAP;

drop table if exists PHIEUXUAT;

drop table if exists TRANGTHAI;

drop table if exists VAITRO;

drop table if exists VATTU;

drop table if exists VATTU_XUAT;

drop table if exists XULY_CHITIET;

drop table if exists YEUCAU;

/*==============================================================*/
/* Table: CHATLUONG                                             */
/*==============================================================*/
create table CHATLUONG
(
   CL_MA                char(3) not null,
   CL_VATTU             varchar(20),
   primary key (CL_MA)
);

/*==============================================================*/
/* Table: CHITIET_PHIEUNHAP                                     */
/*==============================================================*/
create table CHITIET_PHIEUNHAP
(
   PHIEUNHAP_ID        int,
   NSX_MA               char(3),
   CL_MA                char(3),
   VT_MA                char(16),
   SOLUONG              int
);

/*==============================================================*/
/* Table: CHITIET_VATTU                                         */
/*==============================================================*/
create table CHITIET_VATTU
(
   NSX_MA               char(3) not null,
   CL_MA                char(3) not null,
   VT_MA                char(16) not null,
   DINHMUC              int,
   SOLUONG_TON          int,
   primary key (NSX_MA, CL_MA, VT_MA)
);

/*==============================================================*/
/* Table: CHUCDANH                                              */
/*==============================================================*/
create table CHUCDANH
(
   CD_MA                varchar(10) not null,
   CV_TEN               varchar(30),
   primary key (CD_MA)
);

/*==============================================================*/
/* Table: CONGVAN                                               */
/*==============================================================*/
create table CONGVAN
(
   CV_ID               int not null,
   FILE_ID             int not null,
   DV_MA                varchar(10) not null,
   TT_MA                varchar(10) not null,
   MUCDICH_MA           char(3) not null,
   SODEN                int,
   CV_NGAYNHAN          date,
   CV_SO                varchar(10),
   CV_NGAYDI            date,
   TRICHYEU             text,
   BUTPHE               text,
   primary key (CV_ID)
);

/*==============================================================*/
/* Table: DONVI                                                 */
/*==============================================================*/
create table DONVI
(
   DV_MA                varchar(10) not null,
   DV_TEN               varchar(30),
   SDT                  varchar(12),
   EMAIL                varchar(50),
   primary key (DV_MA)
);

/*==============================================================*/
/* Table: FILE                                                  */
/*==============================================================*/
create table FILE
(
   FILE_ID             int not null,
   FILE_DIACHI          varchar(100),
   FILE_MOTA            text,
   primary key (FILE_ID)
);

/*==============================================================*/
/* Table: LAP_PHIEUNHAP                                         */
/*==============================================================*/
create table LAP_PHIEUNHAP
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   PHIEUNHAP_ID        int not null,
   primary key (CV_ID, MSNV, PHIEUNHAP_ID)
);

/*==============================================================*/
/* Table: LAP_PHIEUXUAT                                         */
/*==============================================================*/
create table LAP_PHIEUXUAT
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   PHIEUXUAT_ID        int not null,
   primary key (CV_ID, MSNV, PHIEUXUAT_ID)
);

/*==============================================================*/
/* Table: MUCDICH                                               */
/*==============================================================*/
create table MUCDICH
(
   MUCDICH_MA           char(3) not null,
   NOIDUNG              varchar(50),
   primary key (MUCDICH_MA)
);

/*==============================================================*/
/* Table: NGUOIDUNG                                             */
/*==============================================================*/
create table NGUOIDUNG
(
   MSNV                 varchar(10) not null,
   CD_MA                varchar(10) not null,
   PASSWORD             varchar(20),
   HOTEN                varchar(50),
   DIACHI               varchar(50),
   EMAIL                varchar(50),
   SDT                  varchar(12),
   primary key (MSNV)
);

/*==============================================================*/
/* Table: NGUOIXULY_CV                                          */
/*==============================================================*/
create table NGUOIXULY_CV
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   primary key (CV_ID, MSNV)
);

/*==============================================================*/
/* Table: NOISANXUAT                                            */
/*==============================================================*/
create table NOISANXUAT
(
   NSX_MA               char(3) not null,
   NSX_TEN              varchar(20),
   primary key (NSX_MA)
);

/*==============================================================*/
/* Table: PHIEUNHAP                                             */
/*==============================================================*/
create table PHIEUNHAP
(
   PHIEUNHAP_ID        int not null,
   PHIEUNHAP_NGAY       date,
   primary key (PHIEUNHAP_ID)
);

/*==============================================================*/
/* Table: PHIEUXUAT                                             */
/*==============================================================*/
create table PHIEUXUAT
(
   PHIEUXUAT_ID        int not null,
   PHIEUXUAT_NGAY       date,
   primary key (PHIEUXUAT_ID)
);

/*==============================================================*/
/* Table: TRANGTHAI                                             */
/*==============================================================*/
create table TRANGTHAI
(
   TT_MA                varchar(10) not null,
   TT_TEN               varchar(20),
   primary key (TT_MA)
);

/*==============================================================*/
/* Table: VAITRO                                                */
/*==============================================================*/
create table VAITRO
(
   VAITRO_ID            int not null,
   VAITRO_TEN           varchar(50),
   primary key (VAITRO_ID)
);

/*==============================================================*/
/* Table: VATTU                                                 */
/*==============================================================*/
create table VATTU
(
   VT_MA                char(16) not null,
   VT_TEN               int,
   DVT                  int,
   primary key (VT_MA)
);

/*==============================================================*/
/* Table: VATTU_XUAT                                            */
/*==============================================================*/
create table VATTU_XUAT
(
   NSX_MA               char(3) not null,
   CL_MA                char(3) not null,
   VT_MA                char(16) not null,
   CV_ID               int not null,
   PHIEUXUAT_ID        int not null,
   SOLUONG              int,
   primary key (NSX_MA, CL_MA, VT_MA, CV_ID, PHIEUXUAT_ID)
);

/*==============================================================*/
/* Table: XULY_CHITIET                                          */
/*==============================================================*/
create table XULY_CHITIET
(
   CV_ID               int not null,
   MSNV                 varchar(10) not null,
   VAITRO_ID            int not null,
   primary key (CV_ID, MSNV, VAITRO_ID)
);

/*==============================================================*/
/* Table: YEUCAU                                                */
/*==============================================================*/
create table YEUCAU
(
   NSX_MA               char(3) not null,
   CL_MA                char(3) not null,
   VT_MA                char(16) not null,
   CV_ID               int not null,
   DAXOA                bool,
   YEUCAU_SOLUONG       int,
   primary key (NSX_MA, CL_MA, VT_MA, CV_ID)
);

alter table CHITIET_PHIEUNHAP add constraint FK_CHITIET_VATTU_NHAP foreign key (NSX_MA, CL_MA, VT_MA)
      references CHITIET_VATTU (NSX_MA, CL_MA, VT_MA) on delete restrict on update restrict;

alter table CHITIET_PHIEUNHAP add constraint FK_VATTU_NHAP2 foreign key (PHIEUNHAP_ID)
      references PHIEUNHAP (PHIEUNHAP_ID) on delete restrict on update restrict;

alter table CHITIET_VATTU add constraint FK_CHATLUONG_YEUCAU2 foreign key (CL_MA)
      references CHATLUONG (CL_MA) on delete restrict on update restrict;

alter table CHITIET_VATTU add constraint FK_RELATIONSHIP_15 foreign key (VT_MA)
      references VATTU (VT_MA) on delete restrict on update restrict;

alter table CHITIET_VATTU add constraint FK_SANXUAT2 foreign key (NSX_MA)
      references NOISANXUAT (NSX_MA) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_DONVI_CONGVAN2 foreign key (DV_MA)
      references DONVI (DV_MA) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_FILE_CONGVAN2 foreign key (FILE_ID)
      references FILE (FILE_ID) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_MUCDICH2 foreign key (MUCDICH_MA)
      references MUCDICH (MUCDICH_MA) on delete restrict on update restrict;

alter table CONGVAN add constraint FK_RELATIONSHIP_11 foreign key (TT_MA)
      references TRANGTHAI (TT_MA) on delete restrict on update restrict;

alter table LAP_PHIEUNHAP add constraint FK_NGUOILAP_PHIEUNHAP foreign key (CV_ID, MSNV)
      references NGUOIXULY_CV (CV_ID, MSNV) on delete restrict on update restrict;

alter table LAP_PHIEUNHAP add constraint FK_NHAP_VATTU2 foreign key (PHIEUNHAP_ID)
      references PHIEUNHAP (PHIEUNHAP_ID) on delete restrict on update restrict;

alter table LAP_PHIEUXUAT add constraint FK_PHIEUXUAT_VATTU2 foreign key (PHIEUXUAT_ID)
      references PHIEUXUAT (PHIEUXUAT_ID) on delete restrict on update restrict;

alter table LAP_PHIEUXUAT add constraint FK_VT_XUAT2 foreign key (CV_ID, MSNV)
      references NGUOIXULY_CV (CV_ID, MSNV) on delete restrict on update restrict;

alter table NGUOIDUNG add constraint FK_RELATIONSHIP_2 foreign key (CD_MA)
      references CHUCDANH (CD_MA) on delete restrict on update restrict;

alter table NGUOIXULY_CV add constraint FK_RELATIONSHIP_14 foreign key (MSNV)
      references NGUOIDUNG (MSNV) on delete restrict on update restrict;

alter table NGUOIXULY_CV add constraint FK_XULY2 foreign key (CV_ID)
      references CONGVAN (CV_ID) on delete restrict on update restrict;

alter table VATTU_XUAT add constraint FK_RELATIONSHIP_21 foreign key (PHIEUXUAT_ID)
      references PHIEUXUAT (PHIEUXUAT_ID) on delete restrict on update restrict;

alter table VATTU_XUAT add constraint FK_VATTU_DUOCXUAT foreign key (NSX_MA, CL_MA, VT_MA, CV_ID)
      references YEUCAU (NSX_MA, CL_MA, VT_MA, CV_ID) on delete restrict on update restrict;

alter table XULY_CHITIET add constraint FK_VAITRO_CANXULY foreign key (VAITRO_ID)
      references VAITRO (VAITRO_ID) on delete restrict on update restrict;

alter table XULY_CHITIET add constraint FK_XULYCHO foreign key (CV_ID, MSNV)
      references NGUOIXULY_CV (CV_ID, MSNV) on delete restrict on update restrict;

alter table YEUCAU add constraint FK_RELATIONSHIP_13 foreign key (CV_ID)
      references CONGVAN (CV_ID) on delete restrict on update restrict;

alter table YEUCAU add constraint FK_RELATIONSHIP_7 foreign key (NSX_MA, CL_MA, VT_MA)
      references CHITIET_VATTU (NSX_MA, CL_MA, VT_MA) on delete restrict on update restrict;

