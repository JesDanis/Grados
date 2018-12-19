/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/10/2018 17:17:34                          */
/*==============================================================*/


drop table if exists CARRERAS;

drop table if exists DETALLE_GRA;

drop table if exists ESTUDIANTES;

drop table if exists GRADO;

drop table if exists LUGARES;

drop table if exists MODALIDAD;

drop table if exists PERSONAL_L;

drop table if exists PROFESORES;

drop table if exists ROLES;

drop table if exists SECRETARIAS;

/*==============================================================*/
/* Table: CARRERAS                                              */
/*==============================================================*/
create table CARRERAS
(
   ID_CAR               varchar(5) not null,
   NOM_CAR              varchar(50),
   primary key (ID_CAR)
);

/*==============================================================*/
/* Table: DETALLE_GRA                                           */
/*==============================================================*/
create table DETALLE_GRA
(
   ID_ROL               varchar(5),
   ID_PROF              numeric(8,0),
   ID_GRA               numeric(8,0),
   ID_GRA_PER           numeric(8,0),
   ID_PROF_GRA          numeric(8,0),
   ROL_DES              varchar(5)
);

/*==============================================================*/
/* Table: ESTUDIANTES                                           */
/*==============================================================*/
create table ESTUDIANTES
(
   CED_EST              varchar(10) not null,
   ID_CAR               varchar(5),
   NOM1_EST             varchar(20),
   NOM2_EST             varchar(20),
   APE1_EST             varchar(20),
   APE2_EST             varchar(20),
   TEL_EST              varchar(10),
   E_MAIL_EST           varchar(40),
   primary key (CED_EST)
);

/*==============================================================*/
/* Table: GRADO                                                 */
/*==============================================================*/
create table GRADO
(
   ID_GRA               numeric(8,0) not null auto_increment,
   ID_SEC               numeric(8,0),
   ID_LUG               varchar(10),
   ID_MOD               varchar(5),
   CED_EST              varchar(10),
   ID_PER               numeric(8,0),
   FEC_GRA              date,
   HOR_GRA              time,
   TEM_GRA              varchar(400),
   primary key (ID_GRA)
);

/*==============================================================*/
/* Table: LUGARES                                               */
/*==============================================================*/
create table LUGARES
(
   ID_LUG               varchar(10) not null,
   NOM_LUG              varchar(20),
   primary key (ID_LUG)
);

/*==============================================================*/
/* Table: MODALIDAD                                             */
/*==============================================================*/
create table MODALIDAD
(
   ID_MOD               varchar(5) not null,
   NOM_MOD              varchar(30),
   primary key (ID_MOD)
);

/*==============================================================*/
/* Table: PERSONAL_L                                            */
/*==============================================================*/
create table PERSONAL_L
(
   ID_PER               numeric(8,0) not null auto_increment,
   NOM_PER              varchar(20),
   APE_PER              varchar(20),
   TEL_PER              varchar(10),
   E_MAIL_PER           varchar(40),
   primary key (ID_PER)
);

/*==============================================================*/
/* Table: PROFESORES                                            */
/*==============================================================*/
create table PROFESORES
(
   ID_PROF              numeric(8,0) not null auto_increment,
   NOM_PROF             varchar(20),
   APE_PROF             varchar(20),
   NIV_ACA              varchar(10),
   E_MAIL_PROF          varchar(40),
   primary key (ID_PROF)
);

/*==============================================================*/
/* Table: ROLES                                                 */
/*==============================================================*/
create table ROLES
(
   ID_ROL               varchar(5) not null,
   NOM_ROL              varchar(30),
   primary key (ID_ROL)
);

/*==============================================================*/
/* Table: SECRETARIAS                                           */
/*==============================================================*/
create table SECRETARIAS
(
   ID_SEC               numeric(8,0) not null auto_increment,
   NOM_SEC              varchar(20),
   APE_SEC              varchar(20),
   E_MAIL_SEC           varchar(40),
   primary key (ID_SEC)
);

alter table DETALLE_GRA add constraint FK_ASISTE foreign key (ID_PROF)
      references PROFESORES (ID_PROF) on delete restrict on update restrict;

alter table DETALLE_GRA add constraint FK_DESEMPENA foreign key (ID_ROL)
      references ROLES (ID_ROL) on delete restrict on update restrict;

alter table DETALLE_GRA add constraint FK_TENER foreign key (ID_GRA)
      references GRADO (ID_GRA) on delete restrict on update restrict;

alter table ESTUDIANTES add constraint FK_TIENE foreign key (ID_CAR)
      references CARRERAS (ID_CAR) on delete restrict on update restrict;

alter table GRADO add constraint FK_ASEA foreign key (ID_PER)
      references PERSONAL_L (ID_PER) on delete restrict on update restrict;

alter table GRADO add constraint FK_ESTA foreign key (ID_SEC)
      references SECRETARIAS (ID_SEC) on delete restrict on update restrict;

alter table GRADO add constraint FK_ESTAR foreign key (CED_EST)
      references ESTUDIANTES (CED_EST) on delete restrict on update restrict;

alter table GRADO add constraint FK_REALIZA foreign key (ID_LUG)
      references LUGARES (ID_LUG) on delete restrict on update restrict;

alter table GRADO add constraint FK_TOMA foreign key (ID_MOD)
      references MODALIDAD (ID_MOD) on delete restrict on update restrict;

