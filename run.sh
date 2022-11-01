#!/bin/zsh

# * Original Code
# * https://github.com/kiryanchi/inflearn_algorithm_score/blob/main/run.sh
# * Author: kiryanchi

# Setting
CODE_FILE="code.py"
# Done

dirPath=`dirname $0`
PYTHON_FILE="$dirPath/$CODE_FILE"

INPUT_FILE=""
OUTPUT_FILE=""

function cmp_result() {
  START=`gdate +%s.%N`
  RESULT=`cat $INPUT_FILE | python $PYTHON_FILE | tr -d '\r'`
  END=`gdate +%s.%N`
  OUTPUT=`cat $OUTPUT_FILE | tr -d '\r'`

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
  INPUT_FILE=$dirPath/in$i.txt
  OUTPUT_FILE=$dirPath/out$i.txt

  if ! ( test -f "$INPUT_FILE" ); then
    echo "$INPUT_FILE 존재하지 않음"
    exit
  fi

  if ! ( test -f "$OUTPUT_FILE" ); then
    echo "$OUTPUT_FILE 존재하지 않음"
    exit
  fi

  echo "Test$i: $(cmp_result)"
done

echo "종료하려면 아무 키나 누르세요..."; read