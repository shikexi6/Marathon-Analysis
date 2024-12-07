FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

RUN curl -fsSL https://quarto.org/download/latest/linux/x86_64/quarto-1.3.450-linux-amd64.deb -o quarto.deb \
    && apt install -y ./quarto.deb