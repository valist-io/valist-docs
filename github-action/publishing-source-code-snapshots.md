# Publishing Source Code Snapshots

Publishing source code snapshots is a great way to make sure your code is distributed on web3 protocols, available to anyone. It's also super easy to do, making it an excellent choice even if you're not publishing binary artifacts!

Here's an example for how to publish your repository contents:

```yaml
name: Valist Snapshot
on:
  push:
    branches:
      - main
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - run: echo "TIMESTAMP=$(date +%Y%m%d%H%M)" >> $GITHUB_ENV
      - uses: actions/checkout@v3
        with:
            path: '.'
      - uses: valist-io/valist-github-action@v2.5.3
        with:
          private-key: ${{ secrets.VALIST_SIGNER }}
          account: your-valist-account
          project: your-valist-project
          release: ${{ env.TIMESTAMP }}
          path: '.'
```

This will create a Valist Release every time you merge into your main branch!

For a set of examples, check out these repositories below:

{% embed url="https://github.com/valist-io/valist-github-action-examples/tree/main/.github/workflows" %}

{% embed url="https://github.com/awantoch/valist-publish-gha-example/blob/main/.github/workflows/snapshot.yml" %}

{% hint style="info" %}
Want to add your example to these docs? Please feel free to open a PR or contact us at hello@valist.io 😄
{% endhint %}
