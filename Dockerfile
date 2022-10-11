FROM heroku/heroku:22-build
ENV LC_ALL="1"
ENV RAILS_ROOT /app

WORKDIR /app
COPY . /app

EXPOSE 3000
EXPOSE 5432

ENV RAILS_ENV='development'
ENV RACK_ENV='development'

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
#RUN apt install -y google-chrome-stable


RUN apt-get update -y

RUN apt install -y git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN ls -la /
RUN . ~/.bashrc
RUN cat ~/.bashrc

RUN apt-get install -y postgresql-13 postgresql-client-13
RUN apt install -y net-tools
RUN apt install -y lsof
RUN apt install -y vim
RUN apt install -y libpq-dev
RUN apt install -y xvfb
RUN apt install -y nodejs
RUN apt install -y nano
RUN apt install -y sudo
RUN apt install -y dos2unix
RUN apt install -y redis-server

RUN /root/.rbenv/bin/rbenv install 3.1.2

RUN /root/.rbenv/shims/gem install bundler
RUN /root/.rbenv/shims/bundle install --jobs 20 --retry 5 --without development

RUN Xvfb :99 -ac &

ENV DISPLAY=:99
#ENV http_proxy='http://0.0.0.0:3128'
#ENV https_proxy='http://0.0.0.0:3128'
ENV RAILS_ENV=development
CMD ["tail", "-f", "/dev/null"]
#CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]

