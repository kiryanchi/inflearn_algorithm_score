#!/bin/zsh

function cmp_result() {
  INPUT_FILE=$1
  OUTPUT_FILE=$2

  start=`gdate +%s.%N`
  RESULT=`cat $INPUT_FILE | python ./code.py | tr -d '\r'`
  end=`gdate +%s.%N`
  OUTPUT=`cat $OUTPUT_FILE | tr -d '\r'`

  diff=$( echo "$end - $start" | bc -l )
  if [ $RESULT = $OUTPUT ]
  then
    echo "$diff Success"
  else
    echo "Fail"
  fi
}

for i in {1..5}
do
  INPUT_FILE=./in$i.txt
  OUTPUT_FILE=./out$i.txt

  if ! ( test -f "$INPUT_FILE" ); then
    echo "$INPUT_FILE 존재하지 않음"
    exit
  fi

  if ! ( test -f "$OUTPUT_FILE" ); then
    echo "$OUTPUT_FILE 존재하지 않음"
    exit
  fi

  printf "Test%i: " "i"
  cmp_result $INPUT_FILE $OUTPUT_FILE
done