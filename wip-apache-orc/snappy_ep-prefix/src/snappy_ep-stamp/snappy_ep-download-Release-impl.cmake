set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/snappy_ep-prefix/src/snappy_ep-stamp/download-snappy_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/snappy_ep-prefix/src/snappy_ep-stamp/verify-snappy_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/snappy_ep-prefix/src/snappy_ep-stamp/extract-snappy_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()