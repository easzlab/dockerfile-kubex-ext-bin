# Download kubernetes binaries needed by 'kubex'
# @author:  gjmzj
# @repo:    https://github.com/easzlab/dockerfile-kubex-ext-bin
# @ref:     https://github.com/easzlab/kubex

FROM alpine:3.16

ARG CNI_PLUGINS_VERSION="v1.1.1"
ARG CRICTL_VERSION="v1.25.0"
ARG CONTAINERD_VER="1.6.8"
ARG RUNC_VER="v1.1.4"

COPY multi-platform-download.sh .

RUN sh -x ./multi-platform-download.sh

CMD [ "sleep", "360000000" ]
