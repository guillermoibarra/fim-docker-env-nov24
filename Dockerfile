# Base image
FROM python:3.12-slim

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    zsh \
    neovim \
    build-essential \
    libssl-dev \
    libffi-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Starship prompt
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y

# Install Zinit for plugin management
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# Configure Zsh with Starship and Zinit
RUN echo 'eval "$(starship init zsh)"' >> /root/.zshrc && \
    echo 'source "$HOME/.zinit/bin/zinit.zsh"' >> /root/.zshrc

# Expose JupyterLab port
EXPOSE 8888

# Set Zsh as the default shell
SHELL ["/bin/zsh", "-c"]

# Start Zsh shell
CMD ["zsh"]

