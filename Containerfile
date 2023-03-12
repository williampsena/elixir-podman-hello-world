FROM docker.io/library/elixir:1.14-alpine

ENV MIX_ENV=prod

MAINTAINER me@willsena.dev

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs server.ex ./

RUN mix deps.get --all

RUN mix compile

EXPOSE 3000

CMD mix run --no-halt server.ex