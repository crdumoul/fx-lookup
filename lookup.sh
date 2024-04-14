#!/bin/bash

DATE=$1
SRC_CURRENCY="USD"
DST_CURRENCY="CAD"

SERIES="FX${SRC_CURRENCY}${DST_CURRENCY}"

RATE=$(curl -s \
    -H "accept: application/json" \
    "https://www.bankofcanada.ca/valet/observations/${SERIES}/json?start_date=${DATE}&end_date=${DATE}" | \
    jq -r ".observations[0].${SERIES}.v")

echo "${DATE} ${SRC_CURRENCY}/${DST_CURRENCY} ${RATE}"
