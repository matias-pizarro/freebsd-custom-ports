set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/protobuf_ep-prefix/src/protobuf_ep-stamp/download-protobuf_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/protobuf_ep-prefix/src/protobuf_ep-stamp/verify-protobuf_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/local/bin/cmake;-P;/usr/home/mpizarro/devel/ports/databases/apache-orc/protobuf_ep-prefix/src/protobuf_ep-stamp/extract-protobuf_ep.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()