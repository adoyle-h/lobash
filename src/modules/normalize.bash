# ---
# Category: Path
# Since: 0.1.0
# Usage: l.normalize <path>
# Usage: echo <path> | l.normalize
# Dependent: split, join
# ---

l.normalize() {
  local path
  if [[ -t 0 ]]; then
    path=${1:-}
  else
    IFS='' read -r path
  fi

  if [[ -z ${path} ]]; then
    echo '.'
    return 0
  fi

  if [[ ${path} == '.' ]]; then
    echo '.'
    return 0
  fi

  local words=( $(l.split "$path" '/') )
  local -a list=()
  local -a pre_list=()
  local n=0
  local i

  if [[ ${path:0:1} == '/' ]]; then
    pre_list+=(/)
  else
    for i in "${words[@]}"; do
      if [[ $i =~ ^'.' ]]; then
        ((n+=1))
        pre_list+=("$i")
      else
        break
      fi
    done
  fi

  for (( ; n < ${#words[@]}; n++ )); do
    i=${words[$n]}
    if [[ $i == '' ]] || [[ $i == '.' ]]; then
      true
    elif [[ $i == '..' ]]; then
      local k=$(( ${#list[@]} - 1)) || true
      [[ $k > -1 ]] && unset list["$k"]
    else
      list+=("$i")
    fi
  done

  printf '%s%s\n' "$(l.join pre_list '/')" "$(l.join list '/')"
}
