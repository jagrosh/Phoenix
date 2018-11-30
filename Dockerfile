FROM ruby:2.5

WORKDIR /opt/phoenix

COPY Gemfile ./
RUN bundle install

COPY . .

CMD ["ruby", "./phoenix.rb"]