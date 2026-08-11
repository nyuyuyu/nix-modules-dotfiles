{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../ghq
  ];

  home.sessionVariables = {
    GHQ_SELECTOR = "fzf";
    GHQ_SELECTOR_OPTS = "--prompt=Repos> ";
  };

  programs.fish = {
    plugins = [
      {
        name = "ghq";
        src = pkgs.fetchFromGitHub {
          owner = "decors";
          repo = "fish-ghq";
          rev = "cafaaab";
          sha256 = "sha256-6b1zmjtemNLNPx4qsXtm27AbtjwIZWkzJAo21/aVZzM=";
        };
      }
    ];
  };
}
