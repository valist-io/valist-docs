---
description: Publishing a Unity Project with Valist is super easy!
---

# 🎮 Publishing Unity Projects

Publishing a Unity Project with Valist is super easy -- you have multiple options, depending on whether you are building for WebGL, or a native Windows, Mac, or Linux executable.

### Step 1: Setting your Project Type to "web" or "native"

The first thing you'll need to do is configure your Valist Project Type.

* `web` is for projects built and distributed via WebGL
* `native` is for projects built to native executables for platforms like Windows, Mac, or Linux.

You can set this in your Project Settings by visiting your project, and clicking the `Settings` icon:

<figure><img src="../.gitbook/assets/image (50).png" alt=""><figcaption></figcaption></figure>

This will take you to your Project Details, where you can configure the Project Type:

<figure><img src="../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>

Setting this to `web` will tell Valist to open this in browsers or WebViews, and will show a regular folder uploader on the Web Dashboard Publishing page.

Setting this to `native` or `cli` will tell Valist to change the upload form to include multiple platforms (Mac, Windows, Linux), so that you can specify which binary corresponds to each platform during publish.

For more information, check out "How Native App Publishing" in Valist works:

{% content-ref url="publishing-binaries-and-executables.md" %}
[publishing-binaries-and-executables.md](publishing-binaries-and-executables.md)
{% endcontent-ref %}

### Step 2: Building your project

Building your Unity project works the same as you would normally!

However, something to consider if you are using WebGL is that most IPFS gateways do not support Gzip compression -- the default Unity settings.

The Valist IPFS Gateways \*do\* support Gzip, since it returns the proper headers, but keep this in mind if you plan on accessing this from other IPFS gateways. As a fallback, you can disable compression, but this is only recommended as a last resort.

### Step 3: Publishing your project

From here, all you need to do is publish your project! The flows from here are largely the same as any other Valist project.

If you're using the Valist Web Dashboard, it's a simple drag and drop. The Valist CLI is also super easy to configure and publish with!

Depending on your Project Type, you will have slightly different publishing flows.

#### WebGL Projects:

For `web` projects, follow from Step 2 of the following page:

{% content-ref url="publishing-web-apps.md" %}
[publishing-web-apps.md](publishing-web-apps.md)
{% endcontent-ref %}

#### Native Projects:

For `native` projects, follow from Step 2 of the following page:

{% content-ref url="publishing-binaries-and-executables.md" %}
[publishing-binaries-and-executables.md](publishing-binaries-and-executables.md)
{% endcontent-ref %}

That's all you need to publish a Unity project with Valist and distribute it to the world! 🚀
