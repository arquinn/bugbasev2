CREATE DATABASE test;
USE test;
CREATE TABLE t1 (i INT) ENGINE=MyISAM PARTITION BY HASH(i) PARTITIONS 2;
LOCK TABLE t1 WRITE;
TRUNCATE TABLE t1;
DESC t1;
 
# Cleanup
DROP TABLE t1;