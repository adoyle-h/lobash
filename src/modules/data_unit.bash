# ---
# Category: Prompt
# Since: next-minor
# Usage: l.data_unit <size> <from-unit> <to-unit>
# Description:
# ---

l.data_unit() {
  local size=$1
  local from=$2
  local to=$3
  local scale=2

  local from_u to_u

  case $from in
    K*) from_u=1 ;;
    M*) from_u=2 ;;
    G*) from_u=3 ;;
    T*) from_u=4 ;;
    P*) from_u=5 ;;
    E*) from_u=6 ;;
    Z*) from_u=7 ;;
    Y*) from_u=8 ;;
    *) from_u=1 ;;
  esac

  case $to in
    K*) to_u=1 ;;
    M*) to_u=2 ;;
    G*) to_u=3 ;;
    T*) to_u=4 ;;
    P*) to_u=5 ;;
    E*) to_u=6 ;;
    Z*) to_u=7 ;;
    Y*) to_u=8 ;;
    *) to_u=1 ;;
  esac

  local from_ratio to_ratio
  if [[ $from =~ *i* ]]; then
    from_ratio=1024
  else
    from_ratio=1000
  fi
  if [[ $to =~ *i* ]]; then
    to_ratio=1024
  else
    to_ratio=1000
  fi

  echo "from_u=$from_u ,to_u=$to_u ,from_ratio=$from_ratio ,to_ratio=$to_ratio"

  local result=$(( size * from_ratio ))
  local i
  if (( from_u > to_u )); then
    i=$( bc <<< "scale=$scale; $from_u / $to_u" )
    result=$(( size * from_ratio ))
    while (( i > 0 )) ; do
      result=$(( result / to_ratio ))
      ((i--))
    done
  elif (( from_u == to_u )); then
    result=$(( result / to_ratio ))
  else
    i=$( bc <<< "scale=$scale; $to_u / $from_u" )
    result=$(( size * from_ratio ))
    while (( i > 0 )) ; do
      result=$(( result * to_ratio ))
      ((i--))
    done
  fi

  printf '%s\n' "$result"
}
