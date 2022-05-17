---
description: Projects are created under accounts(teams)
---

# Managing Projects

### ProjectID

Unique identifier for a Project. It is the Keccak256 hash of the Parent [AccountID](managing-accounts.md#account-ids) concatenated with the project name.

#### Generate ID Function

The generate ID function generates an ID for an account.&#x20;

```javascript
export function generateID(
  parentID: ethers.BigNumberish,
  name: string
 ): string
```

### Project Meta

The SDK exports the following class for metadata associated with a project.&#x20;

```javascript
export class ProjectMeta {
    	/** project image used for profile pic */
	public image?: string;
	/** main project image used for discovery */
	public main_capsule?: string;
	/** project friendly name */
	public name?: string;
	/** short description of the project. */
	public short_description?: string;
	/** extended description of the project. */
	public description?: string;
	/** link to the project website. */
	public external_url?: string;
	/** type used by clients to handle project */
	public type?: string;
	/** tags used for searching and categorization */
	public tags?: string[];
	/** videos and graphics of the project */
	public gallery?: {
		name: string,
		src: string,
		type: string,
		preview?: string,
	}[];
}
```

### Project Methods

#### createProject Method

Create a project under an account.&#x20;

```javascript
async createProject(
  accountID: ethers.BigNumberish,
  name: string, 
  meta: ProjectMeta,
  members: string[]
 ): Promise<TransactionResponse> 
```

| Parameter | Type                                          | Description                                                                         |
| --------- | --------------------------------------------- | ----------------------------------------------------------------------------------- |
| accountID | BigNumber                                     | Creates a project under the Input [accountID](managing-accounts.md#account-ids)     |
| name      | string                                        | Name of the project, used to create the [ProjectID](managing-projects.md#undefined) |
| meta      | [ProjectMeta](managing-projects.md#undefined) | Metadata associated with a project.                                                 |
| members   | Array\<string>                                | Array of addresses that can participate in a project.                               |

#### projectExists Method <mark style="color:red;">ReadOnly</mark>

Checks if a project Exists.

```javascript
async projectExists(
  projectID: ethers.BigNumberish
): Promise<boolean> 
```

| Parameters | Type      | Description                                         |
| ---------- | --------- | --------------------------------------------------- |
| ProjectID  | BigNumber | [ID of the project](managing-projects.md#projectid) |

#### getProjectMeta Method <mark style="color:red;">Readonly</mark>

This method returns the [metadata](managing-projects.md#project-meta) associated with the project.&#x20;

```javascript
async getProjectMeta(
  projectID: ethers.BigNumberish
): Promise<ProjectMeta> 
```

| Parameter | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| ProjectID | BigNumber | [ID of the project](managing-projects.md#projectid). |

#### setProjectMeta Method

Resets the metadata for an existing account.

```javascript
async setProjectMeta(
  projectID: ethers.BigNumberish,
  meta: ProjectMeta
): Promise<TransactionResponse> 
```

| Parameter | Type                                             | Description                                          |
| --------- | ------------------------------------------------ | ---------------------------------------------------- |
| ProjectID | BigNumber                                        | [ID of the project](managing-projects.md#projectid). |
| meta      | [ProjectMeta](managing-projects.md#project-meta) | Updated metadata for the project.                    |

#### addProjectMember Method

Members of a project are addresses which are can participate in a project. This method adds a member to the project.&#x20;

```javascript
async addProjectMember(
  projectID: ethers.BigNumberish, 
  address: string
): Promise<TransactionResponse>
```

| Parameter | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| projectID | BigNumber | [ID of the project](managing-projects.md#projectid). |
| address   | string    | Address to add.                                      |

#### removeProjectMember

Removes an address form the Project.

```javascript
async removeProjectMember(
  projectID: ethers.BigNumberish,
  address: string
): Promise<TransactionResponse>
```

| Parameter | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| projectID | BigNumber | [ID of the project](managing-projects.md#projectid). |
| address   | string    | Address to remove.                                   |

#### getProjectMembers Method <mark style="color:red;">ReadOnly</mark>

Returns the list of members of the project.&#x20;

```javascript
async getProjectMembers(
  projectID: ethers.BigNumberish
): Promise<string[]>
```

| Parameter | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| projectID | BigNumber | [ID of the project](managing-projects.md#projectid). |

#### isProjectMember Method <mark style="color:red;">ReadOnly</mark>

Checks if a particular address is a member of a Project.&#x20;

```javascript
async isProjectMember(
  projectID: ethers.BigNumberish,
  address: string
): Promise<boolean> 
```

| Parameter | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| projectID | BigNumber | [ID of the project](managing-projects.md#projectid). |
| address   | string    | Address of the member                                |

#### getProjectAccountID Method <mark style="color:red;">ReadOnly</mark>

Returns the accountID that created the project.&#x20;

```javascript
async getProjectAccountID(
  projectID: ethers.BigNumberish
): Promise<ethers.BigNumber>
```

| Parameter | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| projectID | BigNumber | [ID of the project](managing-projects.md#projectid). |

