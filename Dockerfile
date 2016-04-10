FROM quay.io/alaskaicygiant/build-essential

MAINTAINER Owen Ouyang <owen.ouyang@live.com>

# https://gist.github.com/mugli/8720670
# Enable silent install
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer \
              oracle-java8-set-default

RUN update-java-alternatives -s java-8-oracle

# Clean up any files used by apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
