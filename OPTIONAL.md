# Optional Steps

## Enable Wifi

```bash
sudo pacman -Syu networkmanager
sudo systemctl enable --now NetworkManager
nmtui
```

## Enable Fingerprint for `sudo` and Dank Linux Lock Screen

1. Open a terminal and log in to have a fallback option: `sudo -s`

2. Open a separate terminal and run the following commands:

    ```bash
    sudo pacman -Syu fprintd
    fprintd-enroll # right-index-finger by default
    fprintd-enroll -f right-middle-finger
    fprintd-enroll -f left-index-finger
    sudo vim /etc/pam.d/sudo
    # add this as the first line:
    # auth      sufficient    pam_fprintd.so cue
    # cue gives a prompt reminding you to touch the fingerprint reader
    cat /etc/pam.d/sudo
    # the result should look as follows:
    # auth      sufficient    pam_u2f.so cue
    # auth      include       system-auth
    # account   include       system-auth
    # session   include       system-auth
    ```

Open Dank Linux Settings (`Super + ,`), then

- under Power & Security -> Lock Screen -> Lock Screen behaviour -> Enable fingerprint authentication

---

## Enable Screenlocking on Lid-close (on Laptops)

In `~/.config/niri/config.kdl`, add or find the `switch-events` block and insert the `lid-close` event:

```text
// Lock screen when lid is closed 
switch-events {
    lid-close {
        spawn "dms" "ipc" "call" "lock" "lock"
    }
}
```

## Enable Power Profiles (on Laptops)

```bash
sudo pacman -S power-profiles-daemon
sudo systemctl start --now power-profiles-daemon.service
sudo systemctl enable --now power-profiles-daemon.service
# restart DMS
sudo powerprofilesctl set power-saver # optional: to make it permanent
```

## Disable "Natural Scrolling" (on Laptops/for Touchpads)

```bash
vi ~/.config/niri/config.kdl
# comment or remove "natural-scroll"
```

---

## Install Claude CLI (AI)

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

## Set up [sgpt](https://github.com/tbckr/sgpt) and [rlwrap](https://github.com/hanslub42/rlwrap) for `qa` (AI)

1. Install

    ```bash
    go install github.com/tbckr/sgpt/v2/cmd/sgpt@latest
    sudo pacman -Syu rlwrap
    ```

2. Create the following `~/.local/bin/qa` ([source](https://sgpt.readthedocs.io/en/latest/usage/chat/)):

    ```bash
    #!/usr/bin/env bash

    shopt -s -o errexit
    shopt -s -o pipefail
    shopt -s -o nounset
    shopt -s inherit_errexit

    # https://sgpt.readthedocs.io/en/latest/getting-started/
    export OPENAI_API_BASE="" # your provider URL, e.g., https://api.mammouth.ai/v1
    export OPENAI_API_KEY="" # your provider API key
    export LLM="" # your provider supported model, e.g. see https://info.mammouth.ai/docs/api-quick-start/#models-pricing

    export CHAT="$(date '+%Y%m%d%H%M%S%3N')_$(tr -dc 'A-Za-z' </dev/urandom
    | head -c 3)"
    rlwrap bash -c 'echo ▶; while read in; do [[ -n "$in" ]] && echo ■ && s
    gpt -m "$LLM" --chat "$CHAT" "$in" && echo ▶ && notify-send --urgency=l
    ow 💬 ; done'
    ```

3. `chmod 755 ~/.local/bin/qa`

---

## Use Google Titan Security Key for `sudo`

The steps below aim to achieve the following:

- Touch the Titan key and `sudo` command succeeds
- Without the key, `sudo` falls back to password

### Setup Steps

1. Plug in the key.

2. Run the following commands:

    ```bash
    lsusb | grep Titan # confirm idVendor and idProduct of the key in the output
    sudo pacman -Syu pam-u2f
    echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="9470", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/70-titan-key.rules # idVendor and idProduct must match lsusb output
    sudo udevadm control --reload-rules
    sudo udevadm trigger
    # keep this terminal open
    ```

3. Unplug/replug the key.

4. Open a separate terminal and log in to have a fallback option: `sudo -s`

5. Go back to the first terminal and execute the following:

    ```bash
    mkdir -p ~/.config/Yubico
    pamu2fcfg > ~/.config/Yubico/u2f_keys # touch the flashing key
    # for backup keys: pamu2fcfg -n >> ~/.config/Yubico/u2f_keys
    sudo vim /etc/pam.d/sudo
    # add this as the first line:
    # auth      sufficient      pam_u2f.so cue
    # cue gives a prompt reminding you to touch the key
    cat /etc/pam.d/sudo
    # the result should look as follows:
    # auth      sufficient      pam_u2f.so cue
    # auth      include         system-auth
    # account   include         system-auth
    # session   include         system-auth
    ```

---

Option to require both, password and Titan key, instead of allowing either one:

Replace

`auth sufficient pam_u2f.so cue`

with

`auth required pam_u2f.so cue`
