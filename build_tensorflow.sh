CUDA_HOME="/usr/local/cuda-10.0"
CUDNN_VERSION="7"
NCCL_VERSION="2.2"

ln -s $CUDA_HOME/lib64/stubs/libcuda.so $CUDA_HOME/lib64/stubs/libcuda.so.1
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:${LD_LIBRARY_PATH}:$CUDA_HOME/lib64/stubs"
ldconfig

wget https://github.com/tensorflow/tensorflow/archive/v1.15.1.zip
unzip v1.15.1.zip
cp script.exp ./tensorflow-1.15.1
cd ./tensorflow-1.15.1
./script.exp
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package

#create pip package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

