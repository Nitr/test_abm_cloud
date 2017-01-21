# README

* ruby 2.3.1
* rails 5.0.1
* postgreSQL > 9.5(supported upsert)
* redis


setting up:
  - bundle install
  - rake db:create db:migrate
  - redis-server
  - bundle exec sidekiq -C config/sidekiq.yml
  - rspec
  - rails s
