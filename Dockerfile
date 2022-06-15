FROM condaforge/mambaforge:4.12.0-2
MAINTAINER Jan Janssen <jan.janssen@outlook.com>

COPY environment.yml /tmp

# Install 
RUN mamba env update -n root -f /tmp/environment.yml && \
    mamba clean --all -f -y && \
    rm /tmp/environment.yml && \
    mamba list

# Add user 
RUN useradd \
    --comment "Default user" \
    --create-home \
    --shell /bin/bash \
    --uid 1000 \
    janssen

USER janssen

# Configure container startup as root
WORKDIR /home/janssen
ENTRYPOINT ["tini", "--"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
