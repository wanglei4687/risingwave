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
CREATE MATERIALIZED VIEW m0 AS SELECT t_1.p_container AS col_0, 'oMO9OElogE' AS col_1, t_1.p_container AS col_2 FROM alltypes2 AS t_0 JOIN part AS t_1 ON t_0.c9 = t_1.p_type AND (t_1.p_size > t_0.c6) GROUP BY t_0.c5, t_1.p_mfgr, t_0.c15, t_1.p_partkey, t_1.p_brand, t_0.c2, t_0.c8, t_1.p_comment, t_1.p_type, t_1.p_container HAVING false;
CREATE MATERIALIZED VIEW m1 AS SELECT t_1.ps_availqty AS col_0, (OVERLAY('7dMdWp6oV7' PLACING t_0.col_1 FROM (coalesce(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, t_1.ps_availqty)) FOR t_1.ps_availqty)) AS col_1, (substr((split_part('t0YUqanRUq', t_0.col_1, t_1.ps_availqty)), (DATE '2022-03-23' - DATE '2022-03-30'))) AS col_2 FROM m0 AS t_0 FULL JOIN partsupp AS t_1 ON t_0.col_1 = t_1.ps_comment WHERE CAST(t_1.ps_availqty AS BOOLEAN) GROUP BY t_1.ps_availqty, t_0.col_1, t_1.ps_partkey, t_1.ps_suppkey HAVING false;
CREATE MATERIALIZED VIEW m2 AS SELECT tumble_0.c7 AS col_0, (977) AS col_1, (~ tumble_0.c2) AS col_2, (72) AS col_3 FROM tumble(alltypes2, alltypes2.c11, INTERVAL '1') AS tumble_0 WHERE tumble_0.c1 GROUP BY tumble_0.c7, tumble_0.c2;
CREATE MATERIALIZED VIEW m3 AS SELECT 'DFalAhPq9f' AS col_0, t_1.date_time AS col_1 FROM m0 AS t_0 LEFT JOIN bid AS t_1 ON t_0.col_2 = t_1.channel WHERE false GROUP BY t_0.col_0, t_1.date_time HAVING false;
CREATE MATERIALIZED VIEW m4 AS SELECT t_0.ps_partkey AS col_0, (SMALLINT '906') AS col_1 FROM partsupp AS t_0 GROUP BY t_0.ps_partkey HAVING true;
CREATE MATERIALIZED VIEW m5 AS SELECT ('v9BLvNSXMP') AS col_0 FROM auction AS t_0 JOIN partsupp AS t_1 ON t_0.description = t_1.ps_comment GROUP BY t_1.ps_partkey, t_0.category, t_0.seller, t_1.ps_availqty, t_0.description, t_0.initial_bid, t_0.id HAVING true;
CREATE MATERIALIZED VIEW m6 AS SELECT t_0.city AS col_0, (986) AS col_1, (t_1.ps_supplycost * (BIGINT '164')) AS col_2, t_0.city AS col_3 FROM person AS t_0 LEFT JOIN partsupp AS t_1 ON t_0.email_address = t_1.ps_comment GROUP BY t_0.city, t_1.ps_supplycost;
CREATE MATERIALIZED VIEW m7 AS SELECT t_0.o_totalprice AS col_0, t_0.o_comment AS col_1, t_0.o_orderpriority AS col_2 FROM orders AS t_0 RIGHT JOIN m4 AS t_1 ON t_0.o_shippriority = t_1.col_0 GROUP BY t_0.o_totalprice, t_0.o_comment, t_0.o_orderpriority, t_0.o_custkey HAVING true;
CREATE MATERIALIZED VIEW m8 AS SELECT t_1.ps_supplycost AS col_0, t_0.col_0 AS col_1, t_1.ps_availqty AS col_2 FROM m2 AS t_0 JOIN partsupp AS t_1 ON t_0.col_1 = t_1.ps_supplycost AND ((FLOAT '-2147483648') < (FLOAT '940')) WHERE (t_0.col_2 < (BIGINT '212')) GROUP BY t_0.col_3, t_0.col_0, t_0.col_1, t_1.ps_availqty, t_1.ps_supplycost HAVING (DATE '2022-03-30' > (DATE '2022-03-29' - (INT '729')));
CREATE MATERIALIZED VIEW m9 AS SELECT (t_0.col_0 - (SMALLINT '1')) AS col_0 FROM m1 AS t_0 LEFT JOIN lineitem AS t_1 ON t_0.col_2 = t_1.l_linestatus WHERE true GROUP BY t_0.col_0 HAVING true;
