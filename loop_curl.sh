#!/bin/bash

for i in {1..10}
  do
    ts=$(date +%s%N)
    
    # curl

    duration=$((($(date +%s%N) - $ts)/1000000))
    printf '\n'
    echo "$duration ms"
  done
