--! qt:dataset:srcpart
set hive.cbo.fallback.strategy=NEVER;

CREATE TABLE dest1(key INT, value STRING, dt STRING, hr STRING) STORED AS TEXTFILE;

INSERT OVERWRITE TABLE dest1 SELECT s.*
FROM srcpart TABLESAMPLE (BUCKET 1 OUT OF 2) s
WHERE s.ds='2008-04-08' and s.hr='11';

