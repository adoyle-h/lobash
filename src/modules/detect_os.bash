# ---
# Category: System
# Since: 0.1.0
# ---

detect_os() {
  kernel_name="$(uname -s)"

  case "$kernel_name" in
    "Darwin")                         echo "MacOS" ;;
    "SunOS")                          echo "Solaris" ;;
    "Haiku")                          echo "Haiku" ;;
    "MINIX")                          echo "MINIX" ;;
    "AIX")                            echo "AIX" ;;
    "IRIX"*)                          echo "IRIX" ;;
    "FreeMiNT")                       echo "FreeMiNT" ;;
    "Linux" | "GNU"*)                 echo "Linux" ;;
    *"BSD" | "DragonFly" | "Bitrig")  echo "BSD" ;;
    "CYGWIN"* | "MSYS"* | "MINGW"*)   echo "Windows" ;;
    *) printf '%s %s' "Unknown_OS" "$kernel_name" ;;
  esac
}
