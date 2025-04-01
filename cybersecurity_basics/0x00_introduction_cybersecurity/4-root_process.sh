#!/bin/bash
ps aux | grep "^\s*$1" | grep -v ' 0 *0 '
