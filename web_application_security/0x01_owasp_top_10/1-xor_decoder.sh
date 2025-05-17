#!/bin/bash

# Check input format starts with {xor}
if echo "$1" | grep -q "^{xor}"; then
    encoded=$(echo "$1" | cut -d'}' -f2)
else
    echo "Invalid input format"
    exit 1
fi

# Decode base64 safely
decoded=$(echo "$encoded" | base64 -d 2>/dev/null)
status=$?

# Check if base64 decode succeeded
if test "$status" -ne 0
then
    echo "Base64 decode failed"
    exit 1
fi

# XOR decode using 0x7F and convert to lowercase
i=0
length=$(echo -n "$decoded" | wc -c)

while test "$i" -lt "$length"
do
    char=$(echo -n "$decoded" | cut -c $((i + 1)))
    byte=$(printf "%d" "'$char")
    xor=$((byte ^ 127))
    printf "\\x$(printf '%02x' "$xor")"
    i=$((i + 1))
done | tr '[:upper:]' '[:lower:]'

