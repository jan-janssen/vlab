FROM condaforge/mambaforge:4.12.0-2
MAINTAINER Jan Janssen <jan.janssen@outlook.com>

COPY . /tmp

# Install 
RUN mamba env update -n root -f /tmp/environment.yml

# Configure container startup as root
WORKDIR ${HOME}/
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
