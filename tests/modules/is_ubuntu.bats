#!/usr/bin/env bats

setup_fixture
test_prepare is_ubuntu
load_module is_ubuntu

@test "l.is_ubuntu" {
  if [[ -z ${CI:-} ]]; then skip "Only test this case in CI"; fi

  if [[ -d /Library/Apple ]]; then
    run l.is_ubuntu
    assert_failure
    assert_output ''
  else
    run l.is_ubuntu
    assert_success
    assert_output ''
  fi
}
