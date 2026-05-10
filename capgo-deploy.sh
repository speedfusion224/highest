#!/bin/bash

# Capgo iOS TestFlight Deployment Script
# This script builds and deploys your app to TestFlight via Capgo

set -e

# Load local environment variables if available
if [ -f ".env" ]; then
  # shellcheck disable=SC1091
  set -a
  source .env
  set +a
fi

echo "🚀 Starting Capgo deployment to TestFlight..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Build web assets
echo -e "${BLUE}1️⃣  Building web assets...${NC}"
npm run build

# 2. Login to Capgo
echo -e "${BLUE}2️⃣  Authenticating with Capgo...${NC}"
# Make sure CAPGO_TOKEN is set in environment variables
if [ -z "$CAPGO_TOKEN" ]; then
    echo -e "${RED}❌ Error: CAPGO_TOKEN environment variable not set${NC}"
    echo "Get your token from: https://web.capgo.app/dashboard/settings/api"
    exit 1
fi

# 3. Create/update app in Capgo
echo -e "${BLUE}3️⃣  Creating app in Capgo...${NC}"
capgo app create --api-key "$CAPGO_TOKEN" || true

# 4. Build iOS release
echo -e "${BLUE}4️⃣  Building iOS release...${NC}"
capgo build --platform ios --build-type release --api-key "$CAPGO_TOKEN"

# 5. Upload to TestFlight
echo -e "${BLUE}5️⃣  Uploading to TestFlight...${NC}"
capgo upload --channel production --api-key "$CAPGO_TOKEN"

echo -e "${GREEN}✅ Deployment complete!${NC}"
echo "Your app is now building in App Store Connect."
echo "You can monitor progress at: https://web.capgo.app/dashboard"
