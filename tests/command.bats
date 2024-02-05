#!/usr/bin/env bats

# Uncomment the following to get more detail on failures of stubs
# export DOCKER_STUB_DEBUG=/dev/tty

setup() {
  load "${BATS_PLUGIN_PATH}/load.bash"

  export BUILDKITE_PLUGIN_PLUGIN_LINTER_ID=my-plugin
  # defining specific version to make all the tests not dependent on default
  export BUILDKITE_PLUGIN_PLUGIN_LINTER_IMAGE_VERSION='latest'
}

@test "Missing id parameter is a failure" {
  unset BUILDKITE_PLUGIN_PLUGIN_LINTER_ID

  run "$PWD"/hooks/command

  assert_failure
  assert_output --partial 'Missing id parameter in plugin configuration'
}

@test "Runs the linter via Docker" {
  stub docker \
    "pull buildkite/plugin-linter:latest : echo pulled image" \
    "run -it --rm --volume /plugin:/plugin:ro --env PLUGIN_ID=my-plugin buildkite/plugin-linter:latest : echo linted"

  run "$PWD"/hooks/command

  assert_success
  assert_output --partial "pulled image"
  assert_output --partial "linted"
  unstub docker
}

@test "Supports the readme option" {
  export BUILDKITE_PLUGIN_PLUGIN_LINTER_README=some-readme.yml

  stub docker \
    "pull buildkite/plugin-linter:latest : echo pulled image" \
    "run -it --rm --volume /plugin:/plugin:ro --env PLUGIN_ID=my-plugin --env PLUGIN_README=some-readme.yml buildkite/plugin-linter:latest : echo linted"

  run "$PWD"/hooks/command

  assert_success
  assert_output --partial "pulled image"
  assert_output --partial "linted"
  unstub docker
}

@test "Support not specifying a tag" {
  unset BUILDKITE_PLUGIN_PLUGIN_LINTER_IMAGE_VERSION

  stub docker \
    "pull buildkite/plugin-linter:v2.1.0 : echo pulled image" \
    "run -it --rm --volume /plugin:/plugin:ro --env PLUGIN_ID=my-plugin buildkite/plugin-linter:v2.1.0 : echo linted"

  run "$PWD"/hooks/command

  assert_success
  assert_output --partial "pulled image"
  assert_output --partial "linted"
  unstub docker
}
