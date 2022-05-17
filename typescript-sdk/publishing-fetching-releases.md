# Publishing/fetching Releases

The Valist SDK can be used to manage[ releases](../core-concepts/releases.md).&#x20;

### ReleaseIDs

Release ID is the keccak256 hash of the ProjectID concatenated by the Release Name.&#x20;

#### Generate ID Function

The generate ID function generates an ID for a Release.&#x20;

```javascript
export function generateID(
  parentID: ethers.BigNumberish,
  name: string
): string 
```

### Release Meta&#x20;

The SDK exports the following class for metadata associated with a release.&#x20;

```javascript
export class ReleaseMeta {
	/** project image */
	public image?: string;
	/** full release name. */
	public name?: string;
	/** short description of the release. */
	public description?: string;
	/** link to the release assets. */
	public external_url?: string;
}
```

### Release Methods

#### createRelease Method

This method creates a release for a project.&#x20;

```jsx
async createRelease(
  projectID: ethers.BigNumberish,
  name: string,
  meta: ReleaseMeta
): Promise<TransactionResponse> 
```

| Parameters | Type                                                        | Description                                                                                     |
| ---------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| projectID  | BigNumber                                                   | The [projectID](managing-projects.md#projectid) for which to create the release.                |
| name       | string                                                      | Name of the release, used to create the [ReleaseID](publishing-fetching-releases.md#releaseids) |
| meta       | [ReleaseMeta](publishing-fetching-releases.md#release-meta) | Metadata of the release.                                                                        |

#### releaseExists method **** <mark style="color:red;">Readonly</mark>&#x20;

Checks if a release exists.&#x20;

```javascript
async releaseExists(
  releaseID: ethers.BigNumberish
): Promise<boolean>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### getReleaseMeta Method <mark style="color:red;">Readonly</mark>

Returns the [metadata](publishing-fetching-releases.md#types) for the release.&#x20;

```javascript
async getReleaseMeta(
  releaseID: ethers.BigNumberish
): Promise<ReleaseMeta>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### approveRelease Method

Approves/signs the release and adds to the signer's list.&#x20;

```javascript
async approveRelease(
  releaseID: ethers.BigNumberish
): Promise<TransactionResponse>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### revokeRelease Method

Revokes the release and removes the caller from the signers list.&#x20;

```javascript
async revokeRelease(
  releaseID: ethers.BigNumberish
): Promise<TransactionResponse>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### getReleaseSigners Method <mark style="color:red;">Readonly</mark>

Returns the list of signers for a release.

```javascript
async getReleaseSigners(
  releaseID: ethers.BigNumberish
): Promise<string[]> 
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### getPreviousReleaseID Method <mark style="color:red;">Readonly</mark>

Returns the releaseID of the preceding release.&#x20;

```javascript
async getPreviousReleaseID(
  releaseID: ethers.BigNumberish
): Promise<ethers.BigNumber>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### getReleaseProjectID Method <mark style="color:red;">Readonly</mark>

Returns the ProjectID of the Release.&#x20;

```javascript
async getReleaseProjectID(
  releaseID: ethers.BigNumberish
): Promise<ethers.BigNumber>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |

#### isReleaseSigner Method <mark style="color:red;">Readonly</mark>

Checks if an address is the signer of a release.&#x20;

```javascript
async isReleaseSigner(
 releaseID: ethers.BigNumberish,
 address: string
): Promise<boolean>
```

| Parameter | Type      | Description                                                       |
| --------- | --------- | ----------------------------------------------------------------- |
| releaseID | BigNumber | [Id of the release](publishing-fetching-releases.md#releaseids).  |
| address   | string    | Address of Signer                                                 |

