#!/bin/zsh

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
done


cmp_result() {
  RESULT=`cat $1 | python ./code.py`
  OUTPUT=`cat $2`

  if [ $RESULT -eq $OUTPUT ]
  then
    echo "same"
  else
    echo "different"
  fi
}

for i in {1..1}
do
  cmp_result ./in${i}.txt ./out${i}.txt
done