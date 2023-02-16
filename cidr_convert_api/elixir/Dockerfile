FROM elixir:1.14.3-alpine

WORKDIR /app

COPY . .
RUN cd cidr_api \
    && mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get \
    && mix compile

CMD ["sh", "-c", "cd cidr_api; mix run --no-halt"]
# docker build -t elixm .
# docker run -ti -p 8000:8000 elixm