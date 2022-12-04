#!/bin/sh
ARC=$(uname -m)
ARCH="amd64"

case "$ARC" in
  x86_64)
      ARCH="amd64"
      ;;
  aarch64)
      ARCH="arm64"
      ;;
  ?)
      echo "error: not supported platform right now, exit"
      exit 1
      ;;
esac

mkdir -p /cni /containerd

wget "https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGINS_VERSION}/cni-plugins-linux-${ARCH}-${CNI_PLUGINS_VERSION}.tgz" && \
tar zxf "cni-plugins-linux-${ARCH}-${CNI_PLUGINS_VERSION}.tgz" -C /cni && \
rm -rf "cni-plugins-linux-${ARCH}-${CNI_PLUGINS_VERSION}.tgz"

wget "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-${ARCH}.tar.gz" && \
tar zxf "crictl-${CRICTL_VERSION}-linux-${ARCH}.tar.gz" -C /containerd && \
rm -rf "crictl-${CRICTL_VERSION}-linux-${ARCH}.tar.gz"

wget "https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VER}/containerd-${CONTAINERD_VER}-linux-${ARCH}.tar.gz" && \
tar zxf "containerd-${CONTAINERD_VER}-linux-${ARCH}.tar.gz" -C /tmp && \
mv /tmp/bin/* /containerd && \
rm -rf "containerd-${CONTAINERD_VER}-linux-${ARCH}.tar.gz"

wget "https://github.com/opencontainers/runc/releases/download/${RUNC_VER}/runc.${ARCH}" && \
mv runc.${ARCH} /containerd/runc && \
chmod +x /containerd/runc
