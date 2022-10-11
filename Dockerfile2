FROM ruby:3.1.2
ENV LC_ALL="1"
ENV RAILS_ROOT /app

WORKDIR /app
COPY . /app

EXPOSE 3000
EXPOSE 5432

ENV RAILS_ENV='development'
ENV RACK_ENV='development'

RUN apt update

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
#RUN apt install -y google-chrome-stable

RUN apt update
RUN apt install -y  postgresql
RUN apt install -y postgresql-client
RUN apt update
RUN apt install -y net-tools
RUN apt install -y lsof
RUN apt install -y vim
RUN apt install -y libpq-dev
RUN apt install -y xvfb
RUN apt install -y nodejs
RUN apt install -y nano
RUN apt install -y postgresql
RUN apt install -y postgresql-client
RUN apt install -y sudo
RUN apt install -y dos2unix
RUN apt install -y redis-server

RUN gem install bundler

RUN #bundle install --jobs 20 --retry 5 --without development test
RUN Xvfb :99 -ac &

ENV DISPLAY=:99
#ENV http_proxy='http://0.0.0.0:3128'
#ENV https_proxy='http://0.0.0.0:3128'
ENV RAILS_ENV=development
CMD ["tail", "-f", "/dev/null"]
#CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]

