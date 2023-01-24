# Publishing

## Binary

> [Example Binary Project](https://github.com/valist-io/example-projects/tree/main/cli-publish-go-project)

Start by creating a `valist.yml` for your binary project.

```bash
valist init acme-co/go-example
```

Add your release artifacts to the `valist.yml`. Any README or LICENSE files will be included automatically.

```yaml
name: acme-co/go-example
tag: 0.1.6-rc.0
artifacts:
  main: out/main
```

If your project has artifacts for multiple platforms, add an entry for each supported platform to your `valist.yml`. 

```yaml
artifacts:
  linux/amd64: path_to_bin
  linux/arm64: path_to_bin
  darwin/amd64: path_to_bin
  darwin/arm64: path_to_bin
  windows/amd64: path_to_bin
```

To publish a new release, update the `tag` in your `valist.yml`, and run the following from your project root.

```bash
valist publish
```

## Docker

Start by creating a `valist.yml` for your docker project.

```bash
valist init acme-co/docker-example
```

Build and export your docker image layers.

```bash
docker build acme-co/my-image:latest
docker save acme-co/my-image:latest -o my-image.tar
```

Add your docker image tar to the `valist.yml`.

```yaml
name: acme-co/docker-example
tag: 0.0.1
artifacts:
  docker: my-image.tar
```

To publish a new release, update the `tag` in your `valist.yml`, and run the following from your project root.

```bash
valist publish
```

To install a docker release, run the following:

```bash
curl -o my-image.tar https://app.valist.io/acme-co/docker-example/0.0.1?artifact=docker
docker load my-image.tar
```

## NFTs

Valist can be used to publish and pin metadata, images or any other web3 assets required for minting an nft.

Start by creating a `valist.yml` for your NFT project.

```bash
valist init acme-co/nft-example
```

Next, add your nft assets to the `valist.yml`.

```yaml
name: acme-co/nft-example
tag: 0.0.1
artifacts:
  meta: data/meta.json
  image: data/ape.png
```

To publish a new release, update the `tag` in your `valist.yml`, and run the following from your project root.

```bash
valist publish
```

> **Note:** In a future upgrade to the valist system, all Valist repos will implement the `ERC-721` interface to allow repositories to be managed, owned, and traded. If you are interested in contributing or following the status of these features, checkout the current implementation and planning doc on [hackmd](https://hackmd.io/YF5CsRv_QZWk7o7ZzgRxDg?both)

## Websites

Any static websites can be published and hosted through Valist.

Start by creating a `valist.yml` for your web project.

```bash
valist init acme-co/website-example
```

Next, add your website files to the `valist.yml`.

```yaml
name: acme-co/website-example
tag: 0.0.1
artifacts:
  web/index: index.html
  logo: logo.png
```

To publish a new release, update the `tag` in your `valist.yml`, and run the following from your project root.

```bash
valist publish
```

## CI/CD Platforms

### Github Action

The official Valist github-action can be found at [valist-github-action](https://github.com/valist-io/valist-github-action).

To use the github action start by creating an `example.yml` in `.github/workflows`. The minimal config for using the Github action in your workflow is:

```
name: Valist publish
on:
  push:
    branches: ['main'] # Event triggers on pushes to main

jobs:
  Valist: # Define deploy job
    runs-on: ubuntu-latest # OS used for virtual machine

    steps:
      - uses: actions/checkout@v2 # Make source code of repo available
      
      - name: Valist publish
        uses: valist-io/valist-github-action@main # Execute valist build & publish
        env:
          VALIST_SIGNER: ${{ secrets.VALIST_SIGNER }}
```

Next, create a `valist.yml` for your project.

```
name: acme-co/github-action
tag: 0.0.1
artifacts:
  linux/amd64: dist/linux64
  darwin/amd64: dist/darwin64
  windows/amd64: dist/windows64
```

Now navigate to [https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) and set the `VALIST_SIGNER` secret for your repository as your chosen private key.

Running the following commands in your project will commit and push triggering a new publish:

```bash
git add valist.yml .github/workflows/example.yml
git commit -m "Release 0.0.1"
git push 
```

The Valist CLI inside the Github Action will publish the artifacts to the corresponding `name`, and `tag`.
