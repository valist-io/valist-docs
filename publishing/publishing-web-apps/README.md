---
description: >-
  Valist makes it effortless to publish your static web app. The platform is
  compatible with any web framework that generates static sites, including
  popular choices such as Next.js, Create React App, G
---

# 🌐 Publishing Web Apps

Publishing a static web app with Valist is easy!

No matter what web framework you're using, whether it's Next.js, Create React App, Gatsby or any other, Valist has got you covered. It supports all frameworks that can generate static sites, making the process simple and easy for you.

****

### **Deploy Next JS Application**

{% content-ref url="publishing-a-next-js-app.md" %}
[publishing-a-next-js-app.md](publishing-a-next-js-app.md)
{% endcontent-ref %}

### Deploy React JS Application

{% content-ref url="publishing-a-react-js-app.md" %}
[publishing-a-react-js-app.md](publishing-a-react-js-app.md)
{% endcontent-ref %}

Please note that IPFS gateways that don't use subdomains are not secure for accessing web applications due to sharing the same origin.

IPFS Gateways support either or both of the following formats:

1. Subdomain gateway mode: e.g. `https://<CID>.ipfs.dweb.link/`
2. Path gateway mode: e.g. `https://ipfs.io/ipfs/<CID>/`

You only want to access web apps from IPFS via the first type of gateway. This is because the browser will treat the subdomain as a different "origin" and therefore treat local storage and other security policies in a way that prevents other websites from interfering with your app.

More information can be found here:

{% embed url="https://consensys.net/diligence/blog/2021/06/ipfs-gateway-security/" %}

### Example Projects

We also have examples of common JavaScript frameworks like Next.js and Create React App, check them out below!

{% embed url="https://github.com/valist-io/example-projects/tree/main/nextjs-project" %}
Next.js App
{% endembed %}

{% embed url="https://github.com/valist-io/example-projects/tree/main/react-project" %}
Create React App
{% endembed %}
