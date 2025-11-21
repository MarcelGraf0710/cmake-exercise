# General
cmake_minimum_required(VERSION 3.16.2)
project(sse_cmake_exercise)

# Packages
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

# Source files
set(SOURCE_FILES
    fem/fem.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    yamlParser/yamlParser.cpp
)

# Header files
set(HEADER_FILES
    fem/fem.hpp
    flatset/flatset.hpp
    filesystem/filesystem.hpp
    yamlParser/yamlParser.hpp
)

# Executable
add_executable(${PROJECT_NAME} main.cpp ${SOURCE_FILES} ${HEADER_FILES})

# deal.II
deal_ii_initialize_cached_variables()
deal_ii_setup_target(${PROJECT_NAME})

# Linking
target_link_libraries(${PROJECT_NAME} ${Boost_FILESYSTEM_LIBRARY} yaml-cpp)