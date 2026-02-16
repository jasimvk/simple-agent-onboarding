@echo off
TITLE EndurxLabs OpenClaw One-Click Setup
CLS

echo --------------------------------------------------
echo    🚀 ENDURXLABS: OPENCLAW ONE-CLICK SETUP
echo --------------------------------------------------
echo.

:: 1. Check for Node.js
echo 📦 Step 1/3: Checking environment...
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed.
    echo ⌛ Please download and install Node.js from https://nodejs.org/
    echo ⌛ Once installed, run this script again.
    pause
    exit
) else (
    echo ✅ Node.js is already installed.
)

:: 2. Install OpenClaw
echo.
echo 🛠️  Step 2/3: Installing OpenClaw engine...
npm list -g openclaw >nul 2>&1
if %errorlevel% neq 0 (
    call npm install -g openclaw
) else (
    echo ✅ OpenClaw is already installed.
    echo 🔄 Updating to the latest version...
    call npm update -g openclaw
)

:: 3. Launch Onboarding
echo.
echo 🌐 Step 3/3: Starting Setup Wizard...
echo Success! Opening your setup dashboard in your browser...
echo Please follow the instructions in the browser window to connect your accounts.

start http://localhost:18789
call openclaw onboard

echo.
echo --------------------------------------------------
echo Setup session complete. Welcome to the future of work.
echo --------------------------------------------------
pause
