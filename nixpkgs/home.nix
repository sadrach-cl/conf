{ config, pkgs, ... }:

{
  home.username = "sadrach";
  home.homeDirectory = "/home/sadrach";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;

  imports = [
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/fish.nix


  ];

  home = {
    packages = with pkgs; [
        vscode
        google-chrome
        rofi
        picom
        nitrogen
        _1password-gui
        pamixer
        google-drive-ocamlfuse
        sxhkd
        neovim
        vimPlugins.vim-packer
        luajit
        luajitPackages.luarocks
        exa
        gnome.gnome-tweaks
        lxappearance
        xed-editor
        yad
        dunst
        python39Packages.dbus-next
        polybar
        #wezterm
        hyper
        alacritty
        ];
  };

  # services.sxhkd = {
  #     enable = true;
  #     keybindings = {
  #       "alt + backspace" = "xdotool key KP_Delete";
  #     };
  #   };
}
