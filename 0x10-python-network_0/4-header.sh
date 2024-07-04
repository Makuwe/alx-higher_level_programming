#!/bin/bash
# script to send custom headers to servers
curl -sX GET $1 -H "X-School-User-Id: 98" -L
