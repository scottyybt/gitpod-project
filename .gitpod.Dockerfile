FROM gitpod/workspace-full:latest

# Install Node.js with the specified version
ARG NODE_VERSION=18.18.0
RUN bash -c ". .nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    nvm use ${NODE_VERSION} && \
    nvm alias default ${NODE_VERSION}"

# Install additional dependencies if needed
RUN apt-get update && apt-get install -y \
    python3-pip \
    pkg-config \
    build-essential \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV NODE_ENV=development
ENV PATH=/home/gitpod/.nvm/versions/node/v${NODE_VERSION}/bin:$PATH

