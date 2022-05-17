---
description: >-
  The SDK exports a client class that provides public methods to interact with
  Valist.
---

# Creating a Valist Client

After importing the client in your file, you need to create a Valist client.

#### Create Function

The create function creates a Valist client using a JSON RPC Provider.

```jsx
export async function create(
  provider: Provider,
  options: Partial<Options>
): Promise<Client>
```

#### Input Parameters

| Input    | Description                                                                |
| -------- | -------------------------------------------------------------------------- |
| Provider | An underlying web3 provider connected to a chain with a supported Chain ID |
| Options  | Additional options for configuring a client.                               |

#### Alternatively,

If the functions you want to use are read only, i.e they do not make any changes and are used only to query, the createReadonly function can be used. Further, The methods that can be accessed by a readonly client have <mark style="color:red;">Readonly</mark> next to their headings.&#x20;

#### CreateReadOnly Function

```jsx
export function createReadOnly(
  provider: Provider,
  options: Partial<Options>
): Client
```

| Input    | Description                                                                |
| -------- | -------------------------------------------------------------------------- |
| Provider | An underlying web3 provider connected to a chain with a supported chain id |
| Options  | Additional options for configuring a client.                               |

```jsx
// The configurable options for a valist client.
export interface Options {
	chainId: number;
	ipfsHost: string;
	ipfsGateway: string;
	metaTx: boolean;
	wallet: ethers.Wallet;
	registryAddress: string;
	licenseAddress: string;
}
```

### Example Usage&#x20;

```javascript
// Example
import { ethers } from 'ethers';
import { create } from '@valist/sdk';
const Web3HttpProvider = require('web3-providers-http'); 

async function run(): Promise<void> {
	try {
		const rpcURL = "https://polygon-rpc.com"
		const metaTx = true;
                const privateKey = ethers.Wallet.createRandom()
                 
		const web3 = new Web3HttpProvider(rpcURL);
		const provider = new ethers.providers.Web3Provider(web3);

		const wallet = new ethers.Wallet(privateKey);
		const client = await create(provider, { wallet, metaTx });
	} catch (err: any) {
		console.log(err)
	}
}

```
