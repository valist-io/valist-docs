---
description: >-
  Publishing executable binaries is super easy with Valist. Learn how to use
  publish with the web dashboard, CLI, or GitHub Action!
---

# ⚙ Publishing Binaries & Executables

Publishing executable binaries is super easy with Valist!

{% hint style="info" %}
Note: currently, only statically linked binaries are supported, since Valist does not have a built-in dependency manager yet.
{% endhint %}

### How native app publishing in Valist works

While standard releases are usually a simple folder upload, in order to get Valist to interpret the platform you are building for, you will need to tell it how to describe your Release.

This is accomplished by:

* Setting your `Project Type` to `native` or `cli` in your Project Settings. This will signal to the Web Dashboard and other tooling to display a different upload form fit for your use-case.
* Specifying which binaries belong to their designated platforms during the Release. This can be done from the simple Web Dashboard upload form by clicking the correct platform, or by configuring the `install` field if using the CLI or GitHub Action

Each Release includes metadata that maps the platform/architecture to the corresponding binary.

{% hint style="info" %}
The following platform/architecture combinations are supported:

* darwin\_amd64
* darwin\_arm64
* linux\_amd64
* linux\_arm64
* windows\_amd64
{% endhint %}

### Step 1: Setting your Project Type to "native" or "cli"

First, you will need to set your Project Type to `native` or `cli` to tell the rest of the Valist tooling to treat this project as a native, non-web application.

{% hint style="info" %}
**Note:** the `cli` type is essentially the same as `native`, but exists to specify whether or not the native app has a GUI.&#x20;
{% endhint %}

Navigate to your Project Settings, and in the Project Details section, set the `Project Type` to either `native` or `cli`:

<figure><img src="../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

Awesome! Now, any Releases moving forward will show a different upload form with specific binaries available. Each Release is independently configured, so you can rest assured knowing that changing this later will not break old Releases. This is simply a hint to the tooling to treat upcoming Releases as a certain type.

### Step 2: Publishing a native Release

{% tabs %}
{% tab title="Web Dashboard" %}
Navigate to your project, then click the `New Release` button.

<figure><img src="../.gitbook/assets/image (31).png" alt=""><figcaption></figcaption></figure>

The form will ask you for a Release Name, a Display Name, and Description. You can also add an image to the release.

The `name` field works the same way as the `account` and `project` names -- it is an immutable tag that represents the version of the release, and is accessible at the `account/project/release` path once published.



<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

Next, you will see a list of file upload buttons corresponding to the supported platform/architecture combinations. Choose one or more of your binaries for the right platform, and click `Create`.

This will fire off a transaction, and successfully publish your release!

Congratulations, you've now published your binaries in a web3-native way! 🚀 Time to pat yourself on the back and share your work with the world!
{% endtab %}

{% tab title="CLI" %}
**Note: First, you'll need to install and setup your Valist CLI by configuring the key it uses to publish.** If you haven't done this yet, visit the CLI quick start (it will take less than 5 min):

{% content-ref url="../quick-start/cli.md" %}
[cli.md](../quick-start/cli.md)
{% endcontent-ref %}

#### Step 2a: Creating a valist.yml file

Once you've installed and configured your key, you will need to create a `valist.yml` file:

{% code title="valist.yml" %}
```yaml
account: acme-co
project: multi-platform
release: 0.1.5 # update this for every release
path: dist
install:
  name: hello-go
  darwin_amd64: hello-darwin-amd64
  darwin_arm64: hello-darwin-arm64
  linux_amd64: hello-linux-amd64
  windows_amd64: hello-windows-amd64
```
{% endcode %}

* Simply replace the `account` with your Valist Account name
* Replace the `project` with your Valist Project name
* Replace the `release` with the immutable version/tag you wish to use.
  * The `release` field works the same way as the `account` and `project` names -- it is an immutable tag that represents the version of the release, and is accessible at the `account/project/release` path once published.
* The `path` field indicates the folder to upload. All of the files within will be uploaded, so make sure no private information is included!
* The `install` field acts as a map between the platform/architecture and the designated binary. The `name` field is the name of the binary will be given post-installation.

You can map each supported platform within the `install` field by specifying the platform/architecture along with the path to the binary from within your release directory.

In this example, the `darwin_amd64` version of the `hello-go` binary will be uploaded from the `dist/hello-darwin-amd64` path:

```yaml
path: dist
install:
  name: hello-go
  darwin_amd64: hello-darwin-amd64
```

{% hint style="info" %}
The following platform/architecture combinations are supported:

