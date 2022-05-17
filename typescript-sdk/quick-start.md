---
description: Documentation for using the Valist software development Kit.
---

# Quick Start

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
npm install @valist/valist-sdk
```

Then, you can import the `create` function to create a Valist client!

```jsx
import { create } from "@valist/valist-sdk"
```

If there are other functions with the same name (i.e., IPFS client library), you can import it like this instead:

```javascript
import { create as createValist } from "@valist/valist-sdk"
```

