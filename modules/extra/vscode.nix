{
  config,
  options,
  lib,
  pkgs,
  uPkgs,
  inputs,
  ...
}:

{
  home-manager.users.axiom =
    { pkgs, ... }:
    {
      imports = [
        inputs.vscode-server.nixosModules.home
      ];
      services.vscode-server.enable = true;

      programs.vscode = {
        enable = true;

        profiles.default = {
          extensions = with pkgs.vscode-marketplace; [
            jnoortheen.nix-ide
            eamodio.gitlens
            tinkertrain.theme-panda
            pkief.material-product-icons
            christian-kohler.path-intellisense
          ];

          userSettings = {
            "workbench.colorTheme" = "Panda Syntax";
            "workbench.iconTheme" = "material-icon-theme";
            "security.workplace.trust.enabled" = false;
            "git.openRepositroyInParentFolders" = "always";
            "redhat.telemetry.enabled" = false;
            "telemetry.feedback.enabled" = false;
            "git.autofetch" = true;
            "github.copilot.enable" = false;
            "github.copilot.editor.enableAutoCompletions" = false;
            "github.copilot.editor.enableCodeActions" = false;
            "github.copilot.nextEditSuggestions.enabled" = false;
            "github.copilot.renameSuggestions.triggerAutomatically" = false;
            "chat.commandCenter.enabled" = false;
            "chat.agent.enabled" = false;
            "files.autoSave" = "afterDelay";
            "workbench.secondarySideBar.defaultVisibility" = "hidden";
            "explorer.confirmDragAndDrop" = false;
            "git.openRepositoryInParentFolders" = "always";
            "explorer.confirmDelete" = false;
          };
        };
      };
    };
}
