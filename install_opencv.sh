#!/usr/bin/env bash
#sudo apt-get update
#sudo apt-get install -y \
#        build-essential \
#        cmake \
#        git \
#        wget \
#        unzip \
#        yasm \
#        pkg-config \
#        libswscale-dev \
#        libtbb2 \
#        libtbb-dev \
#        libjpeg-dev \
#        libpng-dev \
#        libtiff-dev \
#        libavformat-dev \
#        libpq-dev \
#        libgtk2.0-dev

# mkdir -p building_opencv
cd building_opencv

export OPENCV_VERSION="4.1.0"
# wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
# mv ${OPENCV_VERSION}.zip opencv_${OPENCV_VERSION}.zip

# wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
# mv ${OPENCV_VERSION}.zip opencv_contrib_${OPENCV_VERSION}.zip

# unzip opencv_${OPENCV_VERSION}.zip
# unzip opencv_contrib_${OPENCV_VERSION}.zip

rm -rf opencv-${OPENCV_VERSION}/cmake_binary
mkdir opencv-${OPENCV_VERSION}/cmake_binary
cd opencv-${OPENCV_VERSION}/cmake_binary
cmake \
  -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_VERSION}/modules .. \
  -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=$(python3.7 -c "import sys; print(sys.prefix)") \
  -DMIN_VER_PYTHON3="3.7.1" \
  -DPYTHON3_EXECUTABLE=/usr/bin/python3.7 \
  -DPYTHON3_INCLUDE_DIR=/usr/include/python3.7m \
  -DPYTHON3_INCLUDE_DIR2=/usr/include/x86_64-linux-gnu/python3.7m \
  -DPYTHON3_PACKAGES_PATH=/usr/local/lib/python3.7/dist-packages \
  -DPYTHON3_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.7m.so \
  -DPYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.7/dist-packages/numpy/core/include \
  -DWITH_QT=ON \
  -DWITH_GTK=ON \
  -DWITH_OPENGL=ON \
  ..

python -c "input('Tecle enter para continuar...')"

sudo make install -j8

#ln -s /usr/local/python/cv2/python-3.7/cv2.cpython-37m-x86_64-linux-gnu.so /usr/local/lib/python3.7/site-packages/cv2.so
echo "ln -s /usr/local/python/cv2/python-3.7/cv2.cpython-37m-x86_64-linux-gnu.so /usr/local/lib/python3.7/site-packages/cv2.so"




#$(python3.7 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
#$(python3.7 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
