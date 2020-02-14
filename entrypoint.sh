#waiting for postgres initialization

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

#do migration
python manage.py flush --no-input
python manage.py migrate

exec "$@"
