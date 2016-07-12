FROM ubuntu:16.04

# BASICS
RUN apt-get update
RUN apt-get install -y net-tools
RUN echo "Acquire::http { Proxy \"http://$(netstat -nr|grep '^0\.0\.0\.0'|awk '{print $2}'):3142\"; };" \
  | tee /etc/apt/apt.conf.d/02proxy
RUN apt-get install -y netbase ca-certificates
RUN update-ca-certificates

# LIBGMP
RUN apt-get install -y libgmp10

# CLEANUP
RUN apt-get autoremove
RUN apt-get clean
