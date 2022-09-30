{ pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ccat = "pygmentize -f terminal256 -g -P style=monokai";
      dmesg = "dmesg --color=always | lless";
      gadc = "git add -A; and git commit";
      gad = "git add .";
      gcm = "git commit";
      gch = "git checkout";
      gdf = "git diff";
      gl = "git log";
      glg = "git log --color --graph --pretty --oneline";
      gpl = "git pull";
      gps = "git push";
      gst = "git status";
      la = "exa --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "exa --long --all --group --header --git";
      lt = "exa --long --all --group --header --tree --level ";
      vdir = "vdir --color=auto";
      ossw = "sudo nixos-rebuild switch --flake '/etc/nixos/#nixtst' --impure -v";
      hmsw = "home-manager switch";
      upa = "nix flake update ~/.config/nixpkgs -v && sudo nix flake update '/etc/nixos/' -v";
      fusw = "upa && ossw && hmsw";
      rusw = "ossw && hmsw";
      ucl = "nix-collect-garbage -d && nix-store --gc && nix-store --repair --verify --check-contents && nix-store --optimise -vvv";
      scl = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --repair --verify --check-contents && sudo nix-store --optimise -vvv";
      acl = "ucl && scl";
    };
#     plugins = [{
#       name = "bobthefish";
#       src = pkgs.fetchFromGitHub {
#         owner = "oh-my-fish";
#         repo = "theme-bobthefish";
#         rev = "626bd39b002535d69e56adba5b58a1060cfb6d7b";
# #        sha256 = lib.fakeSha256;
#         sha256 = "zUngqEZgHLmlyvoiVO3MwJTSFsYD7t3XiP6yMzmMkBs=";
#       };
#     }];
    # loginShellInit = ''
    #   direnv hook fish | source
    # '';
    interactiveShellInit = ''
      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
      set -x PAGER less
      set -x LESS -R
      set -x TERM xterm-256color
      set -x VISUAL nvim
      set -x EDITOR nvim
    '';
  }; 

  home = {
    file = {
      fish_greeting = {
        source = ./fish/fish_greeting.fish;
        target = ".config/fish/functions/fish_greeting.fish";
      };
    #   fish_user_key_bindings = {
    #     source = ./fish/fish_user_key_bindings.fish;
    #     target = ".config/fish/functions/fish_user_key_bindings.fish";
    #   };
    };
  };
}
