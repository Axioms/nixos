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
          enableMcpIntegration = false;
          enableExtensionUpdateCheck = false;
          enableUpdateCheck = false;

          extensions = with pkgs.vscode-marketplace; [
            jnoortheen.nix-ide
            eamodio.gitlens
            tinkertrain.theme-panda
            pkief.material-product-icons
            christian-kohler.path-intellisense
            gruntfuggly.todo-tree
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
            "workbench.secondarySideBar.defaultVisibility" = "hidden";
            "nix.enableLanguageServer" = true;
            "nix.formatterPath" = "nixfmt";
            "nix.serverPath" = "nixd";
            "todo-tree.general.showActivityBarBadge" = true;
            "todo-tree.highlights.useColourScheme" = true;
            "todo-tree.general.tags" = [
              "BUG"
              "HACK"
              "FIXME"
              "TODO"
              "[ ]"
              "[x]"
              "wait"
            ];
            "workbench.settings.showAISearchToggle" = false;
            "gitlens.ai.enabled" = false;
            "chat.todoListTool.descriptionField" = false;
            "chat.disableAIFeatures" = true;
          };
        };
      };
    };
}
