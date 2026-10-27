# adamkpn/homebrew-tap

Homebrew formulae and casks for [adamkpn](https://github.com/adamkpn)'s tools.

## vdisplay

[vdisplay](https://github.com/adamkpn/vdisplay) runs any macOS app on a virtual display of any resolution and shows it in part of your screen.

Both the formula and the cask install the `vdisplay` command-line tool and the vdisplay menu bar app, as one universal (Apple Silicon and Intel) binary from the vdisplay GitHub release. Pick one:

```bash
brew install --cask adamkpn/tap/vdisplay   # cask: vdisplay.app in /Applications
brew install adamkpn/tap/vdisplay          # formula: vdisplay.app inside Homebrew's prefix
```

- **Cask:** the app appears in `/Applications`, Launchpad and Spotlight. vdisplay is not notarized, so the first time you open it after an install or upgrade, macOS may block it. Click **Open Anyway** in *System Settings → Privacy & Security*. `brew uninstall --cask vdisplay` quits the app and removes it; add `--zap` to also remove its settings, logs and the Start at Login agent.
- **Formula:** no Gatekeeper prompt. Open the app with `open "$(brew --prefix)/opt/vdisplay/vdisplay.app"`, or start it now and at every login with `vdisplay service install`.

Both link `vdisplay` into Homebrew's `bin`, so install only one of them. To switch, uninstall the other first.

Installing by the full name (`adamkpn/tap/vdisplay`) trusts that formula or cask. To install by the short name instead, trust the tap once:

```bash
brew tap adamkpn/tap
brew trust adamkpn/tap
brew install --cask vdisplay   # or: brew install vdisplay
```

Each vdisplay release updates the formula and the cask automatically.
