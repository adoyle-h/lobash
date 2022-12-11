#!/usr/bin/env bats

setup_fixture

@test "l.is_ubuntu" {
  if [[ -z ${OS:-} ]]; then skip "Only test when OS is set"; fi

  run l.is_ubuntu

  case "$OS" in
    ubuntu*)
      assert_success
      assert_output ''
      ;;

    *)
      assert_failure
      assert_output ''
      ;;
  esac
}
