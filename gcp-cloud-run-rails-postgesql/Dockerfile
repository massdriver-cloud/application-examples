FROM ruby:2.7.6-alpine

RUN apk add --no-cache --update build-base \
    linux-headers \
    git \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata

ENV RAILS_ENV=production
RUN bundle config set without 'development test'

WORKDIR /app

# Gemfile.lock
COPY Gemfile  /app
RUN bundle lock --add-platform x86_64-linux
RUN bundle install
RUN echo "export PATH=`pwd`/bin:$PATH" >> /etc/profile

COPY . .
RUN bundle install
# RUN RAILS_ENV=production bundle exec rake assets:precompile

EXPOSE 3000

CMD [ "rails", "s", "-b", "0.0.0.0" ]
