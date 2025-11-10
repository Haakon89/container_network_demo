FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        iputils-ping && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# keep container running forever
CMD ["tail", "-f", "/dev/null"]
