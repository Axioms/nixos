{
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
        package = pkgs.unstable.vscode;
        profiles.default = {
          enableMcpIntegration = false;
          enableExtensionUpdateCheck = false;
          enableUpdateCheck = false;

          extensions = with pkgs.vscode-marketplace; [
            jnoortheen.nix-ide
            eamodio.gitlens
            tinkertrain.theme-panda
            christian-kohler.path-intellisense
            fanaticpythoner.better-todo-tree
            ewen-lbh.vscode-hyprls
            fireblast.hyprlang-vscode
            nefrob.vscode-just-syntax
            dlasagno.rasi
            pkief.material-icon-theme
            sumneko.lua
            docker.docker
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
            "better-todo-tree.general.showActivityBarBadge" = true;
            "better-todo-tree.highlights.useColourScheme" = true;
            "better-todo-tree.general.tags" = [
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
            "editor.fontFamily" = "'JetBrainsMono Nerd Font Mono', 'Droid Sans Mono', 'monospace', monospace";
            "workbench.iconTheme" = "material-icon-theme";
            "security.workspace.trust.banner" = "never";
            "security.workspace.trust.enabled" = false;
            "security.workspace.trust.startupPrompt" = "never";
            "security.workspace.trust.untrustedFiles" = "open";
          };
        };
      };
    };
}
