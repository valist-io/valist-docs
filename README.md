![Valist documentation logo](docs/src/img/valist-docs-header.png)
[![Go Reference](https://pkg.go.dev/badge/github.com/valist-io/valist.svg)](https://pkg.go.dev/github.com/valist-io/valist)
[![Discord](https://img.shields.io/discord/785535462311591976)](https://discord.com/channels/785535462311591976)
[![Valist](https://img.shields.io/badge/valist-published-blue)](https://app.valist.io/valist)

This repository organizes overall documentation across the Valist project.

## Building

To install dependencies and build all documentation (Markdown and TypeDoc), run the following:

```bash
make
```

To build the hand-written Markdown (must run `make install-md` once prior):

```bash
make md-docs
```

To hot-reload the markdown docs:

```bash
make dev
```

To build the SDK (TypeDoc) docs (must run `make install-js` once prior):

```bash
make js-docs
```

## Contributing

We welcome pull requests and would love to support our early contributors with some awesome perks!

Found a bug or have an idea for a feature? [Create an issue](https://github.com/valist-io/valist-docs/issues/new).

## Maintainers

[@awantoch](https://github.com/awantoch)

[@jiyuu-jin](https://github.com/jiyuu-jin)

[@nasdf](https://github.com/nasdf)

## License

Valist is licensed under the [Mozilla Public License Version 2.0](https://www.mozilla.org/en-US/MPL/2.0/).