#!/bin/bash
set -e

# Make Docker available to cron
export PATH="/Users/rozierasheed/.docker/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Project location
PROJECT_DIR="/Users/rozierasheed/Documents/workspace/olake-pipeline-assignment"

cd "$PROJECT_DIR"

# Run OLake CDC sync
docker run --rm \
  --network olake-network \
  -v "$PROJECT_DIR/olake/config:/config" \
  olakego/source-postgres:latest sync \
  --config /config/source.json \
  --destination /config/destination.json \
  --streams /config/streams.json \
  --state /config/state.json
