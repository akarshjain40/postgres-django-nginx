Create a docker environment.

For Centos7: wget  https://download.docker.com/linux/centos/docker-ce.repo && yum install docker-ce docker-ce-cli containerd.io

Clone the repo:

- Run: docker-compose -f docker-compose.yml build

- After the build is completed

- Run: docker-compose -f docker-compose.yml up -d

- Check the containers with command docker ps

- Check in the browser http://127.0.0.1:8086 (http will redirect to https)

- For https://127.0.0.1:8086/admin, You need to create a user by running
 
- docker exec -it {{django_web_container_id}} "/bin/sh" 

- Run the script : python3 manage.py createsuperuser

Verify the user created in postgres container 
```
psql -U djusr -d django

django=# select * from auth_user;
 id |                                    password                                    | last_login | is_superuser | username | first_name | last_name |     email     | is_staff | is_active |         date_joined          
----+--------------------------------------------------------------------------------+------------+--------------+----------+------------+-----------+---------------+----------+-----------+------------------------------
  1 | pbkdf2_sha256$150000$9kChpFZGO3em$oif5n5yvzY+5XlTQRQCaRdAd9wjrvq+KAWKWe9QjyIM= |            | t            | john      |            |           | john@gmail.com | t        | t         | 2020-02-15 15:27:40.97991+00
(1 row)
```

Login with created user in https://127.0.0.1/8086/admin and add users.


