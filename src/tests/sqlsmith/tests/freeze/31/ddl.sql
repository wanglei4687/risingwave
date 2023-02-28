CREATE TABLE supplier (s_suppkey INT, s_name CHARACTER VARYING, s_address CHARACTER VARYING, s_nationkey INT, s_phone CHARACTER VARYING, s_acctbal NUMERIC, s_comment CHARACTER VARYING, PRIMARY KEY (s_suppkey));
CREATE TABLE part (p_partkey INT, p_name CHARACTER VARYING, p_mfgr CHARACTER VARYING, p_brand CHARACTER VARYING, p_type CHARACTER VARYING, p_size INT, p_container CHARACTER VARYING, p_retailprice NUMERIC, p_comment CHARACTER VARYING, PRIMARY KEY (p_partkey));
CREATE TABLE partsupp (ps_partkey INT, ps_suppkey INT, ps_availqty INT, ps_supplycost NUMERIC, ps_comment CHARACTER VARYING, PRIMARY KEY (ps_partkey, ps_suppkey));
CREATE TABLE customer (c_custkey INT, c_name CHARACTER VARYING, c_address CHARACTER VARYING, c_nationkey INT, c_phone CHARACTER VARYING, c_acctbal NUMERIC, c_mktsegment CHARACTER VARYING, c_comment CHARACTER VARYING, PRIMARY KEY (c_custkey));
CREATE TABLE orders (o_orderkey BIGINT, o_custkey INT, o_orderstatus CHARACTER VARYING, o_totalprice NUMERIC, o_orderdate DATE, o_orderpriority CHARACTER VARYING, o_clerk CHARACTER VARYING, o_shippriority INT, o_comment CHARACTER VARYING, PRIMARY KEY (o_orderkey));
CREATE TABLE lineitem (l_orderkey BIGINT, l_partkey INT, l_suppkey INT, l_linenumber INT, l_quantity NUMERIC, l_extendedprice NUMERIC, l_discount NUMERIC, l_tax NUMERIC, l_returnflag CHARACTER VARYING, l_linestatus CHARACTER VARYING, l_shipdate DATE, l_commitdate DATE, l_receiptdate DATE, l_shipinstruct CHARACTER VARYING, l_shipmode CHARACTER VARYING, l_comment CHARACTER VARYING, PRIMARY KEY (l_orderkey, l_linenumber));
CREATE TABLE nation (n_nationkey INT, n_name CHARACTER VARYING, n_regionkey INT, n_comment CHARACTER VARYING, PRIMARY KEY (n_nationkey));
CREATE TABLE region (r_regionkey INT, r_name CHARACTER VARYING, r_comment CHARACTER VARYING, PRIMARY KEY (r_regionkey));
CREATE TABLE person (id BIGINT, name CHARACTER VARYING, email_address CHARACTER VARYING, credit_card CHARACTER VARYING, city CHARACTER VARYING, state CHARACTER VARYING, date_time TIMESTAMP, extra CHARACTER VARYING, PRIMARY KEY (id));
CREATE TABLE auction (id BIGINT, item_name CHARACTER VARYING, description CHARACTER VARYING, initial_bid BIGINT, reserve BIGINT, date_time TIMESTAMP, expires TIMESTAMP, seller BIGINT, category BIGINT, extra CHARACTER VARYING, PRIMARY KEY (id));
CREATE TABLE bid (auction BIGINT, bidder BIGINT, price BIGINT, channel CHARACTER VARYING, url CHARACTER VARYING, date_time TIMESTAMP, extra CHARACTER VARYING);
CREATE TABLE alltypes1 (c1 BOOLEAN, c2 SMALLINT, c3 INT, c4 BIGINT, c5 REAL, c6 DOUBLE, c7 NUMERIC, c8 DATE, c9 CHARACTER VARYING, c10 TIME, c11 TIMESTAMP, c13 INTERVAL, c14 STRUCT<a INT>, c15 INT[], c16 CHARACTER VARYING[]);
CREATE TABLE alltypes2 (c1 BOOLEAN, c2 SMALLINT, c3 INT, c4 BIGINT, c5 REAL, c6 DOUBLE, c7 NUMERIC, c8 DATE, c9 CHARACTER VARYING, c10 TIME, c11 TIMESTAMP, c13 INTERVAL, c14 STRUCT<a INT>, c15 INT[], c16 CHARACTER VARYING[]);
CREATE MATERIALIZED VIEW m0 AS SELECT (FLOAT '567') AS col_0, sq_1.col_1 AS col_1, sq_1.col_1 AS col_2 FROM (SELECT t_0.p_container AS col_0, (to_char(TIMESTAMP '2022-03-10 00:35:45', min('VuzMFw0hdW'))) AS col_1, 'wP62PLRk1j' AS col_2 FROM part AS t_0 GROUP BY t_0.p_size, t_0.p_container HAVING false) AS sq_1 WHERE false GROUP BY sq_1.col_1;
CREATE MATERIALIZED VIEW m1 AS SELECT t_0.col_0 AS col_0, (FLOAT '2147483647') AS col_1, t_0.col_0 AS col_2, t_0.col_0 AS col_3 FROM m0 AS t_0 FULL JOIN lineitem AS t_1 ON t_0.col_1 = t_1.l_shipmode GROUP BY t_0.col_0;
CREATE MATERIALIZED VIEW m2 AS SELECT sq_1.col_0 AS col_0 FROM (SELECT TIME '00:35:46' AS col_0 FROM m0 AS t_0 GROUP BY t_0.col_1) AS sq_1 WHERE (((((SMALLINT '482') # (SMALLINT '336')) * (INTERVAL '0')) + sq_1.col_0)) IN (TIME '00:35:46', sq_1.col_0, sq_1.col_0, sq_1.col_0, TIME '00:35:46', ((INTERVAL '-161912') + (TIME '00:35:46' - (INTERVAL '60'))), ((INTERVAL '0') + sq_1.col_0), (sq_1.col_0 - (INTERVAL '1')), sq_1.col_0, sq_1.col_0) GROUP BY sq_1.col_0 HAVING false;
CREATE MATERIALIZED VIEW m3 AS SELECT (INT '1698908945') AS col_0 FROM orders AS t_0 LEFT JOIN supplier AS t_1 ON t_0.o_custkey = t_1.s_nationkey AND true GROUP BY t_0.o_clerk, t_0.o_custkey, t_0.o_shippriority;
CREATE MATERIALIZED VIEW m4 AS SELECT t_1.col_0 AS col_0, (INT '328') AS col_1, true AS col_2 FROM part AS t_0 LEFT JOIN m0 AS t_1 ON t_0.p_comment = t_1.col_1 AND (t_1.col_0 < (SMALLINT '464')) WHERE (true) GROUP BY t_0.p_comment, t_0.p_size, t_0.p_name, t_1.col_0, t_0.p_type, t_0.p_brand HAVING ((t_0.p_size & (BIGINT '0')) <> (FLOAT '459'));
CREATE MATERIALIZED VIEW m5 AS SELECT t_0.l_shipdate AS col_0, DATE '2022-03-10' AS col_1 FROM lineitem AS t_0 LEFT JOIN partsupp AS t_1 ON t_0.l_suppkey = t_1.ps_suppkey AND ((INTERVAL '1') IS NOT NULL) WHERE false GROUP BY t_0.l_tax, t_0.l_shipdate HAVING true;
CREATE MATERIALIZED VIEW m6 AS SELECT 'likRTeRJuF' AS col_0, t_1.l_orderkey AS col_1, (FLOAT '336') AS col_2 FROM region AS t_0 LEFT JOIN lineitem AS t_1 ON t_0.r_comment = t_1.l_returnflag GROUP BY t_1.l_orderkey, t_1.l_linenumber, t_1.l_partkey;
CREATE MATERIALIZED VIEW m7 AS SELECT t_0.c15 AS col_0 FROM alltypes2 AS t_0 WHERE t_0.c1 GROUP BY t_0.c5, t_0.c15, t_0.c7, t_0.c11, t_0.c13, t_0.c1;
CREATE MATERIALIZED VIEW m8 AS SELECT 'Y7ZM84iAhF' AS col_0, t_0.p_partkey AS col_1 FROM part AS t_0 FULL JOIN alltypes1 AS t_1 ON t_0.p_retailprice = t_1.c7 AND t_1.c1 GROUP BY t_0.p_name, t_0.p_container, t_1.c2, t_1.c1, t_1.c16, t_0.p_partkey, t_0.p_type, t_1.c9, t_1.c8, t_0.p_size, t_1.c4 HAVING t_1.c1;
CREATE MATERIALIZED VIEW m9 AS WITH with_0 AS (WITH with_1 AS (SELECT t_4.n_name AS col_0 FROM nation AS t_4 WHERE false GROUP BY t_4.n_name HAVING true) SELECT TIME '00:35:50' AS col_0, TIMESTAMP '2022-03-17 00:35:50' AS col_1 FROM with_1) SELECT CAST(NULL AS STRUCT<a NUMERIC, b DOUBLE, c CHARACTER VARYING>) AS col_0, ARRAY[(INT '454'), (INT '1')] AS col_1 FROM with_0 WHERE false;
