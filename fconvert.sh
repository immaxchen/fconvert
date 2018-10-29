#!/bin/bash

if [ $# -eq 1 ] && [ $1 = '-F' -o $1 = '-f' ]
then
  mode=$1
else
  numA=`ls *.f90 2> /dev/null | wc -w`
  numB=`ls *.F90 2> /dev/null | wc -w`
  if [ $numA -ge $numB ]
  then
    mode='-F'
  else
    mode='-f'
  fi
fi

if [ $mode = '-F' ]
then

  numfiles=`ls *.f90 2> /dev/null | wc -w`
  if [ $numfiles -eq 0 ]
  then
    echo No f90 file detected.
    exit 2
  fi

  n=0
  for file in *.f90
  do
    n=`expr $n + 1`
    newfile=`echo $file | tr '.f90' '.F90'`
    mv $file $newfile
    echo $file '=>' $newfile
  done
  echo $n files converted.

elif [ $mode = '-f' ]
then

  numfiles=`ls *.F90 2> /dev/null | wc -w`
  if [ $numfiles -eq 0 ]
  then
    echo No F90 file detected.
    exit 2
  fi

  n=0
  for file in *.F90
  do
    n=`expr $n + 1`
    newfile=`echo $file | tr '.F90' '.f90'`
    mv $file $newfile
    echo $file '=>' $newfile
  done
  echo $n files converted.

fi
