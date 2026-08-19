{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../fish
    ../udev-gothic-nf
  ];

  config.programs.alacritty = {
    enable = true;
    package = pkgs.alacritty-graphics; # Sixel enabled
    settings = {
      colors = {
        bright = {
          black = "#617D8A";
          blue = "#2B98F0";
          cyan = "#68B6F3";
          green = "#9CCC65";
          magenta = "#B38BFC";
          red = "#FC625D";
          white = "#FFFFFF";
          yellow = "#FEE94E";
        };
        cursor = {
          cursor = "#F828E4";
        };
        normal = {
          black = "#263238";
          blue = "#2B98F0";
          cyan = "#68B6F3";
          green = "#9CCC65";
          magenta = "#B38BFC";
          red = "#FF5252";
          white = "#ECEFF1";
          yellow = "#FEE94E";
        };
        primary = {
          background = "#263238";
          foreground = "#ECEFF1";
        };
      };

      font = {
        bold = {
          family = "UDEV Gothic NF";
          style = "Bold";
        };
        bold_italic = {
          family = "UDEV Gothic NF";
          style = "BoldItalic";
        };
        italic = {
          family = "UDEV Gothic NF";
          style = "Italic";
        };
        normal = {
          family = "UDEV Gothic NF";
          style = "Regular";
        };
        size = 13;
      };

      general = {
        live_config_reload = true;
      };

      scrolling = {
        history = 20000;
        multiplier = 3;
      };

      selection = {
        save_to_clipboard = false;
      };

      terminal = {
        shell = {
          args = ["-l" "-c" "exec fish -i"];
          program = "/bin/sh";
        };
      };

      window = {
        decorations = "buttonless";
        padding = {
          x = 6;
          y = 6;
        };
      };
    };
  };
}
