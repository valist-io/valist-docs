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