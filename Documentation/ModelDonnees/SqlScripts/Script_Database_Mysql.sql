drop trigger COMPOUNDDELETETRIGGER_COMPTE_B;

drop trigger COMPOUNDINSERTTRIGGER_COMPTE_B;

drop trigger COMPOUNDUPDATETRIGGER_COMPTE_B;

drop trigger TIB_LIVRE;

drop trigger TUB_LIVRE;

drop trigger COMPOUNDDELETETRIGGER_UTILISAT;

drop trigger COMPOUNDINSERTTRIGGER_UTILISAT;

drop trigger COMPOUNDUPDATETRIGGER_UTILISAT;

drop trigger TIB_UTILISATEUR;

drop trigger TUB_UTILISATEUR;

drop table if exists ADRESSE;

drop index AIMER_FK on AIMER;

drop table if exists AIMER;

drop table if exists AUTEUR;

drop table if exists AUTEURS_LIVRE;

drop table if exists AUTORISATIONS;

drop table if exists CARTE_BANCAIRE;

drop table if exists CATEGORIE;

drop table if exists COMMENTAIRES;

drop table if exists COMPTE;

drop table if exists COMPTE_BANCAIRE;

drop table if exists CONFIGURATION;

drop table if exists CONFIGURE;

drop table if exists CONTENIR;

drop table if exists EDITEUR;

drop table if exists EDITION;

drop table if exists ENVOI_EMPRUNTS;

drop table if exists EXEMPLAIRE;

drop table if exists FAVORIS;

drop table if exists FORMAT;

drop table if exists LISTE;

drop table if exists LIVRE;

drop table if exists MESSAGE;

drop table if exists NOTES;

drop table if exists PAYS;

drop table if exists POSSEDER_LISTE;

drop table if exists REPUTATION;

drop table if exists RETOUR_EMPRUNT;

drop table if exists TAG;

drop table if exists TAGER;

drop table if exists TRANSACTION;

drop table if exists TYPE_ADRESSE;

drop table if exists TYPE_CONFIGURATION;

drop table if exists UTILISATEUR;

drop table if exists VILLE;

/*==============================================================*/
/* Table : ADRESSE                                              */
/*==============================================================*/
create table ADRESSE
(
   ID_ADRESSE           int not null,
   ID_VILLE             int not null,
   ID_TYPE_ADRESSE      int not null,
   ID_UTILISATEUR       int not null,
   LIGNE1_ADRESSE       varchar(1),
   LIGNE2_ADRESSE       varchar(1),
   DISTRICT_ADRESSE     varchar(1),
   CODE_POSTALE_ADRESSE numeric(5,0),
   PAR_DEFAULT          smallint,
   LIBELLE_ADRESSE      varchar(1),
   primary key (ID_ADRESSE)
);

/*==============================================================*/
/* Table : AIMER                                                */
/*==============================================================*/
create table AIMER
(
   ID_EDITION           int not null,
   ID_UTILISATEUR       int not null,
   primary key (ID_EDITION, ID_UTILISATEUR)
);

/*==============================================================*/
/* Index : AIMER_FK                                             */
/*==============================================================*/
create index AIMER_FK on AIMER
(
   
);

/*==============================================================*/
/* Table : AUTEUR                                               */
/*==============================================================*/
create table AUTEUR
(
   ID_AUTEUR            int not null,
   NOM_AUTEUR           varchar(1) not null,
   PRENOM_AUTEUR        varchar(1) not null,
   PRENOM2_AUTEUR       varchar(1),
   primary key (ID_AUTEUR),
   key AK_IDENTIFIANT_1 (ID_AUTEUR)
);

/*==============================================================*/
/* Table : AUTEURS_LIVRE                                        */
/*==============================================================*/
create table AUTEURS_LIVRE
(
   ID_AUTEUR            int not null,
   ID_LIVRE             int not null
);

/*==============================================================*/
/* Table : AUTORISATIONS                                        */
/*==============================================================*/
create table AUTORISATIONS
(
   LOGIN_COMPTE         varchar(900),
   NETWORK_NAME         varchar(1),
   NETWORK_USER_ID      varchar(1)
);

