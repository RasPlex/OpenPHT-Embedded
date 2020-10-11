PKG_NAME="netifaces"
PKG_VERSION="0.10.9"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://pypi.org/project/netifaces/"
PKG_URL="http://pypi.python.org/packages/source/n/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python"
PKG_SECTION="python/system"
PKG_SHORTDESC="Portable network interface information."
PKG_LONGDESC="It’s been annoying me for some time that there’s no easy way to get the address(es) of the machine’s network interfaces from Python."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  strip_lto
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*/tests
}
