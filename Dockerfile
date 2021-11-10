FROM ruby:3.0.2

RUN apt-get update -qq && \
    apt-get install -y postgresql-client

WORKDIR /survey-backend

COPY Gemfile /survey-backend/Gemfile

COPY Gemfile.lock /survey-backend/Gemfile.lock

RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]