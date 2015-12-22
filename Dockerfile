FROM gliderlabs/alpine:3.2
VOLUME /mnt/routes
EXPOSE 8000

COPY . /src
RUN cd /src && ./build.sh "$(cat VERSION)"

ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ONBUILD COPY ./modules.go /src/modules.go
ONBUILD RUN cd /src && ./build.sh "$(cat VERSION)-custom"
