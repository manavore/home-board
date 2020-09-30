CREATE SCHEMA IF NOT EXISTS manavore;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS manavore."task"(
    "id_task"  uuid DEFAULT uuid_generate_v4(),
    "name" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_Task" PRIMARY KEY ( "id_task" )
);

CREATE TABLE IF NOT EXISTS manavore."period"(
    "id_period"  uuid DEFAULT uuid_generate_v4(),
    "name" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_Period" PRIMARY KEY ( "id_period" )
);

CREATE TABLE IF NOT EXISTS manavore."household"(
    "id_household"  uuid DEFAULT uuid_generate_v4(),
    "name" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_Household" PRIMARY KEY ( "id_household" )
);

CREATE TABLE IF NOT EXISTS manavore."user"(
    "id_user"  uuid DEFAULT uuid_generate_v4(),
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "id_household"   uuid NOT NULL,
    CONSTRAINT "FK_Household" FOREIGN KEY ( "id_household" ) REFERENCES "manavore"."household" ( "id_household" ),
    CONSTRAINT "PK_User" PRIMARY KEY ( "id_user" )
);

CREATE INDEX "FKIDX_Household" ON "manavore"."user"("id_household");

CREATE TYPE WeekDays AS ENUM ('Mon', 'Tue', 'Wed','Thu','Fri','Sat','Sun','Any');

CREATE TABLE IF NOT EXISTS manavore."scheduled"(
    "id_scheduled"  uuid DEFAULT uuid_generate_v4(),
    "weekdays"    WeekDays default 'Any',
    "id_task"   uuid NOT NULL,
    "id_period" uuid NOT NULL,
    "id_household"   uuid NOT NULL,
    CONSTRAINT "FK_Task" FOREIGN KEY ( "id_task" ) REFERENCES "manavore"."task" ( "id_task" ),
    CONSTRAINT "FK_Period" FOREIGN KEY ( "id_period" ) REFERENCES "manavore"."period" ( "id_period" ),
    CONSTRAINT "FK_Household" FOREIGN KEY ( "id_household" ) REFERENCES "manavore"."household" ( "id_household" ),
    CONSTRAINT "PK_Scheduled" PRIMARY KEY ( "id_scheduled" )
);

CREATE INDEX "FKIDX_Task" ON "manavore"."task"("id_task");
CREATE INDEX "FKIDX_Period" ON "manavore"."period"("id_period");
CREATE INDEX "FKIDX_Household_2" ON "manavore"."household"("id_household");

CREATE TABLE IF NOT EXISTS manavore."done"(
    "id_done"  uuid DEFAULT uuid_generate_v4(),
    "date" DATE NOT NULL,
    "id_scheduled"   uuid NOT NULL,
    CONSTRAINT "FK_Scheduled" FOREIGN KEY ( "id_scheduled" ) REFERENCES "manavore"."scheduled" ( "id_scheduled" ),
    CONSTRAINT "PK_Done" PRIMARY KEY ( "id_done" )
);

CREATE INDEX "FKIDX_Scheduled" ON "manavore"."scheduled"("id_scheduled");



