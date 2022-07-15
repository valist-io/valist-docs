# Publishing GitHub Releases automatically to Valist

It's super simple to use the Valist Action to automatically publish your GitHub Releases to Valist. This is the easiest way to get started with integrating web3-native software distribution into your workflow.

Here's a great example for triggering a Valist Publish upon a GitHub Release:

```yaml
name: Valist Publish
on:
  release:
    types: [published]
jobs:
  valist-publish:
    runs-on: ubuntu-latest
    steps:
      - run: echo "TIMESTAMP=$(date +%Y%m%d%H%M)" >> $GITHUB_ENV
      - uses: robinraju/release-downloader@v1.3
        with:
          repository: "your-github-account/your-github-repo"
          latest: true
          tarBall: true
          zipBall: true
          fileName: "*"
      - uses: valist-io/valist-github-action@v2.3.0
        with:
          private-key: ${{ secrets.PRIVATE_KEY }}
          account: your-valist-account
          project: your-valist-project
          release: ${{ env.TIMESTAMP }}
          path: '.'
```

The first section `on` defines when your Action should run. In this case, it will trigger upon a GitHub Release being published

The first step in the job uses the `robinraju/release-downloader@v1.3` to pull all of the release binaries, tarballs, and zips into the staging directory.

Then, the second step uses the Valist Action to publish these artifacts, tagged by the current timestamp.

The result will create a Valist Release version containing the same contents as your GitHub Release! 🥳🎉

For a set of examples, check out these repositories below:

{% embed url="https://github.com/valist-io/valist-github-action-examples/tree/main/.github/workflows" %}

{% embed url="https://github.com/awantoch/valist-publish-gha-example/blob/main/.github/workflows/release.yml" %}

{% hint style="info" %}
Want to add your example to these docs? Please feel free to open a PR or contact us at hello@valist.io 😄
{% endhint %}

We highly encourage this method to help push the web3-native software distribution movement forward! As always, we'd love your feedback in our [Discord](https://valist.io/discord).
