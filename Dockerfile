
FROM ruby:latest

RUN apt update
RUN apt install -y nodejs
RUN apt install -y postgresql

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile

COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp

# How does entrypoint find this script? is usr/bin default? Path?
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# CMD instruction allows you to set a default command, which will be executed only when you run container without specifying a command.
CMD ["rails", "server", "-b", "0.0.0.0"]

