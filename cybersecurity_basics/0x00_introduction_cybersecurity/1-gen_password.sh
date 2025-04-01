#!/bin/bash
read -n "$1" pass < <(tr -dc '[:alnum:]' < /dev/urandom )
echo "$pass"
