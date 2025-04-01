#!/bin/bash
head -c "$1" < <(tr -dc '[:alnum:]' < /dev/urandom)
