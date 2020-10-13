PKG_NAME="docopt"
PKG_VERSION="0.6.2"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://pypi.org/project/docopt/"
PKG_URL="http://pypi.python.org/packages/source/d/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python"
PKG_SECTION="python/system"
PKG_SHORTDESC="docopt creates beautiful command-line interfaces"
PKG_LONGDESC="You know what’s awesome? It’s when the option parser is generated based on the beautiful help message that you write yourself! This way you don’t need to write this stupid repeatable parser-code, and instead can write only the help message–the way you want it."

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
