FROM ruby:2.4.0
ENV APP_ROOT /usr/src/app
RUN apt-get update && \
    apt-get install -y nodejs \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/* /var/tmp/*
WORKDIR $APP_ROOT
COPY Gemfile Gemfile.lock $APP_ROOT/
RUN gem install bundler -v 2.0.1
RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global build.nokogEiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  gem install bundler && \
  bundle install && \
  rm -rf ~/.gem
COPY . $APP_ROOT
EXPOSE 3000
CMD rm -f tmp/pids/server.pid && rails server -b 0.0.0.0