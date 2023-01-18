---
description: >-
  The Valist Web Dashboard gives you an easy way to configure Software License
  NFTs, set pricing, supply limits, and more.
---

# 💱 Configuring Pricing for your Products

{% hint style="success" %}
The Pricing & Product features are evolving quickly! Expect frequent feature enhancements and interface changes 🚀
{% endhint %}

To configure your Software License NFT products, navigate to your Valist Project and click on the `Pricing` button:

<figure><img src="../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

This will take you to a page with 3 sections: `Pricing`, `Royalty`, and `Withdraw`:

<figure><img src="../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

### Pricing

The `Pricing` tab has a few different options for you to manage your product.&#x20;

#### Max License Limits

The first option you will see is the `Max License Limit` -- this value allows you to set a max supply for the Software License NFT you're creating. By default, this is `0`, or unlimited.

#### Adding Payment Currencies

By clicking the `Add Currency` button, you will be able to enable various supported ERC20-tokens on the Polygon network.

This list is provided as a convenient, verified list, but custom tokens are also supported! This is especially useful if you have an in-game currency, or protocol token.

<figure><img src="../.gitbook/assets/image (20).png" alt=""><figcaption><p>Add ERC20 tokens as payment methods for your Software License NFT</p></figcaption></figure>

Once you add the tokens you wish to accept as payments, you will see them appear in the list:

<figure><img src="../.gitbook/assets/image (14).png" alt=""><figcaption><p>Example pricing configured to accept $20 as payment in 3 different USD stablecoins</p></figcaption></figure>

You can then individual set each token price. This will automatically enable these currencies in the Checkout flow!

### Royalties

The `Royalty` tab allows you to configure resale royalty settings for your Product.

<figure><img src="../.gitbook/assets/image (21).png" alt=""><figcaption></figcaption></figure>

Once you configure this, your Software License NFT will comply with the [ERC-2981 Royalty Standard](https://eips.ethereum.org/EIPS/eip-2981) -- so any supported marketplaces like Valist and OpenSea will respect the standard!

{% embed url="https://eips.ethereum.org/EIPS/eip-2981" %}

### Withdrawing Funds

The `Withdraw` tab shows your token balances across your accepted payment currencies, and enables you to withdraw a specific amount like so:

<figure><img src="../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

The funds are stored in the Software License NFT contract, and **any Valist Account admin** can trigger this function call, so be mindful who you give access!
