# Ruby on Rails 7 Demo on Kubernetes

This runs a demo of the Spree Starter.

The admin email and password can be set via secrets added on this bundle:

* `ADMIN_EMAIL`
* `ADMIN_PASSWORD`

To setup the example database, `kubectl exec` into a Rails/Spree pod and run.

```shell
bundle exec rake db:seed
bundle exec rake spree_sample:load
```

To log into the admin page, visit: `https://YOUR_SITE.com/admin`

The [legacy frontend](https://github.com/spree/spree_legacy_frontend) is not configured.
