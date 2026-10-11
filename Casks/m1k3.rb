# M1K3 for Mac — the nightly Developer ID build (signed, notarized, stapled).
# Version = the DateVer release tag the nightly publishes; the URL is that
# release's asset, so a bump is one line each of version + sha256.
#
# Signed: Kev + claude-fable-5.1, 2026-09-11, Confidence 0.8 (installed from
# this file on the author's Mac; livecheck + zap paths verify-on-first-upgrade).
# Prior: Unknown.
# Review: Kev + claude-fable-5.1, 2026-09-11 — 2026.09.11 (dca2dd33) + the `binary`
# stanza: the m1k3 CLI ships inside the bundle at Contents/Helpers from this
# nightly on (#279, #282). Verified by an --appdir install: /opt/homebrew/bin/m1k3
# linked, `m1k3 status` answered the running app, uninstall unlinked it cleanly.
# Confidence now 0.85.
cask "m1k3" do
  version "2026.10.11"
  sha256 "15b44016d81463f9965132d010fc3e7433f1885c300a1881b80da0bf2241438f"

  url "https://github.com/Round-Tower/M1K3/releases/download/#{version}/M1K3.dmg"
  name "M1K3"
  desc "Private, on-device AI with voice, memory, and an MCP server for coding agents"
  homepage "https://m1k3.app/"

  livecheck do
    url "https://github.com/Round-Tower/M1K3/releases/latest"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "M1K3.app"
  binary "#{appdir}/M1K3.app/Contents/Helpers/m1k3"

  zap trash: [
    "~/Library/Application Scripts/app.m1k3",
    "~/Library/Containers/app.m1k3",
    "~/Library/Preferences/app.m1k3.plist",
    "~/Library/Saved Application State/app.m1k3.savedState",
  ]

  caveats <<~EOS
    M1K3 runs its MCP server on 127.0.0.1:4242 while the app is open.
    Connect a coding agent from Settings ▸ Privacy ▸ Connect an agent,
    or: claude mcp add --transport http m1k3 http://127.0.0.1:4242/mcp
  EOS
end
