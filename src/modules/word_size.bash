# ---
# Category: Collection
# Since: 0.1.0
# Dependent: split
# ---

# Usage: word_size string [IFS=' ']
# It returns the size of words
word_size() {
  local _IFS=${IFS:- }
  words=$(split)

  IFS=${2:-' '} read -ra words <<<"$1"

  IFS=$_IFS
  echo ${#words[@]}
}
