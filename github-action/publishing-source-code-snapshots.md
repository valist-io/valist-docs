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
      - uses: valist-io/valist-github-action@v2.2.0
        with:
          private-key: ${{ secrets.PRIVATE_KEY }}
          account: acme-co
          project: example
          release: 0.0.1
          files: '**'
```

This will create a Valist Release every time you merge into your main branch!

For a set of examples, check out this repository below:

{% embed url="https://github.com/valist-io/valist-github-action-examples/tree/main/.github/workflows" %}
