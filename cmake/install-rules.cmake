install(
    TARGETS factory_exe
    RUNTIME COMPONENT factory_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
