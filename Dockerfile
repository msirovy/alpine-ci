FROM debian:10-slim

RUN apt update; \
    apt install --no-install-recommends -y curl unzip git gettext-base tree; \
    rm -rf /var/lib/apt/lists/*


COPY bashrc /root/.bashrc

# Install levant
RUN curl -L https://github.com/hashicorp/levant/releases/download/0.2.9/linux-amd64-levant -o levant

# Install nomad
RUN curl -kL https://releases.hashicorp.com/nomad/1.0.4/nomad_1.0.4_linux_amd64.zip -o nomad.zip
RUN unzip nomad.zip
RUN mv ./nomad /usr/local/bin/nomad
