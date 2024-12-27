{
  lib,
  pkgs,
  home-manager,
}:

(home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    ./home.nix

    (
      { config, ... }:

      {
        home = {
          homeDirectory = "/Users/${config.home.username}";
        };

        i18n.inputMethod.enabled = lib.mkVMOverride null;

        programs = {
          cava.enable = lib.mkVMOverride false; # NOTE: this may actually work on darwin, but the package is currently not supported
          foot.enable = lib.mkVMOverride false;
          fuzzel.enable = lib.mkVMOverride false;
          hyprlock.enable = lib.mkVMOverride false;
          imv.enable = lib.mkVMOverride false;
          mpv.enable = lib.mkVMOverride false; # NOTE: same as cava, but `mpv` fails to build currently
          obs-studio.enable = lib.mkVMOverride false;
          rio.enable = lib.mkVMOverride false; # marked as broken
          rofi.enable = lib.mkVMOverride false;
          spotify-player.enable = lib.mkVMOverride false; # NOTE: same as mpv
          swaylock.enable = lib.mkVMOverride false;
          tofi.enable = lib.mkVMOverride false;
          waybar.enable = lib.mkVMOverride false;
        };

        qt.enable = lib.mkVMOverride false; # NOTE: same as cava

        services = {
          dunst.enable = lib.mkVMOverride false;
          mako.enable = lib.mkVMOverride false;
          polybar.enable = lib.mkVMOverride false;
        };

        wayland.windowManager = {
          hyprland.enable = lib.mkVMOverride false;
          sway.enable = lib.mkVMOverride false;
        };
      }
    )
  ];
}).activationPackage