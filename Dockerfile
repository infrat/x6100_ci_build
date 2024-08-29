# Base image (last LTS)
FROM ubuntu:latest

# For when tzdata gets installed
ENV TZ=UTC

# Update the system
RUN apt-get update && apt-get upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository universe

# Set the correct locale
RUN apt-get install -y locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install dependencies (but not asciidoc because it wants to install LaTeX)
RUN apt-get install -y git build-essential wget cpio unzip rsync bc \
    libncurses5-dev libncursesw5-dev screen file cmake \
    python3 python3-dev python3-setuptools python3-pip mc
