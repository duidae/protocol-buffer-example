# See README.txt.

.PHONY: all cpp clean

all: cpp

cpp:    add_person_cpp    list_people_cpp

clean:
	rm -f add_person_cpp list_people_cpp
	rm -f protoc_middleman addressbook.pb.cc addressbook.pb.h 	

protoc_middleman: addressbook.proto
	protoc $$PROTO_PATH --cpp_out=. addressbook.proto
	@touch protoc_middleman

add_person_cpp: add_person.cc protoc_middleman
	pkg-config --cflags protobuf  # fails if protobuf is not installed
	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`

list_people_cpp: list_people.cc protoc_middleman
	pkg-config --cflags protobuf  # fails if protobuf is not installed
	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`

