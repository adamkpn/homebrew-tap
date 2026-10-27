class Vdisplay < Formula
  desc "Run any macOS app on a virtual display of any resolution"
  homepage "https://github.com/adamkpn/vdisplay"
  # url and sha256 are updated by the vdisplay release workflow.
  url "https://github.com/adamkpn/vdisplay/releases/download/v0.1.1/vdisplay-0.1.1-macos-universal.tar.gz"
  sha256 "834d43f5171d1103e9e92fb5a2785360a4d355640e3de0aa09433ca595237ab3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    if File.directory?("vdisplay.app")
      # The CLI is the menu bar app's own executable, so both share one binary.
      prefix.install "vdisplay.app"
      bin.install_symlink prefix/"vdisplay.app/Contents/MacOS/vdisplay"
    else
      # Releases before the menu bar app ship the binary only.
      bin.install "vdisplay"
    end
  end

  def caveats
    <<~EOS
      The menu bar app is installed as:
        #{opt_prefix}/vdisplay.app
      Open it with `open #{opt_prefix}/vdisplay.app`, or start it now and at
      every login with `vdisplay service install`. After `brew upgrade`, quit it
      and open it again.

      The menu bar app asks for Accessibility, and Screen Recording for showing
      the display in a window, for vdisplay.app. The `vdisplay` command run from
      a terminal needs them for your terminal instead.

      The vdisplay cask (`brew install --cask adamkpn/tap/vdisplay`) installs the
      same app into /Applications. Install one or the other, not both.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vdisplay --version")
  end
end
