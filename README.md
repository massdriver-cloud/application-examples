[![Massdriver][logo]][website]

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
[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=linkedin



[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/aws-elasticache-redis.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/aws-elasticache-redis/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/aws-elasticache-redis.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/aws-elasticache-redis/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/aws-elasticache-redis.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/aws-elasticache-redis/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/aws-elasticache-redis.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/aws-elasticache-redis/issues
[release_url]: https://github.com/massdriver-cloud/aws-elasticache-redis/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/aws-elasticache-redis.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/aws-elasticache-redis.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/aws-elasticache-redis/blob/main/LICENSE


[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=aws-elasticache-redis&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
