########################################################################
# ~~> Representation

## ~> basic project descriptions and options:
### - project name  - - - - - - any string
### - target name - - - - - - - any string
### - target type - - - - - - - one of: "executable", "static", "shared"
### - description - - - - - - - any string
### - version - - - - - - - - - major.minor.patch
### - root_directory  - - - - - any path; the base path of the project
### - source_directory	- - - - any path; where to look for source files
### - include_directory	- - - - any path; where to look for included files
### - build_directory - - - - - any path; where to place targets after building
### - source files  - - - - - - paths (plural or singular) to compilable source code
### - project type  - - - - - - must be "static library", "shared library", or "executable"
### - language  - - - - - - - - one of: CXX/C/OBJC/OBJCXX/CUDA, but, really, C or CXX
### - standard  - - - - - - - - format YY; the standard's release year, such as 20
### - extensions  - - - - - - - one of: "ON", "OFF"; toggles language extensions (like -std=gnu++20)
### - compiler features - - - - this is useful for specifying 
### - compiler options	- - - - any valid gcc or clang compiler options
### - cmake minimum version - - the minimum version of cmake we accept. 3.2 is good.
### - log level - - - - - - - - one of: "off", "low", "high"; whether to or at what level to log.
set(_project_name "cmake-template")
set(_target_name "${_project_name}")
set(_target_type "executable")

set(_project_description "${_project_name}")
set(_project_version "1.0.0")

set(_root_directory "..")
set(_source_directory "${_root_directory}/src")
set(_include_directory "${_root_directory}/${_source_directory}/include")
set(_build_directory "${_root_directory}/build")

set(_source_files "${_source_directory}/main.cpp")

set(_project_language "CXX")
set(_project_language_standard_yy "20")
set(_project_language_extensions "ON")
set(_project_compiler_options "-03")

set(_cmake_minimum_version "3.2")

set(_log_level "high")
########################################################################
# ~~> Notes

## ~> notes on directories:
### we're setting up variables for an overridable 
### project tree which looks something like this:
#### /{root directory}/
####  src/main.{c/cpp}
####  src/[{...}.{c/cpp/h/hpp}]
####  src/include/[{...}.{c/cpp/h/hpp}]
####  build/{project name}[.so]
####  config/{CMakeLists.txt, MakeFile, CMakeFiles, ...}

## ~> note: here's a full list of compiler features:
### possible compiler features: cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;
### cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;
### cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;
### cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;
### cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_final;
### cxx_extended_friend_declarations;cxx_extern_templates;cxx_func_identifier;cxx_generalized_initializers;
### cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;
### cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;
### cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;
### cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;
### cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;
### cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;
### cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;
### cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;
### cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20

########################################################################
# ~~> Intermediate Translation

## ~> It's good to define this early
cmake_minimum_required(VERSION ${_cmake_minimum_version} FATAL_ERROR)

## ~> the project() command is an intermediary who defines a bunch of handy stuff for us
project(
	${_project_name}
	VERSION ${_project_version}
	LANGUAGES ${_project_language}
	DESCRIPTION ${_project_description})

## ~> Handy variables to have for later
string(TOUPPER ${_project_language} _project_language_uppercase)
string(TOLOWER ${_project_language} _project_language_lowercase)

set(_project_language_standard_string "${_project_language_lowercase}_std_${_project_language_standard_yy}")
set(CMAKE_${_project_language_uppercase}_STANDARD "${_project_language_standard_yy}")

########################################################################
# ~~> Implementation

## Tells cmake where to:
### - include headers and libraries from (i.e. #include outside of the PATH)
### - look for source files, and 
### - where to place the binaries and libraries after building
include_directories(${_include_directory})
set(CMAKE_SOURCE_DIR ${_source_directory})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${_build_directory})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${_build_directory})

