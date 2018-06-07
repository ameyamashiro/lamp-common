cd /docker-entrypoint-initdb.d/

for file in dumps/*.sql; do
	filename=$(basename "$file")
	fname="${filename%.*}"
	ext="${filename##*.}"
	echo "[$filename] Creating database..."
    mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE database ${fname};"
	echo "[$filename] Restoring..."
	mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD -P 3306 $fname < $file

	echo "[$filename] Success";
done
