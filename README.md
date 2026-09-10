# Round Tower Homebrew tap

Casks for Round Tower's Mac apps.

```sh
brew install --cask round-tower/tap/m1k3
```

`m1k3` installs the nightly Developer ID build of [M1K3](https://m1k3.app/) — private, on-device AI for the Mac. It is the same signed, notarized DMG the nightly publishes at <https://github.com/Round-Tower/M1K3/releases>; the cask pins the release date as its version and the DMG's sha256, and the nightly bumps both.

The app is source-available under FSL-1.1-ALv2 — see the [M1K3 repository](https://github.com/Round-Tower/M1K3) for the licence, the brains, and the eval scoreboard. This tap holds only the install metadata.
