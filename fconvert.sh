#!/bin/bash

OPTION_A="-F"
OPTION_B="-f"

NAME_A="f90"
NAME_B="F90"

if [ $# -eq 1 ] && [ $1 = $OPTION_A -o $1 = $OPTION_B ]
then
  MODE=$1
else
  COUNT_A=`ls *.$NAME_A 2> /dev/null | wc -w`
  COUNT_B=`ls *.$NAME_B 2> /dev/null | wc -w`
  if [ $COUNT_A -ge $COUNT_B ]
  then
    MODE=$OPTION_A
  else
    MODE=$OPTION_B
  fi
fi

if [ $MODE = $OPTION_A ]
then

  N_FILES=`ls *.$NAME_A 2> /dev/null | wc -w`
  if [ $N_FILES -eq 0 ]
  then
    echo No $NAME_A file detected.
    exit 2
  fi

  N=0
  for FILE in *.$NAME_A
  do
    N=`expr $N + 1`
    NEWFILE=`echo $FILE | tr ".$NAME_A" ".$NAME_B"`
    mv $FILE $NEWFILE
    echo $FILE '=>' $NEWFILE
  done
  echo $N files converted.

elif [ $MODE = $OPTION_B ]
then

  N_FILES=`ls *.$NAME_B 2> /dev/null | wc -w`
  if [ $N_FILES -eq 0 ]
  then
    echo No $NAME_B file detected.
    exit 2
  fi

  N=0
  for FILE in *.$NAME_B
  do
    N=`expr $N + 1`
    NEWFILE=`echo $FILE | tr ".$NAME_B" ".$NAME_A"`
    mv $FILE $NEWFILE
    echo $FILE '=>' $NEWFILE
  done
  echo $N files converted.

fi
