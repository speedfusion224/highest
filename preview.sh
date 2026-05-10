#!/bin/bash

set -e

if [ ! -d "dist" ]; then
  echo "dist directory not found. Run 'npm run build' first."
  exit 1
fi

cd dist
python3 -m http.server 8080
