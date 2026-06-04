# Optional Steps

## Enable Power Profiles (on Laptops)

```bash
sudo pacman -S power-profiles-daemon
sudo systemctl start --now power-profiles-daemon.service
sudo systemctl enable --now power-profiles-daemon.service
# restart DMS
sudo powerprofilesctl set power-saver # optional: to make it permanent
```

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
    sudo vim /etc/pam.d/sudo # add this as the first line: auth sufficient pam_u2f.so cue
    # cue gives a prompt reminding you to touch the key
    cat /etc/pam.d/sudo
    # the result should look as follows:
    #   auth sufficient pam_u2f.so cue
    #   auth include system-auth
    #   account include system-auth
    #   session include system-auth
    ```

---

Option to require both, password and Titan key, instead of allowing either one:

Replace

`auth sufficient pam_u2f.so cue`

with

`auth required pam_u2f.so cue`
