# 🌐 Web Dashboard

The Valist Web Dashboard is your one-stop place to see all of your Valist Accounts, Projects, and Releases. It allows you to both publish software, as well as discover and download new software.

Once you've logged in, created an account and a project, you will see a familiar, Vercel/Netlify-like interface.

If you haven't created an account or project yet, visit the following page to learn how:

{% content-ref url="creating-an-account-and-project.md" %}
[creating-an-account-and-project.md](creating-an-account-and-project.md)
{% endcontent-ref %}

### The Dashboard

On the Dashboard, the top left corner enables you to switch between your Valist Accounts (currently selected, `acme-co`). The center shows the list of projects within this account, and the right hand side shows the list of Members in the Account, and any recent activity.

<figure><img src="../.gitbook/assets/image (49).png" alt=""><figcaption></figcaption></figure>

### Releases

Depending on your `Project Type` in your project settings, you will see two different upload screens when creating a Release.

If you've chosen `web` as your project, you will see a standard drag-and-drop uploader that you can use to upload your app's build folder (see [publishing-web-apps.md](../publishing/publishing-web-apps.md "mention") for more).

If you've chosen `native` or `cli`, the uploader will show buttons for the supported platform/architecture combinations (see [publishing-binaries-and-executables.md](../publishing/publishing-binaries-and-executables.md "mention") for more).

All you need to do is name your release with an immutable tag, and select your files:

<figure><img src="../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

If you're uploading a `web` project, you will see the following uploader:

<figure><img src="../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

If you chose `native` or `cli`, you will see:

<figure><img src="../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

Once you click `Create` it will upload all of the files to IPFS, then fire off a meta-transaction request to finalize the Release on-chain!

For more information about how to create a release, visit the `Publishing` section for more examples:

{% content-ref url="broken-reference" %}
[Broken link](broken-reference)
{% endcontent-ref %}

Congratulations, you've now published a web3-native software release! 🚀 time to show off your project to the world (and in our community [Discord server](https://valist.io/discord)!)
