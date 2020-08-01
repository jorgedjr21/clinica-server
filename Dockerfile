FROM ruby:2.7-alpine
RUN apk add --no-cache --update \
  build-base \
  linux-headers \
  nodejs \
  yarn \
  postgresql-dev \
  tzdata \
  graphviz \
  gmp-dev

RUN mkdir /odontoclin-server  
WORKDIR /odontoclin-server
COPY Gemfile /odontoclin-server/Gemfile
COPY Gemfile.lock /odontoclin-server/Gemfile.lock
RUN bundle install
COPY . /odontoclin-server

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]