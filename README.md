# Plugin Linter Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) to lint your Buildkite plugins, using the [Buildkite Plugin Linter](https://github.com/buildkite-plugins/buildkite-plugin-linter) 😱

## Usage

```yaml
steps:
  - label: lint
    plugins:
      plugin-linter#v1.0.0:
        name: my-plugin
```

If you want to run it locally on a command line, see the [linter documentation](https://github.com/buildkite-plugins/buildkite-plugin-linter).

## Configuration

### `name`

The name of the plugin

### `readme` (optional)

The filename of the plugin’s readme. Default is `README.md`

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```

## License

MIT (see [LICENSE](LICENSE))