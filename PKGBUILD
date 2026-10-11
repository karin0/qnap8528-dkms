# Maintainer: karin0 <karin0@gmx.com>

pkgname=qnap8528-dkms
_name=qnap8528
pkgver=1.27
pkgrel=1
pkgdesc='Driver for the embedded controller on QNAP NAS devices (DKMS)'
arch=('any')
url='https://github.com/0xGiddi/qnap8528'
license=('GPL-2.0-or-later')
depends=('dkms')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('282bac5ac0145b1dbfb1746436db2af7892eace5ca6835ae039fc3719f603eb0')

package() {
  local dest="$pkgdir/usr/src/$_name-$pkgver"
  cd "$_name-$pkgver"
  install -Dm644 -t "$dest/src" src/*
  # Upstream keeps one PACKAGE_VERSION across tags such as v1.24 and v1.24b,
  # and DKMS names the source directory after it.
  sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=$pkgver/" dkms.conf > "$dest/dkms.conf"
}
