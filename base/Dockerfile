FROM buildpack-deps:xenial

ARG NODE_VERSION
ARG JDK_VERSION

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

COPY setup /setup/

# setup user, base packages, etc.
RUN /setup/ubuntu.sh

# install NODE_VERSION
RUN /setup/node.sh

# install JAVA_VERSION
RUN /setup/java.sh
ENV JAVA_HOME /JAVA_HOME

# install Chrome
ENV DBUS_SESSION_BUS_ADDRESS /dev/null
RUN /setup/browser.sh
COPY chrome_launcher.sh /opt/google/chrome/google-chrome
