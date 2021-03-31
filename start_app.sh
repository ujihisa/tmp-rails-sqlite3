#!/bin/bash -eu
# echo "GOOGLE_APPLICATION_CREDENTIALS: ${GOOGLE_APPLICATION_CREDENTIALS}"
gcsfuse tmp-rails-sqlite3 ./tmp/aaa
ls -a
bin/rails server --binding 0.0.0.0
