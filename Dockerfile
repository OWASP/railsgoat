FROM ruby:2.3.3

RUN apt-get update -q \
  && apt-get install -y --no-install-recommends \
     build-essential \
     libpq-dev \
     nodejs \
     bzip2 \
     wget \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /goat \
  && wget -q https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && bzip2 -d phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && tar -xvf phantomjs-2.1.1-linux-x86_64.tar \
  && ln -sf /phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

COPY . /goat

WORKDIR /goat

RUN bundle install
