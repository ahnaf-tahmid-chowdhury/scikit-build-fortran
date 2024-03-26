include_directories("${CMAKE_BINARY_DIR}/src")

# Prepping the module
set(f2py_module_name "fibby")
#set(fortran_src_file "${CMAKE_SOURCE_DIR}/src/transport_spatial_methods/3d/main.f90")
set(fortran_src_file "${CMAKE_SOURCE_DIR}/src/transport_spatial_methods/4d/main.f")
set(f2py_module_c "${f2py_module_name}module.c")

# Target for enforcing dependencies
add_custom_target(genpyf DEPENDS "${fortran_src_file}")
add_custom_command(
  OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${f2py_module_c}"
  COMMAND ${Python_EXECUTABLE} -m "numpy.f2py" "${fortran_src_file}" -m ${f2py_module_name}
          --lower # Important
  DEPENDS "${fortran_src_file}" ${CMAKE_PROJECT_NAME} # Fortran source
)

python_add_library(
  ${f2py_module_name} MODULE WITH_SOABI "${f2py_module_c}"
  "${F2PY_INCLUDE_DIR}/fortranobject.c" "${fortran_src_file}")

target_include_directories(${f2py_module_name} PUBLIC ${F2PY_INCLUDE_DIR})
target_link_libraries(${f2py_module_name} PUBLIC Python::NumPy ${CMAKE_PROJECT_NAME})

add_dependencies(${f2py_module_name} genpyf ${CMAKE_PROJECT_NAME})
set_target_properties(${f2py_module_name} PROPERTIES
    INSTALL_RPATH "$ORIGIN/core/lib"
)
install(TARGETS ${f2py_module_name} DESTINATION ../.)