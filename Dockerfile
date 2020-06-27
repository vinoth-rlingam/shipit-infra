FROM ruby:2.7.1-slim
RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_ROOT /var/www/hello-world
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile* $APP_ROOT/
RUN bundle install
ADD . $APP_ROOT

EXPOSE 4567
CMD ["bundle", "exec", "rackup", "config.ru", "-p", "4567", "-s", "thin", "-o", "0.0.0.0"]