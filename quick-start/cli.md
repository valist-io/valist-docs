# 💻 CLI

**Note: An account and project is required for the following section.** If you haven't created an account or project yet, visit the following page to learn how:

{% content-ref url="creating-an-account-and-project.md" %}
[creating-an-account-and-project.md](creating-an-account-and-project.md)
{% endcontent-ref %}

### Valist CLI

The Valist CLI allows you to easily _publish_, _download_, and _install_ releases from the command line! It's a great way to easily work with releases without navigating through a frontend. You can also use it to integrate your existing CI/CD workflows.

### Features

The Valist CLI supports all of the core publishing functionality of Valist, including:

* Secure key management with [keytar](https://www.npmjs.com/package/keytar)
* Publishing releases, for example `valist publish example-account/go-binary/0.0.1 dist/*`
* Downloading releases, for example `valist download example-account/go-binary`
* Gasless meta-transactions powered by [OpenGSN](https://github.com/opengsn/gsn)

<figure><img src="../.gitbook/assets/image (4).png" alt=""><figcaption><p>The Valist CLI</p></figcaption></figure>

### Installation

To install the CLI, you will need Node.js v16+ installed.

```bash
npm i -g @valist/cli
```

**Note: An account and project is required for the following section.** If you haven't created an account or project yet, visit the following page to learn how:

{% content-ref url="creating-an-account-and-project.md" %}
[creating-an-account-and-project.md](creating-an-account-and-project.md)
{% endcontent-ref %}

### Generating or importing a key in the CLI wallet

**Generating a fresh key (recommended, most secure method)**

The most recommended configuration is to generate a fresh key in the CLI, then add that address to the designated account or project you wish to publish to.

To generate a new key and store it directly into your secure keystore, run the following:

```
valist keygen
```

This will print out an address like so:

<figure><img src="../.gitbook/assets/image (54).png" alt=""><figcaption></figcaption></figure>

Next, you will need to add this key to your desired project or account members to give it access to publish. Navigate to your project or account settings in the web dashboard, and add the key like so, and hit `enter` -- this will trigger a transaction to add the account to the project:

<figure><img src="../.gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
This step is required before the CLI can publish under the account or project.
{% endhint %}

**Importing a Key (easiest, less secure)**

The Valist CLI also supports importing the following key formats:

* Private Key Hex string
* Encrypted JSON Keystore (MyCrypto, Geth, etc)
* Mnemonic phrase

To import your key into your secure keystore, run the following:

```bash
valist import
```

This will prompt you to import the key into your system's secure credential storage. You will then be able to use this key for publishing.

{% hint style="info" %}
Your key is only accessible by you -- this simply copies your key into your system's native secure keystore.
{% endhint %}

### Publishing a Release

Publishing a Release with the CLI is very simple. You simply need to give it the `account/project/tag` path to publish, and the set of files to include in the Release.

The format is the following:

```bash
valist publish <username>/<project>/<version> <folder>
```

An example of this looks like this:

```
valist publish acme-co/go-binary/0.0.1 dist
```

This will upload the files to IPFS, and trigger the publish. Meta-transactions are enabled by default, so you won't need to spend any gas.

<figure><img src="../.gitbook/assets/image (16).png" alt=""><figcaption><p>Example Valist Publish uploading a Go binary</p></figcaption></figure>

This is a flexible and simple way to publish in any environment that supports Node.js!

Feel free to publish your static website's build folder, a Unity project build folder, binaries, you name it! (**Just make sure, it's just your build folder!** :stuck\_out\_tongue\_winking\_eye:**)**

#### Advanced Configuration (Cross-platform builds)

You can configure the CLI to support advanced behaviors, like cross-platform builds by creating a `valist.yml` file in the root of your project.

The `valist.yml` file looks like the following:

```yaml
account: acme-co
project: multi-platform
release: 0.1.3
path: dist
install:
  name: hello-go
  darwin_amd64: hello-darwin-amd64
  darwin_arm64: hello-darwin-arm64
  linux_amd64: hello-linux-amd64
  windows_amd64: hello-windows-amd64
```

The `account`, `project`, `release`, and `path` variables are all the same, however, an additional `install` field is available to enable mapping native static binaries to their designated platforms.

{% hint style="info" %}
The following platform/architecture combinations are supported:

* darwin\_amd64
* darwin\_arm64
* linux\_amd64
* linux\_arm64
* windows\_amd64
{% endhint %}

### Downloading a Release

Downloading a Release with the CLI is just as easy.

Simply provide the release path, and it will download a `.tar` bundle containing the Release:

```bash
valist download acme-co/go-binary/0.0.1
```

If you don't specify a tag, the CLI will automatically download the latest Release:

```bash
valist download acme-co/go-binary
```

Voila! This will fetch the Release metadata and the corresponding artifacts from IPFS into your working directory.

