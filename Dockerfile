FROM ruby:3.3-alpine

# Basic packages needed to build common Jekyll dependencies and serve the site.
RUN apk add --no-cache \
    build-base \
    git \
    nodejs \
    tzdata

WORKDIR /srv/jekyll

# Install Ruby gems first for better layer caching.
COPY Gemfile ./
RUN bundle install

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch", "--incremental"]
