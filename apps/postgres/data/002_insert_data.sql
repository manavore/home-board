COPY "manavore"."task"("name") FROM '/docker-entrypoint-initdb.d/data_task.csv' DELIMITER ';' CSV;
COPY "manavore"."period"("name") FROM '/docker-entrypoint-initdb.d/data_period.csv' DELIMITER ';' CSV;
