#!/usr/bin/env bats

setup_fixture
load_module sleep
load_module now

@test "l.sleep 0.1" {
  local last elapsed

  last=$(l.now)
  run l.sleep 0.1
  assert_success
  elapsed=$(( $(l.now) - $last ))

  if [[ $elapsed -gt 40 ]] && [[ $elapsed -lt 160 ]]; then
    true
  else
    echo "elapsed=$elapsed"
    false
  fi
}

@test "l.sleep 1" {
  local last elapsed

  last=$(l.now)
  run l.sleep 1
  assert_success
  elapsed=$(( $(l.now) - $last ))

  if [[ $elapsed -gt 940 ]] && [[ $elapsed -lt 1060 ]]; then
    true
  else
    echo "elapsed=$elapsed"
    false
  fi
}

@test "l.sleep 2" {
  local last elapsed

  last=$(l.now)
  run l.sleep 2
  assert_success
  elapsed=$(( $(l.now) - $last ))

  if [[ $elapsed -gt 1940 ]] && [[ $elapsed -lt 2060 ]]; then
    true
  else
    echo "elapsed=$elapsed"
    false
  fi
}
