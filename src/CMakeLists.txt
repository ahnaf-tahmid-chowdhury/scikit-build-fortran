include_directories("${CMAKE_CURRENT_SOURCE_DIR}")

set(TRANSPORT_SPATIAL_METHODS_SRCS
  "transport_spatial_methods/3d/ahotn_kernel_module.f90"
  "transport_spatial_methods/3d/angle.f90"
  "transport_spatial_methods/3d/check.f90"
  "transport_spatial_methods/3d/dgfem_kernel.f90"
  "transport_spatial_methods/3d/echo.f90"
  "transport_spatial_methods/3d/geompack.f90"
  "transport_spatial_methods/3d/igeompack.f90"
  "transport_spatial_methods/3d/inner.f90"
  "transport_spatial_methods/3d/invar.f90"
  "transport_spatial_methods/3d/output.f90"
  "transport_spatial_methods/3d/output_phi.f90"
  "transport_spatial_methods/3d/p.f90"
  "transport_spatial_methods/3d/precision_module.f90"
  "transport_spatial_methods/3d/read_inflow_ahotn.f90"
  "transport_spatial_methods/3d/read_inflow_dgfem.f90"
  "transport_spatial_methods/3d/read_inflow_sct_step.f90"
  "transport_spatial_methods/3d/readsrc.f90"
  "transport_spatial_methods/3d/readxs.f90"
  "transport_spatial_methods/3d/sct_module.f90"
  "transport_spatial_methods/3d/sct_step_kernel_module.f90"
  "transport_spatial_methods/3d/solvar.f90"
  "transport_spatial_methods/3d/solve.f90"
  "transport_spatial_methods/3d/sweep_ahotn_l.f90"
  "transport_spatial_methods/3d/sweep_ahotn_nefd.f90"
  "transport_spatial_methods/3d/sweep_dgfem.f90"
  "transport_spatial_methods/3d/sweep_sct_step.f90"
  "transport_spatial_methods/3d/timevar.f90"
  "transport_spatial_methods/3d/trackroutines.f90"
  "transport_spatial_methods/3d/trackstruct.f90"
  "transport_spatial_methods/3d/version.f90"
  #"transport_spatial_methods/3d/main.f90"
  )

find_package(LAPACK REQUIRED)
find_package(BLAS REQUIRED)

#add_library(${CMAKE_PROJECT_NAME} SHARED ${TRANSPORT_SPATIAL_METHODS_SRCS})
add_library(${CMAKE_PROJECT_NAME} SHARED ${CMAKE_SOURCE_DIR}/src/transport_spatial_methods/4d/fib1.f ${CMAKE_SOURCE_DIR}/src/transport_spatial_methods/4d/fib2.f)
#target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${LAPACK_LIBRARIES} ${BLAS_LIBRARIES})

install(TARGETS ${CMAKE_PROJECT_NAME} LIBRARY DESTINATION lib)