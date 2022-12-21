#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "noms::fruit" for configuration "Release"
set_property(TARGET noms::fruit APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(noms::fruit PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/fruit.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/fruit.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS noms::fruit )
list(APPEND _IMPORT_CHECK_FILES_FOR_noms::fruit "${_IMPORT_PREFIX}/lib/fruit.lib" "${_IMPORT_PREFIX}/bin/fruit.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
