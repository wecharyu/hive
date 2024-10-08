--! qt:dataset:src
set hive.explain.user=false;
;
set hive.exec.reducers.max = 1;
set hive.cbo.fallback.strategy=NEVER;

-- SORT_QUERY_RESULTS

CREATE TABLE bucket3_1(key int, value string) partitioned by (ds string) CLUSTERED BY (key) INTO 2 BUCKETS;

explain extended
insert overwrite table bucket3_1 partition (ds='1')
select * from src;

insert overwrite table bucket3_1 partition (ds='1')
select * from src;

insert overwrite table bucket3_1 partition (ds='2')
select * from src;

explain
select * from bucket3_1 tablesample (bucket 1 out of 2) s where ds = '1';

select * from bucket3_1 tablesample (bucket 1 out of 2) s where ds = '1';
