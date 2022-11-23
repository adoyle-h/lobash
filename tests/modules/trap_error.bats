#!/usr/bin/env bats

setup_fixture
test_prepare trap_error
load_module trap_error

# @TODO how to test it?
# @test "l.trap_error" {
#   t() {
#     l.trap_error
#     cat non-existent_file
#   }

#   run t
#   assert_failure
#   assert_output ''
# }
