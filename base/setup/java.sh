#!/usr/bin/env bash

set -e

# install Java
# oracle-java8: https://github.com/dockerfile/java/blob/926218ef9b5b6c83bb07aae9a0aaa2ba118f6372/oracle-java8/Dockerfile
# oracle-java7: https://github.com/dockerfile/java/tree/926218ef9b5b6c83bb07aae9a0aaa2ba118f6372/oracle-java7/Dockerfile

if [ -z "$JDK_VERSION" ]; then
  echo "you must specify the JDK_VERSION build-arg, ie: --build-arg JDK_VERSION=4.4.7";
  exit 1; \
fi

case $JDK_VERSION in
  8)
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
    add-apt-repository -y ppa:webupd8team/java
    apt-get update -y
    apt-get install -y oracle-java8-installer
    rm -rf /var/lib/apt/lists/*
    rm -rf /var/cache/oracle-jdk8-installer

    ln -s /JAVA_HOME /usr/lib/jvm/java-8-oracle
    ;;

  7)
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
    add-apt-repository -y ppa:webupd8team/java
    apt-get update -y
    apt-get install -y oracle-java7-installer
    rm -rf /var/lib/apt/lists/*
    rm -rf /var/cache/oracle-jdk7-installer

    ln -s /JAVA_HOME /usr/lib/jvm/java-7-oracle
    ;;

  *)
    echo "JDK_VERSION \"$JDK_VERSION\" should be either 8 or 7"
    exit 1;
    ;;

esac
