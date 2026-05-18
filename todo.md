# Carbonara
- Add wireguard config to networkmanager with sops
- Config firefox extension through flake and not account

# Tiramisu
## Services to install
- Home assistant
- Immich
- Vaultwarden
- jellyfin

## Nextcloud
- Use password encrypted with sops
- Configure the rest of nextcloud

## Caddy
- Reverse proxy for most services mentionned here (maybe add a firewall rule to my router to expose nextcloud ?)
- Use acme
  - DNS01 challenges with ovh
  - + sops the keys of the challenge


