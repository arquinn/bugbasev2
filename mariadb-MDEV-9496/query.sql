CREATE DATABASE test;
USE test;
CREATE TABLE t1 (i INT);
DROP FUNCTION IF EXISTS f1;
CREATE  FUNCTION f1() RETURNS INT RETURN 1;
CREATE OR REPLACE TABLE t1 SELECT f1() AS a;