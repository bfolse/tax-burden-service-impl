while getopts i:u:d:p: option
do
case "${option}"
in
i) DBINSTANCE=${OPTARG};;
u) DBUSER=${OPTARG};;
d) DBNAME=${OPTARG};;
p) DBPASSWORD=${OPTARG};;
esac
done
set PGPASSWORD=$DBPASSWORD;
psql -h $DBINSTANCE -U $DBUSER -d $DBNAME -f setup_rds_postgis.sql -o setup_rds_postgis.out
