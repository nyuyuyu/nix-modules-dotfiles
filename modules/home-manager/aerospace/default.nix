{ ... }:

{
  # Dependencies
  imports = [
    ../alacritty
  ];

  programs.aerospace = {
    enable = true;

    launchd = {
      enable = true;
    };

    settings = {
      gaps = {
        inner.horizontal = 6;
        inner.vertical = 6;
        outer.left = 6;
        outer.bottom = 6;
        outer.top = 6;
        outer.right = 6;
      };

      mode = {
        main = {
          binding = {
            cmd-h = [];
            cmd-alt-h = [];

            alt-enter = "exec-and-forget open -na Alacritty";

            alt-e = "join-with right";
            alt-shift-e = "join-with left";

            alt-f = "fullscreen";
            alt-r = "reload-config";

            # ---
            # I want to center the floating window. That feature hasn't been implemented yet.
            #   ref: https://github.com/nikitabobko/AeroSpace/discussions/633
            # ---
            # alt-t = "layout floating tiling";

            alt-n = "workspace --wrap-around next";
            alt-p = "workspace --wrap-around prev";

            alt-h = "focus left";
            alt-j = "focus down";
            alt-k = "focus up";
            alt-l = "focus right";

            alt-shift-h = "move left";
            alt-shift-j = "move down";
            alt-shift-k = "move up";
            alt-shift-l = "move right";

            alt-shift-0 = "layout tiles horizontal vertical";

            alt-1 = "workspace 1";
            alt-2 = "workspace 2";
            alt-3 = "workspace 3";
            alt-4 = "workspace 4";
            alt-5 = "workspace 5";
            alt-6 = "workspace 6";
            alt-7 = "workspace 7";
            alt-8 = "workspace 8";
            alt-9 = "workspace 9";

            alt-shift-1 = "move-node-to-workspace 1";
            alt-shift-2 = "move-node-to-workspace 2";
            alt-shift-3 = "move-node-to-workspace 3";
            alt-shift-4 = "move-node-to-workspace 4";
            alt-shift-5 = "move-node-to-workspace 5";
            alt-shift-6 = "move-node-to-workspace 6";
            alt-shift-7 = "move-node-to-workspace 7";
            alt-shift-8 = "move-node-to-workspace 8";
            alt-shift-9 = "move-node-to-workspace 9";
          };
        };
      };
    };
  };
}
