---
description: >-
  Valist offers a different options for uploading your Next JS application,
  making deployment a breeze. The following steps will guide you through the
  process seamlessly.
---

# Publishing a Next JS App

### Step 1: Build your project statically

_You'll first need to run `next export` to create an `out` folder instead of the normal `_next` folder that is served._

Make sure you have created a Next JS project:

```bash
npx create-next-app
```

First, you will need to add `next export` to your `package.json`:

```json
"scripts": {
    "dev": "next dev",
    "build": "next build",
    "export": "next export",
    "start": "next start",
    "lint": "next lint"
 },
```

This can be done by copying and adding `"export": "next export",` line under the `build` script.

_Unfortunately, Next.js server-side features like image optimization and API routes are not supported in static build environments. If you are using `next/image` for your images, you will need to add an `images` property to the `nextConfig` object in your `next.config.js` file. The value of `image` should be an object having a property called `unoptimized` set to `true`. For example:_

{% code title="next.config.js" %}
```javascript
const nextConfig={

...

images: {
      unoptimized: true,
},

...

}
```
{% endcode %}

_Otherwise, you will see an error like the following:_

{% hint style="warning" %}
```bash
Error: Image Optimization using Next.js' default loader is not compatible with `next export`.
  Possible solutions:
    - Use `next start` to run a server, which includes the Image Optimization API.
    - Configure `images.unoptimized = true` in `next.config.js` to disable the Image Optimization API.
  Read more: https://nextjs.org/docs/messages/export-image-api
```
{% endhint %}

**You can still communicate with existing HTTP backends via the static frontend!**

Then, build and run the app by running the following:

```bash
npm run build
npm run export
```

This will then create a folder named `out` in the project directory. Feel free to add the `build` script to the beginning of the `export` script for more convenience!

**You can now upload this to Valist directly**, _you're all set!_

### Step 2: Publishing a Release

Now that you've built your application, you have 3 different options for publishing depending on your preferences!

{% tabs %}
{% tab title="Web Dashboard" %}
To publish a Release with the web dashboard, make sure your `Project Type` is set to `web` in the settings, then click `New Release` on your project page.

This will show a simple upload form:

<figure><img src="../../.gitbook/assets/image (37).png" alt=""><figcaption></figcaption></figure>

* The `Release Image` allows you to attach an image to the release.
* The `Release Name` works the same way as the `account` and `project` names -- it is an immutable tag that represents the version of the release and is accessible at the `account/project/release` the path once published.
* The `Display Name` is simply a human-readable name as an alternative to the immutable tag.
* The `Description` is a Markdown-compatible description for the release.

The next tab allows you to drag and drop or click to upload a folder. Here is where you will drag your `out` folder:

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption></figcaption></figure>

After clicking `Create`, you will be prompted to sign a message for the release! 🚀
{% endtab %}

{% tab title="CLI" %}
**Note: First, you'll need to install and set up your Valist CLI by configuring the key it uses to publish.** If you haven't done this yet, visit the CLI quick start (it will take less than 5 min):

{% content-ref url="../../quick-start/cli.md" %}
[cli.md](../../quick-start/cli.md)
{% endcontent-ref %}

Publishing a web app with the Valist CLI is easy, simply run the following:

```bash
valist publish account_name/project_name/release_name out
```

Replace the variables with your Valist Account & Project names, and giving your release a `release_name` or tag. The `release_name` works the same way as the `account` and `project` names -- it is an immutable tag that represents the version of the release, and is accessible at the `account/project/release` path once published.

Replace `out` with the path, you wish to publish.

An example publish looks like:

```bash
valist publish acme-co/next-project/0.0.1 out
```

This will upload the files to IPFS and create a meta-transaction, publishing your release at the designated version:

<figure><img src="../../.gitbook/assets/image (53).png" alt=""><figcaption></figcaption></figure>

That's it! The CLI will print a few different ways to access your application, like below:

```bash
confirming transaction 0x08279fa71dc9482b55c6b638218712e34e4892f1b4f2df7bfc607f7ac2881ec1... done
successfully published acme-co/next-project/0.0.1!
view the release at:
    https://app.valist.io/acme-co/next-project/0.0.1
    https://gateway.valist.io/ipfs/bafybeigdq74jk5523p5tdhqqq5bydthewlra5klk2guot2pj3fgbx5eakm
    ipfs://bafybeigdq74jk5523p5tdhqqq5bydthewlra5klk2guot2pj3fgbx5eakm
```

