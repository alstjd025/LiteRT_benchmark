#!/bin/bash
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# Step 1, 2, 3: /home/tensorflow 디렉토리에서 실행
echo -e "${CYAN}Step 1: Changing directory to /home/tensorflow... ${RESET}"
cd /host_home/Mercury || { echo -e "${RED}Failed to change directory.${RESET}"; exit 1; }

echo -e "${CYAN}Step 1: Building TensorFlow Lite benchmark_model...${RESET}"

# 기본 빌드 명령어
BUILD_CMD="bazel build -c opt \
  --config=android_arm64 \
  --cxxopt=-DMINSUNG_DEBUG \
  --cxxopt=-DCL_DELEGATE_NO_GL"

# 추가 인자들을 모두 --cxxopt=-D<ARG> 형태로 추가
for macro in "$@"; do
  BUILD_CMD+=" \
  --cxxopt=-D$macro"
  echo -e "${YELLOW}Extra macro defined: -D$macro${RESET}"
done

BUILD_CMD+=" \
  tensorflow/lite/examples/test:test"

# 명령 실행
eval $BUILD_CMD

echo -e "${CYAN}Step 2: Granting execute permission...${RESET}"
chmod +x bazel-bin/tensorflow/lite/examples/test/test

echo -e "${CYAN}Step 3: Moving binary to target directory...${RESET}"
mv bazel-bin/tensorflow/lite/examples/test/test /host_home/LiteRT_benchmark/

# Step 4, 5: /host_home/LiteRT_benchmark 디렉토리에서 실행
echo -e "${CYAN}Step 4: Changing directory to /host_dir/LiteRT_benchmark...${RESET}"
cd /host_home/LiteRT_benchmark || { echo -e "${RED}Failed to change directory.${RESET}"; exit 1; }

echo -e "${CYAN}Step 4: Committing changes to Git...${RESET}"
git commit -a -m "binary push"

echo -e "${CYAN}Step 5: Pushing to remote repository...${RESET}"
git push

echo -e "${GREEN}All tasks completed successfully.${RESET}"

