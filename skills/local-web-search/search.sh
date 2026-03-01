#!/bin/bash

# Configuration
SEARXNG_URL="http://localhost:8080"
QUERY=$1

# Check if a query was provided
if [ -z "$QUERY" ]; then
    echo "Usage: ./search.sh 'your search query'"
    exit 1
fi

# Check if jq is installed for pretty-printing
if ! command -v jq &> /dev/null; then
    echo "Error: 'jq' is not installed. Results will be raw JSON."
    HAS_JQ=false
else
    HAS_JQ=true
fi

# Execute the search
# -s: Silent mode (no progress bar)
# -G: Use GET request
# --data-urlencode: Safely handles spaces/special characters in the query
RESPONSE=$(curl -s -G "$SEARXNG_URL/search" \
    --data-urlencode "q=$QUERY" \
    --data-urlencode "format=json")

echo $RESPONSE

# Output the results
if [ "$HAS_JQ" = true ]; then
    echo "--- Search Results for: $QUERY ---"
    echo "$RESPONSE" | jq -r '.results[] | "\nTitle: \(.title)\nURL:   \(.url)\nScore: \(.score)\nSnippet: \(.content | @text)"'
else
    echo "$RESPONSE"
fi
