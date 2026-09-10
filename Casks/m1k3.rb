# M1K3 for Mac — the nightly Developer ID build (signed, notarized, stapled).
# Version = the DateVer release tag the nightly publishes; the URL is that
# release's asset, so a bump is one line each of version + sha256.
#
# Signed: Kev + claude-fable-5.1, 2026-09-11, Confidence 0.8 (installed from
# this file on the author's Mac; livecheck + zap paths verify-on-first-upgrade).
# Prior: Unknown.
cask "m1k3" do
  version "2026.09.10"
  sha256 "0c0fcd182339707cdf1b1aef4d8aa0ba52f695b04f82b8d1129e7dc143105bef"

  url "https://github.com/Round-Tower/M1K3/releases/download/#{version}/M1K3.dmg"
  name "M1K3"
  desc "Private, on-device AI for the Mac — three brains, voice, memory, and an MCP server for your coding agent"
  homepage "https://m1k3.app/"

  livecheck do
    url "https://github.com/Round-Tower/M1K3/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "M1K3.app"

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
