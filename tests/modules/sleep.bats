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
    # CI is in low performance, so +60ms
    if [[ $elapsed -gt 50 ]] && [[ $elapsed -lt 210 ]]; then
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
    # CI is in low performance, so +60ms
    if [[ $elapsed -gt 950 ]] && [[ $elapsed -lt 1110 ]]; then
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
    # CI is in low performance, so +60ms
    if [[ $elapsed -gt 1950 ]] && [[ $elapsed -lt 2110 ]]; then
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
