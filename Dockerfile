FROM nvidia/cuda:12.5.1-devel-ubi9

COPY install.sh .

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

RUN dnf install -y nvtop

RUN dnf install -y python3.11

RUN dnf install -y git

RUN export CUDACXX=/usr/local/cuda/bin/nvcc

RUN source ./install.sh

