#! /bin/bash

source tests/check_letter_existence_test.sh
source tests/show_occurence_test.sh
source tests/select_color_test.sh

function all_test_cases() {
  echo -e "\n Check Letter Existence\n"
  check_letter_existence_test_cases

  echo -e "\n Show Occurence\n"
  show_occurence_test_cases

  echo -e "\n Select Color\n"
  select_color_test_cases

}

function run_tests() {
  functions=(all check_letter_existence show_occurence select_color)

  PS3="select a function to test : "

  select FUNCTION in ${functions[@]}; do
    echo -e "\n\n${FUNCTION}\n"
    ${FUNCTION}_test_cases
    break
  done
}

run_tests
generate_report
