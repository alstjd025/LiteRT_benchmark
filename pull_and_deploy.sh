#!/bin/bash

GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m" 

echo -e "${CYAN}Pulling latest changes from Git repository... ${RESET}"
git pull

echo -e "${CYAN}Pushing benchmark_model_debug to Android device...${RESET}"
adb push benchmark_model_debug /tmp

echo -e "${CYAN}All tasks completed successfully.${RESET}"

