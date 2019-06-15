#!/usr/bin/env bats

setup_fixture
load_module sleep
load_module now

@test "l.sleep 0.1" {
  local last now elapsed

  last=$(l.now)
  l.sleep 0.1
  now=$(l.now)

  elapsed=$(( now - last ))

  # Total deviation 60~80ms:
  # 40~50ms deviation of l.sleep
  # 20~30ms deviation of test code (why?)
  if [[ $elapsed -gt 100 ]] && [[ $elapsed -lt 180 ]]; then
    true
  else
    echo "elapsed=$elapsed"
    false
  fi
}

@test "l.sleep 1" {
  local last now elapsed

  last=$(l.now)
  l.sleep 1
  now=$(l.now)

  elapsed=$(( now - last ))
  if [[ $elapsed -gt 1000 ]] && [[ $elapsed -lt 1080 ]]; then
    true
  else
    echo "elapsed=$elapsed"
    false
  fi
}

@test "l.sleep 2" {
  local last now elapsed

  last=$(l.now)
  l.sleep 2
  now=$(l.now)

  elapsed=$(( now - last ))
  if [[ $elapsed -gt 2000 ]] && [[ $elapsed -lt 2080 ]]; then
    true
  else
    echo "elapsed=$elapsed"
    false
  fi
}
