FROM alpine:3.8
LABEL maintainer="Fusengine <info@fusengine.ch>"

ENV TIMEZONE "Europe/Zurich"

# create repository to script
RUN mkdir -p /root/.script_base
RUN chmod 777 /root/.script_base

# Add buildpack script alpine
COPY scripts_base/ /root/.script_base
RUN chmod +x /root/.script_base/*

# Run script
RUN ./root/.script_base/build

# add zsh
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

# Run shell
ENV SHELL /bin/zsh

# RUN ZSH
CMD [ "zsh",  "--version"]
