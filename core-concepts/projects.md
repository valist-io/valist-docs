# ⚙ Projects

{% embed url="https://www.loom.com/share/e1c5da09a5b4433babd8775378df3571" %}

Projects can be created under an Account, and are referenced by `username/project`.

Projects also have a separate set of `Members` that can publish to the project. This enables higher security, since if a project member's key is compromised, they can only effect the Project and not the Account.

{% hint style="info" %}
We recommend using different keys for Projects and Account Admin keys for higher security.
{% endhint %}

A Project contains:

* An address array of `members` that represent the Project Publishers.
* A reference to metadata stored on a decentralized network&#x20;
* A list of versions by `tag` -- this can be [SemVer](https://semver.org/) or [CalVer](https://calver.org/), or any arbitrary versioning system (i.e., "v1" or "Pro Edition").

{% hint style="info" %}
You can view the smart contract implementation [here](https://github.com/valist-io/valist-js/blob/main/packages/evm-contracts/contracts/Valist.sol#L103).
{% endhint %}
