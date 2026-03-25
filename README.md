# Dotfiles

NixOS configuration of Wulu Knut

## 环境确认

- 测试网络联通

```shell
ping -c 4 nixos.org
```

- 更新系统时钟

```shell
timedatectl set-ntp true
timedatectl status
```

- 开启临时代理

```shell
nix --experimental-features "nix-command flakes" run nixpkgs#mihomo -- -d .

export {http,https}_proxy="http://127.0.0.1:7890"
```

## 磁盘准备

- 分区挂载

```shell
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/disko/work.nix
```

## 系统安装

- 生成配置

```shell
nixos-generate-config --root /mnt
```

- 添加密钥

```shell
mkdir -p /mnt/var/lib/sops-nix

chmod 600 /mnt/var/lib/sops-nix/keys.txt
```

- 合并信息

```shell
cp hardware-configuration.nix dotfiles/hosts/hardware.nix

vi dotfiles/hosts/hardware.nix
```

- 配置安装

```shell
nixos-install --root /mnt --flake .#nixos --no-root-password --show-trace --verbose
```

- 安全加固

```shell
sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=7 /dev/sda3
```

## 日常维护

```shell
sudo nix flake update

sudo nixos-rebuild switch --flake .#nixos

sudo nixos-rebuild boot --flake .#nixos

sudo nixos-rebuild test --flake .#nixos

sudo nix-collect-garbage -d
```
