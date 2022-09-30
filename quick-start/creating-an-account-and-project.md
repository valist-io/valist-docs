# 🚀 Creating an Account & Project

Creating an account on Valist is super easy!

The web dashboard will walk you through the whole process, but the high level overview is:

* Creating an account, and setting up the addresses that will be admins for the account.
* Creating a project, and optionally giving access to additional project-level addresses that can publish only under this specific project. Adding as much detail in the descriptions and adding optional screenshots qualify you for the Valist Discovery page & features!
* Publishing to the project when you're ready to release!

First, navigate to the web dashboard at [app.valist.io](https://app.valist.io/):

{% embed url="https://app.valist.io/" %}
Valist Web Dashboard
{% endembed %}

This will display the onboarding welcome page:

<figure><img src="../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

You'll then be prompted to create an account.

The `Account Name` is your Valist username -- this will abstract away all of the other keys associated with the account into a human-readable namespace that can also act as an organization account. This is unique, and cannot be changed, so pick wisely!

<figure><img src="../.gitbook/assets/image (46).png" alt=""><figcaption></figcaption></figure>

Once you've filled out this meta-data, you will be asked to setup the `Account Members`:

<figure><img src="../.gitbook/assets/image (44).png" alt=""><figcaption></figcaption></figure>

**This is a super important step!** This is the list of addresses that will become administrators on this account. Every account member has access to publish across any project within the account, as well as modify other account & project settings. Be mindful who you give access here! For even higher security, you can also put a Gnosis Safe Multi-sig here (_**\*Polygon only**_) to ensure that multiple admins need to sign off on an action.

Once you click `Create`, a message signature request will pop-up on your wallet, like so:

<img src="../.gitbook/assets/image (42).png" alt="" data-size="original">

This is a "meta-transaction" -- meaning, the Valist protocol is paying the gas and creating the on-chain transaction for you! All Valist needs is a signature from your wallet approving the transaction. If you're using MetaMask, you may have to click the small arrow on the bottom right to enable the `Sign` button.

Voilà! You've now created a Valist account successfully.

Creating a project is very similar, with some slight differences.

The `Project Name` works the same way as the `Account Name` -- it is an immutable short-name for your project that will be used to reference by `account/project` in the Valist Registry.

Filling in as much detail about your project is key, as it will enable your app to be more easily discovered in the Valist ecosystem!

Be mindful of the `Project Type` field as well -- this is the field that indicates how to consume your software. If it's `web`, Valist will know to launch it like a web app in a Browser or WebView. If it's `native` or `cli`, Valist will know that it needs to show different publishing options for cross-platform builds, and signals to Valist how to install/launch your app.

<figure><img src="../.gitbook/assets/image (38).png" alt=""><figcaption></figcaption></figure>

You can also add as many tags as you like, including custom tags that aren't in the default list:

<figure><img src="../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

The `Descriptions` section also supports Markdown in the long description, so feel free to copy/paste your existing `README.md` file here!

<figure><img src="../.gitbook/assets/image (51).png" alt=""><figcaption></figcaption></figure>

**Another important configuration** is the project `Members` tab. This is where you configure which addresses will have access to this project. The Account Members already have admin access, so they are shown here for reference, but you can add additional keys to just this project. This is great for adding more team members, or configuring CI/CD only keys with the GitHub Action.

<figure><img src="../.gitbook/assets/image (35).png" alt=""><figcaption></figcaption></figure>

Lastly, the `Media` tab allows you to add screenshots, and a YouTube URL that will auto-render on the project's page. Feel free to skip this for now, but remember: to qualify for the Discovery page & other Discovery features, you'll need to add at least one screenshot and high quality descriptions!

<figure><img src="../.gitbook/assets/image (52).png" alt=""><figcaption></figcaption></figure>

### Now you're ready to get publishing!

You've got an account and a project fully set up for web3-native publishing. After creating the Project, you'll be taken back to your Dashboard where you can click `New Release` to get your software out to the world!

From this point forward, creating Releases is a straight-forward process, with multiple options for how you prefer to publish. The Web Dashboard is an excellent choice for drag-and-drop uploading. The CLI is awesome if you prefer to run `valist publish account/project/version build_folder` instead. Or, integrate the GitHub Action into your existing release pipeline super easily, whichever your dev needs lead you!
