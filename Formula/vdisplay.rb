class Vdisplay < Formula
  desc "Run any macOS app on a virtual display of any resolution"
  homepage "https://github.com/adamkpn/vdisplay"
  # url and sha256 are updated by the vdisplay release workflow.
  url "https://github.com/adamkpn/vdisplay/releases/download/v0.1.0/vdisplay-0.1.0-macos-universal.tar.gz"
  sha256 "d38eb87a4a0f9b071be82647a869dab1ac456f43b1ca78814024dea52f02cbfe"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "vdisplay"
  end

  def caveats
    <<~EOS
      vdisplay moves other apps' windows, so your terminal needs Accessibility
      permission (System Settings > Privacy & Security > Accessibility).
      `--view` also needs Screen Recording permission for the terminal.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vdisplay --version")
  end
end
