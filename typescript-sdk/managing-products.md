# Managing Products

Valist helps developers monetize their projects, essentially making them products. The Valist SDK helps facilitate the price, royalties, supply, limit and [NFT](../core-concepts/products-via-software-license-nfts/) for [products](../core-concepts/products-via-software-license-nfts/).&#x20;

A project on Valist can be wrapped into an NFT and monetized. Owning a product's NFT means owning the product's license. At the moment, a project can support a single product. To release different editions, you will need to create different projects and configure their prices separately. However, this is beneficial to separate the content between the products.

Products support the following configurations:

* Payment in MATIC and any ERC-20 token on the Polygon network
* Setting supply limits for the product. This is great for special editions/releases.
* Built-in Royalties to monetize secondary item sales.

Make sure to check out the Software License NFT page for more information! 👇

{% content-ref url="../core-concepts/products-via-software-license-nfts/" %}
[products-via-software-license-nfts](../core-concepts/products-via-software-license-nfts/)
{% endcontent-ref %}

### Product Methods

The client class has the following methods for managing a product.&#x20;

#### setProductLimit Method

Sets a limit on the supply of a product.

```jsx
async setProductLimit(
  projectID: ethers.BigNumberish,
  limit: ethers.BigNumberish
): Promise<TransactionResponse> 
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |
| limit      | BigNumber | Supply limit. Set to zero for unlimited.                         |

#### setProductRoyalty Method&#x20;

Creates a stream of royalties for a recipient.&#x20;

```jsx
async setProductRoyalty(
  projectID: ethers.BigNumberish,
  recipient: string,
  amount: ethers.BigNumberish
): Promise<TransactionResponse>
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |
| recipient  | string    | Address of the recipient.                                        |
| amount     | BigNumber | Amount of royalties for a project.                               |

#### setProductPrice Method

Sets a price for the product's NFT in the chain's native token.&#x20;

```jsx
async setProductPrice(
  projectID: ethers.BigNumberish, 
  price: ethers.BigNumberish
): Promise<TransactionResponse>
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |
| price      | BigNumber | Price of minting the product NFT. (Price of the Product)         |

**setProductTokenPrice** **Method**

Sets a price for the product's NFT in a selected ERC20 token.

```jsx
async setProductTokenPrice(
   token: string,
   projectID: ethers.BigNumberish,
   price: ethers.BigNumberish
): Promise<TransactionResponse>
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| token      | string    | Address of the ERC20 token to be priced with.                    |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |
| price      | BigNumber | Price of minting the product NFT. (Price of the Product)         |

#### purchaseProduct Method

Purchases a product NFT using the chain's native token.&#x20;

```jsx
async purchaseProduct(
  projectID: ethers.BigNumberish, 
  recipient: string
): Promise<TransactionResponse> 
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |
| address    | string    | The recipient of the product NFT.                                |

#### purchaseProductToken Method&#x20;

Purchases a product NFT using the ERC20 token that the product was priced with.&#x20;

```jsx
async purchaseProductToken(
  token: string,
  projectID: ethers.BigNumberish,
  recipient: string
): Promise<TransactionResponse> 
```

| Parameters | Type      | Description                                                     |
| ---------- | --------- | --------------------------------------------------------------- |
| token      | string    | Address of the ERC20 token to be purchased with.                |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product. |
| recipient  | string    | he recipient of the product NFT.                                |

**getProductPrice** **Method **<mark style="color:red;">**Readonly**</mark>

gets a product's price in the chain's native token.&#x20;

```jsx
async getProductPrice(
  projectID: ethers.BigNumberish
): Promise<ethers.BigNumber>
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |

**getProductBalance Method **<mark style="color:red;">**Readonly**</mark>&#x20;

Checks if a user owns the NFT for a product.&#x20;

```jsx
async getProductBalance(
     address: string,
     projectID: ethers.BigNumberish
  ): Promise<ethers.BigNumber>
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| address    | string    | Address of the user.                                             |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |

**getProductTokenPrice Method **<mark style="color:red;">**Readonly**</mark>&#x20;

gets a product's price in the ERC20 token.&#x20;

```jsx
async getProductTokenPrice(
  token: string,
  projectID: ethers.BigNumberish
): Promise<ethers.BigNumber> 
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| token      | string    | Address of the ERC20 token.                                      |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |

**getProductLimit** **Method **<mark style="color:red;">**Readonly**</mark>

Returns the Product's supply limit.&#x20;

```jsx
async getProductLimit(
  projectID: ethers.BigNumberish
): Promise<ethers.BigNumber>
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |

**getProductRoyaltyInfo Method **<mark style="color:red;">**Readonly**</mark>

Returns the royalty recipient address and amount owed to the recipient.&#x20;

```jsx
async getProductRoyaltyInfo(
projectID: ethers.BigNumberish,
 price: ethers.BigNumberish
 ): Promise<[string, BigNumber]> 
```

| Parameters | Type      | Description                                                      |
| ---------- | --------- | ---------------------------------------------------------------- |
| projectID  | BigNumber | The [projectID](managing-projects.md#projectid) of the product.  |
| price      | BigNumber | The Price of the Product NFT                                     |

****
