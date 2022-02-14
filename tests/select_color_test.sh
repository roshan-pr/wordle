source tests/assert.sh
source wordle_library.sh

DARK_GRAY="\033[1;30m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NORMAL="\033[0m"

function select_dark_grey_color() {
  local description="should display dark grey color"
  local flag=0
  local expected="${DARK_GRAY}"

  local actual=$(select_color ${flag})
  assert_expectation ${flag} "${actual}" "${expected}" "${description}" "select_color"
}

function select_yellow_color() {
  local description="should display yellow color"
  local flag=1
  local expected="${YELLOW}"

  local actual=$(select_color ${flag})
  assert_expectation ${flag} "${actual}" "${expected}" "${description}" "select_color"
}

function select_green_color() {
  local description="should display green color"
  local flag=2
  local expected="${GREEN}"

  local actual=$(select_color ${flag})
  assert_expectation ${flag} "${actual}" "${expected}" "${description}" "select_color"
}

function select_normal_color() {
  local description="should display normal color"
  local flag=3
  local expected="${NORMAL}"

  local actual=$(select_color ${flag})
  assert_expectation ${flag} "${actual}" "${expected}" "${description}" "select_color"
}
function select_color_test_cases() {
  select_dark_grey_color
  select_yellow_color
  select_green_color
  select_normal_color
}
