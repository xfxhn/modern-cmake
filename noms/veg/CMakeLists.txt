

set(component veg)
add_library(${component} SHARED src/asparagus.cpp)


target_include_directories(${component}
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>

        #[[
        INTERFACE_INCLUDE_DIRECTORIES install的时候会把这个路径设置在这个属性里
        在生成的.cmake文件里会set_target_properties设置这个属性，链接这个目标的目标就不用单独设置头文件了，会继承过去
        就像target_include_directories(aa PUBLIC bb)会把bb这个路径写入aa的INTERFACE_INCLUDE_DIRECTORIES属性里，
        这样谁链接了aa，谁就会继承INTERFACE_INCLUDE_DIRECTORIES的值，这样达到继承的目的
        冒号后面跟着自己安装的头文件路径 比如<prefix>/include/
        ]]
        $<INSTALL_INTERFACE:include>
        )


# 将库文件，可执行文件，头文件安装到指定目录
install(TARGETS ${component}
        EXPORT ${component}-targets #导出相关目标文件的信息
        #[[COMPONENT ${component}]]
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        )

#安装相关目标文件的信息
install(EXPORT ${component}-targets
        FILE "${project}-${component}-targets.cmake"  #相关信息的文件名
        NAMESPACE ${project}::           #命令空间
        DESTINATION lib/cmake/${project}  #安装位置
        #[[COMPONENT ${component}]]
        )


set(var aaa)
#用于自定义编译选项或者自定义宏的场景
#比如使用者来编译这个库的时候 比如开启和关闭某个功能，需要编译者传入 比如设置一个set(var aaa)
#这个命令把${component}-config.cmake.in 里@var@或者${var}替换为cmake中指定的值,这样可以控制以什么参数生成这个库
configure_file("${component}-config.cmake.in"
        "${CMAKE_BINARY_DIR}/${project}-${component}-config.cmake"
        @ONLY  #只替换@var@，不替换${var}
        )

#[[include(CMakePackageConfigHelpers)
write_basic_package_version_file(
        "${CMAKE_BINARY_DIR}/${project}-${component}-config-version.cmake"
        VERSION ${version}
        COMPATIBILITY AnyNewerVersion
)]]

#安装文件
install(
        FILES
        "${CMAKE_BINARY_DIR}/${project}-${component}-config.cmake"
        DESTINATION lib/cmake/${project}
        #[[COMPONENT ${component}]]
)

install(
        DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include
        #[[COMPONENT ${component}]]
        DESTINATION ${CMAKE_INSTALL_PREFIX}
)
