#!/bin/bash
sudo nmap -sS -sn -p 22,80,443 $1
