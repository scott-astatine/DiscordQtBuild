cmake_minimum_required(VERSION 3.16)

project(Quax VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_COMPILER /bin/clang++)

find_package(Qt6 6.2 COMPONENTS Quick Widgets QuickControls2 REQUIRED)

add_subdirectory(src)
