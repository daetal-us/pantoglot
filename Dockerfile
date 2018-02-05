FROM ruby:2.4-alpine

RUN apk --update add --virtual build_deps \
    build-base \
    libc-dev \
    linux-headers \
    cmake \
  && apk --no-cache add icu-dev \
  && gem install github-linguist \
  && apk del build_deps

RUN gem install pantoglot

WORKDIR /stage

ENTRYPOINT ["pantoglot"]
CMD ["."]
