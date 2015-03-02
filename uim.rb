require 'formula'

class Uim < Formula
  homepage 'http://code.google.com/p/uim/'
  url 'https://uim.googlecode.com/files/uim-1.6.0.tar.bz2'
  sha1 'd27f2ca8136da0702c82f0522911d06b2b8f8ea7'

  deprecated_option "with-x" => "with-x11"

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on :x11 => :optional

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
