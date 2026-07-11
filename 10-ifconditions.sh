#!/bin/bash

echo "Enter a number:"
read NUMBER

if [ $((NUMBER % 2)) -eq 0 ]; then
    echo "The number is even."
else
    echo "The number is odd."
fi