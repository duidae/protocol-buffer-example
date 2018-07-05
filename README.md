# protocol-buffer-example

## 1. install on CentOS 7
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

* 这个问题是由于系统的环境变量中未包括libprotobuf.so.0的路径，这个动态库在 /usr/local/lib 中，我们可以用export 将路径临时添加到环境变量中
  * $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib 
```
./list_people_cpp: error while loading shared libraries: libprotobuf.so.16: cannot open shared object file: No such file or directory
```
