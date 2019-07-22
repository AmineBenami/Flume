FROM alpine:latest
MAINTAINER Amine Ben Belgacem <amin.benbelkacem@gmail.com>
ENV LANG C.UTF-8
ENV JAVA_VERSION 8u202
ENV JAVA_ALPINE_VERSION 8.212.04-r0
ENV FLUME_HOME /home/guest/flume
ENV FLUME_VERSION 1.9.0
ENV SPARK_VERSION 2.11
ENV SPARK_SINK_JAR_VERSION 2.2.1
RUN apk update
RUN apk add --no-cache shadow bash zip curl openjdk8="$JAVA_ALPINE_VERSION"
ENV HOME /home/guest
ENV JAVA_HOME   /usr/lib/jvm/default-jvm
ENV PATH        $PATH:${JAVA_HOME}/bin
RUN mkdir -p $HOME
RUN usermod -d $HOME guest
RUN groups guest
RUN chown guest:users $HOME
WORKDIR $HOME
USER guest
RUN wget -Y on --no-check-certificate  http://archive.apache.org/dist/flume/${FLUME_VERSION}/apache-flume-${FLUME_VERSION}-bin.tar.gz
RUN tar xvzf apache-flume-${FLUME_VERSION}-bin.tar.gz
RUN mv apache-flume-${FLUME_VERSION}-bin $FLUME_HOME
RUN rm apache-flume-${FLUME_VERSION}-bin.tar.gz
COPY launcher.sh /home/guest/
ENTRYPOINT ["bash", "/home/guest/launcher.sh"]

