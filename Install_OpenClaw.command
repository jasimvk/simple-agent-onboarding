#!/bin/bash

# EndurxLabs One-Click Setup for OpenClaw
# ----------------------------------------
# This script automates the installation of OpenClaw.
# ----------------------------------------

# Set colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

clear
echo -e "${BLUE}${BOLD}--------------------------------------------------${NC}"
echo -e "${BLUE}${BOLD}   🚀 ENDURXLABS: OPENCLAW ONE-CLICK SETUP       ${NC}"
echo -e "${BLUE}${BOLD}--------------------------------------------------${NC}"
echo ""

# 1. Check for Node.js
echo -e "📦 ${BOLD}Step 1/3: Checking environment...${NC}"
if ! command -v node &> /dev/null
then
    echo -e "❌ Node.js is not installed."
    echo -e "⌛ Installing Homebrew and Node.js (this may take a few minutes)..."
    
    # Install Homebrew if missing
    if ! command -v brew &> /dev/null
    then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    brew install node
else
    echo -e "✅ Node.js is already installed (${BLUE}$(node -v)${NC})"
fi

# 2. Install OpenClaw
echo -e "\n🛠️  ${BOLD}Step 2/3: Installing OpenClaw engine...${NC}"
if ! command -v openclaw &> /dev/null
then
    npm install -g openclaw
else
    echo -e "✅ OpenClaw is already installed."
    echo -e "🔄 Updating to the latest version..."
    npm update -g openclaw
fi

# 3. Launch Onboarding
echo -e "\n🌐 ${BOLD}Step 3/3: Starting Setup Wizard...${NC}"
echo -e "${GREEN}Success! Opening your setup dashboard in your browser...${NC}"
echo -e "Please follow the instructions in the browser window to connect your accounts."

# Start OpenClaw in the background and open the browser
(sleep 3 && open "http://localhost:18789") &
openclaw onboard

echo -e "\n${BLUE}${BOLD}--------------------------------------------------${NC}"
echo -e "Setup session complete. Welcome to the future of work."
echo -e "${BLUE}${BOLD}--------------------------------------------------${NC}"

# Keep terminal open if there's an error
if [ $? -ne 0 ]; then
    echo "Something went wrong. Please copy the text above and contact support."
    read -p "Press any key to close..."
fi
