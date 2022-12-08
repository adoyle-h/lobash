#!/usr/bin/env bats

setup_fixture

# It uses echo pipe just for test.
# You should invoke `l.ask_with_cancel <message>` for normal usage.

@test "'l.ask_with_cancel test_ask' returns 'YES'" {
  t() {
    echo y | l.ask_with_cancel test_ask
    echo Y | l.ask_with_cancel test_ask
    echo ye | l.ask_with_cancel test_ask
    echo Ye | l.ask_with_cancel test_ask
    echo yE | l.ask_with_cancel test_ask
    echo YE | l.ask_with_cancel test_ask
    echo yes | l.ask_with_cancel test_ask
    echo yES | l.ask_with_cancel test_ask
    echo yeS | l.ask_with_cancel test_ask
    echo YeS | l.ask_with_cancel test_ask
    echo Yes | l.ask_with_cancel test_ask
    echo YEs | l.ask_with_cancel test_ask
    echo YES | l.ask_with_cancel test_ask
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

@test "'l.ask_with_cancel test_ask' returns 'NO'" {
  t() {
    echo n | l.ask_with_cancel test_ask
    echo N | l.ask_with_cancel test_ask
    echo no | l.ask_with_cancel test_ask
    echo No | l.ask_with_cancel test_ask
    echo nO | l.ask_with_cancel test_ask
    echo NO | l.ask_with_cancel test_ask
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

@test "'l.ask_with_cancel test_ask' returns 'CANCEL'" {
  t() {
    echo c | l.ask_with_cancel test_ask
    echo C | l.ask_with_cancel test_ask
    echo can | l.ask_with_cancel test_ask
    echo CAN | l.ask_with_cancel test_ask
    echo cancel | l.ask_with_cancel test_ask
    echo CANCEL | l.ask_with_cancel test_ask
  }
  run t
  assert_success
  assert_equal "${#lines[@]}" 6
  assert_line -n 0 'CANCEL'
  assert_line -n 1 'CANCEL'
  assert_line -n 2 'CANCEL'
  assert_line -n 3 'CANCEL'
  assert_line -n 4 'CANCEL'
  assert_line -n 5 'CANCEL'
}

@test "echo '' | l.ask_with_cancel 'test_ask' N" {
  t() {
    echo '' | l.ask_with_cancel 'test_ask' N
  }
  run t
  assert_success
  assert_output 'NO'
}

@test "echo '' | l.ask_with_cancel 'test_ask' Y" {
  t() {
    echo '' | l.ask_with_cancel 'test_ask' Y
  }
  run t
  assert_success
  assert_output 'YES'
}

@test "echo 'C' | l.ask_with_cancel 'test_ask' <default>" {
  t() {
    echo 'C' | l.ask_with_cancel 'test_ask' Y
    echo 'C' | l.ask_with_cancel 'test_ask' N
    echo 'c' | l.ask_with_cancel 'test_ask' Y
    echo 'c' | l.ask_with_cancel 'test_ask' N
    echo 'cancel' | l.ask_with_cancel 'test_ask'
    echo 'cancel' | l.ask_with_cancel 'test_ask' Y
    echo 'cancel' | l.ask_with_cancel 'test_ask' N
    echo 'CANCEL' | l.ask_with_cancel 'test_ask' Y
    echo 'CANCEL' | l.ask_with_cancel 'test_ask' N
  }
  run t

  assert_success
  assert_equal "${#lines[@]}" 9
  assert_line -n 0 'CANCEL'
  assert_line -n 1 'CANCEL'
  assert_line -n 2 'CANCEL'
  assert_line -n 3 'CANCEL'
  assert_line -n 4 'CANCEL'
  assert_line -n 5 'CANCEL'
  assert_line -n 6 'CANCEL'
  assert_line -n 7 'CANCEL'
  assert_line -n 8 'CANCEL'
}
