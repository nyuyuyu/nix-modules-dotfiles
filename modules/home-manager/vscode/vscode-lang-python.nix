{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "charliermarsh.ruff"
          "ms-python.python"
        ];

        userSettings = {
          "[python]" = {
            "editor.defaultFormatter" = "charliermarsh.ruff";
            "editor.codeActionsOnSave" = {
              "source.fixAll.ruff" = "explicit";
              "source.organizeImports.ruff" = "explicit";
            };
          };
          "python.analysis.autoImportCompletions" = true;
          "python.analysis.completeFunctionParens" = true;
          "python.analysis.inlayHints.callArgumentNames" = "all";
          "python.analysis.inlayHints.functionReturnTypes" = true;
          "python.analysis.inlayHints.pytestParameters" = true;
          "python.analysis.inlayHints.variableTypes" = true;
          "python.languageServer" = "Pylance";
        };
      };
    };
  };
}
