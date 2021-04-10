#!/bin/bash -eu
if [ -v GOOGLE_APPLICATION_CREDENTIALS ]; then
  echo "GOOGLE_APPLICATION_CREDENTIALS: ${GOOGLE_APPLICATION_CREDENTIALS}"
  gcsfuse tmp-rails-sqlite3 ./tmp/aaa
else
  echo "GOOGLE_APPLICATION_CREDENTIALS not defined"
  env
fi

ls -a
bin/rails server --binding 0.0.0.0
