---
description: A cross-platform desktop and Android app store and game launcher for web3.
---

# 💎 Sapphire Launcher

<figure><img src="../.gitbook/assets/image (10).png" alt=""><figcaption><p>Valist Sapphire preview</p></figcaption></figure>

Valist Sapphire is a cross-platform app store and game launcher for web3. You can think of it as an evolution of web2 app stores and game launchers.

Sapphire replaces traditional platforms like the App Store and Steam with a web3-powered alternative that uses cryptocurrency and Software License NFTs as payment methods, with fiat gateways (coming soon) on top for easy payment onboarding/offboarding.

### Features

* Fully web3-native app distribution powered by Polygon, IPFS, and Filecoin + other payment networks.
* Built-in crypto wallet that's transparent when you want it, but confirms with you when it should.
* Natively install and launch web apps, Unity games, and other software published on Valist. Or, simply browse as usual!
* Local IPFS node + Valist.io IPFS/Filecoin infrastructure, so you're not relying on a single entity to fetch the software -- you can even fetch it from your neighbor if they've already downloaded it! This helps especially for large games.

The Sapphire Launcher can install and launch both **web** and **native** games:

<figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption><p>Play and install games!</p></figcaption></figure>

Sapphire supports both full-screen and windowed gameplay, creating the most immersive experience for any dApp or game!

<figure><img src="../.gitbook/assets/image (30).png" alt=""><figcaption><p>Full-screen mode support</p></figcaption></figure>

You can even install and launch multiple web apps!

<figure><img src="../.gitbook/assets/image (34).png" alt=""><figcaption><p>Install and launch web applications to your local IPFS node</p></figcaption></figure>

With support for NFT in-games assets and collectibles.

<figure><img src="../.gitbook/assets/image (39).png" alt=""><figcaption><p>Sapphire supports in-game and in-app asset management</p></figcaption></figure>

### Installation

Coming soon! We're hard at work getting Sapphire built and deployed via CI/CD and jumping through the traditional web2 gatekeeper hoops to deliver you a downloadable version of Sapphire!

Check out the progress here: [https://github.com/valist-io/valist-js/pull/235](https://github.com/valist-io/valist-js/pull/235)

If you can't wait, and want to get a build today or start contributing, you can perform the following steps:

```
git clone https://github.com/valist-io/valist-js
cd valist-js
make install electron
```

This will install all dependencies, build the frontend first, then build and launch the Electron app.
