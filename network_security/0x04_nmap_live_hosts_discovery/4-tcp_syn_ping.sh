#!/bin/bash
sudo nmap -sn -sS -p 22,80,443 "$1"
