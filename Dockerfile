FROM ubuntu 
LABEL maintainer="ashwinder@nooor.in"
RUN apt-get update -y && apt-get install -y -qq \
  git \
  curl \
  ssh \
  gcc \
  make \
  build-essential \
  sudo \
  apt-utils \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN npm install --quiet -g yarn \
  && npm cache verify
RUN node -v
COPY ./dist /src
WORKDIR /src
RUN npm install -g yarn
EXPOSE 4000
ENTRYPOINT ["node", "./bin/dev"]
