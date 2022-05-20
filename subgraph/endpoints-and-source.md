# Endpoints and source

The Valist Subgraph indexes multiple Valist contracts and consolidates it into a simple GraphQL interface.

### Polygon Mainnet

You can find the deployed Polygon Mainnet subgraph here:

{% embed url="https://thegraph.com/hosted-service/subgraph/valist-io/valist" %}
Polygon Mainnet Hosted Subgraph
{% endembed %}

HTTP Endpoint: [https://api.thegraph.com/subgraphs/name/valist-io/valist](https://api.thegraph.com/subgraphs/name/valist-io/valist)

### Polygon Mumbai

You can find the deployed Polygon Mumbai subgraph here:

{% embed url="https://thegraph.com/hosted-service/subgraph/valist-io/valistmumbai" %}

HTTP Endpoint: [https://api.thegraph.com/subgraphs/name/valist-io/valistmumbai](https://api.thegraph.com/subgraphs/name/valist-io/valistmumbai)

### Self-hosted

The source code for the Valist Subgraph can be found here, which contains everything you need to get started:

{% embed url="https://github.com/valist-io/valist-subgraph" %}

For this, you will need to deploy your own graph node. Here's a docker-compose file that can help get you started -- however please note **this is not secure out of the box, you will need to configure your database and networking/firewall properly.**

{% embed url="https://gist.github.com/awantoch/decee0e9117a0dd0bc4c54535cc04e1e" %}
