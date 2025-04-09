#!/bin/bash
subfinder -d $1 -nW -oI | awk -F, '{print $1 "," $2}'
