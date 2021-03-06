# FROM debian:stretch
# RUN apt-get update && apt-get install -y gcc libc6-dev make
# # RUN apt-get update && apt-get install -y linux-headers-$(dpkg --print-architecture)
# RUN apt-get install -y wget
# # RUN apt-get update && apt-get install -y git vim 
# RUN apt-get install -y libpcre3 libpcre3-dev
# RUN apt-get install -y libssl1.0-dev
# RUN apt-get install -y zlibc zlib1g zlib1g-dev
# RUN apt-get install -y libkrb5-dev
# WORKDIR /tmp
# ARG version=1.3.7
# RUN wget https://nginx.org/download/nginx-$version.tar.gz
# RUN tar -zxf nginx-$version.tar.gz && rm nginx-$version.tar.gz
# WORKDIR /tmp/nginx-$version
# RUN mkdir /var/tmp/nginx
# RUN ./configure --prefix=/usr --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error_log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx.lock --with-cc-opt='-g3 -O0 -I/usr/include' --with-ld-opt=-L/usr/lib --http-log-path=/var/log/nginx/access_log --http-client-body-temp-path=/var/tmp/nginx/client --http-proxy-temp-path=/var/tmp/nginx/proxy --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi --http-scgi-temp-path=/var/tmp/nginx/scgi --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --with-ipv6 --with-pcre --without-http_auth_basic_module --without-http_autoindex_module --without-http_empty_gif_module --without-http_geo_module --without-http_limit_req_module --without-http_limit_conn_module --without-http_map_module --without-http_memcached_module --without-http_proxy_module --without-http_referer_module --without-http_scgi_module --without-http_split_clients_module --without-http_upstream_ip_hash_module --without-http_uwsgi_module --with-http_mp4_module --with-http_stub_status_module --with-http_realip_module --with-http_ssl_module --without-mail_imap_module --without-mail_pop3_module --without-mail_smtp_module
# RUN make -j8 && make install
# COPY ./nginx.conf /etc/nginx/conf/nginx.conf
# COPY ./index.html /usr/nginx/html/index.html
# CMD nginx

# Test suite building from source

FROM debian:stretch

# Some utility unrelated to the final binary build
RUN apt-get update && apt-get install -y make gcc wget apt-src

# Update sources.list for apt-src install
COPY sources.list /etc/apt/sources.list
# Configure build method from source
COPY 02dpkg-buildpackage /etc/apt/apt.conf.d/02dpkg-buildpackage
RUN apt-src update
RUN apt-src install zlib && apt-src --build install zlib
RUN apt-src --build install pcre3
RUN apt-src --build install libssl1.0-dev

WORKDIR /tmp
ARG version=1.3.7
RUN wget https://nginx.org/download/nginx-$version.tar.gz
RUN tar -zxf nginx-$version.tar.gz && rm nginx-$version.tar.gz
WORKDIR /tmp/nginx-$version
RUN mkdir /var/tmp/nginx
RUN ./configure --prefix=/usr --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error_log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx.lock --with-cc-opt="-static -static-libgcc" --with-ld-opt="-static" --http-log-path=/var/log/nginx/access_log --http-client-body-temp-path=/var/tmp/nginx/client --http-proxy-temp-path=/var/tmp/nginx/proxy --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi --http-scgi-temp-path=/var/tmp/nginx/scgi --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --with-ipv6 --with-pcre=/pcre3-8.39 --without-http_auth_basic_module --without-http_autoindex_module --without-http_empty_gif_module --without-http_geo_module --without-http_limit_req_module --without-http_limit_conn_module --without-http_map_module --without-http_memcached_module --without-http_proxy_module --without-http_referer_module --without-http_scgi_module --without-http_split_clients_module --without-http_upstream_ip_hash_module --without-http_uwsgi_module --with-http_mp4_module --with-http_stub_status_module --with-http_realip_module --with-http_ssl_module --without-mail_imap_module --without-mail_pop3_module --without-mail_smtp_module --with-openssl=/openssl1.0-1.0.2r --with-zlib=/zlib-1.2.8.dfsg
RUN make && make install
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /usr/nginx/html/index.html
CMD nginx