## Tell cmake in what form to build this project,
## i.e. one of:
## - "shared": as a shared library, 
## - "static": a static library, 
## - "executable": or a standalone executable
if(${_target_type} STREQUAL "shared")
	add_library(${_target_name} SHARED ${_source_files})
	set_target_properties(
		"${_target_name}"
		PROPERTIES 
		VERSION ${PROJECT_VERSION})
	set_target_properties(
		"${_target_name}"
		PROPERTIES 
		SOVERSION ${PROJECT_VERSION_MAJOR})
elseif(${_target_type} STREQUAL "static")
	add_library(${_target_name} ${_source_files})
elseif(${_target_type} STREQUAL "executable")
	add_executable(${_target_name} ${_source_files})
endif()

## Compiler language standards, extensions and features
set(CMAKE_${_project_language_uppercase}_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_${_project_language_uppercase}_EXTENSIONS ${_project_language_extensions})

## Compiler options and features
### ~> This is for i.e. CMAKE_CXX_STANDARD, but it deduces it from the language we specified
set(CMAKE_${_project_language}_STANDARD ${_project_language_standard_yy})
target_compile_features(${_target_name} PUBLIC ${_project_compiler_features})
add_compile_options(${_project_compiler_options})

## ~> logging
if(NOT _log_level STREQUAL "off")
	if(NOT WIN32)
		string(ASCII 27 Esc)
		set(ColorReset "${Esc}[m")
		set(ColorBold  "${Esc}[1m")
		set(Red         "${Esc}[31m")
		set(Green       "${Esc}[32m")
		set(Yellow      "${Esc}[33m")
		set(Blue        "${Esc}[34m")
		set(Magenta     "${Esc}[35m")
		set(LightBlue   "${Esc}[36m")
		set(White       "${Esc}[37m")
		set(BoldRed     "${Esc}[1;31m")
		set(BoldGreen   "${Esc}[1;32m")
		set(BoldYellow  "${Esc}[1;33m")
		set(BoldBlue    "${Esc}[1;34m")
		set(BoldMagenta "${Esc}[1;35m")
		set(BoldCyan    "${Esc}[1;36m")
		set(BoldWhite   "${Esc}[1;37m")
		set(ColorPrimary ${Green})
	endif()
	if(_log_level STREQUAL "high")
		set(_host_queries "NUMBER_OF_LOGICAL_CORES;NUMBER_OF_PHYSICAL_CORES;HOSTNAME;FQDN;TOTAL_VIRTUAL_MEMORY;AVAILABLE_VIRTUAL_MEMORY;TOTAL_PHYSICAL_MEMORY;AVAILABLE_PHYSICAL_MEMORY;IS_64BIT;HAS_FPU;HAS_MMX;HAS_MMX_PLUS;HAS_SSE;HAS_SSE2;HAS_SSE_FP;HAS_SSE_MMX;HAS_AMD_3DNOW;HAS_AMD_3DNOW_PLUS;HAS_IA64;HAS_SERIAL_NUMBER;PROCESSOR_SERIAL_NUMBER;PROCESSOR_NAME;PROCESSOR_DESCRIPTION;OS_NAME;OS_RELEASE;OS_VERSION;OS_PLATFORM;DISTRIB_INFO")
		foreach(_i IN LISTS _host_queries)
			cmake_host_system_information(RESULT _host_query QUERY ${_i})
			#message(STATUS "${_host_query}")
			if(_host_query STREQUAL "")
				set(_host_query "[None]")
			endif()
			message( STATUS "${ColorPrimary}${_host_query}${ColorReset} : ${ColorReset}${_i}" )
		endforeach()
		message( STATUS "${ColorPrimary}${_project_name}${ColorReset} : _project_name${ColorReset}" )
		message( STATUS "${ColorPrimary}${_target_name}${ColorReset} : _target_name${ColorReset}" )
		message( STATUS "${ColorPrimary}${_target_type}${ColorReset} : _target_type${ColorReset}" )
		message( STATUS "${ColorPrimary}${_project_description}${ColorReset} : _project_description${ColorReset}" )
		message( STATUS "${ColorPrimary}${_project_version}${ColorReset} : _project_version${ColorReset}" )
		message( STATUS "${ColorPrimary}${_root_directory}${ColorReset} : _root_directory${ColorReset}" )
		message( STATUS "${ColorPrimary}${_source_directory}${ColorReset} : _source_directory${ColorReset}" )
		message( STATUS "${ColorPrimary}${_include_directory}${ColorReset} : _include_directory${ColorReset}" )
		message( STATUS "${ColorPrimary}${_build_directory}${ColorReset} : _build_directory${ColorReset}" )
		message( STATUS "${ColorPrimary}${_source_files}${ColorReset} : _source_files${ColorReset}" )
		message( STATUS "${ColorPrimary}${_project_language}${ColorReset} : _project_language${ColorReset}" )
		message( STATUS "${ColorPrimary}${_project_language_standard_yy}${ColorReset} : _project_language_standard_yy${ColorReset}" )
		message( STATUS "${ColorPrimary}${_project_language_extensions}${ColorReset} : _project_language_extensions${ColorReset}" )
		message( STATUS "${ColorPrimary}${_project_compiler_options}${ColorReset} : _project_compiler_options${ColorReset}" )
		message( STATUS "${ColorPrimary}${_cmake_minimum_version}${ColorReset} : _cmake_minimum_version${ColorReset}" )
		message( STATUS "${ColorPrimary}${_log_level}${ColorReset} : _log_level${ColorReset}" )
	endif()
	string(REGEX REPLACE "xx" "++" _project_language_pretty ${_project_language_lowercase})
	message( STATUS "${ColorReset}${ColorPrimary}${_source_files}${ColorReset} : source files${ColorReset}" )
	message( STATUS "${ColorReset}${ColorPrimary}${_project_language_pretty}${ColorReset} : language${ColorReset}" )
	message( STATUS "${ColorReset}${ColorPrimary}${CMAKE_CXX_STANDARD}${ColorReset} : standard (YY)${ColorReset}" )
	message( STATUS "${ColorReset}${ColorPrimary}${CMAKE_CXX_EXTENSIONS}${ColorReset} : compiler extension (on/off)${ColorReset}" )
	message( STATUS "${ColorReset}${ColorPrimary}${CMAKE_CROSSCOMPILING}${ColorReset} : crosscompiling (true/false)${ColorReset}" )
	message( STATUS "${ColorReset}${ColorPrimary}${CMAKE_CXX_STANDARD_REQUIRED}${ColorReset} : standard required (on/off)${ColorReset}" )
