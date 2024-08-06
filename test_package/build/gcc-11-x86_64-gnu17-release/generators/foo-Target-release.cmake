# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(foo_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(foo_FRAMEWORKS_FOUND_RELEASE "${foo_FRAMEWORKS_RELEASE}" "${foo_FRAMEWORK_DIRS_RELEASE}")

set(foo_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET foo_DEPS_TARGET)
    add_library(foo_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET foo_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${foo_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${foo_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### foo_DEPS_TARGET to all of them
conan_package_library_targets("${foo_LIBS_RELEASE}"    # libraries
                              "${foo_LIB_DIRS_RELEASE}" # package_libdir
                              "${foo_BIN_DIRS_RELEASE}" # package_bindir
                              "${foo_LIBRARY_TYPE_RELEASE}"
                              "${foo_IS_HOST_WINDOWS_RELEASE}"
                              foo_DEPS_TARGET
                              foo_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "foo"    # package_name
                              "${foo_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${foo_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET foo::foo
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${foo_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${foo_LIBRARIES_TARGETS}>
                 )

    if("${foo_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET foo::foo
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     foo_DEPS_TARGET)
    endif()

    set_property(TARGET foo::foo
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${foo_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET foo::foo
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${foo_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET foo::foo
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${foo_LIB_DIRS_RELEASE}>)
    set_property(TARGET foo::foo
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${foo_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET foo::foo
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${foo_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(foo_LIBRARIES_RELEASE foo::foo)
