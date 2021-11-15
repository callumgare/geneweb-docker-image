FROM ubuntu:20.04

LABEL MAINTAINER="Callum Gare <callum@gare.com.au>"
ENV LANGUAGE en

RUN groupadd -r geneweb && useradd -r -s /bin/false -g geneweb geneweb

RUN apt-get update && \
  apt-get -y install --no-install-recommends \
    iproute2 \
    ca-certificates \
    curl \
    wget \
    unzip && \
  rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
  curl -s https://api.github.com/repos/geneweb/geneweb/releases/latest | \
  grep --color=never 'browser_download_url.*geneweb-linux-.*\.zip' | \
  awk -F"\"" '{print $4}' | \
  wget -i - && \
  unzip geneweb-linux-*.zip && \
  mv distribution /geneweb && \
  chown -R geneweb:geneweb /geneweb

COPY --chown=geneweb:geneweb entrypoint.sh /

EXPOSE 2317
EXPOSE 2316

USER geneweb

ENTRYPOINT ["/entrypoint.sh"]
