FROM python:3.8-alpine
LABEL MAINTAINER="MonoLoGu"

# Copy the requirements.txt file into the /app dir
COPY root/ /

# Install some required packages
RUN apk add --no-cache build-base \
  freetype-dev \
  libexecinfo-dev \
  pkgconfig \
  gcc \
  git

# Install packages from requirements.txt
RUN \
  python3 -m pip install -r /requirements.txt && \
  python3 -m spacy download en_core_web_sm

VOLUME /app

ENTRYPOINT ["/entrypoint.sh"]
