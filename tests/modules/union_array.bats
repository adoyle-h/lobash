#!/usr/bin/env bats

setup_fixture
test_prepare union_array
load_module union_array

@test "l.union_array (a b) (c d)" {
  local arr1=(a b)
  local arr2=(c d)
  t() {
    # read -d $'\n' -ra arr < <(l.union_array arr1 arr2)
    local arr="$(l.union_array arr1 arr2)"
    for i in "${arr[@]}"; do
      printf '%s\n' "$i"
    done
  }
  run t
	assert_success
  assert_equal "${#lines[@]}" 4
	assert_line -n 0 'a'
	assert_line -n 1 'b'
	assert_line -n 2 'c'
	assert_line -n 3 'd'
}

@test "l.union_array (a 'b c') (d e)" {
  local arr1=(a 'b c')
  local arr2=(d e)

  t() {
    # read -d $'\n' -ra arr < <(l.union_array arr1 arr2)
    local arr="$(l.union_array arr1 arr2)"
    for i in "${arr[@]}"; do
      printf '%s\n' "$i"
    done
  }
  run t
	assert_success
  assert_equal "${#lines[@]}" 4
	assert_line -n 0 'a'
	assert_line -n 1 'b c'
	assert_line -n 2 'd'
	assert_line -n 3 'e'
}
