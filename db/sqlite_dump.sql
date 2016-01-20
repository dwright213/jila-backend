PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20140707142334');
INSERT INTO "schema_migrations" VALUES('20140707142336');
INSERT INTO "schema_migrations" VALUES('20140711130643');
INSERT INTO "schema_migrations" VALUES('20140711150134');
INSERT INTO "schema_migrations" VALUES('20140715033644');
INSERT INTO "schema_migrations" VALUES('20140715042545');
INSERT INTO "schema_migrations" VALUES('20140717011649');
INSERT INTO "schema_migrations" VALUES('20140728044357');
INSERT INTO "schema_migrations" VALUES('20140811034540');
INSERT INTO "schema_migrations" VALUES('20140811050655');
INSERT INTO "schema_migrations" VALUES('20140813120924');
INSERT INTO "schema_migrations" VALUES('20140818013217');
INSERT INTO "schema_migrations" VALUES('20140820022452');
INSERT INTO "schema_migrations" VALUES('20140903121444');
INSERT INTO "schema_migrations" VALUES('20140904020258');
CREATE TABLE "admin_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "admin_users" VALUES(1,'admin@example.com','$2a$10$Ht6Xip8mvJZnydfZG3/lkOCm71Wi/HBNcJy/iomjgPyPOXmtb46/W',NULL,NULL,NULL,2,'2016-01-19 04:27:12.276117','2016-01-18 03:58:32.904636','127.0.0.1','127.0.0.1','2016-01-18 03:57:42.727701','2016-01-19 04:27:12.277997');
CREATE TABLE "active_admin_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "namespace" varchar(255), "body" text, "resource_id" varchar(255) NOT NULL, "resource_type" varchar(255) NOT NULL, "author_id" integer, "author_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "entry_word" varchar(255), "word_type" varchar(255), "translation" varchar(255), "description" text, "published?" boolean, "created_at" datetime, "updated_at" datetime, "image_file_name" varchar(255), "image_content_type" varchar(255), "image_file_size" integer, "image_updated_at" datetime, "audio_file_name" varchar(255), "audio_content_type" varchar(255), "audio_file_size" integer, "audio_updated_at" datetime, "extras" text DEFAULT '---
:alternate_translations: []
', "display_order" integer);
INSERT INTO "entries" VALUES(2,'dan','noun','the one that''s here','the one that''s herethe one that''s herethe one that''s herethe one that''s herethe one that''s herethe one that''s here','f','2016-01-18 04:53:06.074796','2016-01-18 05:00:29.030216','20151106_221136.jpg','image/jpeg',3179811,'2016-01-18 05:00:25.158655',NULL,NULL,NULL,NULL,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
alternate_translations:
- the one that''s here
alternate_spellings:
- the one that''s herethe one that''s herethe one that''s herethe one that''s herethe
  one that''s herethe one that''s herethe one that''s herethe one that''s herethe one
  that''s herethe one that''s here
',NULL);
INSERT INTO "entries" VALUES(3,'eat sugart','pronoun','eat sugarteat sugart','eat sugart','f','2016-01-18 05:13:01.960448','2016-01-18 21:18:15.348549','018ab.jpg','image/jpeg',251719,'2016-01-18 21:18:14.045636',NULL,NULL,NULL,NULL,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
alternate_translations:
- eat sugart
alternate_spellings:
- eat sugart
',NULL);
INSERT INTO "entries" VALUES(4,'Translation','noun','traduccion','Translation','f','2016-01-18 06:12:32.405945','2016-01-18 21:17:45.584564','mountains_blue_sky_meadows_lake_fog_day_46053_3840x2160.jpg','image/jpeg',3468892,'2016-01-18 21:17:42.283106',NULL,NULL,NULL,NULL,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
alternate_translations:
- Translation
alternate_spellings:
- TranslationTranslation
',NULL);
INSERT INTO "entries" VALUES(5,'asdas','adjective','asdas','asdasasdasasdasasdas','f','2016-01-18 07:34:54.056820','2016-01-19 01:34:39.475608','20151219_154318.jpg','image/jpeg',2608470,'2016-01-18 07:34:50.306159','4-120.mp3','audio/mp3',94907,'2016-01-19 01:34:39.250766','--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
alternate_translations:
- "asdasasdas\r"
- "asdas\r"
- asdasasdasasdas
alternate_spellings:
- asdasasdas
',NULL);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "image_file_name" varchar(255), "image_content_type" varchar(255), "image_file_size" integer, "image_updated_at" datetime, "created_at" datetime, "updated_at" datetime, "position" integer, "image_game_available?" boolean DEFAULT 't', "audio_game_available?" boolean DEFAULT 't');
INSERT INTO "categories" VALUES(1,'Common Phrases','Fork-Conversion-Details.jpg','image/jpeg',510813,'2016-01-18 21:18:40.598204','2016-01-18 03:57:42.918601','2016-01-18 21:18:42.055564',1,'t','t');
CREATE TABLE "categories_entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category_id" integer, "entry_id" integer);
INSERT INTO "categories_entries" VALUES(2,1,2);
INSERT INTO "categories_entries" VALUES(3,1,3);
INSERT INTO "categories_entries" VALUES(4,1,4);
INSERT INTO "categories_entries" VALUES(5,1,5);
CREATE TABLE "image_credits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "attribution_text" varchar(255), "link" varchar(255), "created_at" datetime, "updated_at" datetime, "entry_id" integer, "category_id" integer);
INSERT INTO "image_credits" VALUES(4,'','','2016-01-18 05:00:29.034986','2016-01-18 05:00:29.034986',2,NULL);
INSERT INTO "image_credits" VALUES(10,'','','2016-01-18 21:17:45.592719','2016-01-18 21:17:45.592719',4,NULL);
INSERT INTO "image_credits" VALUES(11,'','','2016-01-18 21:18:15.355450','2016-01-18 21:18:15.355450',3,NULL);
INSERT INTO "image_credits" VALUES(12,'','','2016-01-18 21:18:42.058157','2016-01-18 21:18:42.058157',NULL,1);
INSERT INTO "image_credits" VALUES(13,'','','2016-01-19 01:34:39.486625','2016-01-19 01:34:39.486625',5,NULL);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('admin_users',1);
INSERT INTO "sqlite_sequence" VALUES('categories',1);
INSERT INTO "sqlite_sequence" VALUES('entries',5);
INSERT INTO "sqlite_sequence" VALUES('image_credits',13);
INSERT INTO "sqlite_sequence" VALUES('categories_entries',5);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE UNIQUE INDEX "index_admin_users_on_email" ON "admin_users" ("email");
CREATE UNIQUE INDEX "index_admin_users_on_reset_password_token" ON "admin_users" ("reset_password_token");
CREATE INDEX "index_active_admin_comments_on_namespace" ON "active_admin_comments" ("namespace");
CREATE INDEX "index_active_admin_comments_on_author_type_and_author_id" ON "active_admin_comments" ("author_type", "author_id");
CREATE INDEX "index_active_admin_comments_on_resource_type_and_resource_id" ON "active_admin_comments" ("resource_type", "resource_id");
COMMIT;
