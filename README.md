# Plugin Linter Buildkite Plugin ![Build status](https://badge.buildkite.com/6a0a80700a07fdead547632d8fdf57447bf1db7b25fa96aebf.svg?branch=master)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) to lint your Buildkite plugins 😱

## Usage

```yaml
steps:
  - label: ":sparkles: Lint"
    plugins:
      plugin-linter#v1.0.0:
        name: my-plugin
```

If you want to run it locally on a command line, see the [Plugin Linter tool documentation](https://github.com/buildkite-plugins/buildkite-plugin-linter).

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