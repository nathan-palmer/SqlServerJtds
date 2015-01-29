.onLoad <- function(libname, pkgname) {
  .jinit(parameters=c("-Djsse.enableCBCProtection=false", "-Xmx1024m", "-d64"))
  .jpackage(pkgname, lib.loc = libname)
}
