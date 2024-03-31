# SnarkOS Docker Compose Setup

This repository contains the necessary configuration files to run a SnarkOS node within a Docker container using Docker Compose. SnarkOS is the operating system designed to power the decentralized network of Aleo, which is focused on enabling private, scalable blockchain applications.

## Prerequisites

Before you begin, ensure you have installed the following on your system:

- Docker
- Docker Compose

## Getting Started

To get your SnarkOS node up and running with Docker, follow these steps:

1. **Clone the repository**

    ```sh
    git clone https://aditya-manit/snarkos-docker-compose.git
    cd snarkos-docker-compose
    ```

2. **Set up your `.env` file**

   Copy the `.env.sample` to `.env` and edit it to fill in the values for `VALIDATORS` and `KEY_PATH`:

    ```sh
    cp .env.sample .env
    nano .env # Use your favorite text editor here
    ```

   Your `.env` file should look something like this:

    ```
    VALIDATORS="ValidatorIPAddress1:5000,Validator2IPAddress2:5000,..."
    KEY_PATH="/data/validator.key"
    ```

3. **Add your `validator.key`**

   Place your `validator.key` file inside the `data` directory. This key file is essential for running your SnarkOS node as a validator and must be kept secure.

4. **Build and run the container**

   With the `.env` file set and the `validator.key` in place, you can build and run the Docker container:

    ```sh
    docker-compose build
    docker-compose up -d
    ```

5. **Verify that the container is running**

   You can check the status of your container using:

    ```sh
    docker-compose ps
    ```

   To view the logs and verify that the SnarkOS node has started successfully, use:

    ```sh
    docker-compose logs -f
    ```

## Important Notes

- **Security**: Never commit the `.env` file or the `data` directory to version control. These contain sensitive information and should be kept private.
- **Data Persistence**: The `data` directory is mounted into the container to ensure that your validator data persists across restarts.
- **Stopping the Container**: To stop your SnarkOS node, run `docker-compose down`.