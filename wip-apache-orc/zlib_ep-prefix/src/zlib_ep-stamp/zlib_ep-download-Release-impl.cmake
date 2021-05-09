set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/zlib_ep-prefix/src/zlib_ep-stamp/download-zlib_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/zlib_ep-prefix/src/zlib_ep-stamp/verify-zlib_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/zlib_ep-prefix/src/zlib_ep-stamp/extract-zlib_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
