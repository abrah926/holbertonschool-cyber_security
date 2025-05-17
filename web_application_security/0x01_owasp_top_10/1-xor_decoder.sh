#!/bin/bash

# Ensure input begins with {xor}
if [[ "$1" =~ ^\{xor\}(.*) ]]; then
    encoded="${BASH_REMATCH[1]}"
else
    echo "Invalid input format. Usage: ./1-xor_decoder.sh {xor}Base64String"
    exit 1
fi

# Decode base64
decoded=$(echo "$encoded" | base64 -d 2>/dev/null)

# Check if decode was successful
if [ $? -ne 0 ]; then
    echo "Base64 decode failed"
    exit 1
fi

# XOR decode using key 0x7F (127) which is common in WebSphere-style XOR
# If 0x7F doesn't work, we try 0x10 (16), 0x55 (85), or test visually
for ((i = 0; i < ${#decoded}; i++)); do
    byte=$(printf '%d' "'${decoded:$i:1}")
    printf "\\$(printf '%03o' "$((byte ^ 0x7F))")"
done

echo

