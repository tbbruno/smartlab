PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "accesses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "desk_id" integer, "user_id" integer, "devolution_time" datetime, "image" blob, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "desks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "status" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "lab_id" integer);
INSERT INTO "desks" VALUES(1,'Desk 01',0,'2017-05-27 23:51:01.816609','2017-05-27 23:51:01.816609',1);
INSERT INTO "desks" VALUES(2,'Desk 02',0,'2017-05-27 23:51:01.833316','2017-05-27 23:51:01.833316',1);
INSERT INTO "desks" VALUES(3,'Desk 03',1,'2017-05-27 23:51:01.852401','2017-05-27 23:51:01.852401',1);
INSERT INTO "desks" VALUES(4,'Desk 04',0,'2017-05-27 23:51:01.866123','2017-05-27 23:51:01.866123',1);
INSERT INTO "desks" VALUES(5,'Desk 05',1,'2017-05-27 23:51:01.881664','2017-05-27 23:51:01.881664',1);
CREATE TABLE "equipment" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "model" varchar NOT NULL, "description" varchar, "tag" varchar NOT NULL, "serial" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "desk_id" integer);
INSERT INTO "equipment" VALUES(1,'DE2-70','Placa de SD','023948812','28128438483','2017-05-27 23:51:01.909968','2017-05-27 23:51:01.909968',1);
INSERT INTO "equipment" VALUES(2,'DE2-70','Placa de SD','094833812','66128438483','2017-05-27 23:51:01.924045','2017-05-27 23:51:01.924045',2);
INSERT INTO "equipment" VALUES(3,'DE2-70','Placa de SD','02394886062','281284384023','2017-05-27 23:51:01.938089','2017-05-27 23:51:01.938089',4);
INSERT INTO "equipment" VALUES(4,'Arduíno UNO','Arduíno usado pra projetos de disciplinas diversas','394885666062','2812842343840','2017-05-27 23:51:01.953547','2017-05-27 23:51:01.953547',4);
INSERT INTO "equipment" VALUES(5,'DE2-70','Placa de SD','02488908712','28128434573','2017-05-27 23:51:01.967822','2017-05-27 23:51:01.967822',5);
CREATE TABLE "incidents" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "location" varchar NOT NULL, "description" varchar NOT NULL, "measure" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "incidents" VALUES(1,'Laboratório de Hardware','Quebra de placa DE2-70','Advertência ao aluno e comunicação a Edna.','2017-05-27 23:51:01.992016','2017-05-27 23:51:01.992016');
INSERT INTO "incidents" VALUES(2,'Laboratório de Hardware','Quebra de placa DE2-70','Advertência ao aluno e comunicação a Edna.','2017-05-27 23:51:02.007970','2017-05-27 23:51:02.007970');
INSERT INTO "incidents" VALUES(3,'Laboratório de Hardware','Quebra de Arduíno','Advertência ao aluno e comunicação a Edna.','2017-05-27 23:51:02.020924','2017-05-27 23:51:02.020924');
CREATE TABLE "labs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "building" varchar NOT NULL, "code" varchar NOT NULL, "name" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "labs" VALUES(1,'CIn','C007','Laboratório de Hardware','2017-05-27 23:51:01.770473','2017-05-27 23:51:01.770473');
CREATE TABLE "tokens" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "cpf" varchar NOT NULL, "password" varchar NOT NULL, "admin" boolean DEFAULT 'f' NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "users" VALUES(1,'Admin','11111111111','admin','t','2017-05-27 23:51:01.723523','2017-05-27 23:51:01.723523');
INSERT INTO "users" VALUES(2,'User','22222222222','user','f','2017-05-27 23:51:01.744777','2017-05-27 23:51:01.744777');
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20170517022151');
INSERT INTO "schema_migrations" VALUES('20170517004100');
INSERT INTO "schema_migrations" VALUES('20170517003854');
INSERT INTO "schema_migrations" VALUES('20170517003302');
INSERT INTO "schema_migrations" VALUES('20170517021901');
INSERT INTO "schema_migrations" VALUES('20170517003208');
INSERT INTO "schema_migrations" VALUES('20170517003054');
INSERT INTO "schema_migrations" VALUES('20170517003459');
INSERT INTO "schema_migrations" VALUES('20170517013103');
INSERT INTO "schema_migrations" VALUES('20170517010230');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2017-05-27 23:51:01.371644','2017-05-27 23:51:01.371644');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',2);
INSERT INTO "sqlite_sequence" VALUES('labs',1);
INSERT INTO "sqlite_sequence" VALUES('desks',5);
INSERT INTO "sqlite_sequence" VALUES('equipment',5);
INSERT INTO "sqlite_sequence" VALUES('incidents',3);
CREATE INDEX "index_accesses_on_desk_id" ON "accesses" ("desk_id");
CREATE INDEX "index_accesses_on_user_id" ON "accesses" ("user_id");
CREATE INDEX "index_desks_on_lab_id" ON "desks" ("lab_id");
CREATE INDEX "index_equipment_on_desk_id" ON "equipment" ("desk_id");
CREATE INDEX "index_tokens_on_user_id" ON "tokens" ("user_id");
COMMIT;