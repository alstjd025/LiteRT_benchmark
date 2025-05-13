#!/bin/bash
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${CYAN}Step 1: Changing directory to /home/tensorflow... ${RESET}"
cd /host_dir/tensorflow || { echo -e "${RED}Failed to change directory.${RESET}"; exit 1; }

echo -e "${CYAN}Step 1: Building TensorFlow Lite simple_test binary..${RESET}"

BUILD_CMD="bazel build -c opt \
  --config=android_arm64 tensorflow/lite/examples/simple_test:simple_test"

eval $BUILD_CMD

echo -e "${CYAN}Step 2: Granting execute permission...${RESET}"
chmod +x bazel-bin/tensorflow/lite/examples/simple_test/simple_test

echo -e "${CYAN}Step 3: Moving binary to target directory...${RESET}"
mv bazel-bin/tensorflow/lite/examples/simple_test/simple_test /host_dir/LiteRT_benchmark/yongwha

echo -e "${CYAN}Step 4: Changing directory to /host_home/LiteRT_benchmark...${RESET}"
cd /host_dir/LiteRT_benchmark/yongwha || { echo -e "${RED}Failed to change directory.${RESET}"; exit 1; }

echo -e "${GREEN}All tasks completed successfully.${RESET}"
