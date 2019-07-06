FROM ruby:2.6.3-alpine3.10

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./app

EXPOSE 3000
CMD ["ruby", "./run.rb"]
