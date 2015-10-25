#!/usr/bin/env bash

twitch_token="${1:-TWITCH_TOKEN}"
parse_app_id=""
parse_rest_key=""

curl -X POST \
 -H "X-Parse-Application-Id: ${parse_app_id}" \
 -H "X-Parse-REST-API-Key: ${parse_rest_key}" \
 -H "Content-Type: application/json" \
 -d "{\"access_token\": \"${twitch_token}\"}" \
 https://api.parse.com/1/functions/signInWithTwitch
