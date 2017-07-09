#!/bin/bash

cutoff=10

cat $1 | awk \
    '{if ($1 > '${cutoff}') print $1}' > $2
