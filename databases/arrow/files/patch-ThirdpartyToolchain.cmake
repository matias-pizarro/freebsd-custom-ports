--- cmake_modules/ThirdpartyToolchain.cmake.orig	2020-08-17 17:58:35 UTC
+++ cmake_modules/ThirdpartyToolchain.cmake
@@ -2182,10 +2182,10 @@
   file(MAKE_DIRECTORY ${CARES_INCLUDE_DIR})
 
   add_dependencies(toolchain cares_ep)
-  add_library(c-ares::cares STATIC IMPORTED)
-  set_target_properties(c-ares::cares
-                        PROPERTIES IMPORTED_LOCATION "${CARES_STATIC_LIB}"
-                                   INTERFACE_INCLUDE_DIRECTORIES "${CARES_INCLUDE_DIR}")
+  # add_library(c-ares::cares STATIC IMPORTED)
+  # set_target_properties(c-ares::cares
+  #                       PROPERTIES IMPORTED_LOCATION "${CARES_STATIC_LIB}"
+  #                                  INTERFACE_INCLUDE_DIRECTORIES "${CARES_INCLUDE_DIR}")
 
   set(CARES_VENDORED TRUE)
 
@@ -2194,7 +2194,7 @@
 
 if(ARROW_WITH_GRPC)
   if(c-ares_SOURCE STREQUAL "AUTO")
-    find_package(c-ares QUIET CONFIG)
+    find_package(c-ares QUIET)
     if(c-ares_FOUND)
       set(CARES_INCLUDE_DIR ${c-ares_INCLUDE_DIR})
     else()
@@ -2203,7 +2203,7 @@
   elseif(c-ares_SOURCE STREQUAL "BUNDLED")
     build_cares()
   elseif(c-ares_SOURCE STREQUAL "SYSTEM")
-    find_package(c-ares REQUIRED CONFIG)
+    find_package(c-ares REQUIRED)
     set(CARES_INCLUDE_DIR ${c-ares_INCLUDE_DIR})
   endif()
 
