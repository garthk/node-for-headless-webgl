FROM node:6
MAINTAINER Garth Kidd <garth@garthk.com>

RUN apt-get update && apt-get install -y \
        libgl1-mesa-dri \
        libglapi-mesa \
        libosmesa6 \
        mesa-utils \
        xvfb \
 && apt-get clean

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/bin/dumb-init
RUN chmod 0777 /usr/bin/dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--", "xvfb-run", "-s", "-ac -screen 0 1280x1024x24"]
CMD ["node"]
