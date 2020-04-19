FROM continuumio/miniconda3 as build


RUN conda update -n base -c defaults conda 
RUN conda init bash &&\
conda create -n cling 
SHELL ["conda", "run", "-n", "cling", "/bin/bash", "-c"]
RUN conda install -y xeus-cling jupyterlab -c conda-forge

USER root
WORKDIR /workdir
EXPOSE 8888

ENTRYPOINT [ "conda", "run", "-n", "cling"]
CMD ["jupyter", "lab", "--port=8888", "--ip=0.0.0.0", \ 
"--allow-root", "--notebook-dir=/workdir", "--NotebookApp.token='$NOTEBOOKTOKEN'"]

