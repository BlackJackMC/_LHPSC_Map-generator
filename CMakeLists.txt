cmake_minimum_required(VERSION 3.4...3.27)
project(pybindtest)
add_subdirectory(pybind11)
pybind11_add_module(game_map map.cpp)