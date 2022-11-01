#!/bin/zsh

PYTHON_FILE="./code.py"

function cmp_result() {
  START=`gdate +%s.%N`
  RESULT=`cat $1 | python $PYTHON_FILE | tr -d '\r'`
  END=`gdate +%s.%N`
  OUTPUT=`cat $2 | tr -d '\r'`

  diff=$( echo "$END - $START" | bc -l )
  if [ $RESULT = $OUTPUT ]
  then
    printf "\t%f\t" "diff"
    if ((`bc <<< "$diff < 1.0"`))
      then echo "Success"
      else echo "Time Out"
    fi
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