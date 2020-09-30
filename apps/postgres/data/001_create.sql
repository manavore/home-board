CREATE SCHEMA IF NOT EXISTS manavore;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS manavore."Task"(
    "idTask"  uuid DEFAULT uuid_generate_v4(),
    "name" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_Task" PRIMARY KEY ( "idTask" )
);

CREATE TABLE IF NOT EXISTS manavore."Period"(
    "idPeriod"  uuid DEFAULT uuid_generate_v4(),
    "name" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_Period" PRIMARY KEY ( "idPeriod" )
);

CREATE TABLE IF NOT EXISTS manavore."Household"(
    "idHousehold"  uuid DEFAULT uuid_generate_v4(),
    "name" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_Household" PRIMARY KEY ( "idHousehold" )
);

CREATE TABLE IF NOT EXISTS manavore."User"(
    "idUser"  uuid DEFAULT uuid_generate_v4(),
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "idHousehold"   uuid NOT NULL,
    CONSTRAINT "FK_Household" FOREIGN KEY ( "idHousehold" ) REFERENCES "manavore"."Household" ( "idHousehold" ),
    CONSTRAINT "PK_User" PRIMARY KEY ( "idUser" )
);

CREATE INDEX "FKIDX_Household" ON "manavore"."User"("idHousehold");

CREATE TYPE WeekDays AS ENUM ('Mon', 'Tue', 'Wed','Thu','Fri','Sat','Sun','Any');

CREATE TABLE IF NOT EXISTS manavore."Scheduled"(
    "idScheduled"  uuid DEFAULT uuid_generate_v4(),
    "weekdays"    WeekDays default 'Any',
    "idTask"   uuid NOT NULL,
    "idPeriod" uuid NOT NULL,
    "idHousehold"   uuid NOT NULL,
    CONSTRAINT "FK_Task" FOREIGN KEY ( "idTask" ) REFERENCES "manavore"."Task" ( "idTask" ),
    CONSTRAINT "FK_Period" FOREIGN KEY ( "idPeriod" ) REFERENCES "manavore"."Period" ( "idPeriod" ),
    CONSTRAINT "FK_Household" FOREIGN KEY ( "idHousehold" ) REFERENCES "manavore"."Household" ( "idHousehold" ),
    CONSTRAINT "PK_Scheduled" PRIMARY KEY ( "idScheduled" )
);

CREATE INDEX "FKIDX_Task" ON "manavore"."Task"("idTask");
CREATE INDEX "FKIDX_Period" ON "manavore"."Period"("idPeriod");
CREATE INDEX "FKIDX_Household_2" ON "manavore"."Household"("idHousehold");

CREATE TABLE IF NOT EXISTS manavore."Done"(
    "idDone"  uuid DEFAULT uuid_generate_v4(),
    "date" DATE NOT NULL,
    "idScheduled"   uuid NOT NULL,
    CONSTRAINT "FK_Scheduled" FOREIGN KEY ( "idScheduled" ) REFERENCES "manavore"."Scheduled" ( "idScheduled" ),
    CONSTRAINT "PK_Done" PRIMARY KEY ( "idDone" )
);

CREATE INDEX "FKIDX_Scheduled" ON "manavore"."Scheduled"("idScheduled");



