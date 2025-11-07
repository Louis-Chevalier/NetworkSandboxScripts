FROM fedora:latest

RUN dnf -y update && \
    dnf -y install vim neovim make gcc iputils glibc-devel libnsl net-tools glibc-headers libnsl2-devel hostname && \
    dnf clean all && \
    rm -rf /var/cache/dnf

CMD ["/bin/bash"]
