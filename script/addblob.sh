#!/bin/sh

#-------------------------

CALICO_VERSION=3.10.1
CNI_VERSION=0.7.1
#-------------------------
wget https://github.com/projectcalico/calicoctl/releases/download/v${CALICO_VERSION}/calicoctl
wget -N https://github.com/projectcalico/cni-plugin/releases/download/v${CALICO_VERSION}/calico-amd64
wget -N https://github.com/projectcalico/cni-plugin/releases/download/v${CALICO_VERSION}/calico-ipam-amd64
wget https://github.com/containernetworking/plugins/releases/download/v${CNI_VERSION}/cni-plugins-amd64-v${CNI_VERSION}.tgz
wget https://docs.projectcalico.org/v3.10/manifests/rbac/rbac-etcd-calico.yaml
wget https://docs.projectcalico.org/v3.10/getting-started/kubernetes/installation/calico-kube-controllers.yaml
bosh add-blob calicoctl  calico/calicoctl
bosh add-blob calico-amd64 calico/calico
bosh add-blob calico-ipam-amd64 calico/calico-ipam
bosh add-blob rbac-etcd-calico.yaml calico/rbac-etcd-calico.yaml
bosh add-blob calico-kube-controllers.yaml calico/calico-kube-controllers.yaml

bosh add-blob cni-plugins-amd64-v${CNI_VERSION}.tgz cni/cni-plugins-amd64.tgz

rm calicoctl
rm calico-amd64
rm calico-ipam-amd64
rm cni-plugins-amd64-v${CNI_VERSION}.tgz
rm rbac-etcd-calico.yaml
rm calico-kube-controllers.yaml

