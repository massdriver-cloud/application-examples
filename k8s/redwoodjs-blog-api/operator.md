# RedwoodJS Blog API

GraphQL playground will be available at: `https://INGRESS_HOST/graphql`


## Shelling into your App

You'll need to download the Kubernetes credential from your cluster:

![Download Credential](https://raw.githubusercontent.com/massdriver-cloud/aws-eks-cluster/fdcc6476fe99976b934d45bf5281880f56a2fa2b/images/kubeconfig-download.gif)

```shell
export MD_PACKAGE_NAME=YOUR_NAME
kubectl exec $(kubectl get pod -l md-package=${MD_PACKAGE_NAME} -o jsonpath="{.items[0].metadata.name}") -it -- /bin/bash
```

