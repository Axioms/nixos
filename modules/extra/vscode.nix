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
            "chat.agent.enabled" = false;
            "chat.commandCenter.enabled" = false;
            "explorer.confirmDelete" = false;
            "explorer.confirmDragAndDrop" = false;
            "files.autoSave" = "afterDelay";
            "git.autofetch" = true;
            "git.confirmSync" = false;
            "git.openRepositroyInParentFolders" = "always";
            "github.copilot.enable" = false;
            "github.copilot.editor.enableAutoCompletions" = false;
            "github.copilot.editor.enableCodeActions" = false;
            "github.copilot.nextEditSuggestions.enabled" = false;
            "github.copilot.renameSuggestions.triggerAutomatically" = false;
            "redhat.telemetry.enabled" = false;
            "telemetry.feedback.enabled" = false;
            "security.workplace.trust.enabled" = false;
            "workbench.colorTheme" = "Panda Syntax";
            "workbench.iconTheme" = "material-icon-theme";
            "workbench.secondarySideBar.defaultVisibility" = "hidden";
          };
        };
      };
    };
}
