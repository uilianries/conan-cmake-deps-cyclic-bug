########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(foo_COMPONENT_NAMES "")
if(DEFINED foo_FIND_DEPENDENCY_NAMES)
  list(APPEND foo_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES foo_FIND_DEPENDENCY_NAMES)
else()
  set(foo_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(foo_PACKAGE_FOLDER_RELEASE "/home/uilian/.conan2/p/b/foo7229e6f52d733/p")
set(foo_BUILD_MODULES_PATHS_RELEASE )


set(foo_INCLUDE_DIRS_RELEASE "${foo_PACKAGE_FOLDER_RELEASE}/include")
set(foo_RES_DIRS_RELEASE )
set(foo_DEFINITIONS_RELEASE )
set(foo_SHARED_LINK_FLAGS_RELEASE )
set(foo_EXE_LINK_FLAGS_RELEASE )
set(foo_OBJECTS_RELEASE )
set(foo_COMPILE_DEFINITIONS_RELEASE )
set(foo_COMPILE_OPTIONS_C_RELEASE )
set(foo_COMPILE_OPTIONS_CXX_RELEASE )
set(foo_LIB_DIRS_RELEASE "${foo_PACKAGE_FOLDER_RELEASE}/lib")
set(foo_BIN_DIRS_RELEASE )
set(foo_LIBRARY_TYPE_RELEASE STATIC)
set(foo_IS_HOST_WINDOWS_RELEASE 0)
set(foo_LIBS_RELEASE foo core baz foo)
set(foo_SYSTEM_LIBS_RELEASE )
set(foo_FRAMEWORK_DIRS_RELEASE )
set(foo_FRAMEWORKS_RELEASE )
set(foo_BUILD_DIRS_RELEASE )
set(foo_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(foo_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${foo_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${foo_COMPILE_OPTIONS_C_RELEASE}>")
set(foo_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${foo_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${foo_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${foo_EXE_LINK_FLAGS_RELEASE}>")


set(foo_COMPONENTS_RELEASE )