# 📦 Releases

{% embed url="https://www.loom.com/share/4d6991cbed084172a6106efd931b380b" %}

A Release is simply an arbitrary file or folder stored on a decentralized storage network that is tagged as a version under a Project.

A Release contains:

* A reference to metadata stored in a decentralized network
* A reference to the file or folder associated with the release

The Valist frontend and SDKs will handle keeping track of the relevant metadata that enables things like multi-platform builds, decentralized web applications, Software Licenses, and more.

You should always be able to download the Release from the network given an `account/project/version`

The metadata for a Release complies with common NFT [metadata structure](https://docs.opensea.io/docs/metadata-standards#metadata-structure) so it can easily be rendered on NFT galleries and in wallets.

{% hint style="info" %}
You can view the smart contract implementation [here](https://github.com/valist-io/valist-js/blob/main/packages/evm-contracts/contracts/Valist.sol#L139).
{% endhint %}
