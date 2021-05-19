set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/lz4_ep-prefix/src/lz4_ep-stamp/download-lz4_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/lz4_ep-prefix/src/lz4_ep-stamp/verify-lz4_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/lz4_ep-prefix/src/lz4_ep-stamp/extract-lz4_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()