* darwin\_amd64
* darwin\_arm64
* linux\_amd64
* linux\_arm64
* windows\_amd64
{% endhint %}

#### Step 3: Publishing the Release!

Once you've configured the release, simply run the following command:

```bash
valist publish
```

Boom! 🚀 You're all finished! You should see a successful release prompt like the following:

<figure><img src="../.gitbook/assets/image (26).png" alt=""><figcaption><p>A successful Valist Release</p></figcaption></figure>

You can now access this from anywhere in the Valist ecosystem, and from IPFS directly!

Congratulations, you've now published your binaries in a web3-native way! 🚀 Time to pat yourself on the back and share your work with the world!
{% endtab %}

{% tab title="GitHub Action" %}
**Note: For more information about how the GitHub Action works, visit the following page. If you're familiar with the CLI, configuring the GitHub Action is very similar:**

{% content-ref url="../quick-start/github-action.md" %}
[github-action.md](../quick-start/github-action.md)
{% endcontent-ref %}

#### Step 2a: Creating the valist.yml workflow file

First, you'll need to create a `valist.yml` file inside of the `.github/workflows` folder in your project.

Alternatively, you can add only the necessary Valist GitHub Action code to your existing workflow files.

An example workflow file for a multi-platform build looks like the following:

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

      - name: Setup Go
        uses: actions/setup-go@v3
        with:
          go-version: '^1.13.1'

      - name: Build multi-platform Go binary
        run: |
          cd multi-platform-project
          make

      - run: echo "TIMESTAMP=$(date +%Y%m%d%H%M)" >> $GITHUB_ENV

      - name: Valist Publish
        uses: valist-io/valist-github-action@v2.5.6
        with:
          private-key: ${{ secrets.VALIST_SIGNER }}
          account: acme-co
          project: multi-platform
          release: github-action-${{ env.TIMESTAMP }}
          path: multi-platform-project/dist

          # configures installer support for mac, linux, and windows
          install-name: hello-go
          install-darwin-amd64: hello-darwin-amd64
          install-darwin-arm64: hello-darwin-arm64
          install-linux-amd64: hello-linux-amd64
          install-windows-amd64: hello-windows-amd64
```

In this example, the following fields are configured:

* The `private-key` uses a GitHub repository secret, containing a key that has access to the Valist Project.
* The `account` is the Valist Account name.
* The `project` is the Valist Project name.
* The `release` field works the same way as the `account` and `project` names -- it is an immutable tag that represents the version of the release, and is accessible at the `account/project/release` path once published.
* The `path` field indicates the folder to upload. All of the files within will be uploaded, so make sure no private information is included!

The `install-*` fields act as a map between the platform/architecture and the designated binary. The `install-name` field is the name of the binary will be given post-installation.

This will map each binary to its designated platform, enabling the Valist tooling to install the correct version on the correct platforms.

In this example, the `darwin_amd64` version of the `hello-go` binary will be uploaded from the `multi-platform-project/dist/hello-darwin-amd64` path:

```yaml
path: multi-platform-project/dist
install-name: hello-go
install-darwin-amd64: hello-darwin-amd64
```

{% hint style="info" %}
The following platform/architecture combinations are supported:

* install-darwin-amd64
* install-darwin-arm64
* install-linux-amd64
* install-linux-arm64
* install-windows-amd64
{% endhint %}

Once you've configured the release, the Valist GitHub Action will publish the binaries, and configure the platforms as specified! 🚀

A successful workflow run will look something like this:

<figure><img src="../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

A live example can be found here:

{% embed url="https://github.com/valist-io/example-projects/blob/main/.github/workflows/multi-platform.yml" %}
Multi-platform Go binary publish via the Valist GitHub Action
{% endembed %}

{% embed url="https://app.valist.io/acme-co/multi-platform" %}
Valist Multi-platform project
{% endembed %}

Congratulations, you've now published your binaries in a web3-native way! 🚀 Time to pat yourself on the back and share your work with the world!
{% endtab %}
{% endtabs %}

An example multi-platform project can be found here:

{% embed url="https://github.com/valist-io/example-projects/tree/main/multi-platform-project" %}
Multi-platform Go project
{% endembed %}

This contains both a [CLI](https://github.com/valist-io/example-projects/blob/main/multi-platform-project/valist.yml) example, as well as a GitHub Action [workflow](https://github.com/valist-io/example-projects/blob/main/.github/workflows/multi-platform.yml) example!

{% hint style="success" %}
Want to add your example to these docs? Please feel free to open a PR or contact us at hello@valist.io 😄
{% endhint %}
