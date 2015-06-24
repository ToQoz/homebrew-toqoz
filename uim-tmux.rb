require 'formula'

class UimTmux < Formula
  homepage 'https://github.com/ToQoz/uim-tmux'
  url 'https://github.com/ToQoz/uim-tmux/archive/v0.0.1.tar.gz'
  sha1 'dc521f75fae78b38dca0f33cfed97f19c8ee5bde'

  head 'https://github.com/ToQoz/uim-tmux.git'

  def install
    bin.install "uim-tmux"
  end
end
