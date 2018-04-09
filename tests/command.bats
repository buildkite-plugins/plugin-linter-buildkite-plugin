#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following to get more detail on failures of stubs
# export DOCKER_STUB_DEBUG=/dev/tty

@test "Runs the linter via Docker" {
  export BUILDKITE_PLUGIN_PLUGIN_LINTER_NAME=my-plugin

  stub docker \
    "pull buildkite/plugin-linter : echo pulled image" \
    "run -it --rm --volume /plugin:/plugin:ro --env PLUGIN_NAME=my-plugin buildkite/plugin-linter : echo linted"

  run $PWD/hooks/command

  assert_success
  assert_output --partial "pulled image"
  assert_output --partial "linted"
  unstub docker
}

@test "Supports the readme option" {
  export BUILDKITE_PLUGIN_PLUGIN_LINTER_NAME=my-plugin
  export BUILDKITE_PLUGIN_PLUGIN_LINTER_README=some-readme.yml

  stub docker \
    "pull buildkite/plugin-linter : echo pulled image" \
    "run -it --rm --volume /plugin:/plugin:ro --env PLUGIN_NAME=my-plugin --env PLUGIN_README=some-readme.yml buildkite/plugin-linter : echo linted"

  run $PWD/hooks/command

  assert_success
  assert_output --partial "pulled image"
  assert_output --partial "linted"
  unstub docker
}
