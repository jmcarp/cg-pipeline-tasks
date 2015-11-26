#!/bin/bash
# vim: set ft=sh

set -e -x

#
# A little environment validation
#
if [ -z "$INPUT_DIR" ]; then
  echo "must specify \$INPUT_DIR" >&2
  exit 1
fi
#if [ -z "$OUTPUT_DIR" ]; then
  #  echo "must specify \$OUTPUT_DIR" >&2
  #exit 1
#fi

#
# Temporary file for storing compressed directory
#
TEMP_FILE=/tmp/inflate-`date +"%m-%d-%Y-%T"`.tar.gz

#
# Inflate a given directory into a new one with symbolic links dereferenced
#
tar -czh "$INPUT_DIR" > "$TEMP_FILE"

mkdir -p "$INPUT_DIR/inflated"
tar -xzf "$TEMP_FILE" -C "$INPUT_DIR/inflated"

rm -f "$TEMP_FILE"