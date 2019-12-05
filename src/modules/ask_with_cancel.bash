# ---
# Category: Prompt
# Since: next-minor
# Usage: l.ask_with_cancel <message> [<default>='']
# Description: Print the message to tty and wait for user typing from stdin.
# Description: It will print 'YES' when user types y/Y/ye/Ye/yE/YE/yes/yES/yeS/YeS/Yes/YEs/YES.
# Description: It will print 'NO' when user types n/N/no/No/nO/NO.
# Description: It will print 'CANCEL' when user types c/C/cancel/CANCEL.
# Description: It prints default value when get empty answer.
# Description: When default=Y, it prints 'YES' by default.
# Description: When default=N, it prints 'NO' by default.
# Description: When default='', there is no default value. It will keep asking until user typed right answer.
# Description: **Attention: "echo invalid_string | l.ask message" will fall into a infinite loop.**
# Description: "echo y | l.ask message" and "echo n | l.ask message" are valid.
# Dependent: ask
# ---

l.ask_with_cancel() {
  local values=(yes no cancel)
  _l.ask "$1" "${2:-}"
}
