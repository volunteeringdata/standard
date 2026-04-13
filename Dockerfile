ARG RUBY_VERSION=3

FROM ruby:${RUBY_VERSION}-alpine

RUN apk add --no-cache \
    build-base \
    git \
    tzdata \
    npm

WORKDIR /dist

COPY Gemfile .
RUN bundle install
RUN npm install -g pagefind

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--watch", "--incremental"]
