FROM brendan6/ruby:2.2.4
MAINTAINER Chris Sandison <chris@thinkdataworks.com>

ADD . $APP_HOME

RUN bundle install

CMD bundle exec rspec
