#!/usr/bin/env bats

setup_fixture
test_prepare ask
load_module ask

# It uses echo pipe just for test.
# You should invoke `l.ask <message>` for normal usage.

@test "'l.ask test_ask' returns 'YES'" {
  t() {
    echo y | l.ask test_ask
    echo Y | l.ask test_ask
    echo ye | l.ask test_ask
    echo Ye | l.ask test_ask
    echo yE | l.ask test_ask
    echo YE | l.ask test_ask
    echo yes | l.ask test_ask
    echo yES | l.ask test_ask
    echo yeS | l.ask test_ask
    echo YeS | l.ask test_ask
    echo Yes | l.ask test_ask
    echo YEs | l.ask test_ask
    echo YES | l.ask test_ask
  }
  run t
  assert_success
  assert_equal "${#lines[@]}" 13
  assert_line -n 0 'YES'
  assert_line -n 1 'YES'
  assert_line -n 2 'YES'
  assert_line -n 3 'YES'
  assert_line -n 4 'YES'
  assert_line -n 5 'YES'
  assert_line -n 6 'YES'
  assert_line -n 7 'YES'
  assert_line -n 8 'YES'
  assert_line -n 9 'YES'
  assert_line -n 10 'YES'
  assert_line -n 11 'YES'
  assert_line -n 12 'YES'
}

@test "'l.ask test_ask' returns 'NO'" {
  t() {
    echo n | l.ask test_ask
    echo N | l.ask test_ask
    echo no | l.ask test_ask
    echo No | l.ask test_ask
    echo nO | l.ask test_ask
    echo NO | l.ask test_ask
  }
  run t
  assert_success
  assert_equal "${#lines[@]}" 6
  assert_line -n 0 'NO'
  assert_line -n 1 'NO'
  assert_line -n 2 'NO'
  assert_line -n 3 'NO'
  assert_line -n 4 'NO'
  assert_line -n 5 'NO'
}

@test "echo '' | l.ask 'test_ask' N" {
  t() {
    echo '' | l.ask 'test_ask' N
  }
  run t
  assert_success
  assert_output 'NO'
}

@test "echo '' | l.ask 'test_ask' Y" {
  t() {
    echo '' | l.ask 'test_ask' Y
  }
  run t
  assert_success
  assert_output 'YES'
}
