#!/usr/bin/env bats

setup_fixture
test_prepare ask
load_module ask

# It uses echo pipe just for test.
# You should invoke `l.ask <message>` for normal usage.

@test "'l.ask hello' returns 'YES'" {
  t() {
    echo y | l.ask hello
    echo Y | l.ask hello
    echo ye | l.ask hello
    echo Ye | l.ask hello
    echo yE | l.ask hello
    echo YE | l.ask hello
    echo yes | l.ask hello
    echo yES | l.ask hello
    echo yeS | l.ask hello
    echo YeS | l.ask hello
    echo Yes | l.ask hello
    echo YEs | l.ask hello
    echo YES | l.ask hello
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

@test "'l.ask hello' returns 'NO'" {
  t() {
    echo n | l.ask hello
    echo N | l.ask hello
    echo no | l.ask hello
    echo No | l.ask hello
    echo nO | l.ask hello
    echo NO | l.ask hello
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

@test "'l.ask hello' returns 'Invalid Answer'" {
  t() {
    echo yesn | l.ask hello
    echo yn | l.ask hello
    echo w | l.ask hello
    echo x | l.ask hello
    echo 0 | l.ask hello
    echo _ | l.ask hello
  }
  run t
  assert_success
  assert_equal "${#lines[@]}" 6
  assert_line -n 0 'Invalid Answer'
  assert_line -n 1 'Invalid Answer'
  assert_line -n 2 'Invalid Answer'
  assert_line -n 3 'Invalid Answer'
  assert_line -n 4 'Invalid Answer'
  assert_line -n 5 'Invalid Answer'
}

@test "echo '' | l.ask 'hello world' N" {
  t() {
    echo '' | l.ask 'hello world' N
  }
  run t
  assert_success
  assert_output 'NO'
}

@test "echo '' | l.ask 'hello world' Y" {
  t() {
    echo '' | l.ask 'hello world' Y
  }
  run t
  assert_success
  assert_output 'YES'
}
