FROM condaforge/mambaforge:4.12.0-2
MAINTAINER Jan Janssen <jan.janssen@outlook.com>

COPY environment.yml /tmp

# Install 
RUN mamba env update -n root -f /tmp/environment.yml && \
    mamba --all -f -y && \
    rm /tmp/environment.yml && \
    mamba list

# Configure container startup as root
WORKDIR ${HOME}/
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
