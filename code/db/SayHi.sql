/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/23 20:40:01                           */
/*==============================================================*/


drop table if exists activity;

drop table if exists activity_member;

drop table if exists comment;

drop table if exists favorite_info;

drop table if exists message;

drop table if exists user;

drop table if exists user_label;

/*==============================================================*/
/* Table: activity                                              */
/*==============================================================*/
create table activity
(
   activ_id             int(4) not null auto_increment,
   user_id              int(4),
   activ_name           char(50) not null,
   activ_state          char(10) not null,
   activ_city           char(10) not null,
   activ_address        varchar(255) not null,
   activ_starttime      datetime not null,
   activ_endtime        datetime not null,
   activ_brief          varchar(255) not null,
   activ_label          char(10) not null,
   exp_num              int(4) not null,
   limit_explain        varchar(255),
   activ_bill           varchar(255),
   favor_num            int(4),
   cmt_num              int(4),
   primary key (activ_id)
);

/*==============================================================*/
/* Table: activity_member                                       */
/*==============================================================*/
create table activity_member
(
   user_id              int(4),
   activ_id             int(4)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   cmt_id               int(4) not null auto_increment,
   user_id              int(4),
   activ_id             int(4),
   cmt_time             datetime,
   cmt_content          varchar(255),
   primary key (cmt_id)
);

/*==============================================================*/
/* Table: favorite_info                                         */
/*==============================================================*/
create table favorite_info
(
   user_id              int(4),
   activ_id             int(4)
);

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   msg_id               int(4) not null,
   user_id              int(4),
   mess_info            varchar(255),
   mess_time            datetime not null,
   primary key (msg_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int(4) not null auto_increment,
   user_name            char(50) not null,
   password             varchar(100) not null,
   avatar               varchar(255),
   primary key (user_id)
);

/*==============================================================*/
/* Table: user_label                                            */
/*==============================================================*/
create table user_label
(
   label_id             int(4) not null auto_increment,
   user_id              int(4),
   label_name           char(10),
   primary key (label_id)
);

alter table activity add constraint FK_Reference_9 foreign key (user_id)
      references user (user_id) on delete cascade on update cascade;

alter table activity_member add constraint FK_Reference_7 foreign key (user_id)
      references user (user_id) on delete cascade on update cascade;

alter table activity_member add constraint FK_Reference_8 foreign key (activ_id)
      references activity (activ_id) on delete cascade on update cascade;

alter table comment add constraint FK_Reference_5 foreign key (user_id)
      references user (user_id) on delete cascade on update cascade;

alter table comment add constraint FK_Reference_6 foreign key (activ_id)
      references activity (activ_id) on delete cascade on update cascade;

alter table favorite_info add constraint FK_Reference_3 foreign key (user_id)
      references user (user_id) on delete cascade on update cascade;

alter table favorite_info add constraint FK_Reference_4 foreign key (activ_id)
      references activity (activ_id) on delete cascade on update cascade;

alter table message add constraint FK_Reference_1 foreign key (user_id)
      references user (user_id) on delete cascade on update cascade;

alter table user_label add constraint FK_Reference_2 foreign key (user_id)
      references user (user_id) on delete cascade on update cascade;

