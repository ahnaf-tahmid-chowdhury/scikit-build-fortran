# setup project ###
cmake_minimum_required(VERSION 3.17.2...3.24)

project(
  pyne
  VERSION 1.0
  DESCRIPTION "FIB module"
  LANGUAGES C Fortran)

find_package(Python REQUIRED COMPONENTS Interpreter Development.Module NumPy)

# Grab the variables from a local Python installation F2PY headers
execute_process(
  COMMAND "${Python_EXECUTABLE}" -c
          "import numpy.f2py; print(numpy.f2py.get_include())"
  OUTPUT_VARIABLE F2PY_INCLUDE_DIR
  OUTPUT_STRIP_TRAILING_WHITESPACE)

add_subdirectory(src)
add_subdirectory(fibby)
