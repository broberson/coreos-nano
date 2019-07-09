FROM ubuntu:latest

WORKDIR /root

RUN \
	sed -i 's/^# deb/deb/g' /etc/apt/sources.list \
	  && apt update \
	  && apt build-dep nano -y \
	  && apt install libmagic-dev libgpm-dev wget -y \
	  && wget https://www.nano-editor.org/dist/v2.9/nano-2.9.8.tar.gz \
	  && tar -xf nano-2.9.8.tar.gz \
	  && cd nano-2.9.8 \
	  && mkdir build && cd build \
	  && ../configure --enable-utf8 --prefix=/opt CFLAGS="-flto -O2 -march=native" LDFLAGS="-static" LIBS="-ltinfo -lgpm -lz" \
	  && make -j$(getconf _NPROCESSORS_ONLN) \
	  && mkdir install && make install DESTDIR=$(pwd)/install

WORKDIR /root/nano-2.9.8/build

COPY ./install.sh /root/nano-2.9.8/build/

ENTRYPOINT ["./install.sh"]


