CREATE TABLE "matches" (
  "match_id" varchar(30) PRIMARY KEY,
  "game_length" float8,
  "tft_set_number" float4,
  "patch" varchar(60)
);

CREATE TABLE "participants" (
  "puuid" varchar(100) PRIMARY KEY,
  "sname" varchar(50)
);

CREATE TABLE "traits" (
  "tid" serial PRIMARY KEY,
  "trait_id" varchar(50),
  "trait_name" varchar(30),
  "descrip" text
);

CREATE TABLE "units" (
  "cid" serial PRIMARY KEY,
  "char_id" varchar(50),
  "cname" varchar,
  "cost" int
);

CREATE TABLE "unit_traits" (
  "cid" int REFERENCES units ON DELETE NO ACTION,
  "tid" int REFERENCES traits ON DELETE NO ACTION,
  PRIMARY KEY ("cid", "tid")
);

CREATE TABLE "match_participant" (
  "match_id" varchar(30) REFERENCES matches ON DELETE NO ACTION,
  "puuid" varchar(100) REFERENCES participants ON DELETE NO ACTION,
  "gold_remaining" int,
  "last_round" int,
  "placement" int,
  "level" int,
  "dmg_dealt" int,
  "players eliminated" int,
  "augments" varchar,
  PRIMARY KEY ("match_id", "puuid")
);

CREATE TABLE "team_traits" (
  "match_id" varchar(30) REFERENCES matches ON DELETE NO ACTION,
  "puuid" varchar(100) REFERENCES participants ON DELETE NO ACTION,
  "tid" int REFERENCES traits ON DELETE NO ACTION,
  "num_units" int, 
  "teir_current" int,
  "teir_total" int, 
  "style" int,
  PRIMARY KEY ("match_id", "puuid", "trait_id")
);

CREATE TABLE "team_units" (
  "match_id" varchar(30) REFERENCES matches ON DELETE NO ACTION,
  "puuid" varchar(100) REFERENCES participants ON DELETE NO ACTION,
  "cid" int REFERENCES units ON DELETE NO ACTION,
  "teir" int,
  PRIMARY KEY ("match_id", "puuid", "char_id")
);

CREATE TABLE "items" (
  "iid" serial PRIMARY KEY,
  "item_id" int,
  "iname" varchar(50),
  "descrip" text
);

CREATE TABLE "augments" (
  "aid" serial PRIMARY KEY,
  "augment_id" varchar,
  "aname" varchar(50),
  "descrip" text
);

CREATE TABLE "team_units_items" (
  "match_id" varchar,
  "participant_id" varchar,
  "cid" int REFERENCES units ON DELETE NO ACTION,
  "iid" int REFERENCES items ON DELETE NO ACTION,
  PRIMARY KEY ("match_id", "participant_id", "cid", "iid")
);

