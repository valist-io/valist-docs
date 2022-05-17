# 👥 Accounts

{% embed url="https://www.loom.com/share/f054e6cbbfee45cf94c0ab7f945d5643" %}

Valist uses the concept of "Accounts" to organize projects.

An Account is simply a username that points to a group of addresses that are designated as "Account Admins."

These members control the projects under this username.

Rather than relying solely on external naming systems, Valist integrates them into this unified namespace.

{% hint style="info" %}
Valist supports ENS domain resolution for any address associated with an Account or Project
{% endhint %}

This is to enable GitHub-like indexing of pages, i.e. the ability to navigate by`/username/project/version`. The access control is also very similar: account members control the account, and project members control the projects within the account.

An account can be controlled by a set of addresses, or a multi-sig address.&#x20;

{% hint style="info" %}
For larger accounts, we recommend creating a Gnosis Safe on Polygon, and setting that as the sole account admin.
{% endhint %}

An account contains:

* A reference to metadata stored on a decentralized network.
* An address array of `members` that represent the Account Admins.
* A `beneficiary` address that receives all funds associated with the sale of Software Licenses, as well as donations.

Account members can publish to any project within the account.

{% hint style="info" %}
You can view the smart contract implementation [here](https://github.com/valist-io/valist-contracts).
{% endhint %}
