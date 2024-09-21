{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ntoan96";
  home.homeDirectory = "/home/ntoan96";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.helix
    pkgs.nushell
    pkgs.zellij
    pkgs.yazi
    pkgs.zoxide
    pkgs.ripgrep
    pkgs.fd
    pkgs.fzf
    pkgs.rustup
    pkgs.uv
    pkgs.nil
    pkgs.starship
    pkgs.tldr
    pkgs.gitui
  ];

  # Config for tools
  programs.nushell.enable = true;
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        bufferline = "multiple";
        line-number = "relative";
        cursor-shape.insert = "bar";
        lsp.display-inlay-hints = true;
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/zellij/config.kdl".source = dotfiles/zellij.kdl;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ntoan96/etc/profile.d/hm-session-vars.sh
  #

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
