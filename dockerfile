FROM python:3
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install -U pip
RUN apt update -y
RUN apt install vim -y
RUN apt install sudo -y
RUN apt-get install -y apt-transport-https ca-certificates dirmngr
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754
RUN echo "deb https://packages.clickhouse.com/deb stable main" | tee /etc/apt/sources.list.d/clickhouse.list
RUN apt-get update
RUN apt-get install debconf -y
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq install clickhouse-server clickhouse-client
RUN sudo service clickhouse-server start
