#!/usr/bin/env bats

setup_fixture
test_prepare cur_dir_path
load_module cur_dir_path

setup() {
  # It will run before each test case in this file
  dir=$(mktemp -d)
}

@test "l.real_path" {
  path=$(get_module_path cur_dir_path)

  echo '#!/usr/bin/env bash' > $dir/file
  cat $path >> $dir/file
  echo "l.real_path" >> $dir/file

  chmod +x $dir/file
  run $dir/file

  assert_success
  if [[ $TEST_OS == MacOS ]]; then
    assert_output "/private$dir"
  else
    assert_output "$dir"
  fi
}

@test "l.real_path symbolic link" {
  path=$(get_module_path cur_dir_path)

  echo '#!/usr/bin/env bash' > $dir/file
  cat $path >> $dir/file
  echo "l.real_path" >> $dir/file

  chmod +x $dir/file

  ln -s $dir/file $dir/link
  run $dir/link

  assert_success
  if [[ $TEST_OS == MacOS ]]; then
    assert_output "/private$dir"
  else
    assert_output "$dir"
  fi
}

@test "l.real_path <path>" {
  touch $dir/file

  run l.real_path $dir

  assert_success
  if [[ $TEST_OS == MacOS ]]; then
    assert_output "/private$dir"
  else
    assert_output "$dir"
  fi

  run l.real_path $dir/file

  assert_success
  if [[ $TEST_OS == MacOS ]]; then
    assert_output "/private$dir/file"
  else
    assert_output "$dir/file"
  fi
}

@test "l.real_path symbolic link which point to symbolic link" {
  path=$(get_module_path cur_dir_path)

  echo '#!/usr/bin/env bash' > $dir/file
  cat $path >> $dir/file
  echo "l.real_path" >> $dir/file

  chmod +x $dir/file
  ln -s $dir/file $dir/link

  ln -s $dir/link $dir/link2
  run $dir/link2

  assert_success
  if [[ $TEST_OS == MacOS ]]; then
    assert_output "/private$dir"
  else
    assert_output "$dir"
  fi
}

@test "l.real_path parent directory is symbolic link" {
  mkdir $dir/a
  ln -s $dir/a $dir/b

  path=$(get_module_path cur_dir_path)
  echo '#!/usr/bin/env bash' > $dir/a/file
  cat $path >> $dir/a/file
  echo "l.real_path" >> $dir/a/file

  chmod +x $dir/a/file
  run $dir/b/file

  assert_success
  if [[ $TEST_OS == MacOS ]]; then
    assert_output "/private$dir/a"
  else
    assert_output "$dir/a"
  fi
}
