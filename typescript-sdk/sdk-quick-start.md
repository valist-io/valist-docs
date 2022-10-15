---
description: Documentation for using the TypeScript Valist software development kit.
---

# SDK Quick Start

Welcome to Valist’s TypeScript SDK v2. It helps developers interact with Valist’s Registry smart contracts, protocols like IPFS, The Graph, OpenGSN, and more, in an easy to use interface.&#x20;

### Getting Started

The SDK is written in TypeScript and is meant to simplify interaction with Valist in a Javascript based environment. It is compatible with both Node.js and Browser environments!

#### Overview

The SDK is broken into two components,

1. Client : An exported class used to interact with the contracts and registry to manage projects and accounts.
   * This connects to the Polygon network and corresponding contract addresses, as well as gasless meta-transactions powered by OpenGSN.
   * This also connects to IPFS, and handles automatic storage functionality when publishing content.
2. Types/interface: Exported interfaces for metadata associated with Accounts, Projects and Releases.

Everything is abstracted into a clean interface, and all you need to get started is a Wallet/Web3 Provider! You can also customize the infrastructure (RPC, IPFS, Subgraph, etc) the SDK connects with. By default it uses the valist.io managed infrastructure, but you can swap out every component for your own!

#### Installation

To start using the SDK, simply install it into your project...

```bash
npm install @valist/sdk
```

Then, you can import the `create` function to create a Valist client!

```jsx
import { create } from "@valist/sdk"
```

If there are other functions with the same name (i.e., IPFS client library), you can import it like this instead:

```javascript
import { create as createValist } from "@valist/sdk"
```

Below is an example of creating a Valist Client and fetching some Project and Release metadata:

```javascript
// Example
const ethers = require('ethers');
const create = require('@valist/sdk').create;
const Web3HttpProvider = require('web3-providers-http'); 

async function main() {
	try {
            const web3 = new Web3HttpProvider("https://rpc.valist.io/polygon");
            
            const privateKey = ethers.Wallet.createRandom();
            const wallet = new ethers.Wallet(privateKey);
            
            const provider = new ethers.providers.Web3Provider(web3);
            const valist = await create(provider, { wallet, metaTx: true });
            
            const accountID = valist.generateID(137, 'acme-co');
            const projectID = valist.generateID(accountID, 'go-binary')
            const releaseID = await valist.getLatestReleaseID(projectID)
        
            const projectMeta = await valist.getProjectMeta(projectID);
            const latestRelease = await valist.getReleaseMeta(releaseID);
        
            console.log(projectMeta);
            console.log(latestRelease);
	} catch (err) {
		console.log(err)
	}
}

main()
```

Here's a live example:

{% embed url="https://replit.com/@AlecWantoch/valist-sdk" %}

### TypeDoc

To view the TypeDoc for the Valist TypeScript SDK, navigate to the following site:

{% embed url="https://jsdocs.valist.io" %}
