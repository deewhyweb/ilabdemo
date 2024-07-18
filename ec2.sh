
sudo dnf makecache

sudo subscription-manager repos --enable codeready-builder-for-rhel-9-$(uname -i)-rpms

sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

sudo dnf install -y kernel-devel-$(uname -r) kernel-headers-$(uname -r) gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig

sudo dnf config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel9/$(uname -i)/cuda-rhel9.repo

sudo dnf -y install cuda-toolkit-12-5

sudo dnf -y module install nvidia-driver:latest-dkms

sudo dnf install nvtop

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl start docker

sudo groupadd docker

sudo usermod -aG docker $USER


curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo | \
  sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo

sudo yum-config-manager --enable nvidia-container-toolkit-experimental

sudo yum install -y nvidia-container-toolkit

sudo systemctl restart docker

sudo dnf install python3.11

sudo dnf install git


export CUDACXX=/usr/local/cuda/bin/nvcc



docker run --rm -it --gpus all 