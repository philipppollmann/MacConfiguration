{ config, lib, pkgs, ... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/installer/cd-dvd/iso-minimal.nix>
    ];

  boot.initrd.availableKernelModules = [ "ahci" "usb_storage" ];

  networking.hostName = "my-nixos-box";
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];

  environment.systemPackages = with pkgs; [
    vscode
    jetbrains-toolbox
    docker
    git-fork
    notion
    iterm
    postman
  ];

  users.users.yourUsername = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}