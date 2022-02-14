source wordle_library.sh
source tests/assert.sh

#Not taking input as herestring !

function check_win() {
  local description="Should make the player won."
  local selected_word="bat"
  local expected="0"

  actual=$( launch_wordle ${selected_word} <<< cat bat) 
  local status="$?"
  assert_expectation ${selected_word} "${status}" "${expected}" "${description}" "launch_wordle"
}

function launch_wordle_test_cases() {
  check_win
}

# launch_wordle_test_cases
