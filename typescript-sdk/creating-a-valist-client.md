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

To create a Valist client, you need a Wallet and an RPC provider:

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

To create a read-only client, you can use the `createReadOnly` function:

```javascript
// Example
const ethers = require('ethers');
const createReadOnly = require('@valist/sdk').createReadOnly;
const Web3HttpProvider = require('web3-providers-http'); 

async function main() {
	try {
            const web3 = new Web3HttpProvider("https://rpc.valist.io/polygon");
            const provider = new ethers.providers.Web3Provider(web3);
            const valist = createReadOnly(provider, { metaTx: false });
                
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
