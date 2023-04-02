FROM alpine

RUN apk add --no-cache git curl libgcc

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone https://github.com/rust-lang/crates.io-index.git crates

WORKDIR /app

COPY . .

RUN mv cargo.config /root/.cargo/config

RUN cargo update

