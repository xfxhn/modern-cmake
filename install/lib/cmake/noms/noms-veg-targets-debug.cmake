#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "noms::veg" for configuration "Debug"
set_property(TARGET noms::veg APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(noms::veg PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/veg.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/veg.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS noms::veg )
list(APPEND _IMPORT_CHECK_FILES_FOR_noms::veg "${_IMPORT_PREFIX}/lib/veg.lib" "${_IMPORT_PREFIX}/bin/veg.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
