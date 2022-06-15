FROM condaforge/mambaforge:4.12.0-2
MAINTAINER Jan Janssen <jan.janssen@outlook.com>

COPY . ${HOME}

# Install 
RUN micromamba env update -n root -f "${HOME}/environment.yml"

# Configure container startup as root
WORKDIR ${HOME}/
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
