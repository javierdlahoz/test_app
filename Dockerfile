FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential
WORKDIR /app

EXPOSE 3000
EXPOSE 27017

RUN gem update --system