endif()

#message( STATUS "_project_language_standard_string: ${_project_language_standard_string}" )
#message( STATUS "_project_language_standard_yy: ${_project_language_standard_yy}" )
#message( STATUS "CMAKE_CXX_STANDARD: ${CMAKE_CXX_STANDARD}" )

########################################################################
# ~~> TODO

# TODO
## Support for dynamic frameworks.
## Here is cmake's example:
#add_library(dynamicFramework SHARED
#            dynamicFramework.c
#            dynamicFramework.h
#)
#set_target_properties(dynamicFramework PROPERTIES
#  FRAMEWORK TRUE
#  FRAMEWORK_VERSION C
#  MACOSX_FRAMEWORK_IDENTIFIER com.cmake.dynamicFramework
#  MACOSX_FRAMEWORK_INFO_PLIST Info.plist
#  # "current version" in semantic format in Mach-O binary file
#  VERSION 16.4.0
#  # "compatibility version" in semantic format in Mach-O binary file
#  SOVERSION 1.0.0
#  PUBLIC_HEADER dynamicFramework.h
#  XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
#)

# TODO
## Package Config files:
#configure_file("${_include_directory}/${PROJECT_NAME}.pc.in" "${PROJECT_NAME}.pc" @ONLY)

# TODO
## Installation Rules:
#include(GNUInstallDirs)
#install(TARGETS ${PROJECT_NAME} 
#	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} 
#	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
# and
#install(FILES ${CMAKE_BINARY_DIR}/mylib.pc DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig)

