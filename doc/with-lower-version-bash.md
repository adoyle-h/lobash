# With Lower Version Bash

If you want use Lobash with Bash 4.3 and lower versions, there are some knowledges you should know.

## Compatible with different versions

### 4.4

Completely supported.

### 4.3

- `shopt -s inherit_errexit` is new feature in Bash v4.4. There is no workaround in v4.3.

### 4.2

- The Nameref is new feature in Bash v4.3. There is no workaround in v4.2.

### 4.1

- `declare -g var=str` not supported in Bash 4.1, use `read -r var <<< "str"` instead.

- `$(( "$i" + 1 ))` not work in Bash 4.1, use `$(( i + 1))` instead.

- `[[ $'\e' == $'\u001b' ]]` is `false` in Bash less than v4.2. No workaround.

- `printf "%($1)T\\n" "-1"` not work in v4.1. No workaround.

### 4.0

- `exec {_sleep_fd}<> <(true)` is not supported util v4.1. No workaround.


## What you should do with different versions

## Target: Bash 4.4

Nothing else.

## Target: Bash 4.3

Because there is no workaround and similar mechanism for fast-failing (inherit_errexit),
it is your responsibility to keep the program always on right processing.
Test your script with complete boundary testings. Make sure your script never get unexpected trapped.

Still add this line `(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit` to
your script to keep compatible with higher versions.

## Target: Bash 4.2

There is no workaround for Nameref in v4.2.

Lobash not include modules whose metadata `Bash` higher than 4.2 when build for Bash 4.2+.

You can implement similar functions by reading Lobash source codes as references.

Still add this line `(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit` to
your script to keep compatible with higher versions.

## Target: Bash 4.1

Lobash not include modules whose metadata `Bash` higher than 4.1 when build for Bash 4.1+.

You can implement similar functions by reading Lobash source codes as references.

Still add this line `(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit` to
your script to keep compatible with higher versions.

## Target: Bash 4.0

Lobash not include modules whose metadata `Bash` higher than 4.0 when build for Bash 4.0+.

You can implement similar functions by reading Lobash source codes as references.

Still add this line `(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit` to
your script to keep compatible with higher versions.
