#!/bin/bash

# Start the SnarkOS validator with options from environment variables
exec /home/snarkosadm/bin/snarkos start \
  --nodisplay \
  --logfile /dev/null \
  --verbosity 4 \
  --validators "$VALIDATORS" \
  --validator \
  --private-key-file "$KEY_PATH"
