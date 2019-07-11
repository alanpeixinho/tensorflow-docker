wget https://github.com/tensorflow/tensorflow/archive/v1.12.2.zip
unzip v1.12.2.zip
cp script.exp ./tensorflow-1.12.2
cd ./tensorflow-1.12.2
./script.exp
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package

#create pip package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

