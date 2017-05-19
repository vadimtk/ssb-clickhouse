cat cust.sql | clickhouse-client --host=ch
sed -i 's/$/"1999-01-01"/' customer.tbl
cat customer.tbl | clickhouse-client --host=ch --query "INSERT INTO customer FORMAT CSV"
cat lineorder.tbl | clickhouse-client --host=ch --query "INSERT INTO lineorder FORMAT CSV" 
