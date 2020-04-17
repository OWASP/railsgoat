FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
RUN chgrp -R 0 /myapp \
  && chmod -R g+rwX /myapp
WORKDIR /myapp
RUN bundle install
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
ADD . /myapp