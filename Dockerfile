FROM ubuntu:xenial

ARG ETA_UID
ARG ETA_GID
ARG ETA_BRANCH

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV PATH $PATH:/home/eta_user/.local/bin

RUN apt-get update \
 && apt-get install locales \
 && locale-gen en_US.UTF-8 \
 && apt-get install -y software-properties-common \
 && add-apt-repository -y ppa:webupd8team/java \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    openjdk-8-jdk zlib1g-dev libncurses5-dev libbz2-dev curl git \
 && curl -sSL https://get.haskellstack.org/ | sh \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY eta-entrypoint.sh /eta-entrypoint.sh
RUN chmod +x /eta-entrypoint.sh

COPY etlas-entrypoint.sh /etlas-entrypoint.sh
RUN chmod +x /etlas-entrypoint.sh

RUN groupadd -g $ETA_GID eta_group \
 && useradd --create-home --uid $ETA_UID --gid $ETA_GID eta_user

USER eta_user
WORKDIR /home/eta_user

# && mkdir -p /home/eta_user/.local/bin \
RUN git clone --recursive --branch $ETA_BRANCH https://github.com/typelead/eta \
 && cd ./eta \
 && ./install.sh
