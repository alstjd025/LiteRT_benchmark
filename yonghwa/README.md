### How to execute a Tensorflow Lite (LiteRT) runtime ###

## Starting docker continer ##
1. Start the tflite docker container
   You can find a running docker container named tflite-builder with `docker ps` command.
   Command `docker exec -it container_name /bin/bash`
   (container name could be found with  `docker ps`)

## Checking tensorflow lite example source code(outside docker) ##
2.  Goto simple_test folder in tensorflow folder with `cd /host_dir/tensorflow/tensorflow/lite/examples/simple_test`.
    You can find simple_example.cc, which is the simple source code of tensorflow lite.

## Building binary(in docker) ##
3. Go back to /host_dir/LiteRT_benchmark/yongwha folder.
   Run build script with './build.sh', this will automatically build tflite example source binary with bazel and move the output file 
   here(named simple_test).

## Pushing binary to phone(outside docker) ##
4. Run `./push.sh` to push binary file to your phone's /tmp directory.
   Make sure that your phone is connected via USB DEBUGGING mode.

## Run binary(on phone) ##
5. Run binary in adb with .tflite model by `./simple_test {model_name}.tflite, {interation_time} {verbose print 0/1}`.

Feel free to modify the source and ask me if you have problem anytime.
