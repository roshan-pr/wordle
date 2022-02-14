#! /bin/bash

source tests/assert.sh
source wordle_library.sh

function display_result_test_cases() {
  local description="Should display text with color."
  local word="four"
  local similarities="0 1 2 3"
  local expected=$(echo -e "\033[1;30m f \033[0m\033[1;33m o \033[0m\033[0;32m u \033[0m\033[0m r \033[0m")

  local actual=$(display_result "${word}" "${similarities}")
  assert_expectation "${word},${similarities}" "${actual}" "${expected}" "${description}" "display_result"
}

# display_result_test_cases
# generate_report
