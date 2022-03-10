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
  "trait_id" varchar(50) PRIMARY KEY,
  "trait_name" varchar(30),
  "descrip" text
);

CREATE TABLE "units" (
  "char_id" varchar(50) PRIMARY KEY,
  "cname" varchar,
  "cost" int
);

CREATE TABLE "unit_traits" (
  "char_id" varchar(50) REFERENCES units ON DELETE NO ACTION,
  "trait_id" varchar(50) REFERENCES traits ON DELETE NO ACTION,
  PRIMARY KEY ("char_id", "trait_id")
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
  "trait_id" varchar REFERENCES traits ON DELETE NO ACTION,
  "num_units" int, 
  "teir_current" int,
  "teir_total" int, 
  "style" int,
  PRIMARY KEY ("match_id", "puuid", "trait_id")
);

CREATE TABLE "team_units" (
  "match_id" varchar(30) REFERENCES matches ON DELETE NO ACTION,
  "puuid" varchar(100) REFERENCES participants ON DELETE NO ACTION,
  "char_id" varchar REFERENCES units ON DELETE NO ACTION,
  "teir" int,
  PRIMARY KEY ("match_id", "puuid", "char_id")
);

CREATE TABLE "items" (
  "item_id" int PRIMARY KEY,
  "iname" varchar(50),
  "descrip" text
);

CREATE TABLE "augments" (
  "augment_id" varchar PRIMARY KEY,
  "aname" varchar(50),
  "descrip" text
);

CREATE TABLE "team_units_items" (
  "match_id" varchar,
  "participant_id" varchar,
  "char_id" varchar,
  "item_id" int REFERENCES items ON DELETE NO ACTION,
  PRIMARY KEY ("match_id", "participant_id", "char_id", "item_id")
);

