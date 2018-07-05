# protocol-buffer-example

## 1. install
* https://github.com/google/protobuf/blob/master/src/README.md
* $ ./configure
* $ make
* $ make check
* $ sudo make install
* $ sudo ldconfig

## 2. run example
* $ make

## problem
* Makefile中会用pkg-config命令检测环境变量，但是没有设置PKG_CONFIG_PATH，找不到protobuf.pc这个文件
  * $ export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig 
```
pkg-config --cflags protobuf  # fails if protobuf is not installed
Package protobuf was not found in the pkg-config search path.
Perhaps you should add the directory containing `protobuf.pc'
to the PKG_CONFIG_PATH environment variable
No package 'protobuf' found
make: *** [add_person_cpp] Error 1
```
