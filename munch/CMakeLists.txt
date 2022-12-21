
#如何使用我们生成的cmake库
cmake_minimum_required(VERSION 3.14)
project(test LANGUAGES CXX)




#设置你安装库的目录
set(CMAKE_PREFIX_PATH C:/Users/Administrator/Desktop/cmakestudy/nomnoms/install)

find_package(noms 1.0.0 REQUIRED COMPONENTS fruit)

add_executable(test src/main.cpp)

target_link_libraries(test
        PRIVATE
        noms::fruit
        )

