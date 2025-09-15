#!/usr/bin/env bash
set -Eeuo pipefail

g='\033[0;32m'
r='\033[0;31m'
n='\033[0m'

# Example: only the stars/asterisks green
echo
echo -e "   __   __   __   ___ "
echo -e "  /  \` /  \ |  \ |__  "
echo -e "  \__, \__/ |__/ |___ "
echo -e "   __       ___       "
echo -e "  |__)  /\   |   |__|  "
echo -e "  |    /--\  |   |  |  "
echo -e "        __   __   ___  "
echo -e "  ${g}\|/  ${n}/  \ |__) / _   "
echo -e "  ${g}/|\  ${n}\__/ |  \ \__/  "
echo
echo -e "Welcome to the ${g}Steganography Lab${n} environment!"
echo
echo "GETTING STARTED:"
echo -e " ${g}*${n} Steghide is already installed (use 'steghide' to run)."
echo -e " ${g}*${n} Provided files are in ~/ (use 'ls -l' to view)."
echo -e " ${g}*${n} Follow along with the instructions at:"
echo -e "\thttps://github.com/codepath/opencyber-steganography-lab"
echo
echo "VIEWING IMAGES:"
echo -e "\e[3m (Use either of the following options, according to your preference)\e[0m"
echo -e " ${g}1${n} Open http://localhost:8080 in your web browser."
echo -e " ${g}2${n} Use 'chafa <image_file>' to preview in the terminal."
echo

# Always serve /home/student on port 8080 in the background
serve-files /home/student >/tmp/serve-files.log 2>&1 & SF_PID=$!
trap 'kill "$SF_PID" 2>/dev/null || true' EXIT

# Hand off to whatever the user specifies (default = bash)
exec "$@"