psql $DATABASE_URL -c 'SELECT id FROM users LIMIT 1'

if [ $? == 0 ]; then
  echo "Running Rails DB migrations..."
  bundle exec rake db:migrate
else
  echo 'Skipping Rails DB migrations!!'
fi