#!/usr/bin/env bash

#TODO get filetypes as argument?
FILETYPE="?(*.c|*.py)"
#specify multiple filetypes with ?(*.c|*.hs)
for i in $(ls -rc ${FILETYPE}); do CTIME=$(find . -maxdepth 1 -type f -name "$i" -printf '%c'); faketime "${CTIME}" git add $i; faketime "${CTIME}" git commit -m "$i"; done

