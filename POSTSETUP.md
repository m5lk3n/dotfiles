# Post-Setup Steps

Optionally, perform [these steps](https://github.com/m5lk3n/dotfiles/blob/main/OPTIONAL.md).

Last, do the following:

## Configure Dank Linux

Open Dank Linux Settings, then

- under Wallpaper, select `~/Pictures/wallpaper.jpg`
- under Theme & Colors -> Theme Color -> Browse -> Browse Themes: Install "retrobox" -> *Select it*
- under "Time & Weather" -> Location Search -> Enter location
- under Power & Security -> Power & Sleep -> Idle Settings -> Configure "Automatically lock after", "Turn off monitors after", "Suspend system after"

## Configure LibreWolf

- In LibreWolf
  - browse to 'about:config', set 'privacy.resistFingerprinting' to 'false'
  - browse to 'about:preferences', select dark mode
  - browse to 'about:addons' -> Extensions
    - "uBlock Origin" -> `...` -> `Preferences` -> under "Filter lists" tab, select the two entries under "Cookie notices" -> Apply changes
    - install extension "SponsorBlock"
  - browse to 'about:addons' -> Themes and install "gruvbox-dark-theme"

## Run one-offs

```bash
cheat # Y to create a default config and Y to download the community cheatsheets
sudo tailscale login
```

## AI
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

## Add an Avatar (skip if you're not [me](https://michael-klein.info))

```bash
curl https://michael-klein.info/images/mk.png -o "${HOME}/.face"
```
