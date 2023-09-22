[![Massdriver][logo]][website]

# Application Examples

Example applications bundles to run on [Massdriver](https://massdriver.cloud).

We have application examples for every Cloud that Massdriver supports. At Massdriver, we sometimes even treat Kubernetes just like the Clouds. The number of our application examples is growing rapidly and it's hard to keep this list maintained, until we automate that too. Feel free to poke around or reach out if you have any questions!

## Kubernetes

These example application bundles will run on AWS EKS, Azure AKS, and GCP GKE.

- [Express / Mongo Guestbook](./k8s/express-mongoose-demo/) - Guestbook application running on Express JS and MongoDB
- [Elixir / Phoenix Chat Example](./k8s/phoenix-chat-example) - Chat application running on Elixir/Phoenix & Postgres 13 (AWS RDS, Cloud SQL, etc)

## AWS

### Lambdas

- [NodeJS / Lambda](./aws/lambda-transform) - A serverless application that transforms a JSON payload.

## Azure

### App Service

- [NodeJS / Blob Storage](./azure/app-service/bloby) - A simple hello world Blob Storage application named Bloby.

### Function App

- [NodeJS / Blob Storage](./azure/function-app/bloby) - A simple hello world Blob Storage application named Bloby.

## GCP

### Cloud Run

- [PHP / Cachethq](./gcp/cloud-run/cachethq) - Cachethq running on GCP Cloud Run.
- [NodeJS / Cloud Task Creator](./gcp/cloud-run/cloud-task-creator) - Cloud Tasks creator.
- [NodeJS / Cloud Task Handler](./gcp/cloud-run/cloud-task-handler) - Application to handle / run a Cloud Task.

### GKE

- [Python / Stable Diffusion](./gcp/gke/model-server) - Simple Stable Diffusion inference API running on GKE standard.
- [NodeJS / PubSub Consumer](./gcp/gke/pubsub-worker) - Simple PubSub Consumer application.

### VMs - Via Managed Instance Groups

- [Tailscale](./gcp/vm/tailscale) - Tailscale running on VMs in GCP.

## Source Code For Example Applications

We're in the process of moving all of this information into the `operator.md` for each application. The Operator Guide supports markdown and is also availabile in the Massdriver UI for every bundle. We will provide information about each application or piece of infrastructure, links to source code, etc... Please feel free to open an [Issue](https://github.com/massdriver-cloud/application-examples/issues) on this repository if you'd like to see any of these guides filled out sooner. Cheers!

## Running An Application In Massdriver

**Note:** these are all **live** apps. To run any of the examples yourself, simply follow the steps below.

**One-time local setup**
+ Install the Massdriver [CLI](https://docs.massdriver.cloud/bundles/walk-through#download-the-massdriver-cli).
+ You'll need a [Service Account](https://docs.massdriver.cloud/cli/overview#setup) created in your Massdriver organization.
+ You'll need the [Organization ID](https://docs.massdriver.cloud/cli/overview#setup) of your Massdriver organization.
+ Don't forget to edit your `.bashrc`, `.zshrc`, `.envrc`, etc... so that every future terminal session has the `MASSDRIVER_API_KEY` and `MASSDRIVER_ORG_ID` environment variables set.

**Publish and run the app**
+ Switch into the directory of any example and run, `mass bundle publish`. This will create a new application bundle in your Massdriver organization.
+ In the Massdriver UI, drag your new application bundle to the canvas. Connect it to other packages and you're ready to deploy!

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]

<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg
[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=linkedin



[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/application-examples.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/application-examples/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/application-examples.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/application-examples/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/application-examples.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/application-examples/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/application-examples.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/application-examples/issues
[release_url]: https://github.com/massdriver-cloud/application-examples/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/application-examples.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/application-examples.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/application-examples/blob/main/LICENSE


[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=application-examples&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
