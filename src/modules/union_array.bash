# ---
# Category: Array
# Since: 0.1.0
# Usage: l.union_array <var_name>...
# Status: not work
# Bash: 4.3.0
# ---

l.union_array() {
  declare -n a=$1
  declare -n b=$2
  declare -a arr;
  arr=("${a[@]}" "${b[@]}")
  echo "${arr[@]}"
}
