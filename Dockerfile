FROM continuumio/miniconda3


RUN conda update -n base -c defaults conda 
RUN conda init bash &&\
conda create -n cling 
SHELL ["conda", "run", "-n", "cling", "/bin/bash", "-c"]
RUN conda install xeus-cling -c conda-forge
RUN conda install -c conda-forge jupyterlab
SHELL ["/bin/sh", "-c"]
