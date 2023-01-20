FROM rust:latest

RUN echo "fn main() {}" > placeholder.rs
COPY Cargo.toml .
RUN sed -i 's#src/main.rs#placeholder.rs#' Cargo.toml
RUN cargo build
RUN sed -i 's#placeholder.rs#src/main.rs#' Cargo.toml

COPY . .
RUN cargo build

CMD ["cargo", "run"]
