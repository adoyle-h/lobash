#!/usr/bin/env bats

setup_fixture
test_prepare trim_color
load_module trim_color

@test "l.trim_color 'string'" {
  run l.trim_color 'string'
  assert_success
  assert_output 'string'
}

@test "l.trim_color colored string" {
  local RED='\e[31m'
  local GREEN='\e[32m'
  local RESET_ALL='\e[0m'
  local UL_YELLOW='\e[33;4m'
  local BG_CYAN='\e[36;46m'
  local BLK_BLUE='\e[34;5m'

  local str=$(echo -e "${RED}RED ${RESET_ALL}and ${GREEN}GREEN ${RESET_ALL}and ${UL_YELLOW}UL_YELLOW and ${BG_CYAN}BG_CYAN and ${BLK_BLUE}BLK_BLUE")
  run l.trim_color "$str"
  assert_success
  assert_output 'RED and GREEN and UL_YELLOW and BG_CYAN and BLK_BLUE'
}

@test "l.trim_color \033 colored string" {
  local RED='\033[31m'
  local GREEN='\033[32m'
  local RESET_ALL='\033[0m'
  local UL_YELLOW='\033[33;4m'
  local BG_CYAN='\033[36;46m'
  local BLK_BLUE='\033[34;5m'

  local str=$(echo -e "${RED}RED ${RESET_ALL}and ${GREEN}GREEN ${RESET_ALL}and ${UL_YELLOW}UL_YELLOW and ${BG_CYAN}BG_CYAN and ${BLK_BLUE}BLK_BLUE")
  run l.trim_color "$str"
  assert_success
  assert_output 'RED and GREEN and UL_YELLOW and BG_CYAN and BLK_BLUE'
}

@test "l.trim_color \x1B colored string" {
  local RED='\x1B[31m'
  local GREEN='\x1B[32m'
  local RESET_ALL='\x1B[0m'
  local UL_YELLOW='\x1B[33;4m'
  local BG_CYAN='\x1B[36;46m'
  local BLK_BLUE='\x1B[34;5m'

  local str=$(echo -e "${RED}RED ${RESET_ALL}and ${GREEN}GREEN ${RESET_ALL}and ${UL_YELLOW}UL_YELLOW and ${BG_CYAN}BG_CYAN and ${BLK_BLUE}BLK_BLUE")
  run l.trim_color "$str"
  assert_success
  assert_output 'RED and GREEN and UL_YELLOW and BG_CYAN and BLK_BLUE'
}

@test "l.trim_color \u001b colored string" {
  local RED='\u001b[31m'
  local GREEN='\u001b[32m'
  local RESET_ALL='\u001b[0m'
  local UL_YELLOW='\u001b[33;4m'
  local BG_CYAN='\u001b[36;46m'
  local BLK_BLUE='\u001b[34;5m'

  local str=$(echo -e "${RED}RED ${RESET_ALL}and ${GREEN}GREEN ${RESET_ALL}and ${UL_YELLOW}UL_YELLOW and ${BG_CYAN}BG_CYAN and ${BLK_BLUE}BLK_BLUE")
  run l.trim_color "$str"
  assert_success
  assert_output 'RED and GREEN and UL_YELLOW and BG_CYAN and BLK_BLUE'
}
