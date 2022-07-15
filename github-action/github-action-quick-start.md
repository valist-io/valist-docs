---
description: >-
  Get started with the Valist GitHub Action to integrate web3 publishing into
  your CI/CD pipeline
---

# GitHub Action Quick Start

### Create an account & project

To publish with the CLI, you first need to create an account & project at the [Web Dashboard](https://app.valist.io).

For more information, visit:

{% content-ref url="../web/publishing-releases/creating-an-account.md" %}
[creating-an-account.md](../web/publishing-releases/creating-an-account.md)
{% endcontent-ref %}

{% content-ref url="../videos/creating-a-project.md" %}
[creating-a-project.md](../videos/creating-a-project.md)
{% endcontent-ref %}

Valist provides an extremely easy to integrate GitHub Action that enables you to publish anything from source code snapshots, arbitrary binaries, Docker images, NPM packages, or anything else that you're building in your existing CI/CD pipeline!

It can be found in the GitHub Marketplace below:

{% embed url="https://github.com/marketplace/actions/valist-action" %}

Here's what it looks like to publish a release to Valist using the Valist GitHub Action:

```yaml
name: Valist Publish
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: valist-io/valist-github-action@v2.3.0
        with:
          private-key: ${{ secrets.PRIVATE_KEY }}
          account: acme-co
          project: example
          release: 0.0.1
          path: 'build'
```

Super easy!

* The `private-key` field maps to your GitHub Repository secret that contains a key with permission on the Valist Project. We strongly recommend this is a fresh key that only has access to the corresponding Valist Project, and that you don't use an Account-level admin key here.
* The `account` field maps to your Valist Account
* The `project` field maps to the Valist Project you wish to publish to
* The `release` field maps to the version/tag you wish to release
* The `files` field is a list of files that you wish to publish in the release. In this case, the `**` value will publish all files in the repository, creating a source code snapshot.

For a set of examples, check out these repositories below:

{% embed url="https://github.com/valist-io/valist-github-action-examples/tree/main/.github/workflows" %}

{% embed url="https://github.com/awantoch/valist-publish-gha-example" %}

{% hint style="info" %}
Want to add your example to these docs? Please feel free to open a PR or contact us at hello@valist.io 😄
{% endhint %}

The Valist Action is built to be modular, and compatible with your existing pipeline. There are many ways to configure it! Next, we'll demonstrate how to automatically publish your GitHub Releases with it!
