# postsetup

Last, perform the following steps manually:

## tailscale

```bash
tailscale login
```

## configure Dank Linux

- Under Settings -> Theme & Colors -> Browse Themes: Install retrobox
- Under Power & Sleep -> Idle Settings -> Configure "Automatically lock after", "Turn off monitors after", "Suspend system after"

## configure LibreWolf

- In LibreWolf
  - browse to https://addons.mozilla.org/en-US/firefox/addon/gruvbox-dark-theme/ and install theme
  - browse to 'about:config', set 'privacy.resistFingerprinting' to 'false'
  - browse to 'about:preferences', select dark mode
  - browse to 'about:addons' 
    - "uBlock Origin" -> `...` -> `Preferences` -> under "Filter lists" tab, select the two entries under "Cookie notices"
    - install extension "SponsorBlock"

## skip if you're not [me](https://michael-klein.info)

```bash
curl https://michael-klein.info/images/mk.png -o "${HOME}/.face"
```