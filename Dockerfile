# Start from the latest Ubuntu image
FROM ubuntu:latest

# Avoid prompts from apt by setting this environment variable
ENV DEBIAN_FRONTEND=noninteractive

# Update the base image and install dependencies
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
    build-essential \
    curl \
    clang \
    gcc \
    git \
    libssl-dev \
    llvm \
    make \
    pkg-config \
    tmux \
    xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Rust using rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Rust's cargo bin directory to the PATH environment variable
ENV PATH="/root/.cargo/bin:${PATH}"

# Clone the SnarkOS repository and build it
RUN git clone https://github.com/AleoHQ/snarkOS.git && \
    cd snarkOS && \
    cargo build --release

# Move the snarkOS binary to a bin directory in the root folder
RUN mkdir /bin/snarkos && \
    mv /snarkOS/target/release/snarkos /bin/snarkos/

# Copy the entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script to be executed when the container starts
ENTRYPOINT ["/entrypoint.sh"]
