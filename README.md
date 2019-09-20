# Helm Chart

We provide a helm chart to make launching on Kubernetes as easy as possible.

## Installation

**NOTE** If you're using Minikube, k3d, or Docker for Mac please see the below instructions 

### Helm 2

```bash
helm install --name triton ./tritonmedia
```

### Helm 3

```bash
helm install triton ./tritonmedia
```

## Using Minikube, k3d, or Docker for Mac

You'll need to setup a local-storage provider.

```bash
# install strorageClass
$ kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

# mark it as default
$ kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```
