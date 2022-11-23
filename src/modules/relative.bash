# ---
# Category: Path
# Since: 0.5.0
# Usage: l.relative <from> <to>
# Description: Output the relative path.
# Dependent: normalize
# ---

l.relative() {
  local from=${1:-.}
  local to=${2:-.}

  from=$(l.normalize "$from")
  to=$(l.normalize "$to")

  local result=''

  while [[ "${to#"$from"}" == "$to" ]]; do
    if [[ $from == '.' ]]; then
      break
    fi

    from=$(dirname "$from")
    if [[ -z $result ]]; then
      result="../"
    else
      result="../$result"
    fi
  done

  forward_part="${to#"$from"}"
  forward_part="${forward_part#/}" # remove head slash

  if [[ -n $result ]]; then
    result="$result$forward_part"
  else
    result="${forward_part}"
  fi

  echo "${result%/}" # remove tail slash
}
