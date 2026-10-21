# Plugin Linter Buildkite Plugin [![Build status](https://badge.buildkite.com/044827c84a7a6aa9d9b80ff3f1f7285189607fe0c39e17e8d6.svg?branch=master)](https://buildkite.com/buildkite/plugins-plugin-linter)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) to lint your Buildkite plugins 😱

For a full list of features see the [Buildkite Plugin Linter cli tool documentation](https://github.com/buildkite-plugins/buildkite-plugin-linter).

## Usage

```yaml
steps:
  - label: ":sparkles: Lint"
    plugins:
      - plugin-linter#v4.0.0:
          id: my-org/my-plugin
          image-version: v3.2.0
```

This explicitly selects the `buildkite/plugin-linter:v3.2.0` image, including when using an older plugin release.

If you want to run it locally on a command line, see the [Buildkite Plugin Linter cli tool documentation](https://github.com/buildkite-plugins/buildkite-plugin-linter).

## Configuration

### Required

#### `id`

The id of the plugin (e.g. `my-org/my-plugin`)

### Optional

#### `image-version`

The Docker tag of the `buildkite/plugin-linter` image to use. Default is `v3.2.0`.

#### `readme`

The filename of the plugin’s readme to lint examples on. Default is `README.md`

#### `skip-invalid` (boolean)

Whether invalid examples (for example with invalid options) should not cause the linting to fail. Defaults to false.

## Upgrading to v4

Version 4 updates the default linter image from `v2.1.0` to `v3.1.0`. The new image includes current dependency and security updates, improved YAML validation, and native `linux/amd64` and `linux/arm64` support.

To keep using the previous linter behavior while upgrading the wrapper, set the image version explicitly:

```yaml
steps:
  - label: ":sparkles: Lint"
    plugins:
      - plugin-linter#v4.0.0:
          id: my-org/my-plugin
          image-version: v2.1.0
```

## Developing

To run testing, shellchecks and plugin linting use use `bk run` with the [Buildkite CLI](https://github.com/buildkite/cli).

```bash
bk run
```

Or if you want to run just the tests, you can use the docker [Plugin Tester](https://github.com/buildkite-plugins/buildkite-plugin-tester):

```bash
docker run --rm -ti -v "${PWD}":/plugin buildkite/plugin-tester:latest
```

## License

MIT (see [LICENSE](LICENSE))
