# Maintainer: karin0 <karin0@gmx.com>

pkgname=qnap8528-dkms
_name=qnap8528
pkgver=1.24b
pkgrel=1
pkgdesc='Driver for the embedded controller on QNAP NAS devices (DKMS)'
arch=('any')
url='https://github.com/0xGiddi/qnap8528'
license=('GPL-2.0-or-later')
depends=('dkms')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7bfe43a56eb822b77ae7ae24e84208ed56bc152e65d6f798eae2235ede75469')

package() {
  local dest="$pkgdir/usr/src/$_name-$pkgver"
  cd "$_name-$pkgver"
  install -Dm644 -t "$dest/src" src/*
  # Upstream keeps one PACKAGE_VERSION across tags such as v1.24 and v1.24b,
  # and DKMS names the source directory after it.
  sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=$pkgver/" dkms.conf > "$dest/dkms.conf"
}
