for h in ch 10.10.7.165 10.10.7.164
do
    clickhouse-client --host=$h --query="DROP TABLE IF EXISTS customer"
    clickhouse-client --host=$h --query="DROP TABLE IF EXISTS lineorder"
    clickhouse-client --host=$h --query="DROP TABLE IF EXISTS customerd"
    clickhouse-client --host=$h --query="DROP TABLE IF EXISTS lineorderd"
    clickhouse-client --host=$h --query="DROP TABLE IF EXISTS part"
    clickhouse-client --host=$h --query="DROP TABLE IF EXISTS partd"
    cat cust.sql | clickhouse-client --host=$h 
    cat lineorder.sql | clickhouse-client --host=$h 
    cat part.sql | clickhouse-client --host=$h 
    cat part.tbl | clickhouse-client --host=$h --query="INSERT INTO part FORMAT CSV"
    cat customer.tbl | clickhouse-client --host=$h --query="INSERT INTO customer FORMAT CSV"
    clickhouse-client --host=$h --query="CREATE TABLE lineorderd AS lineorder ENGINE = Distributed(perftest_3shards_1replicas, default, lineorder, rand())"
    clickhouse-client --host=$h --query="CREATE TABLE customerd AS customer ENGINE = Distributed(perftest_3shards_1replicas, default, customer, rand())"
    clickhouse-client --host=$h --query="CREATE TABLE partd AS part ENGINE = Distributed(perftest_3shards_1replicas, default, part, rand())"
done
