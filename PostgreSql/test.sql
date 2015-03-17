#-- ---------------------------------Q1
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT * FROM r WHERE b=9;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q1
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = on; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT * FROM r WHERE b=9;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q2
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index c_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q2
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index c_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q3
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT b FROM r WHERE b>9;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q3
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = off; 
ELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT b FROM r WHERE b>9;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q3
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = off; 
SET enable_indexonlyscan = on; SET enable_seqscan = off;
BEGIN;
DROP index b_idx;
EXPLAIN ANALYZE SELECT b FROM r WHERE b>9;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q4
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT * FROM r WHERE b=9 AND c=10;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q4
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index cb_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b=9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q5
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = on; 
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index cb_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b=9 AND c>0;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q5
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index b_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b=9 AND c>0;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = on;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index cb_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index cb_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = on;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index b_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index b_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = on;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index c_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = on; SET enable_indexcan = off;
SET enable_indexonlyscan = off; SET enable_seqscan = off;
BEGIN;
DROP index c_idx;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
ROLLBACK;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-- ---------------------------------Q6
SELECT pg_stat_reset();
SELECT dropdbbuffers('assign2');
SET enable_bitmapscan = off; SET enable_indexcan = off;
SET enable_indexonlyscan = off; SET enable_seqscan = on;
EXPLAIN ANALYZE SELECT * FROM r WHERE b>9 AND c=10;
SELECT pg_sleep(2);
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit FROM pg_statio_all_tables WHERE relname = 'r';
#-----------------------------------End of file
