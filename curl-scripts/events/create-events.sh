#!/bin/bash

curl "http://localhost:4741/events" \
  --include \
  --request POST \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "event": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESCRIPTION}"'",
      "date": "'"${DATE}"'",
      "time": "'"${TIME}"'",
      "console": "'"${CONSOLE}"'"
    }
  }'

echo
