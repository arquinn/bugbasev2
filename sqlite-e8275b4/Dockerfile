FROM debian:latest
ARG checkin=fb90e718
RUN apt-get update && apt-get install -y gcc libc6-dev make gdb
RUN apt-get update && apt-get install -y tcl-dev tk-dev
RUN apt-get update && apt-get install -y file vim wget
WORKDIR /tmp
RUN wget https://www.sqlite.org/src/tarball/$checkin/SQLite-$checkin.tar.gz
RUN tar -xvf SQLite-$checkin.tar.gz && rm SQLite-$checkin.tar.gz
WORKDIR /tmp/SQLite-$checkin
ENV CFLAGS='-g3 -O0'
RUN ./configure --enable-debug && make -j8 && make install
WORKDIR /tmp
COPY *.sqlite /tmp/
CMD sqlite3 < test1.sqlite
