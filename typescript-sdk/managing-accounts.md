# Managing Accounts

An Account is a user or an organization on Valist that can publish their own projects. An account can be used for an individual, team or an organization. Accounts are used interchangeably for Teams or Personal accounts on Valist.

### Account IDs

An accountID is the unique identifier Valist's smart contracts use to identify accounts. It is the keccak256 hash of the Chain ID concatenated by the Account Name.&#x20;

#### Generate ID Function

The generate ID function generates an ID for an account.&#x20;

```javascript
export function generateID(
  parentID: ethers.BigNumberish,
  name: string
 ): string 
```

| Parameters | Type      | Description                                                                                                                                                                                                                                                   |
| ---------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ParentID   | BigNumber | <p>The parentID. </p><p></p><p>If you're generating an account ID, this is the chain ID which the account belongs to.<br><br>If you're generating a project ID, this is the account ID.<br><br>If you're generating a release ID, this is the project ID.</p> |
| Name       | String    | The name of the account, project, or release. Also used as a parameter in the [createAccount](managing-accounts.md#create-account-method) method.                                                                                                             |

### Account Metadata

The SDK exposes the account metadata class to provide an interface for the data keys associated with an account.

```jsx
// Class for account metadata

export class AccountMeta {
	/** account image */
	public image?: string;
	/** account friendly name. */
	public name?: string;
	/** short description of the account. */
	public description?: string;
	/** link to the account website. */
	public external_url?: string;
}
```

The Valist client class has the following public methods interacting with accounts.

### Account Methods

#### Create Account Method

This method creates an account on Valist. It takes in the name, account metadata and the list of members as parameters.

```jsx
async createAccount(
  name: string, 
  meta: AccountMeta,
  members: string[]
): Promise<TransactionResponse>
```

| Parameters | Type           | Description                                                       |
| ---------- | -------------- | ----------------------------------------------------------------- |
| name       | string         | Desired name of the account. Also used to generate the accountID. |
| meta       | AccountMeta    | Metadata associated with the account. (Can be updated)            |
| members    | array\<string> | List of addresses that are will control this account.             |

#### AccountExists method **** <mark style="color:red;">Readonly</mark>&#x20;

This method checks if an account exists on the Valist Registry on IPFS

```javascript
async accountExists(
  accountID: ethers.BigNumberish
): Promise<boolean>
```

| Parameter | Type      | Description |
| --------- | --------- | ----------- |
| accountID | BigNumber | accountId   |

#### GetAccountMeta Method <mark style="color:red;">Readonly</mark>

This method returns the [metadata](managing-accounts.md#types) associated with the account.&#x20;

```javascript
async getAccountMeta(
  accountID: ethers.BigNumberish
): Promise<AccountMeta>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| accountID | BigNumber | The [accountID](managing-accounts.md#account-ids) for the account |

#### setAccountMeta Method

Resets the metadata for an existing account.

```javascript
async setAccountMeta(
  accountID: ethers.BigNumberish, 
  meta: AccountMeta
): Promise<TransactionResponse> 
```

| Parameter | Type                                      | Description                                                       |
| --------- | ----------------------------------------- | ----------------------------------------------------------------- |
| accountID | BigNumber                                 | The [accountID](managing-accounts.md#account-ids) for the account |
| meta      | [AccountMeta](managing-accounts.md#types) | Updated metadata class for the account.                           |

#### addAccountMember Method

An account can be used interchangeably as teams. Teams can add or remove members for an account. Add account member adds an address to the account.&#x20;

```javascript
async addAccountMember(
  accountID: ethers.BigNumberish, 
  address: string
): Promise<TransactionResponse>
```

| Parameter | Type      | Description                                                                   |
| --------- | --------- | ----------------------------------------------------------------------------- |
| accountID | BigNumber | The [accountID](managing-accounts.md#account-ids) for the account to add to.  |
| address   | string    | Address to add.                                                               |

#### removeAccountMember

Removes an address form the account.&#x20;

```javascript
async removeAccountMember(
  accountID: ethers.BigNumberish,
  address: string
): Promise<TransactionResponse>
```

| Parameter | Type      | Description                                                                        |
| --------- | --------- | ---------------------------------------------------------------------------------- |
| accountID | BigNumber | The [accountID](managing-accounts.md#account-ids) for the account to remove from.  |
| address   | string    | Address to remove.                                                                 |



#### getAccountMembers Method <mark style="color:red;">ReadOnly</mark>

Returns the list of members of the account.&#x20;

```javascript
async getAccountMembers(
  accountID: ethers.BigNumberish
): Promise<string[]>
```

| Parameter | Type      | Description                                                        |
| --------- | --------- | ------------------------------------------------------------------ |
| accountID | BigNumber | The [accountID](managing-accounts.md#account-ids) for the account. |

#### isAccountMember Method <mark style="color:red;">ReadOnly</mark>

Checks if a particular address is a member of an account.&#x20;

```javascript
async isAccountMember(
  accountID: ethers.BigNumberish,
  address: string
): Promise<boolean> 
```

| Parameter | Type      | Description                                                        |
| --------- | --------- | ------------------------------------------------------------------ |
| accountID | BigNumber | The [accountID](managing-accounts.md#account-ids) for the account. |
| address   | string    | Address of the member                                              |

