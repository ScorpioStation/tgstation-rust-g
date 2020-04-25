FROM i386/debian:buster-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gcc-multilib \
    libssl-dev \
    pkg-config \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSfo rustup-init.sh \
    && chmod +x rustup-init.sh \
    && ./rustup-init.sh -y

COPY . /rust-g

WORKDIR /rust-g

RUN /root/.cargo/bin/cargo build --release --features dmi,file,hash,http,log,url
