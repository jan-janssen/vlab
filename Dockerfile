FROM mambaorg/micromamba:0.24-bullseye-slim
MAINTAINER Jan Janssen <jan.janssen@outlook.com>

COPY . ${HOME}

# Install 
RUN mamba env update -n root -f "${HOME}/environment.yml"

# Configure container startup as root
WORKDIR ${HOME}/
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
