#!/bin/bash

SEARXNG_URL="http://localhost:8080"
QUERY=$1

if [ -z "$QUERY" ]; then
    echo "Usage: ./search.sh 'your search query'"
    exit 1
fi

if command -v jq &> /dev/null; then
    HAS_JQ=true
else
    HAS_JQ=false
fi

RESPONSE=$(curl -s -w "\n%{http_code}" -G "$SEARXNG_URL/search" \
    -H "User-Agent: Mozilla/5.0" \
    -H "Accept: application/json" \
    --data-urlencode "q=$QUERY" \
    --data-urlencode "format=json")

HTTP_BODY=$(echo "$RESPONSE" | sed '$d')
HTTP_CODE=$(echo "$RESPONSE" | tail -n1)

if [ "$HTTP_CODE" != "200" ]; then
    echo "Error: HTTP $HTTP_CODE"
    echo "$HTTP_BODY"
    exit 1
fi

if [ "$HAS_JQ" = true ]; then
    echo "--- Search Results for: $QUERY ---"
    echo "$HTTP_BODY" | jq -r '.results[] | "\nTitle: \(.title)\nURL:   \(.url)\nScore: \(.score)\nSnippet: \(.content | @text)"'
else
    echo "$HTTP_BODY"
fi

