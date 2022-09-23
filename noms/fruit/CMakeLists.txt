
message(STATUS "${project} project fruit")
message(STATUS "${version} version fruit")
set(component fruit)


#[[生成一个动态库]]
add_library(${component} SHARED src/apple.cpp)


#[[add_custom_target(aaa COMMAND ${CMAKE_COMMAND} -E echo "\"$<$<CONFIG:Debug>:-g;-O0>,$<PLATFORM_ID>\"")]]
target_include_directories(${component}
        PUBLIC
        #[[build阶段使用这个路径]]
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        #[[安装阶段使用这个路径，比如你把头文件安装到xxx路径，那么就会生成<xxx>/include]]
        $<INSTALL_INTERFACE:include>
        )








install(TARGETS ${component} EXPORT ${component}-targets
        #[[COMPONENT ${component}]]
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        )

install(EXPORT ${component}-targets
        FILE "${project}-${component}-targets.cmake"
        NAMESPACE ${project}::
        DESTINATION lib/cmake/${project}
        #[[COMPONENT ${component}]]
        )

# This seems like a kludge, but it does place the file in the correct location
# on my machine (Ubuntu 18.04). Idea taken from Poco
configure_file("${component}-config.cmake.in"
        "${CMAKE_BINARY_DIR}/${project}-${component}-config.cmake"
        @ONLY
        )

#[[include(CMakePackageConfigHelpers)]]
#[[write_basic_package_version_file(
        "${CMAKE_BINARY_DIR}/${project}-${component}-config-version.cmake"
        VERSION ${version}
        COMPATIBILITY AnyNewerVersion
)]]

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
