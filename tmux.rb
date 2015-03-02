require 'formula'

class Tmux < Formula
  url 'git://git.code.sf.net/p/tmux/tmux-code'

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on 'pkg-config' => :build
  depends_on 'libevent'

  patch do
    url 'https://gist.githubusercontent.com/ToQoz/38d0955d07359c373e26/raw/776efdcec7d128e41eda6894ce7d2b49d26cdf1b/tmux-add-format-for-session-activity.patch'
    sha1 'fcd191ebabe8f77f63484b02779f8f0e722ae7b0'
  end

  def install
    system "sh", "autogen.sh"

    ENV.append "LDFLAGS", '-lresolv'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make install"

    bash_completion.install "examples/bash_completion_tmux.sh" => 'tmux'
    (share/'tmux').install "examples"
  end

  def caveats; <<-EOS.undent
    Example configurations have been installed to:
      #{share}/tmux/examples
    EOS
  end

  test do
    system "#{bin}/tmux", "-V"
  end
end
