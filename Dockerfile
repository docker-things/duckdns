FROM alpine:3.8
MAINTAINER Gabriel Ionescu <gabi.ionescu+docker@protonmail.com>

# ARGS
ARG DOCKER_USERID
ARG DOCKER_GROUPID
ARG DOCKER_USERNAME

# COPY CODE
COPY app /app

# INSTALL DEPENDENCIES
RUN echo -e "\n > INSTALL DEPENDENCIES\n" \
 && apk add --no-cache \
    curl \
 \
 && echo -e "\n > CREATE USER\n" \
 && addgroup -g $DOCKER_GROUPID $DOCKER_USERNAME \
 && adduser -D -H -u $DOCKER_USERID -G $DOCKER_USERNAME $DOCKER_USERNAME \
 \
 && echo -e "\n > CHANGE PERMISSIONS\n" \
 && chown $DOCKER_USERNAME:$DOCKER_USERNAME /app \
 \
 && echo -e "\n > CLEANUP\n" \
 && rm -rf \
    /tmp/* \
    /var/tmp/*

# SWITCH USER
USER $DOCKER_USERNAME

# SET WORK DIR
WORKDIR /app

# LAUNCH
CMD ["/bin/ash", "/app/launcher.sh"]
