@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
  echo Please create the Python environment first. See README.md.
  pause
  exit /b 1
)
echo Open http://127.0.0.1:7860 in your browser.
.venv\Scripts\python.exe -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:7860/api/status', timeout=3)" >nul 2>nul
if not errorlevel 1 (
  echo The lecture chatbot is already running. Use the address above.
  pause
  exit /b 0
)
echo Keep this window open for chat and automatic audio processing.
".venv\Scripts\python.exe" -m lecture_chatbot
pause
