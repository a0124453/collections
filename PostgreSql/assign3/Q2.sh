#!/usr/bin/env bash

# Assignment 3
# Sample script to run experiment 1a using indexed nested loop join


DBNAME=assign3

# check that server is running
if ! pg_ctl status > /dev/null; then
    echo "ERROR: postgres server is not running!"
    exit 1;
fi


# set PORTOPTION appropriately depending on whether server is running with non-default port number
PORTNUMBER=$(pg_ctl status | grep "\-p" | awk '{print $3}')
PORTNUMBER=${PORTNUMBER//\"/}
if [ "${PORTNUMBER}" ]; then
    PORTOPTION=" -p $PORTNUMBER"
else
    PORTOPTION=""
fi

####################################### Q2
####################################### INLJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO on;
    SET enable_indexscan TO on;
    SET enable_mergejoin TO off;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= 25000;
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO off;
    SET enable_mergejoin TO on;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= 25000;
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO on;
    SET enable_mergejoin TO on;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= 25000;
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO off;
    SET enable_mergejoin TO off;
    SET enable_hashjoin TO on;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= 25000;
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### END OF Q2A




####################################### INLJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO on;
    SET enable_indexscan TO on;
    SET enable_mergejoin TO off;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO off;
    SET enable_mergejoin TO on;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO on;
    SET enable_mergejoin TO on;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO off;
    SET enable_mergejoin TO off;
    SET enable_hashjoin TO on;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### END OF Q2B




####################################### INLJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO on;
    SET enable_indexscan TO on;
    SET enable_mergejoin TO off;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO off;
    SET enable_mergejoin TO on;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO on;
    SET enable_mergejoin TO on;
    SET enable_hashjoin TO off;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### SMJ
for i in 5 10 20 40 80
do
./loaddata.sh 100000 $i
psql -e ${PORTOPTION} $DBNAME <<EOF
    SET work_mem TO 4096; 
    SET enable_nestloop TO off;
    SET enable_indexscan TO off;
    SET enable_mergejoin TO off;
    SET enable_hashjoin TO on;
    SELECT pg_stat_reset();
    SELECT dropdbbuffers('assign3');
    EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= 25000);
    SELECT pg_sleep(2);
    SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
    \q
EOF
done

####################################### END OF Q2C
####################################### END OF Q2
