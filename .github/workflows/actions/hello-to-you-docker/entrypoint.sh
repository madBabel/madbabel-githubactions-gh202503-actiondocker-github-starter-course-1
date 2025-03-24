#!/bin/sh -l

# Use INPUT_<INPUT_NAME> to get the value of an input
GREETING="Hello, $INPUT_NAME"

# Use workflow commands to do things like set debug messages
echo "$GREETING"

# Write outputs to the $GITHUB_OUTPUT file
echo "time=$(date)" >>"$GITHUB_OUTPUT"

exit 0