# Ruby on Rails 7 Demo on Kubernetes

This runs a demo of the Spree Starter.

The admin email and password can be set via secrets added on this bundle:

* `ADMIN_EMAIL`
* `ADMIN_PASSWORD`

To setup the example database, `kubectl exec` into a Rails/Spree pod and run.

You can find your package name by following the docs [here](https://docs.massdriver.cloud/applications/deploying-application#:~:text=expects%20the%20package%20name).

```shell
export MD_PACKAGE_NAME=YOUR_NAME
kubectl exec $(kubectl get pod -l md-package=${MD_PACKAGE_NAME} -o jsonpath="{.items[0].metadata.name}") -it -- /bin/bash
```

```shell
bundle exec rake db:seed
bundle exec rake spree_sample:load
```

To log into the admin page, visit: `https://YOUR_SITE.com/admin`

The [legacy frontend](https://github.com/spree/spree_legacy_frontend) is not configured.
