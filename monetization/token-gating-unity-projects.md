---
description: Valist makes it easy to token-gate Unity projects
---

# 🔐 Token-gating Unity Projects

{% hint style="warning" %}
This page is under re-construction! Stay tuned for updates!
{% endhint %}

Once you've created a License NFT (ERC1155), it's up to you how you'd like to token gate!

The general flow for token gating your software is to:

1. &#x20;Connect to the user's wallet
2. Sign a message to authenticate the user
3. Recover the address from the signature
4. Check the user's License NFT balance
5. Start your application if they have a License token. If they don't, redirect them to your Valist Project page, or enable in-app purchasing of the License.

For Unity games and applications, we recommend:

* [ChainSafe Gaming](https://gaming.chainsafe.io/) SDK (Developer [Docs](https://docs.gaming.chainsafe.io/erc1155))
  * Example [script](https://gist.github.com/nasdf/d8b7fb4e570e563e990c52501bdfdfa7)
* Moralis Unity SDK (Developer [Docs](https://github.com/ethereum-boilerplate/ethereum-unity-boilerplate))

A starter template for ChainSafe Gaming & Valist Software License NFTs can be found here:

{% embed url="https://github.com/valist-io/valist-chainsafe-gaming-starter" %}

The following script enables quick signing, you just simply need to attach this to a `Login` object in your Unity game!

{% embed url="https://gist.github.com/nasdf/d8b7fb4e570e563e990c52501bdfdfa7" %}
NFTLicense.cs
{% endembed %}

Another example can be found here:

{% embed url="https://youtu.be/aurYZhPkRQw" %}
