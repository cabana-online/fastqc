FROM cabanaonline/java:1.0

ARG USER=cabana
ENV HOME /home/$USER

USER root

# Downloads compiled libraries.
RUN set -xe; \
    \
    mkdir -p $HOME/tools/fastqc && \
    curl http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip > $HOME/tools/fastqc/fastqc.zip && \
    cd $HOME/tools/fastqc && unzip fastqc.zip && rm fastqc.zip && cd FastQC && chmod +x fastqc; \
    rm -rf /var/cache/apk/*

USER $USER

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]