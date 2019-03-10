#!/bin/bash

curl "http://localhost:4741/events/${ID}" \
  --include \
  --header "Authorization: Token token=${TOKEN}" \
  --request PATCH \
  --header "Content-Type: application/json" \
    --data '{
      "event": {
        "title": "'"${TITLE}"'",
        "description": "'"${DES}"'",
        "date": "'"${DATE}"'"
      }
    }'
echo
