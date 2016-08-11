FROM ubuntu:14.04
MAINTAINER Rune Langoy "rune@something.com"
RUN apt-get update
RUN apt-get -y install python
COPY dontStop.py dontStop.py
CMD python dontStop.py
