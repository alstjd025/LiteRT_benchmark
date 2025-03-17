#!/bin/bash

# Step 1, 2, 3: /home/tensorflow 디렉토리에서 실행
echo "Step 1: Changing directory to /home/tensorflow..."
cd /host_home/tensorflow

echo "Step 1: Building TensorFlow Lite benchmark_model..."
bazel build -c opt \
  --config=android_arm64 \
  tensorflow/lite/tools/benchmark:benchmark_model

echo "Step 2: Granting execute permission..."
chmod +x bazel-bin/tensorflow/lite/tools/benchmark/benchmark_model

echo "Step 3: Moving binary to target directory..."
mv bazel-bin/tensorflow/lite/tools/benchmark/benchmark_model /host_home/LiteRT_benchmark/benchmark_model_debug

# Step 4, 5: /host_home/LiteRT_benchmark 디렉토리에서 실행
echo "Step 4: Changing directory to /host_home/LiteRT_benchmark..."
cd /host_home/LiteRT_benchmark

echo "Step 4: Committing changes to Git..."
git commit -a -m "binary push"

echo "Step 5: Pushing to remote repository..."
git push

echo "All tasks completed successfully."

