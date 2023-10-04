# Ruby is needed to be able to install ruby on rails framework.
FROM ruby:3.0-bullseye as base

# Update the system and install build-essential, apt-utils, apt-utils, libpq-dev, nodejs.
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

# Provide permission to manipulate app folder.
WORKDIR /app

# Install bundler with ruby which is a gem needed to install dependencies.
RUN gem install bundler

# Copy the gemfile content.
COPY Gemfile* ./

# Run bundle install which is needed to install the dependencies in the gem file.
RUN bundle install

# Put the installed dependencies in the app folder.
ADD . /app

# Set the default port to 3000.
ARG DEFAULT_PORT 3000

# The container will listen on the port specified above.
EXPOSE ${DEFAULT_PORT}

# bundle command ensures that everything in the gemfile is installed upon starting the server.
# exec keeps the server running and any changes to be deployed to it so no need to restart server.
# puma is ruby on rails server.
# config.ru is used for creating services in ruby on rails.
# All these commands are fired up when the container is started.
CMD [ "bundle","exec", "puma", "config.ru"] 
# CMD ["bundle", "exec", "rails","server"] # you can also write like this.
