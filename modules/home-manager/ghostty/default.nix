{ config, pkgs, ... }:

{
  # Dependencies
  imports = [
    ./darwin.nix
    ../udev-gothic-nf
    ../fish
  ];

  home = {
    file.".hushlogin".text = "";
  };

  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    clearDefaultKeybinds = true;
    enableFishIntegration = true;
    settings = {
      background = "#263238";
      foreground = "#ECEFF1";
      palette = [
        "0=#263238"
        "1=#FF5252"
        "2=#9CCC65"
        "3=#FEE94E"
        "4=#2B98F0"
        "5=#B38BFC"
        "6=#68B6F3"
        "7=#ECEFF1"
        "8=#617D8A"
        "9=#FC625D"
        "10=#9CCC65"
        "11=#FEE94E"
        "12=#2B98F0"
        "13=#B38BFC"
        "14=#68B6F3"
        "15=#FFFFFF"
      ];

      font-family = "UDEV Gothic NF";
      font-size = 12.5;
      font-style = "Regular";
      font-style-bold = "Bold";
      font-style-italic = "Italic";
      font-style-bold-italic = "BoldItalic";
      font-thicken = true;
      font-thicken-strength = 128;

      cursor-color = "#F828E4";
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      window-padding-x = 8;
      window-padding-y = 8;
      # window-title-font-family = "UDEV Gothic NF";
      # title = " ";

      custom-shader-animation = false;

      command = "/bin/sh -l -c 'exec fish -i'";

      copy-on-select = false;
      confirm-close-surface = false;
      quit-after-last-window-closed = true;
      scrollbar = "never";

      macos-option-as-alt = true;
      macos-titlebar-style = "hidden";
      # macos-titlebar-proxy-icon = "hidden";
    };
  };
}
