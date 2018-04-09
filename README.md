# Plugin Linter

A Buildkite plugin to run the [Buildkite plugin linter](https://github.com/buildkite-plugins/buildkite-plugin-linter) 😱

## Usage

```
steps:
  - label: lint
    plugins:
      plugin-linter#1.0.0:
        name: my-plugin
```

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