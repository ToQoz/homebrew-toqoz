require 'formula'

class UimTmux < Formula
  homepage 'https://github.com/ToQoz/uim-tmux'
  url 'https://github.com/ToQoz/uim-tmux/archive/v0.0.1.tar.gz'
  sha256 'a77a8f8c26d1b7e8cb46fa47f654a8b22aebd97ef4f1400bdf077d5e87f3fdad'

  head 'https://github.com/ToQoz/uim-tmux.git'

  def install
    bin.install "uim-tmux"
  end
end
