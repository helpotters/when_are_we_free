#!/usr/bin/env bash

bundle install
bundle exec rails assets:precompile RAILS_ENV=production
bundle exec rake assets:clean
bundle exec rake db:migrate
