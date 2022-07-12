# 🌐 Web3-native Software Distribution

## The Big Picture

These days, most developers use platforms like GitHub, AWS, GCP, or Azure to distribute software. For user-facing applications, most developers publish to app/game stores like Apple, Google Play, or Steam. These are web2 software distribution platforms.

Unfortunately, this still the case for web3 software. Despite the energy and effort spent on consensus security, decentralization, and resilience, almost all web3 software is built, packaged, and distributed over web2.

Valist is a web3-native software distribution system that glues web3 protocols like Ethereum/Polygon, IPFS, and Filecoin together into a simple interface that enables:

* Publishing software with your web3 identity (Ethereum address, ENS)
* Fetching software
* Over-the-air auto-update systems
* DAO-coordinated software releases
* ERC1155-based Software Licenses
* Public Goods funding mechanisms

While tools like Radicle (💜) are solving decentralized source control, Valist is solving for decentralizing the rest of the software development lifecycle, from built application to the end user. You can think of it as the "Hub" in GitHub, for web3.

## How it works

There are two main components to make this possible:

* Smart contracts on Polygon (NEAR & zkSync coming soon) for access control, namespaces (accounts, projects, versions), and linking each release version to a decentralized storage hash
* Decentralized storage (IPFS, Filecoin) to store and distribute the release artifacts

The general workflow looks like the following:

![](<../.gitbook/assets/image (1) (1).png>)

First, a developer creates an account and a project on the Valist Registry smart contract.

Then, when the developer publishes a release -- for example, version `1.0.0` of a CLI application, the following happens:

* Valist pins the file onto IPFS using several pinning providers. This file is also archived onto Filecoin for long-term storage.
* The Valist client creates a JSON file from the release metadata, file CIDs, and other relevant information, and publishes this onto IPFS.
* This Release CID is then stored in the Valist Registry contract on Polygon under the `account/project/1.0.0` path.
* When calling the contract, an EIP-712 meta-transaction signature is requested from the user, which is used to relay the transaction with [OpenGSN](https://opengsn.org/).
  * This enables gasless transactions, removing friction for developers.
  * The transaction paymaster is powered by Valist.io and the community.
* The [Subgraph](https://thegraph.com/hosted-service/subgraph/valist-io/valist) indexes the event triggered by the smart contract, enabling advanced data querying from the client in addition to the direct RPC-based requests.

Once the release is published, the Valist SDK, Web Dashboard, and CLI are all able to easily query this path to resolve the release.

Valist is 100% [open-source](https://github.com/valist-io), from frontend to smart contracts, and completely decentralized. You can run your own frontend, and plug in your own infrastructure.

Valist.io is a service that you can use for storage redundancy, an easy portal to the software published on the Valist registries, as well as quality-of-life improvements like gasless transactions and passwordless email login.

## The impact of Web3-native software distribution

Once we port over the common features from web2 software distribution platforms like publishing, fetching, and access control, what can we do now that we're in web3 that we couldn't do before?

#### DAO-coordinated software

Let's start with blockchain node software like geth. Currently, we rely on developers from the Ethereum Foundation to publish new versions. They happen to use Microsoft Azure Blobstore to handle builds, signatures, and distribution.

In the future, a DAO could coordinate these releases instead. Let's call it "GethDAO" -- members of this community can each perform a build and submit their resulting geth binary. The DAO can then coordinate these releases after a threshold is reached (say 100/500 people).

Then, geth itself can query the smart contract registry, detect a new version was published by the DAO, and auto-update. This enables community-powered builds and upgrade mechanisms that doesn't require falling back to a centralized developer team!

#### Software License NFTs

For user-facing software, developers can now publish and monetize their applications and games directly with their users, rather than having to request permission from the likes of Apple or Steam (not to mention their 30% cut). Developers can token-gate software, collect royalties on resells, create truly limited editions, and even fund their open source project with special support licenses.

Consumers of the application or game can also show off their favorite software in their wallets, trade/resell their games, and build up their profile.

#### Proof of Contribution

As developers publish software, a Proof of Contribution NFT can be minted to demonstrate proof that they participated in a release. Now, instead of building up a social profile on a centralized GitHub account, developers can build their reputation on their wallet. Developers can show off their best contributions to the most popular protocols right in the same place they show off their other NFTs.

This creates a more sovereign developer identity, and creates on-chain reputation that can be used in other decentralized applications.



Next, we will learn about Accounts and how they organize Projects and Releases!
