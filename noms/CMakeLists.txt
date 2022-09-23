

cmake_minimum_required(VERSION 3.0)
set(project noms)
set(version 1.0.0)

project(${project})

#设置安装目录，可以从cmake命令行传进来
#SET(CMAKE_INSTALL_PREFIX "C:/Users/Administrator/Desktop/cmakestudy/nomnoms/install")


#加载这个库的两个模块
add_subdirectory(fruit)
add_subdirectory(veg)


#把文件拷贝到具体位置
configure_file(noms-config.cmake
        "${CMAKE_BINARY_DIR}/${project}-config.cmake"
        @ONLY
        )


#生成工程版本信息的.cmake文件，让find_packet的时候可以根据这个生成的文件来匹配这个库的版本号
#有一点要非常注意，版本配置的文件名要和库配置文件名配对 <TargetName>-config.cmake配置<TargetName>-config-version.cmake
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
        "${CMAKE_BINARY_DIR}/${project}-config-version.cmake"
        VERSION ${version}
        COMPATIBILITY AnyNewerVersion #这个参数AnyNewerVersion向后兼容
)

#安装到指定的目录
install(
        FILES
        "${CMAKE_BINARY_DIR}/${project}-config-version.cmake"
        "${CMAKE_BINARY_DIR}/${project}-config.cmake"
        DESTINATION
        lib/cmake/${project}
)
