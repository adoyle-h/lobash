#!/usr/bin/env bats

setup_fixture

@test "l.extract" {
  t() {
    l.extract '```sh' '```' <<'EOF'
```sh
echo 1
echo 2
```
lol
7o7

```sh
echo 3
echo 4
```


ahahaha
```sh
echo 5
```
7o7
7o7
```
echo 6
echo 7
```
7o7
7o7
```sh
echo 8
echo 9
echo 10
```
EOF
  }
  run t

  assert_success
  assert_output_text <<EOF
echo 1
echo 2
echo 3
echo 4
echo 5
echo 8
echo 9
echo 10
EOF
}
