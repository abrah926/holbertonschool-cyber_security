#!/bin/bash

# Check if the argument starts with {xor}
if [[ "$1" =~ ^\{xor\}(.*) ]]; then
    base64_data="${BASH_REMATCH[1]}"
    
    # Decode base64, XOR with 0x5A, and print
    echo "$base64_data" | base64 -d | \
    od -An -t u1 | tr -d ' \n' | \
    xargs -n1 echo | while read byte; do
        printf \\$(printf '%03o' $((byte ^ 0x5A)))
    done
    echo
else
    echo "Usage: $0 {xor}Base64EncodedString"
    exit 1
fi

