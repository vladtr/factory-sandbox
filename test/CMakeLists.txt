# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(factoryTests LANGUAGES CXX)

# ---- Tests ----

add_executable(factory_test source/factory_test.cpp)
target_link_libraries(factory_test PRIVATE factory_lib)
target_compile_features(factory_test PRIVATE cxx_std_20)

add_test(NAME factory_test COMMAND factory_test)

# ---- End-of-file commands ----

add_folders(Test)
