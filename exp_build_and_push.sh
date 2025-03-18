#!/bin/bash
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m" 

# Step 1, 2, 3: /home/tensorflow 디렉토리에서 실행
echo -e "${CYAN}Step 1: Changing directory to /home/tensorflow... ${RESET}"
cd /host_home/tensorflow

echo -e "${CYAN}Step 1: Building TensorFlow Lite benchmark_model...${RESET}"
bazel build -c opt \
  --config=android_arm64 \
  --cxxopt=-DMINSUNG_EXP \
  tensorflow/lite/tools/benchmark:benchmark_model

echo -e "${CYAN}Step 2: Granting execute permission...${RESET}"
chmod +x bazel-bin/tensorflow/lite/tools/benchmark/benchmark_model

echo -e "${CYAN}Step 3: Moving binary to target directory...${RESET}"
mv bazel-bin/tensorflow/lite/tools/benchmark/benchmark_model /host_home/LiteRT_benchmark/benchmark_model_debug

# Step 4, 5: /host_home/LiteRT_benchmark 디렉토리에서 실행
echo -e "${CYAN}Step 4: Changing directory to /host_home/LiteRT_benchmark...${RESET}"
cd /host_home/LiteRT_benchmark

echo -e "${CYAN}Step 4: Committing changes to Git...${RESET}"
git commit -a -m "binary push"

echo -e "${CYAN}Step 5: Pushing to remote repository...${RESET}"
git push

echo -e "${CYAN}All tasks completed successfully.${RESET}"

