#! /bin/bash

source tests/assert.sh
source wordle_library.sh

function test_with_no_match() {
  local description="Should give each letter similarities."
  local selected_word="but"
  local guessed_word="cow"
  local expected="0 0 0"

  local actual=$(check_letter_existence ${selected_word} ${guessed_word})
  assert_expectation "${selected_word},${guessed_word}" "${actual}" "${expected}" "${description}" "check_letter_existence"
}

function test_with_one_occurence() {
  local description="Should give one occurence similarity."
  local selected_word="but"
  local guessed_word="tag"
  local expected="1 0 0"

  local actual=$(check_letter_existence ${selected_word} ${guessed_word})
  assert_expectation "${selected_word},${guessed_word}" "${actual}" "${expected}" "${description}" "check_letter_existence"
}

function test_with_one_exact_match() {
  local description="Should give one exact matching similarity."
  local selected_word="but"
  local guessed_word="bag"
  local expected="2 0 0"

  local actual=$(check_letter_existence ${selected_word} ${guessed_word})
  assert_expectation "${selected_word},${guessed_word}" "${actual}" "${expected}" "${description}" "check_letter_existence"
}

function check_letter_existence_test_cases() {
  test_with_no_match
  test_with_one_exact_match
  test_with_one_occurence
}

# check_letter_existence_test_cases
# # generate_report
