{ pkgs, nixpkgs-unstable, ... }:

{
  config.programs.antigravity-cli = {
    enable = true;
    package = nixpkgs-unstable.antigravity-cli;

    permissions = {
      ask = [
        "read_file(*)"
        "write_file(*)"
        "command(*)"
        "read_url(*)"
        "execute_url(*)"
        "mcp(*)"
        "unsandboxed(*)"
      ];
    };

    settings = {
      "enableTelemetry" = false;
      "runningLightSpeed" = "off";
      "showFeedbackSurvey" = false;
      "showTips" = false;
    };
  };
}
