#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)
#[[对于 Imported Target，当库已经事先编译好时，我们需要通过一个特殊的变量，IMPORTED_LOCATION，
来指明动态链接库的具体位置。这个变量就可以通过set_target_properties进行设置，
在实际生产环境下，由于存在 Release 以及 Debug 环境的区别，IMPORTED_LOCATION实际上也存在多个版本，
比如IMPORTED_LOCATION_RELEASE以及IMPORTED_LOCATION_DEBUG，都进行设置后，在对应的环境下，
CMake 会根据这些变量为下游使用者选择正确的链接库]]
# Import target "noms::fruit" for configuration "Debug"
set_property(TARGET noms::fruit APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(noms::fruit PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/fruit.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/fruit.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS noms::fruit )
list(APPEND _IMPORT_CHECK_FILES_FOR_noms::fruit "${_IMPORT_PREFIX}/lib/fruit.lib" "${_IMPORT_PREFIX}/bin/fruit.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
