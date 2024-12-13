FROM --platform=linux/amd64 quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy the Conda lock file
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Initialize conda, install dependencies, and fix permissions
RUN conda init bash && \
    . /opt/conda/etc/profile.d/conda.sh && \
    conda activate base && \
    conda install --quiet --yes --file /tmp/conda-linux-64.lock && \
    conda install --quiet --yes jupyterlab jupyter_core && \
    conda clean --all -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Set environment variables to ensure the Conda environment is activated
ENV PATH=/opt/conda/bin:$PATH

# Default command to start Jupyter Notebook/Lab
CMD ["start-notebook.sh"]
