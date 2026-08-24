{ pkgs, ... }:

{
  config.programs.antigravity-cli = {
    enable = true;

    permissions = {
      ask = [
        "read_file(*)",
        "write_file(*)",
        "command(*)",
        "read_url(*)",
        "execute_url(*)",
        "mcp(*)",
        "unsandboxed(*)"
      ];
    };
  };
}
