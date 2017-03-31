cat cust.sql | clickhouse-client --host=ch
cat customer.tbl | clickhouse-client --host=ch --query "INSERT INTO customer FORMAT CSV"
cat lineorder.tbl | clickhouse-client --host=ch --query "INSERT INTO lineorder FORMAT CSV" 
