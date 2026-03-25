# 安全启动

- 在 UEFI 中设置 Secure Boot 为 Setup Mode

```shell
sudo nix run nixpkgs#sbctl -- create-keys
sudo nix run nixpkgs#sbctl -- enroll-keys --microsoft --firmware-builtin
```

- 在 hosts 中设置 `boot.loader.limine.secureBoot.enable = true`

```shell
sudo nixos-rebuild switch --flake .#nixos
```

- 在 UEFI 中设置 Secure Boot 为 User Mode

```shell
sudo nix run nixpkgs#sbctl -- status
```
