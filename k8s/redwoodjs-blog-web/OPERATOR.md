# RedwoodJS Blog Web Interface

You'll need to generate a secret before deploying this bundle.

```shell
yarn redwood generate secret
```

The session secret can be set by click the lock icon on the bundle on your canvas.

## Shelling into your App

You'll need to download the Kubernetes credential from your cluster:

![Download Credential](https://raw.githubusercontent.com/massdriver-cloud/aws-eks-cluster/fdcc6476fe99976b934d45bf5281880f56a2fa2b/images/kubeconfig-download.gif)

```shell
export MD_PACKAGE_NAME=YOUR_NAME
kubectl exec $(kubectl get pod -l md-package=${MD_PACKAGE_NAME} -o jsonpath="{.items[0].metadata.name}") -it -- /bin/bash
```
