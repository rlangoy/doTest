FROM ubuntu:14.04
MAINTAINER Rune Langøy (email@domain.com)
FROM registry-ice.ng.bluemix.net/ibmliberty:latest

RUN apt-get update && apt-get install -y \
	git 

# Add a SSH key, this will allow to perform SSH into containers
COPY id_rsa.pub /root/.ssh/ 

RUN chmod 600 /root/.ssh/id_rsa.pub \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && rm -rf /opt/ibm/wlp/usr/servers/defaultServer/apps/* \
    && mkdir -p /opt/ibm/wlp/usr/extension/lib

# Extract binaries from public IDS repo
RUN rm -rf /src
RUN mkdir /src


EXPOSE 22