Now you can celebrate knowing your app is available on web3! 🚀

**Optional: Publishing with a valist.yml file**

The Valist CLI also reads a `valist.yml` file to configure the publishing.

This is typically used to configure multi-platform releases (Mac/Windows/Linux/Android), but you can also use it for web projects.

An example for a web app looks like the following:

{% code title="valist.yml" %}
```yaml
account: acme-co
project: next-project
release: 0.0.1
path: out
```
{% endcode %}

Once the `valist.yml` file is saved, simply run:

```bash
valist publish
```

It will use these values instead of the CLI arguments, making it an easy way to keep track of the previous release!
{% endtab %}

{% tab title="GitHub Action" %}
**Note: For more information about how the GitHub Action works, visit the following page. If you're familiar with the CLI, configuring the GitHub Action is very similar:**

{% content-ref url="../../quick-start/github-action.md" %}
[github-action.md](../../quick-start/github-action.md)
{% endcontent-ref %}

Building and publishing a web app with the Valist GitHub Action is easy!

You simply need:

* Add the Valist Publish step to the end of your app's build process
* Add a Repository Secret called `VALIST_SIGNER` that contains a fresh private key that has access to the Valist Project you're publishing to. For more information, visit the [GitHub Action page](../../quick-start/github-action.md).

Create a `.github/workflows/valist.yml` file like the following:

{% code title="valist.yml" %}
```yaml
name: Valist Publish
on:
  push:
    branches:
      - main
jobs:
  valist-publish:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '16'

      - name: Build and export Next.js app
        run: |
          npm install
          npm run build
          npm run export

      - run: echo "TIMESTAMP=$(date +%Y%m%d%H%M)" >> $GITHUB_ENV

      - name: Valist Publish
        uses: valist-io/valist-github-action@v2.5.6
        with:
          private-key: ${{ secrets.VALIST_SIGNER }}
          account: acme-co
          project: next-project
          release: github-action-${{ env.TIMESTAMP }}
          path: build

```
{% endcode %}

In this example, the Valist Publish step contains:

* The `private-key` of the address that has access to this Valist Project.
* The Valist `account` name.
* The Valist `project` name.
* The Valist `release` name. This works the same way as the `account` and `project` names -- it is an immutable tag that represents the version of the release, and is accessible at the `account/project/release` path once published.
* The `path` of the folder you wish to publish. In this example, it's the static Next.js output folder.

**Live Example**

A working example can be found here:

{% embed url="https://github.com/valist-io/example-projects/blob/main/.github/workflows/nextjs-project.yml" %}
Publish Next.js app with the Valist GHA
{% endembed %}

{% embed url="https://github.com/valist-io/example-projects/runs/8144882618?check_suite_focus=true" %}
Successful Workflow run
{% endembed %}

Congratulations! You now have your web app building and publishing automatically to web3! 🚀
{% endtab %}
{% endtabs %}

That's all you need to publish web apps with Valist!

After publishing, your application will be highly available via IPFS, using links like the following:

[https://bafybeihpv3piaiybqgqcvqmgpq3dkjz55czkndkjdqjpskagml3fnczih4.ipfs.gateway.valist.io/](https://bafybeihpv3piaiybqgqcvqmgpq3dkjz55czkndkjdqjpskagml3fnczih4.ipfs.gateway.valist.io/)

You can access this IPFS hash from anywhere on the IPFS network including your own node, and from common gateways like IPFS.io, dweb.link, and Cloudflare:

[http://bafybeihpv3piaiybqgqcvqmgpq3dkjz55czkndkjdqjpskagml3fnczih4.ipfs.dweb.link/](http://bafybeihpv3piaiybqgqcvqmgpq3dkjz55czkndkjdqjpskagml3fnczih4.ipfs.dweb.link/)

Please note that IPFS gateways that don't use subdomains are not secure for accessing web applications due to sharing the same origin.

IPFS Gateways support either or both of the following formats:

1. Subdomain gateway mode: e.g. `https://<CID>.ipfs.dweb.link/`
2. Path gateway mode: e.g. `https://ipfs.io/ipfs/<CID>/`

You only want to access web apps from IPFS via the first type of gateway. This is because the browser will treat the subdomain as a different "origin" and therefore treat local storage and other security policies in a way that prevents other websites from interfering with your app.
