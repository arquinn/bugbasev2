FROM debian:stretch
RUN apt-get update && apt-get install -y gcc libc6-dev make apt-src
RUN apt-get update && apt-get install -y linux-headers-$(dpkg --print-architecture)
RUN apt-get update && apt-get install -y wget curl procps
# RUN apt-get update && apt-get install -y git
# RUN apt-get update && apt-get install -y libpcre3 libpcre3-dev
# RUN apt-get update && apt-get install -y libssl1.0-dev
# RUN apt-get update && apt-get install -y zlibc zlib1g zlib1g-dev
# RUN apt-get update && apt-get install -y libkrb5-dev

# Update sources.list for apt-src install
COPY sources.list /etc/apt/sources.list
# Configure build method from source
COPY 02dpkg-buildpackage /etc/apt/apt.conf.d/02dpkg-buildpackage
RUN apt-src update
RUN apt-src --build install zlib
RUN apt-src --build install pcre3
RUN apt-src --build install libssl1.0-dev

WORKDIR /tmp
ARG version=1.14.1
RUN wget https://nginx.org/download/nginx-$version.tar.gz
RUN tar -zxf nginx-$version.tar.gz && rm nginx-$version.tar.gz
WORKDIR /tmp/nginx-$version
RUN ./configure --with-debug --with-cc-opt="-static -static-libgcc" --with-ld-opt="-static" --with-openssl=/openssl1.0-1.0.2r --with-zlib=/zlib-1.2.8.dfsg --with-pcre=/pcre3-8.39 --prefix=/etc/nginx --with-pcre-jit --with-http_stub_status_module --with-http_realip_module --with-http_flv_module --with-http_gzip_static_module --with-http_ssl_module --with-http_v2_module --with-stream
RUN make && make install
COPY ./nginx.conf /etc/nginx/conf/nginx.conf
COPY ./index.html /etc/nginx/html/index.html
CMD /etc/nginx/sbin/nginx && curl -i 127.0.0.1:8000 > /dev/null 2>&1 &&curl -i -H 'If-Match: 1' 127.0.0.1:8000 > /dev/null 2>&1 ; sleep 0.5 ; cat /etc/nginx/logs/error.log
