# detect_system() {
#   if [[ "$OSTYPE" == "linux-gnu" ]]; then
#     # ...
#   elif [[ "$OSTYPE" == "darwin"* ]]; then
#     echo MacOS
#   elif [[ "$OSTYPE" == "cygwin" ]]; then
#     # POSIX compatibility layer and Linux environment emulation for Windows
#   elif [[ "$OSTYPE" == "msys" ]]; then
#     # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
#   elif [[ "$OSTYPE" == "win32" ]]; then
#     # I'm not sure this can happen.
#   elif [[ "$OSTYPE" == "freebsd"* ]]; then
#     # ...
#   else
#     # Unknown.
#   fi
# }

detect_os() {
  IFS=" " read -ra uname <<< "$(uname -srm)"

  kernel_name="${uname[0]}"
  kernel_version="${uname[1]}"
  kernel_machine="${uname[2]}"

  if [[ "$kernel_name" == "Darwin" ]]; then
    IFS=$'\n' read -d "" -ra sw_vers < <(awk -F'<|>' '/key|string/ {print $3}' \
                         "/System/Library/CoreServices/SystemVersion.plist")

    for ((i=0;i<${#sw_vers[@]};i+=2)) {
      case ${sw_vers[i]} in
        ProductName)          darwin_name=${sw_vers[i+1]} ;;
        ProductVersion)       osx_version=${sw_vers[i+1]} ;;
        ProductBuildVersion)  osx_build=${sw_vers[i+1]}   ;;
      esac
    }
  fi

  # $kernel_name is set in a function called cache_uname and is
  # just the output of "uname -s".
  case "$kernel_name" in
    "Darwin"):   "$darwin_name" ;;
    "SunOS"):    "Solaris" ;;
    "Haiku"):    "Haiku" ;;
    "MINIX"):    "MINIX" ;;
    "AIX"):      "AIX" ;;
    "IRIX"*):    "IRIX" ;;
    "FreeMiNT"): "FreeMiNT" ;;
    "Linux" | "GNU"*): "Linux" ;;
    *"BSD" | "DragonFly" | "Bitrig"): "BSD" ;;
    "CYGWIN"* | "MSYS"* | "MINGW"*): "Windows" ;;
    "Mac OS X"): "MacOS" ;;
    *) printf '%s %s' "Unknown_OS" "$kernel_name" ;;
  esac

  echo "$_"
}
