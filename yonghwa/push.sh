#!/bin/bash

GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${CYAN}Pushing simple_test to Android device...${RESET}"
adb push simple_test /tmp

echo -e "${CYAN}All tasks completed successfully.${RESET}"
