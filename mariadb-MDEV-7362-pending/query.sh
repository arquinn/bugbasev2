#!/bin/bash
mysql -uroot -psecret -e "CREATE DATABASE test;
USE test;
CREATE TABLE t1 (a longtext, FULLTEXT KEY (\`a\`)) ENGINE=MyISAM;
insert into t1 values (unhex('3E0D0A4141414142334E7A6143317963324541414141424977414141674541726D'));
analyze table t1 persistent for all;"