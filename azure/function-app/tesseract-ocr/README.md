# Application Examples

Example applications bundles to run on [Massdriver](https://massdriver.cloud).

## Kubernetes

These example application bundles will run on AWS EKS, Azure AKS, and GCP GKE.

- [Express / Mongo Guestbook](./k8s/express-mongoose-demo/) - Guestbook application running on Express JS and MongoDB
- [Elixir / Phoenix Chat Example](./k8s/phoenix-chat-example) - Chat application running on Elixir/Phoenix & Postgres 13 (AWS RDS, Cloud SQL, etc)

## Cloud-Specific Examples

### AWS

- [Javascript / Lambda](./aws/lambda-transform) - A serverless application that transforms a JSON payload.

### Azure

- [.NET / MySQL eCommerce App](./azure/app-service) - This app, `nopCommerce`, is a free and open-source eCommerce solution

### GCP

- [Laravel / PostgreSQL ChatOps](./gcp/cloud-run/laravel) - ChatOps application built with Laravel

## Source Code For Example Applications

The source code for each example application is included in a folder named `app`. This folder is a git submodule unless the app code is minimal.

**Note:** these are all **live** apps. To run any of the examples yourself, simply follow the steps below.

**One-time local setup**
+ Install the Massdriver [CLI](https://docs.massdriver.cloud/bundles/walk-through#download-the-massdriver-cli).
+ You'll need a [Service Account](https://docs.massdriver.cloud/platform/service-accounts) created in your Massdriver organization.
+ Don't forget to edit your `.bashrc`, `.zshrc`, `.envrc`, etc... so that every future terminal session has the `MASSDRIVER_API_KEY` environment variable set.

**Publish and run the app**
+ Switch into the directory of any example and run, `mass app publish`. This will create a new application bundle in your Massdriver organization.
+ In the Massdriver UI, drag your new application bundle to the canvas. Connect it to other packages and you're ready to deploy!