/*==============================================================*/
/* Table : CARTE_BANCAIRE                                       */
/*==============================================================*/
create table CARTE_BANCAIRE
(
   ID_CARTE             int not null,
   ID_UTILISATEUR       int not null,
   NUMERO_CARTE         int not null,
   4DERNIER_NUMERO_CARTE int not null,
   NOM_COMPLET_TUTILAIRE varchar(1) not null,
   TYPE_CARTE           varchar(1) not null,
   MOIS_EXPIRATION_CARTE int not null,
   ANNEE_EXPIRATION_CARTE int not null,
   CRYPTOGRAMME_CARTE   int not null,
   primary key (ID_CARTE)
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE
(
   ID_CATEGORIE         int not null,
   NOM_CATEGORIE        varchar(1) not null,
   primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Table : COMMENTAIRES                                         */
/*==============================================================*/
create table COMMENTAIRES
(
   ID_UTILISATEUR       int not null,
   ID_LIVRE             int not null,
   COMMENTAIRE          text not null,
   DATE_COMMENTAIRE     datetime not null
);

/*==============================================================*/
/* Table : COMPTE                                               */
/*==============================================================*/
create table COMPTE
(
   LOGIN_COMPTE         varchar(900) not null,
   MOTDEPASS_COMPTE     varchar(1024) not null,
   DATE_DERNIERE_CONEEXION_COMPTE datetime not null,
   DATE_CREATION_COMPTE datetime not null,
   DESACTIVE            smallint not null,
   EMAIL_VERIFIE        smallint not null,
   primary key (LOGIN_COMPTE)
);

/*==============================================================*/
/* Table : COMPTE_BANCAIRE                                      */
/*==============================================================*/
create table COMPTE_BANCAIRE
(
   RIB_ID_AUTO          numeric(6,0) not null auto_increment,
   CODE_BANQUE          int not null,
   CODE_GUICHET         varchar(1) not null,
   NUMERO_COMPTE        varchar(1) not null,
   CLE_RIB              varchar(1) not null,
   RIB                  varchar(1) not null,
   IBAN                 varchar(1) not null,
   BIC                  varchar(1) not null,
   NOM_PROPRIAITAIRE    varchar(1),
   PRENOM_PROPRIAITAIRE varchar(1),
   primary key (RIB_ID_AUTO)
);

/*==============================================================*/
/* Table : CONFIGURATION                                        */
/*==============================================================*/
create table CONFIGURATION
(
   ID_CONFIGURATION     int not null,
   ID_TYPE_CONFIGURATION int not null,
   NOM_CONFIGURATION    varchar(1) not null,
   VALEUR_CONFIGURATION varchar(1) not null,
   primary key (ID_CONFIGURATION),
   key AK_IDENTIFIANT_1 (ID_CONFIGURATION)
);

/*==============================================================*/
/* Table : CONFIGURE                                            */
/*==============================================================*/
create table CONFIGURE
(
   ID_UTILISATEUR       int not null,
   ID_CONFIGURATION     int not null,
   primary key (ID_UTILISATEUR, ID_CONFIGURATION)
);

/*==============================================================*/
/* Table : CONTENIR                                             */
/*==============================================================*/
create table CONTENIR
(
   ID_EDITION           int not null,
   ID_LISTE             int not null,
   primary key (ID_EDITION, ID_LISTE)
);

/*==============================================================*/
/* Table : EDITEUR                                              */
/*==============================================================*/
create table EDITEUR
(
   ID_EDITEUR           int not null,
   CODE_EDITEUR         numeric(8,0) not null,
   NOM_EDITEUR          text not null,
   primary key (ID_EDITEUR)
);

/*==============================================================*/
/* Table : EDITION                                              */
/*==============================================================*/
create table EDITION
(
   ID_EDITION           int not null,
   ID_LIVRE             int not null,
   ID_EDITEUR           int not null,
   ID_FORMAT            int not null,
   NOM_EDITION          text not null,
   NOMBRE_PAGE_EDITION  int not null,
   LANGUE_EDITION       text not null,
   DATE_SORTIE_EDITION  datetime not null,
   ISBN13               text not null,
   ISBN10               text not null,
   primary key (ID_EDITION)
);

/*==============================================================*/
/* Table : ENVOI_EMPRUNTS                                       */
/*==============================================================*/
create table ENVOI_EMPRUNTS
(
   ID_TRANSACTION       int not null,
   ID_UTILISATEUR       int,
   ID_ADRESSE           int not null,
   ID_EXEMPLAIRE        int,
   ADR_ID_ADRESSE       int not null,
   DATE_EMPREINT        datetime not null,
   DUREE_EMPREINTE      int not null
);

/*==============================================================*/
/* Table : EXEMPLAIRE                                           */
/*==============================================================*/
create table EXEMPLAIRE
(
   ID_EXEMPLAIRE        int not null,
   ID_UTILISATEUR       int not null,
   ID_EDITION           int not null,
   DISPONIBILITE        smallint not null,
   DATE_MISE_EN_LIGNE   datetime,
   primary key (ID_EXEMPLAIRE)
);

/*==============================================================*/
/* Table : FAVORIS                                              */
/*==============================================================*/
create table FAVORIS
(
   ID_UTILISATEUR       int not null,
   ID_EDITION           int not null,
   primary key (ID_UTILISATEUR, ID_EDITION)
);

/*==============================================================*/
/* Table : FORMAT                                               */
/*==============================================================*/
create table FORMAT
(
   ID_FORMAT            int not null,
   NOM_FORMAT           text,
   primary key (ID_FORMAT)
);

/*==============================================================*/
/* Table : LISTE                                                */
/*==============================================================*/
create table LISTE
(
   ID_LISTE             int not null,
   NOM_LISTE            varchar(1),
   DATE_CREATION_LISTE  datetime,
   primary key (ID_LISTE)
);

/*==============================================================*/
/* Table : LIVRE                                                */
/*==============================================================*/
create table LIVRE
(
   ID_LIVRE             int not null,
   ID_CATEGORIE         int,
   TITRE_LIVRE          text not null,
   RESUME_OFFICIEL      text,
   primary key (ID_LIVRE)
);

/*==============================================================*/
/* Table : MESSAGE                                              */
/*==============================================================*/
create table MESSAGE
(
   ID_UTILISATEUR       int not null,
   UTI_ID_UTILISATEUR   int not null,
   MESSAGE_TEXT         text not null,
   DATE_ENVOI_MESSAGE   datetime not null,
   DATE_LECTURE_MESSAGE datetime,
   primary key (ID_UTILISATEUR, UTI_ID_UTILISATEUR, MESSAGE_TEXT)
);

/*==============================================================*/
/* Table : NOTES                                                */
/*==============================================================*/
create table NOTES
(
   ID_LIVRE             int not null,
   ID_UTILISATEUR       int not null,
   NOTE                 int
);

/*==============================================================*/
/* Table : PAYS                                                 */
/*==============================================================*/
create table PAYS
(
   ID_PAYS              int not null,
   NOM_PAYS             varchar(1),
   NOM_FR_PAYS          varchar(1),
   primary key (ID_PAYS)
);

/*==============================================================*/
/* Table : POSSEDER_LISTE                                       */
/*==============================================================*/
create table POSSEDER_LISTE
(
   ID_LISTE             int not null,
   ID_UTILISATEUR       int not null,
   primary key (ID_LISTE, ID_UTILISATEUR)
);

/*==============================================================*/
/* Table : REPUTATION                                           */
/*==============================================================*/
create table REPUTATION
(
   A_ID_UTILISATEUR     int not null,
   DE_UTILISATEUR       int not null,
   NOTE_REPUTATION      int not null,
   RECOMMENDATION_TEXTE text,
   primary key (A_ID_UTILISATEUR, DE_UTILISATEUR)
);

/*==============================================================*/
/* Table : RETOUR_EMPRUNT                                       */
/*==============================================================*/
create table RETOUR_EMPRUNT
(
   ID_EXEMPLAIRE        int,
   ID_UTILISATEUR       int,
   DATE_RETOUR          datetime not null
);

/*==============================================================*/
/* Table : TAG                                                  */
/*==============================================================*/
create table TAG
(
   ID_TAG               int not null,
   NOM_TAG              text not null,
   primary key (ID_TAG)
);

/*==============================================================*/
/* Table : TAGER                                                */
/*==============================================================*/
create table TAGER
(
   ID_TAG               int not null,
   ID_LIVRE             int not null
);

/*==============================================================*/
/* Table : TRANSACTION                                          */
/*==============================================================*/
create table TRANSACTION
(
   ID_TRANSACTION       int not null,
   ID_CARTE             int not null,
   RIB_ID_AUTO          numeric(8,0) not null,
   PRIX_TRANSACTION     numeric(8,2),
   NUMERO_AUTORISATION_BANCAIRE varchar(1),
   DATE_TRANSACTION     datetime,
   primary key (ID_TRANSACTION)
);

/*==============================================================*/
/* Table : TYPE_ADRESSE                                         */
/*==============================================================*/
create table TYPE_ADRESSE
(
   ID_TYPE_ADRESSE      int not null,
   LIBELLE_TYPE_ADRESSE varchar(1),
   primary key (ID_TYPE_ADRESSE)
);

/*==============================================================*/
/* Table : TYPE_CONFIGURATION                                   */
/*==============================================================*/
create table TYPE_CONFIGURATION
(
   ID_TYPE_CONFIGURATION int not null,
   LIBELLE_TYPE_CONFIGURATION varchar(1) not null,
   WP_CONFIG            smallint,
   ANDROID_CONFIG       smallint,
   IOS_CONFIG           smallint,
   WEB_CONFIG           smallint,
   SERVER_CONFIG        smallint,
   RECOMMENDATION_CONFIG smallint,
   COMMENTAIRE_CONFIGURATION varchar(1),
   primary key (ID_TYPE_CONFIGURATION)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   ID_UTILISATEUR       int not null,
   LOGIN_COMPTE         varchar(900) not null,
   NOM_UTILISATEUR      varchar(1024) not null,
   PRENOM_UTILISATEUR   varchar(1024) not null,
   PRENOM2_UTILISATEUR  varchar(1024) not null,
   TEL_UTILISATEUR      text not null,
   EMAIL_UTILISATEUR    text not null,
   DATE_NAISSANCE_UTILISATEUR datetime,
   LSITE_NOIRE          smallint,
   primary key (ID_UTILISATEUR)
);

/*==============================================================*/
/* Table : VILLE                                                */
/*==============================================================*/
create table VILLE
(
   ID_VILLE             int not null,
   ID_PAYS              int not null,
   NOM_VILLE            varchar(1),
   primary key (ID_VILLE)
);

alter table AIMER add constraint FK_AIMER foreign key (ID_EDITION)
      references EDITION (ID_EDITION);

alter table AIMER add constraint FK_AIMER2 foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table CARTE_BANCAIRE add constraint FK_POSSEDER foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table COMMENTAIRES add constraint FK_REFERENCE_18 foreign key (ID_LIVRE)
      references LIVRE (ID_LIVRE);

alter table COMMENTAIRES add constraint FK_REFERENCE_19 foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table CONTENIR add constraint FK_CONTENIR foreign key (ID_EDITION)
      references EDITION (ID_EDITION);

alter table CONTENIR add constraint FK_CONTENIR2 foreign key (ID_LISTE)
      references LISTE (ID_LISTE);

alter table ENVOI_EMPRUNTS add constraint FK_ADRESSE_ENVOI foreign key (ADR_ID_ADRESSE)
      references ADRESSE (ID_ADRESSE);

alter table ENVOI_EMPRUNTS add constraint FK_FACTURATION_ADRESSE foreign key (ID_ADRESSE)
      references ADRESSE (ID_ADRESSE);

alter table ENVOI_EMPRUNTS add constraint FK_FK_UTILISATEUR_ID_EMPRUNT foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table ENVOI_EMPRUNTS add constraint FK_REFERENCE_17 foreign key (ID_EXEMPLAIRE)
      references EXEMPLAIRE (ID_EXEMPLAIRE);

alter table ENVOI_EMPRUNTS add constraint FK_TRANSCATION_EMPREINTE foreign key (ID_TRANSACTION)
      references TRANSACTION (ID_TRANSACTION);

alter table FAVORIS add constraint FK_FAVORIS foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table FAVORIS add constraint FK_FAVORIS2 foreign key (ID_EDITION)
      references EDITION (ID_EDITION);

alter table POSSEDER_LISTE add constraint FK_POSSEDER_LISTE foreign key (ID_LISTE)
      references LISTE (ID_LISTE);

alter table POSSEDER_LISTE add constraint FK_POSSEDER_LISTE2 foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table REPUTATION add constraint FK_REPUTATION_PAR foreign key (A_ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table REPUTATION add constraint FK_REPUTER foreign key (DE_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table RETOUR_EMPRUNT add constraint FK_REFERENCE_14 foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR);

alter table RETOUR_EMPRUNT add constraint FK_REFERENCE_15 foreign key (ID_EXEMPLAIRE)
      references EXEMPLAIRE (ID_EXEMPLAIRE);

alter table TRANSACTION add constraint FK_TRANSACTION_CARTE foreign key (ID_CARTE)
      references CARTE_BANCAIRE (ID_CARTE);

alter table TRANSACTION add constraint FK_TRANSACTION_VERS foreign key (RIB_ID_AUTO)
      references COMPTE_BANCAIRE (RIB_ID_AUTO);


create trigger TIB_LIVRE before insert
on LIVRE for each row
begin
end;


create trigger TUB_LIVRE before update
on LIVRE for each row
begin
end;


create trigger TIB_UTILISATEUR before insert
on UTILISATEUR for each row
begin
end;


create trigger TUB_UTILISATEUR before update
on UTILISATEUR for each row
begin
end;
