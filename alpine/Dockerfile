# Version Alpine
ARG IMAGE="alpine"
ARG VERSION=latest

FROM ${IMAGE}:${VERSION}
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Default Config
ARG ALPINE_VERSION_REPOS=latest
ARG TIMEZONE="Europe/Zurich"
ARG ROOT_DIR="/root/.script_base/"

# create repository to script
RUN mkdir -p ${ROOT_DIR}
RUN chmod 777 ${ROOT_DIR}

# Add buildpack script alpine
COPY scripts_base/ ${ROOT_DIR}
RUN chmod +x ${ROOT_DIR}*

# Run script
RUN .${ROOT_DIR}build.sh

# add zsh Bash
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

# Run Shell
ENV SHELL /bin/zsh

# RUN ZSH
CMD [ "zsh",  "--version"]
