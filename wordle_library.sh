#! /bin/bash

DARK_GRAY="\033[1;30m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NORMAL="\033[0m"

function check_letter_existence() {
  local selected_word=$1
  local guessed_word=$2
  local length=$((${#selected_word} - 1))

  for index_1 in $(seq 0 ${length}); do
    guessed_letter=${guessed_word:${index_1}:1}
    existence[${index_1}]=0

    for index_2 in $(seq 0 ${length}); do
      selected_letter=${selected_word:${index_2}:1}

      if [[ ${guessed_letter} == ${selected_letter} ]]; then
        existence[${index_1}]=1

        if [[ ${index_1} == ${index_2} ]]; then
          existence[${index_1}]=2
          break
        fi
      fi
    done
  done

  echo ${existence[@]}
}

function get_random_number() {
  local limit=$1
  jot -r 1 0 ${limit}
}

function get_random_word() {
  local words=($1)

  local last_index=$((${#words[@]} - 1))
  local random_number=$(get_random_number ${last_index})
  echo ${words[${random_number}]}
}

function select_color() {
  local flag=$1

  if [[ ${flag} == 0 ]]; then
    color=${DARK_GRAY}
  elif [[ ${flag} == 1 ]]; then
    color=${YELLOW}
  elif [[ ${flag} == 2 ]]; then
    color=${GREEN}
  else
    color=${NORMAL}
  fi
  echo ${color}
}

function show_occurence() {
  local word=$1
  local similarities=($2)

  local last_index=$((${#word} - 1))

  for index in $(seq 0 ${last_index}); do
    local similarity=${similarities[${index}]}
    local color=$(select_color ${similarity})
    echo -en "${color} ${word:${index}:1} ${NORMAL}"
  done
  echo
}

function launch_wordle () {
  local selected_word=$1

  for limit in `seq 0 ${#selected_word}` ; do
    read guessed_word
    local similarities=($( check_letter_existence "${selected_word}" "${guessed_word}" ))
    show_occurence "${guessed_word}" "${similarities[*]}"
    
    if [[ "${selected_word}" == "${guessed_word}" ]] ; then
      return 0 
    fi
  done

  return 1
}

function main() {
  local words_file=$1
  local words=(`cat ${words_file}`)
  local selected_word=$(get_random_word "${words[*]}")

  echo "Guess ${#selected_word} letter word."
  local game_status="Lost"

  launch_wordle "${selected_word}"
  local status=$?

  if [[ ${status} == 0 ]]; then
    game_status="Won"
  fi

  echo -e "\nYou ${game_status}\nWord is ${selected_word}"
}
