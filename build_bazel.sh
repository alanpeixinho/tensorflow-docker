wget https://github.com/bazelbuild/bazel/releases/download/0.15.0/bazel-0.15.0-dist.zip
unzip bazel-0.15.0-dist.zip
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh
mv ./output/bazel /usr/local/bin/
rm -rf /opt/bazel
