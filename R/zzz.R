.onLoad <- function(libname, pkgname) {
  .jinit(parameters=c("-Djsse.enableCBCProtection=true", "-Xmx102400m", "-d64"))
  .jpackage(pkgname, lib.loc = libname)
}
