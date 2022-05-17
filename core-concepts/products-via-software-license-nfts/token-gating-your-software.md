# 🔑 Token Gating your Software

Once you've created a License NFT (ERC1155), it's up to you how you'd like to token gate!

The general flow for token gating your software is to:

1. &#x20;Connect to the user's wallet
2. Sign a message to authenticate the user
3. Recover the address from the signature
4. Check the user's License NFT balance
5. Start your application if they have a License token. If they don't, redirect them to your Valist Project page, or enable in-app purchasing of the License.

For Node.js and Web Applications, we recommend:

* Using the Valist SDK
* [MintGate](https://mintgate.io) (Developer [Docs](https://mintgate.gitbook.io/mintgate-docs/))

For Unity games and applications, we recommend:

* [ChainSafe Gaming](https://gaming.chainsafe.io/) SDK (Developer [Docs](https://docs.gaming.chainsafe.io/erc1155))
  * Example [script](https://gist.github.com/nasdf/d8b7fb4e570e563e990c52501bdfdfa7)
* Moralis Unity SDK (Developer [Docs](https://github.com/ethereum-boilerplate/ethereum-unity-boilerplate))

For a video tutorial that goes over these concepts, check out our BuildQuest 2022 workshop below! 👇

{% embed url="https://www.youtube.com/watch?v=aurYZhPkRQw" %}
