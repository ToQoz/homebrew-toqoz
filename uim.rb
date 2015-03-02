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
    # - Optimazation will raise segv on build.
    # - ENV['CFLAGS'] will be overwritten by ENV['HOMEBREW_OPTIMIZATION_LEVEL']
    #   https://github.com/Homebrew/homebrew/blob/6dd602f073a97094839d05d2126d944434b5c752/Library/ENV/4.3/cc#L187-L199
    # - ENV.{O3, O2, O1, O0, Os} sets HOMEBREW_OPTIMIZATION_LEVEL
    #   https://github.com/Homebrew/homebrew/blob/b5ab4744bbd88dc65c8e6fb0f54b90dc8f535611/Library/Homebrew/extend/ENV/super.rb#L45
    ENV.O0

    cargs = [
      "--disable-debug",
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
    ]
    cargs << "--without-x" if build.without? "x11"

    system "./configure", *cargs

    system "make install"
  end
end
