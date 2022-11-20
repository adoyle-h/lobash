#!/usr/bin/env bats

setup_fixture
test_prepare sleep
load_module sleep
load_module now

@test "l.sleep 0.1" {
  if [[ -n ${CI:-} ]]; then skip; fi

  local last now elapsed

  last=$(l.now)
  l.sleep 0.1
  now=$(l.now)

  elapsed=$(( now - last ))

  local flag=false
  if [[ $elapsed -gt 50 ]] && [[ $elapsed -lt 150 ]]; then
    flag=true
  fi

  if [[ $flag == false ]]; then
    echo "elapsed=$elapsed"
    false
  else
    true
  fi
}

@test "l.sleep 1" {
  local last now elapsed

  last=$(l.now)
  l.sleep 1
  now=$(l.now)

  elapsed=$(( now - last ))

  local flag=false
  # Some machine has low performance, so +-250ms
  if [[ $elapsed -gt 750 ]] && [[ $elapsed -lt 1250 ]]; then
    flag=true
  fi

  if [[ $flag == false ]]; then
    echo "elapsed=$elapsed"
    false
  else
    true
  fi
}

@test "l.sleep 2" {
  local last now elapsed

  last=$(l.now)
  l.sleep 2
  now=$(l.now)

  elapsed=$(( now - last ))

  local flag=false
  # Some machine has low performance, so +-250ms
  if [[ $elapsed -gt 1750 ]] && [[ $elapsed -lt 2250 ]]; then
    flag=true
  fi

  if [[ $flag == false ]]; then
    echo "elapsed=$elapsed"
    false
  else
    true
  fi
}
