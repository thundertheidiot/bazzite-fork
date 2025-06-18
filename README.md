# uBlue images &nbsp; [![bluebuild build badge](https://github.com/thundertheidiot/bazzite-fork/actions/workflows/build.yml/badge.svg)](https://github.com/thundertheidiot/bazzite-fork/actions/workflows/build.yml)

## Bazzite

Personal custom image based on [bazzite-dx](https://dev.bazzite.gg) with some minor tweaks. Not really recommended for general usage, just make your own.

Included stuff:
- ckb-next for my corsair mouse
- swap firefox flatpak for zen
- edid override script, place an edid bin by connector name in /etc/edids, e.g. /etc/edids/HDMI-A-1.bin
- downgrade kernel to 6.13.7-108 from bazzite-41 to make rocm work
  i did not figure out how to install the extra kernel modules of bazzite yet
<!-- - [lesbian nix](https://lix.systems) -->

## Aurora

Custom image bazed on [aurora-dx](https://getaurora.dev) with some minor tweaks.

Included stuff:
- swap firefox flatpak for zen
- edid override script, place an edid bin by connector name in /etc/edids, e.g. /etc/edids/HDMI-A-1.bin

Rest of the default bluebuild readme below

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/thundertheidiot/bazzite-fork:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/thundertheidiot/bazzite-fork:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/thundertheidiot/bazzite-fork
```
