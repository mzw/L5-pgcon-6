#!/usr/bin/env bash

L=$(sed -ne '1,1p' $1)
N=$(sed -ne '2,2p' $1)
while read l; do arr+=($l); done < <(sed -ne '3,$p' $1)

n=0
for((i=0; i<((N-2)); i++)); do [ $((L-3)) -lt ${arr[$i]} ] && continue
  for((j=((i+1)); j<((N-1)); j++)); do [ $((L-1)) -lt $((${arr[$i]}+${arr[$j]})) ] && continue
    for((k=((j+1)); k<N; k++)); do [ $((${arr[$i]}+${arr[$j]}+${arr[$k]})) -eq $((L)) ] && ((n++)); done
  done
done
echo $n
