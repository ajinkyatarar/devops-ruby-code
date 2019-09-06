#!/bin/bash

echo "Enter Name:"
read name
heroku create $name
heroku git:remote -a $name 
git push heroku master  
heroku addons:create cleardb:ignite
mysql=`heroku config | grep CLEARDB_DATABASE_URL | awk {'print $2'}`
mysql2=`echo "${mysql//mysql/$'mysql2'}"`
heroku config:set DATABASE_URL=$mysql2
heroku run rake db:migrate db:seed
 
