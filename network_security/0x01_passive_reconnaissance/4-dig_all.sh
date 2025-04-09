#!/bin/bash
for t in A AAAA MX NS SOA CNAME TXT SRV; do dig +noall +answer -t $t $1; done
