cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    factory
    VERSION 0.1.0
    DESCRIPTION "Factory pattern playground for modern C++"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    factory_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    factory_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(factory_lib PUBLIC cxx_std_20)

# ---- Declare executable ----

add_executable(factory_exe source/main.cpp)
add_executable(factory::exe ALIAS factory_exe)

set_property(TARGET factory_exe PROPERTY OUTPUT_NAME factory)

target_compile_features(factory_exe PRIVATE cxx_std_20)

target_link_libraries(factory_exe PRIVATE factory_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT factory_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of factory"
  )
endif()

include(cmake/dev-mode.cmake)
