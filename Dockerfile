# Base image
FROM python:3.12.7-slim

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    make \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    libncurses-dev \
    libgdbm-dev \
    libgdbm-compat-dev \
    libnss3-dev \
    liblzma-dev \
    tk-dev \
    uuid-dev \
    libdb5.3-dev \
    libexpat1-dev \
    xz-utils \
    ca-certificates \
    wget \
    curl \
    git \
    zsh \
    neovim \
    && rm -rf /var/lib/apt/lists/*

# Create a new group and user
RUN groupadd -g 1000 taller && \
    useradd -m -u 1000 -g taller -s /bin/zsh taller

# Install Starship prompt
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y

# Switch to student user
USER taller
ENV HOME="/home/taller"
WORKDIR /home/taller

# startup script to run
USER root
COPY init.sh /usr/local/bin/startup.sh
RUN sed -i 's/\r$//' /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh
USER taller

# Copy resources into /opt/resources
COPY resources /opt/resources

ENTRYPOINT ["/usr/local/bin/startup.sh"]

# Expose JupyterLab port
EXPOSE 8888

# Set Zsh as the default shell
SHELL ["/bin/zsh", "-c"]

# Start Zsh shell
CMD ["zsh"]
