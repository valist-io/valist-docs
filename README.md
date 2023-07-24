---
description: >-
  Powering Deployment in the Decentralized Era - Deploying Games at Lightning
  Speed, from Small Prototypes to Epic Projects, on Web2 and Web3!
---

# 🌄 Intro to Valist

## Welcome to Valist ✨

{% embed url="https://youtu.be/7ak6PQPDBkk" %}

Valist is an open-source, web3-native software publishing protocol.

You can think of it as the App Store or Steam, but decentralized -- no reliance on a single entity to deliver software from the developer to the end user!

Right now, software distribution is relying entirely on centralized web2 companies to distribute and publish our software.

Imagine you're building an app or game for months, or years, putting your hard work, love, and energy into it -- finally, the day comes when you're ready to share it with the world! Next thing you know, you're being interrogated by your app store/distributor for countless details, jumping through the hoops of their release process, and when they finally take your app's build, you can only hope they let it pass through the gates! Then, if you manage to get your app published, they take 30+% of your hard-earned revenue!

There are so many problems with this. The craziest part is:

* They own your products.
* They own your users.
* Your users don't even truly own the assets they've purchased.

How did we ever let this happen? These are the problems that are created when you rely on _**companies**_ and not _**protocols**_.

Valist ties together the best-in-class web3 protocols, like [Polygon](https://polygon.technology/), [IPFS](https://ipfs.io/), [Filecoin](https://filecoin.io/), and other networks to make publishing your software or game super easy.

It supports any kind of software -- from binaries to web apps to Unity games -- all in a unified interface, with a familiar look and feel.

The most popular, and supported use cases for Valist are:

* Publishing static web apps (Next.js, Create React App, Gatsby, etc.)
* Publishing games and apps
* Publishing static binaries and executables
  * Golang, Rust, and other binaries are excellent fits here
* Publishing Electron & other desktop apps
* Publishing apps to multiple platforms (Mac, Windows, Linux, Android, and Web currently supported)

Valist works by using IPFS and Filecoin to store all software and other data assets, and Polygon to coordinate the `account/project/version` combination in a decentralized registry smart contract that enforces all the security policies set on the Valist account.

This is all wrapped into an easy-to-use interface, with gas-less transactions and password-less email login as a cherry on top.



The Valist SDK is what powers the [Web Dashboard](https://app.valist.io), [CLI](quick-start/cli.md), [GitHub Action](quick-start/github-action.md), and any other Valist-powered tooling.

An example of a Valist Release on-chain looks like this:

{% code overflow="wrap" lineNumbers="true" %}
```json
{
  "name": "1.2.3",
  "description": "Example multi-platform binary release!",
  "install": {
    "windows_amd64": "hello-windows-amd64",
    "linux_amd64": "hello-linux-amd64",
    "darwin_arm64": "hello-darwin-arm64",
    "darwin_amd64": "hello-darwin-amd64"
  },
  "external_url": "https://gateway.valist.io/ipfs/bafybeidlsyuka7ycdqtj5hltmlv6gghfkbr45gmissqvi6lbgdkqmbfieu"
}
```
{% endcode %}

Gateway URLs are stored with `https://gateway.valist.io/ipfs/` as the prefix, but you can easily strip this away and fetch the CID directly from IPFS! The Valist clients do this automatically, and load from native IPFS wherever possible.

Valist is **fully decentralized**, meaning you can run Valist entirely locally, plugging in your own web3 infrastructure, without depending on a single point of failure. All you need is a Polygon RPC node, an IPFS node, and a Valist Subgraph endpoint.

[**valist.io**](https://www.valist.io/) is simply a hosted version of the Valist protocol, with some extra performance and services we provide on top!

_Ready to get started?_ 🚀

Click next to know more about how we help Gamers and Game Devs.
