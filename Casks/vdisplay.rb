cask "vdisplay" do
  # version and sha256 are updated by the vdisplay release workflow.
  version "0.2.0"
  sha256 "f8990076d0b07d37016f6e117ec2ce01334b46c0bab560ad8012937507868ecd"

  url "https://github.com/adamkpn/vdisplay/releases/download/v#{version}/vdisplay-#{version}-macos-app.zip"
  name "vdisplay"
  desc "Run any app on a virtual display of any resolution"
  homepage "https://github.com/adamkpn/vdisplay"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "vdisplay.app"
  # The CLI is the app's own executable, so both share one binary.
  binary "#{appdir}/vdisplay.app/Contents/MacOS/vdisplay"

  # Quitting stops running sessions cleanly. The LaunchAgent (Start at Login)
  # is left alone so it survives upgrades; zap removes it.
  uninstall quit: "io.github.adamkpn.vdisplay"

  zap trash: [
    "~/Library/Application Support/vdisplay",
    "~/Library/LaunchAgents/io.github.adamkpn.vdisplay.plist",
    "~/Library/Logs/vdisplay",
  ]

  caveats <<~EOS
    vdisplay is not notarized. If macOS says it cannot be opened or that
    Apple could not verify it, click "Open Anyway" in
    System Settings > Privacy & Security (again after each upgrade).

    The menu bar app asks for Accessibility, and Screen Recording for showing
    the display in a window, for vdisplay.app. The `vdisplay` command run from
    a terminal uses your terminal's permissions instead.

    Start the menu bar app at login from its menu, or: vdisplay service install

    The vdisplay formula (`brew install adamkpn/tap/vdisplay`) installs the
    same tool and app into Homebrew's prefix. Install one or the other.
  EOS
end
