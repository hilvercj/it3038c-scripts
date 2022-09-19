#!/bin/bash
# This script downloads covid data and displays it

DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA  | jq '.[0].positive')
DEATH=$(echo $DATA | jq '.[0].death')
HOSPITALIZED=$(echo $DATA | jq '.[0].hospitalized')
PENDING=$(echo $DATA | jq '.[0].pending')
TODAY=$(date)

echo "on $TODAY, there were $POSITIVE positive COVID cases, with $DEATH dead, $HOSPITALIZED people hospitalized with COVID, and $PENDING cases awaiting results."
