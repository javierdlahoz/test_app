FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm

WORKDIR /app

EXPOSE 3000
EXPOSE 27017
EXPOSE 4200

RUN gem update --system
RUN npm install -g @angular/cli
