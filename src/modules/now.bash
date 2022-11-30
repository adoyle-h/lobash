# ---
# Category: Time
# Since: 0.1.0
# Usage: l.now
# Description: Print the timestamp of the number of milliseconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
# Notice: When run under Bash 4.0~4.4 and Alpine/Busybox systems, perl 5+ is required. Most Unix/Linux operating systems have included Perl 5. See the [Perl Binaries](https://www.cpan.org/ports/binaries.html).
# ---

if (( BASH_VERSINFO[0] > 4 )); then
  # EPOCHREALTIME is supported since Bash 5.0
  l.now() {
    echo $(( ${EPOCHREALTIME/./} / 1000 ))
  }
else
  _l.perl_now() {
    perl -MTime::HiRes=time -e 'printf "%d\n", time * 1000'
  }

  l.now() {
    local timestamp

    if [[ $_LOBASH_OS == 'MacOS' ]]; then
      # date '+%N' not supported in MacOS.
      _l.perl_now
    else
      # Some Linux systems may not install the Perl module "Time::HiRes".
      # So use date '+%3N' to get milliseconds.
      timestamp=$(date '+%s%3N')

      if [[ ${#timestamp} == 10 ]]; then
        # But the date '+%N' is GNU date feature which not supported in Alpine/Busybox systems.
        _l.perl_now
      else
        printf '%s\n' "$timestamp"
      fi
    fi
  }
fi
