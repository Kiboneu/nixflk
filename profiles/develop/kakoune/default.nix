{ pkgs, ... }: {
  imports = [ ../python ];

  environment.systemPackages = with pkgs; [
    clang-tools
    kak-lsp
    kakoune-config
    kakoune-unwrapped
    nixpkgs-fmt
    python3Packages.python-language-server
    rustup
    nix-linter
    dhall
  ];

  environment.etc = {
    "xdg/kak/kakrc".source = ./kakrc;
    "xdg/kak/autoload/plugins".source = ./plugins;
    "xdg/kak/autoload/lint".source = ./lint;
    "xdg/kak/autoload/lsp".source = ./lsp;
    "xdg/kak/autoload/default".source =
      "${pkgs.kakoune-unwrapped}/share/kak/rc";
  };
}
