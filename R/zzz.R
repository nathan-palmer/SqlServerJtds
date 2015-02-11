.onLoad <- function(libname, pkgname) {
  .jinit(parameters=c("-Djsse.enableCBCProtection=false", "-Xmx10240m", "-d64"))
  .jpackage(pkgname, lib.loc = libname)
}
