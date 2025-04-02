#!/bin/bash
sudo last | grep -v "reboot" | grep -v "wtmp" | tail -n 5
