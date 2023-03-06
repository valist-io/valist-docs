# 🔐 Products via Software License NFTs

{% hint style="info" %}
Hey there! Software License NFTs are a new and flexible primitive. We'd love your feedback on different ways Valist can improve the implementation, come share your thoughts in our Discord! [https://valist.io/discord](https://valist.io/discord)
{% endhint %}

Valist helps developers monetize their projects, essentially making them products. The Valist SDK helps facilitate the price, royalties, supply, limit and [NFT](./) for [products](./).&#x20;

A project on Valist can be wrapped into an NFT and monetized. Owning a product's NFT means owning the product's license. At the moment, a project can support a single product. To release different editions, you will need to create different projects and configure their prices separately. This is beneficial to separate the token-gated content and payment configurations between the products.&#x20;

Products support the following configurations:

* Payment in MATIC and any ERC-20 token on the Polygon network
* Setting supply limits for the product. This is great for special editions/releases.
* Built-in Royalties to monetize secondary item sales.

You can use Valist to create a Software License NFT that enables you to directly monetize your game or software fairly.

The Software License NFT is an ERC1155 token that you can use as a token-gate, or in-app/game purchase.

Valist will facilitate creating the NFT contract, including setting a price, metadata, etc.

You can then embed a license check into your app/game by using the Valist SDK, or any other ERC1155-compatible token SDK or API. You can also directly call the contract yourself!

The Valist SDK also makes it easy to query balances, purchasing/minting Licenses, and fetching License metadata.

There is a 2.5% protocol fee to support the Valist project. There will be a community contribution fee introduced in the future to support public goods funding, as well as community funding for projects published on Valist. This will be controlled by the Valist community members with sufficient on-chain reputation (i.e., use of the protocol, past public goods funding history, etc).

{% hint style="info" %}
For reference, the SoftwareLicense contract is deployed at the following addresses:\


Polygon Mainnet: `0x3cE643dc61bb40bB0557316539f4A93016051b81`\
Polygon Mumbai: `0x3cE643dc61bb40bB0557316539f4A93016051b81`
{% endhint %}

{% hint style="info" %}
You can view the smart contract implementation [here](https://remix.ethereum.org/valist-io/valist-contracts/blob/main/contracts/token/License.sol).
{% endhint %}

{% hint style="info" %}
You can visit the relevant GitHub repo [here](https://github.com/valist-io/valist-contracts).
{% endhint %}

After creating a License, you can gate your software with it! Click next to learn how 👇
