CUDA_HOME="/usr/local/cuda-10.2"
CUDNN_VERSION="7"
NCCL_VERSION="2.2"

ln -s $CUDA_HOME/lib64/stubs/libcuda.so $CUDA_HOME/lib64/stubs/libcuda.so.1
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:${LD_LIBRARY_PATH}:$CUDA_HOME/lib64/stubs"
ldconfig

git clone --branch v2.2.0-rc1 --depth 1 https://github.com/tensorflow/tensorflow.git

cp script.exp ./tensorflow
cd ./tensorflow
./script.exp
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package

#create pip package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

