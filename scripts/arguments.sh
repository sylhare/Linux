#!/bin/bash
# https://stackoverflow.com/questions/5474732/how-can-i-add-a-help-method-to-a-shell-script
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash/13359121#13359121
# https://www.lifewire.com/pass-arguments-to-bash-script-2200571

usage="$(basename "$0") [-h] [-s n] -- program to calculate the answer to life, the universe and everything

where:
    -h  show this help text
    -s  set the seed value (default: 42)"

seed=42
while getopts ':hs:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s) seed=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

echo  "this is $seed"
shift $((OPTIND - 1))