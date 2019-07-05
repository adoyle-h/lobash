#!/usr/bin/env bats

setup_fixture
test_prepare sleep
load_module sleep
load_module now

@test "l.sleep 0.1" {
  local last now elapsed

  last=$(l.now)
  l.sleep 0.1
  now=$(l.now)

  elapsed=$(( now - last ))

  local flag=false
  if [[ -n ${CI:-} ]]; then
    # Travis CI has low performance, so +100ms
    if [[ $elapsed -gt 50 ]] && [[ $elapsed -lt 250 ]]; then
      flag=true
    fi
  else
    if [[ $elapsed -gt 50 ]] && [[ $elapsed -lt 150 ]]; then
      flag=true
    fi
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
  if [[ -n ${CI:-} ]]; then
    # Travis CI has low performance, so +100ms
    if [[ $elapsed -gt 950 ]] && [[ $elapsed -lt 1150 ]]; then
      flag=true
    fi
  else
    if [[ $elapsed -gt 950 ]] && [[ $elapsed -lt 1050 ]]; then
      flag=true
    fi
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
  if [[ -n ${CI:-} ]]; then
    # Travis CI has low performance, so +100ms
    if [[ $elapsed -gt 1950 ]] && [[ $elapsed -lt 2150 ]]; then
      flag=true
    fi
  else
    if [[ $elapsed -gt 1950 ]] && [[ $elapsed -lt 2050 ]]; then
      flag=true
    fi
  fi

  if [[ $flag == false ]]; then
    echo "elapsed=$elapsed"
    false
  else
    true
  fi
}
