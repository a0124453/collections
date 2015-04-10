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


####################################### For Q1 & Q3
./loaddata.sh 100000 10

####################################### Q1
####################################### INLJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO on;
	SET enable_indexscan TO on;
	SET enable_mergejoin TO off;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= :v;
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO off;
	SET enable_mergejoin TO on;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= :v;
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO on;
	SET enable_mergejoin TO on;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= :v;
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO off;
	SET enable_mergejoin TO off;
	SET enable_hashjoin TO on;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT r.c, s.z FROM r JOIN s ON r.a = s.y WHERE r.b <= :v;
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### END OF Q1A




####################################### INLJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO on;
	SET enable_indexscan TO on;
	SET enable_mergejoin TO off;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO off;
	SET enable_mergejoin TO on;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO on;
	SET enable_mergejoin TO on;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO off;
	SET enable_mergejoin TO off;
	SET enable_hashjoin TO on;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### END OF Q1B




####################################### INLJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO on;
	SET enable_indexscan TO on;
	SET enable_mergejoin TO off;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO off;
	SET enable_mergejoin TO on;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO on;
	SET enable_mergejoin TO on;
	SET enable_hashjoin TO off;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### SMJ
for i in 12500 25000 37500 50000 75000 100000
do
psql -e -v v=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO 4096; 
	SET enable_nestloop TO off;
	SET enable_indexscan TO off;
	SET enable_mergejoin TO off;
	SET enable_hashjoin TO on;
	SELECT pg_stat_reset();
	SELECT dropdbbuffers('assign3');
	EXPLAIN ANALYZE SELECT z FROM S WHERE NOT EXISTS (SELECT * FROM r WHERE r.a = s.y AND r.b <= :v);
	SELECT pg_sleep(2);
	SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname IN ('r', 's');
	\q
EOF
done

####################################### END OF Q1C
####################################### END OF Q1












####################################### Q3
####################################### INLJ
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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

####################################### END OF Q3A




####################################### INLJ
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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

####################################### END OF Q3B




####################################### INLJ
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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
for i in 2048 4096 8192 16384 32768
do
psql -e -v m=$i ${PORTOPTION} $DBNAME <<EOF
	SET work_mem TO :m; 
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

####################################### END OF Q3C
####################################### END OF Q3






