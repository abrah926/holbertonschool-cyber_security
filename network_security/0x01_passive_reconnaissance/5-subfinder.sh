#!/bin/bash
subfinder -d "$1" | while read subdomain; do echo -n "$subdomain,"; dig +short "$subdomain" | head -n 1; done > "$1.txt"
