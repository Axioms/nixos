{
  config,
  pkgs,
  inputs,
  ...
}:

{

  home-manager.users.axiom =
    { pkgs, ... }:
    {

      imports = [
        inputs.zen-browser.homeModules.beta
      ];
      programs.zen-browser = {
        enable = true;
        
        policies = {
          AutofillAddressEnabled = false;
          AutofillCreditCardEnabled = false;
          DisableAppUpdate = true;
          DisableFeedbackCommands = true;
          DisableFirefoxStudies = true;
          DisablePocket = true; # save webs for later reading
          DisableTelemetry = true;
          DontCheckDefaultBrowser = true;
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          /*
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          */
          /*
          ExtensionSettings = {
            "{acf82b50-48cf-4dd4-8059-5c949e754a65}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/anori/latest.xpi";
              installation_mode = "force_installed";
            };
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
              installation_mode = "force_installed";
            };
            "{74145f27-f039-47ce-a470-a662b129930a}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
              installation_mode = "force_installed";
            };
            "CookieAutoDelete@kennydo.com" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/cookie-autodelete/latest.xpi";
              installation_mode = "force_installed";
            };
            "cookie.block.extension@gmail.com" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/cookieblock/latest.xpi";
              installation_mode = "force_installed";
            };
            "{7fc8ef53-24ec-4205-87a4-1e745953bb0d}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/css-exfil-protection/latest.xpi";
              installation_mode = "force_installed";
            };
            "addon@darkreader.org" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
              installation_mode = "force_installed";
            };
            "jid1-BoFifL9Vbdl2zQ@jetpack" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
              installation_mode = "force_installed";
            };
            "@testpilot-containers" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
              installation_mode = "force_installed";
            };
            "jordanlinkwarden@gmail.com" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/linkwarden/latest.xpi";
              installation_mode = "force_installed";
            };
            "{b86e4813-687a-43e6-ab65-0bde4ab75758}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/localcdn-fork-of-decentraleyes/latest.xpi";
              installation_mode = "force_installed";
            };
            "plasma-browser-integration@kde.org" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
              installation_mode = "force_installed";
            };
            "{6da4a0dd-e540-4a26-8202-98e364ecef2e}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-dislike/latest.xpi";
              installation_mode = "force_installed";
            };
            "smart-referer@meh.paranoid.pk" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/smart-referer/latest.xpi";
              installation_mode = "force_installed";
            };
            "tab-stash@condordes.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/tab-stash/latest.xpi";
              installation_mode = "force_installed";
            };
            "{c607c8df-14a7-4f28-894f-29e8722976af}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi";
              installation_mode = "force_installed";
            };
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            "info@virustotal.com" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/vt4browsers/latest.xpi";
              installation_mode = "force_installed";
            };
          };
          */
          Preferences =
            let
              locked = value: {
                "Value" = value;
                "Status" = "locked";
              };
            in
            {
              "browser.tabs.warnOnClose" = locked false;
              "widget.use-xdg-desktop-portal.file-picker" = locked 1;
            };
        };
        /*
          profiles.default = {
            settings = {
              "accessibility.typeaheadfind.flashBar" = 0;
              "app.normandy.first_run" = false;
              "app.normandy.migrationsApplied" = 12;
              "app.shield.optoutstudies.enabled" = true;
              "app.update.lastUpdateTime.addon-background-update-timer" = 1757125743;
              "app.update.lastUpdateTime.background-update-timer" = 1757190064;
              "app.update.lastUpdateTime.browser-cleanup-thumbnails" = 1757190064;
              "app.update.lastUpdateTime.region-update-timer" = 1756586924;
              "app.update.lastUpdateTime.services-settings-poll-changes" = 1757125743;
              "app.update.lastUpdateTime.suggest-ingest" = 1746477776;
              "app.update.lastUpdateTime.xpi-signature-verification" = 1757125743;
              "browser.bookmarks.addedImportButton" = true;
              "browser.bookmarks.editDialog.confirmationHintShowCount" = 3;
              "browser.bookmarks.restore_default_bookmarks" = false;
              "browser.bookmarks.showMobileBookmarks" = false;
              "browser.contentblocking.category" = "custom";
              "browser.contextual-services.contextId" = "{8100970a-d56e-4053-acdb-4fce4de94102}";
              "browser.ctrlTab.sortByRecentlyUsed" = true;
              "browser.discovery.enabled" = true;
              "browser.download.panel.shown" = true;
              "browser.download.save_converter_index" = 1;
              "browser.download.viewableInternally.typeWasRegistered.avif" = true;
              "browser.download.viewableInternally.typeWasRegistered.jxl" = true;
              "browser.download.viewableInternally.typeWasRegistered.webp" = true;
              "browser.eme.ui.firstContentShown" = true;
              "browser.engagement.ctrlTab.has-used" = true;
              "browser.engagement.downloads-button.has-used" = true;
              "browser.engagement.home-button.has-removed" = true;
              "browser.firefox-view.feature-tour" =
                "{\"message\":\"FIREFOX_VIEW_FEATURE_TOUR\",\"screen\":\"FEATURE_CALLOUT_1\",\"complete\":false}";
              "browser.laterrun.bookkeeping.profileCreationTime" = 1732277437;
              "browser.laterrun.bookkeeping.sessionCount" = 1;
              "browser.migration.version" = 158;
              "browser.ml.enable" = true;
              "browser.newtab.extensionControlled" = true;
              "browser.newtab.privateAllowed" = false;
              "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = true;
              "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = true;
              "browser.newtabpage.activity-stream.impressionId" = "{2ba8cfc6-d7d2-4b04-a024-445420e3fb73}";
              "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "google";
              "browser.newtabpage.activity-stream.showSponsored" = false;
              "browser.newtabpage.activity-stream.showSponsoredTopSites" = true;
              "browser.newtabpage.activity-stream.showWeather" = false;
              "browser.newtabpage.pinned" =
                "[null,{\"url\":\"https://google.com\",\"label\":\"@google\",\"searchTopSite\":true,\"baseDomain\":\"google.com\"}]";
              "browser.newtabpage.storageVersion" = 1;
              "browser.pageActions.persistedActions" =
                "{\"ids\":[\"bookmark\",\"_c607c8df-14a7-4f28-894f-29e8722976af_\",\"tab-stash_condordes_net\",\"_testpilot-containers\"],\"idsInUrlbar\":[\"_c607c8df-14a7-4f28-894f-29e8722976af_\",\"tab-stash_condordes_net\",\"_testpilot-containers\",\"bookmark\"],\"idsInUrlbarPreProton\":[],\"version\":1}";
              "browser.pagethumbnails.storage_version" = 3;
              "browser.policies.applied" = true;
              "browser.policies.runOncePerModification.setDefaultSearchEngine" = "DuckDuckGo";
              "browser.preferences.experimental.hidden" = true;
              "browser.protections_panel.infoMessage.seen" = true;
              "browser.proton.toolbar.version" = 3;
              "browser.region.update.updated" = 1756586924;
              "browser.rights.3.shown" = true;
              "browser.safebrowsing.downloads.enabled" = false;
              "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
              "browser.safebrowsing.malware.enabled" = false;
              "browser.safebrowsing.phishing.enabled" = false;
              "browser.safebrowsing.provider.mozilla.lastupdatetime" = "1757190034856";
              "browser.safebrowsing.provider.mozilla.nextupdatetime" = "1757211634856";
              "browser.search.region" = "US";
              "browser.search.serpEventTelemetryCategorization.regionEnabled" = true;
              "browser.search.suggest.enabled" = true;
              "browser.search.totalSearches" = 101;
              "browser.sessionstore.upgradeBackup.latestBuildID" = "20250828101435";
              "browser.shell.mostRecentDateSetAsDefault" = "1757190034";
              "browser.startup.couldRestoreSession.count" = 2;
              "browser.startup.homepage" = "https://glance.axioms.dev/";
              "browser.startup.homepage_override.buildID" = "20250902101725";
              "browser.startup.homepage_override.extensionControlled" = true;
              "browser.startup.homepage_override.mstone" = "142.0.1";
              "browser.startup.homepage_override.privateAllowed" = false;
              "browser.startup.lastColdStartupCheck" = 1757190035;
              "browser.startup.page" = 1;
              "browser.tabs.inTitlebar" = 0;
              "browser.termsofuse.prefMigrationCheck" = true;
              "browser.topsites.contile.cacheValidFor" = 10800;
              "browser.topsites.contile.cachedTiles" =
                "[{\"id\":74301,\"name\":\"Amazon\",\"url\":\"https://www.amazon.com/?tag=admarketus-20&ref=pd_sl_5f6c4549f9ba96b093c38d76143fb3bb4b7d72e8c1066c57ab23a496&mfadid=adm\",\"click_url\":\"https://bridge.sfo1.admarketplace.net/ctp?version=1.0.0&encp=jnEYxmwVJQkX5QbUftINI%3DwqgClnxGEkgClr4p8X4Zx_1CLdfZxnHnwqI%3DEYD%3DcYHFdZgF49DnIQfRNnCwjIfwwPDCc13%3DXuCdj6ilzDFnw43%3DuPFGv44cvlHZ74EccPFnd7swwuBCeIin3oCRv6Jlz9CGN43cqYFGvEfdwGBGw4fqDWCd3I7ReOgClWftaW7REkiCkX7RERiCkY7ndZj9eKiF3agCbnirjvIpkZ4CxafZLk4CqnxGEwxRwvIpkX4Cqa4pLY4Z2rfCbYfZfW1pLnJG4kjpkW7R7kHnWzIncTxmDnx93kiF2zftIqx%3D4vIpkW7ncWfZd4DZeaCc37jldCf9N1snukCEfWsDXD3G34DZekCq3QfD_lHZe1swE_CRv37n4ksFwqgC8nHr7wiF2z1pfWfBIWJ%3DwqgClWfpxnI94WHnwqgClWfCqnI94WHF3miF2zfCbXfBIqxreNjF3miF2z4QLYfBIqxrevJmwqgClk4QHnHF3ZJ%3DwqgCld1CLk1p8r4pxZfC8YfC8dfBIZJ%3DzkJREugClnIF_EDqWzClNefmIFE%3DLaEZIUxDuFC94wCwckflutEqIFfR3FsQEG3mjU3DEWfl_rBrvg7C7t3lD_id3Ns9IojCcOfQ4qBkc_BR8rIqjYCdje2dj5DYDY2RwYCk8mjFjp4E7YfrbkjEvTfmN1B%3DHY3ODY2RwXxwDXjQ2ZBrjU1pNvsnXFfnXa7C7%3DDwe1HE3Zj%3DcaIpw52kcRfq7HBlkXJnIQEkjc2RwF2BDY2QEeCEw42q3QHq32CdDd1ld1JEcRBwetjDcr7C4l7C4l7R7kJrfz6QTS1Y%2FM6OIviFfz5ClM5ClM5ClM5ClM5ClnHrbzftaZfCDW5pbTfCbX4tWW5pbTfCbW4YWT5tWTj%3DwTIG4W5%3D7NHmuniFXTGm4VJn3dHmwmI2yy\",\"image_url\":\"https://ads-img.mozilla.org/v1/images?image_data=CjoKOGh0dHBzOi8vYW1wLWFzc2V0LjQ1dHUxYzAuY29tL2Fzc2V0cy8xMDExLzE2MDI1MTczODUuanBnEiCPWEpTJukrjsNjZdZ-ENKI3O38x6nmTcNlFXn6RNaaQQ\",\"impression_url\":\"https://imp.mt48.net/static?id=7RHzfOIXjFEYsBdvIpkX4Cqa4pLY4Z2rfCbYfZfW1pLnj9wWIBdvIpkY7n4YIFckiGIw5FwqgCLZfplnx%3DXNHmEuIF%2Bk5FwqgClWfpxnHF2uxmETIF4kiFzU5FwqgCld1CLk1p8r4pxZfC8YfC8dfBIZJ%3Dzk5F%2BdJF7wxQkX\",\"image_size\":200},{\"id\":23100,\"name\":\"H&R Block\",\"url\":\"https://www.hrblock.com/lp/tax-filing/?otppartnerid=9695&campaignid=ps_mcm_9695_0000_fy25_lob-gct_999_p07_a08_1297_1711_privacy+tile_159848274710233088&mfadid=adm\",\"click_url\":\"https://bridge.sfo1.admarketplace.net/ctp?version=1.0.0&encp=jnEYxmwVJQkX5QbUftINI%3DwqgC8nxGEkgClr4p8X4Zx_1CLdfZxnHnwqI%3DEYD%3DcYHFdZgDdDECEg3clkCFvQfl_P3Gj4iqdPCD3R4tIWHQkXfpbUftIdj%3DqzfBIdImqzfOIuxr3WGmwqspkW7nuriF2zfZDrfCxrfZx_7RcdIG7_iF2zfCD_1p2afQxk4ZlWfQfZfpLa7ndZj92zftIYj%3D7TgFINJ94w7Rekj%3DwqgCbnI9eQiF2zftIQj9wvIpkY7n4YIFwqgCLXfpxnx%3DXvIpkXfpbr7n3Zx%3D7vIpkXfQbd7n3Zx%3DcqjnwqgClYfCDnI94WHGEqjnwqgCHm4pfnI94WiFzvIpkX4pf_7ncqxmXvIpkX4Cqa4pLY4Z2rfZlYfQlYfQxnxmXVj%3D_dJCkY7nEUEE7fgDX82C4nEw3%2F1cxr49E64qckj94gERIvJZ4UscwGIGIVimuUBmw1BpNYBp4ZBlcF2BDY2qLr3rcoDn2Ziq_cxlAWCEjWBcwP3r2Z1CNXjqvF3%3DwvjQlWEkIW7C7%3DxmI8BREr4%3DEHDwEdJnItCrwlfG%2FkC9bmBZ7lD9IECDwrxmwviRj33wcmiqd5D%3D3fEq3YJQEGfwcnCZ3DFl_BHCIp4r8wfqI5EDDdFRI6jODY3q7XEnzZ3RxdIFvO7C7%3D3%3DdS4c43EDvIiFz%2FCCjwElfwfqIoftDY3nu7itDY3nlkBCc57C7%3DCQHX2Z3DIEwZfC2kIDqmsF_aEm4usEeIJ%3DdGI%3DN4DQErJnXgjYDZ3tDZ3tIYj%3DzZgB%2FM6QTS1Y%2FniFwQgBkX1YkX1YkX1YkX1YkX7n4WgCbU4ZbWftWW5plY1CxTftWW5plWfpxT5tWT593vJ%3DEZxtXOHF4oInwTJczQJm_qjF4vjnDy\",\"image_url\":\"https://ads-img.mozilla.org/v1/images?image_data=CnAKbmh0dHBzOi8vYW1wLWFzc2V0LjQ1dHUxYzAuY29tL2Fzc2V0cy8xMjE1LzhhNzJiMjRhOGQzN2JmMWMwYTM1NzBmODEwYzRmZGViMjNhOGFmMTliY2E5NTljMzY0ZGQwZDU3NzdlMGVjY2UuSlBHEiDxYWBtSG7Qytmszjqjhon5RjLXYdlo1Ej7MGH3WaqUYg\",\"impression_url\":\"https://imp.mt48.net/static?id=7RHzfOIXjFEYsBdvIpkX4Cqa4pLY4Z2rfCbYfZfW1pLnj9wWIBdvIpkY7n4YIFckiGIw5FwqgCLXfpxnx%3DXNHmEuIF%2Bk5FwqgClWfpxnHF2uxmETIF4kiFzU5FwqgCld1CLk1p8r4pxZfC8YfC8Y4YIZJ%3Dzk5F%2BdJF7wxQkY\",\"image_size\":200},{\"id\":75169,\"name\":\"Temu\",\"url\":\"https://temuaffiliateprogram.pxf.io/Jz52V7?subId1=159848274710233088&mfadid=adm\",\"click_url\":\"https://bridge.sfo1.admarketplace.net/ctp?version=1.0.0&encp=jnEYxmwVJQkX5QbUftINI%3DwqgCfnxGEkgClr4p8X4Zx_1CLdfZxnHnwqI%3DEYD%3DcYHFdZgDdDECEg3clkCFvQfl_P3Gj4iqdPCD3R4tIWHQkXfpbUftIdj%3DqzfBIdImqzfOIuxr3WGmwqspkW7nuriF2zfZDa1pxYfZfZ7RcdIG7_iF2zfCD_1p2afQxk4ZlWfQfZfpLa7ndZj92zftIYj%3D7TgFINJ94w7Rekj%3DwqgCbnI9eQiF2zftIQj9wvIpkY7n4YIFwqgClW4pbr7ReTiF2zfCbW4YIqxreOiF2zfC2rftIqxreNI9IvIpkX4pfX7n3Zx%3DcdI9IvIpkafQ2_7n3Zx%3DwViF2zfCfkfYINI94TiF2zfCD_1p2afQxk4ZfXfQ8X4CfY7R4TJr3UjFkzfYIwJwEBCpdfBllZIwIDipNG4wqdjF4ojtDY2nN_4C3u2qXGfF4lCDjSiq3cEDcNsGIY2dE6iFxZxnkWsC44iE7nHnjEfw4djn_B1E46HQeQxReHiFdB3nutEmEeDEetild21pNWEnIqEEw3BlvE3pjo2GNRjkE1s9441pEDJRjrfwvp2FTa3Z3l7R7kJrfz6QTS1Y%2FM6OIviFfz5ClM5ClM5ClM5ClM5ClnHrbzftaY1C8W5pbTfQLa4OWW5pbTfCbW4YWT5tWTj%3DwTIG4W5%3D7NHmuniFXTGm4VJn3dHmwmI2yy\",\"image_url\":\"https://ads-img.mozilla.org/v1/images?image_data=CnAKbmh0dHBzOi8vYW1wLWFzc2V0LjQ1dHUxYzAuY29tL2Fzc2V0cy8xNDMxL2UxYjMxOGJkNDkzNDYyN2Q3MjZkNTFmOWM1ZDQyNTVjZWFhNjI0MWRkYmY4M2RmMDE5MGUyMjBiN2E4MWUyODUuanBnEiCF1FoJ1nRR2YvYgV1umBhTKA482BKOK56b6gVGpg0XUQ\",\"impression_url\":\"https://imp.mt48.net/static?id=7RHzfOIXjFEYsBdvIpkX4Cqa4pLY4Z2rfCbYfZfW1pLnj9wWIBdvIpkY7n4YIFckiGIw5FwqgClW4pbr7ReTHF4wJFEUjtdvIpkXfpbr7ncq5G4wJ%3DEQj%3DwVJOdvIpkX4Cqa4pLY4Z2rfZlYfQldfZ8nxmXVjtdUjFdOIG8zfWyy\",\"image_size\":200}]";
              "browser.topsites.contile.lastFetch" = 1746577409;
              "browser.translations.panelShown" = true;
              "browser.uiCustomization.state" =
                "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"_b86e4813-687a-43e6-ab65-0bde4ab75758_-browser-action\",\"smart-referer_meh_paranoid_pk-browser-action\",\"_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action\",\"treestyletab_piro_sakura_ne_jp-browser-action\",\"_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action\",\"plasma-browser-integration_kde_org-browser-action\",\"_acf82b50-48cf-4dd4-8059-5c949e754a65_-browser-action\",\"info_virustotal_com-browser-action\",\"skipredirect_sblask-browser-action\",\"cookieautodelete_kennydo_com-browser-action\",\"tab-stash_condordes_net-browser-action\",\"_74145f27-f039-47ce-a470-a662b129930a_-browser-action\",\"jid1-bofifl9vbdl2zq_jetpack-browser-action\",\"cookie_block_extension_gmail_com-browser-action\",\"kde-connect_0xc0dedbad_com-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"vertical-spacer\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"wrapper-sidebar-button\",\"unified-extensions-button\",\"ublock0_raymondhill_net-browser-action\",\"_c607c8df-14a7-4f28-894f-29e8722976af_-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"jordanlinkwarden_gmail_com-browser-action\",\"addon_darkreader_org-browser-action\",\"_testpilot-containers-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\"],\"vertical-tabs\":[],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"],\"zen-sidebar-top-buttons\":[],\"zen-sidebar-foot-buttons\":[\"downloads-button\",\"zen-workspaces-button\",\"zen-create-new-button\"],\"zen-sidebar-bottom-buttons\":[\"preferences-button\",\"zen-workspaces-button\",\"downloads-button\"],\"zen-sidebar-icons-wrapper\":[\"zen-profile-button\",\"preferences-button\",\"zen-workspaces-button\",\"downloads-button\"]},\"seen\":[\"developer-button\",\"_b86e4813-687a-43e6-ab65-0bde4ab75758_-browser-action\",\"smart-referer_meh_paranoid_pk-browser-action\",\"_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action\",\"treestyletab_piro_sakura_ne_jp-browser-action\",\"_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action\",\"_c607c8df-14a7-4f28-894f-29e8722976af_-browser-action\",\"plasma-browser-integration_kde_org-browser-action\",\"_acf82b50-48cf-4dd4-8059-5c949e754a65_-browser-action\",\"info_virustotal_com-browser-action\",\"skipredirect_sblask-browser-action\",\"cookieautodelete_kennydo_com-browser-action\",\"tab-stash_condordes_net-browser-action\",\"_74145f27-f039-47ce-a470-a662b129930a_-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_testpilot-containers-browser-action\",\"jordanlinkwarden_gmail_com-browser-action\",\"addon_darkreader_org-browser-action\",\"jid1-bofifl9vbdl2zq_jetpack-browser-action\",\"cookie_block_extension_gmail_com-browser-action\",\"kde-connect_0xc0dedbad_com-browser-action\",\"screenshot-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"vertical-tabs\",\"zen-sidebar-icons-wrapper\",\"PersonalToolbar\",\"unified-extensions-area\",\"TabsToolbar\",\"toolbar-menubar\",\"zen-sidebar-top-buttons\",\"zen-sidebar-bottom-buttons\",\"zen-sidebar-foot-buttons\"],\"currentVersion\":23,\"newElementCount\":7}";
              "browser.urlbar.placeholderName" = "DuckDuckGo";
              "browser.urlbar.quicksuggest.migrationVersion" = 2;
              "browser.urlbar.quicksuggest.scenario" = "offline";
              "browser.urlbar.recentsearches.lastDefaultChanged" = "1748922773563";
              "browser.urlbar.suggest.bookmark" = false;
              "browser.urlbar.suggest.history" = false;
              "browser.urlbar.suggest.openpage" = false;
              "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
              "browser.urlbar.suggest.quicksuggest.sponsored" = false;
              "browser.urlbar.suggest.topsites" = false;
              "browser.urlbar.tipShownCount.searchTip_redirect" = 4;
              "browser.warnOnQuitShortcut" = false;
              "captchadetection.hasUnsubmittedData" = false;
              "captchadetection.lastSubmission" = 1755876;
              "datareporting.dau.cachedUsageProfileGroupID" = "0702c47b-7642-4a36-8aa9-be36a714c5b5";
              "datareporting.dau.cachedUsageProfileID" = "beefbeef-beef-beef-beef-beeefbeefbee";
              "datareporting.usage.uploadEnabled" = false;
              "devtools.debugger.prefs-schema-version" = 11;
              "devtools.everOpened" = true;
              "devtools.netmonitor.columnsData" =
                "[{\"name\":\"status\",\"minWidth\":30,\"width\":6.45},{\"name\":\"method\",\"minWidth\":30,\"width\":6.43},{\"name\":\"domain\",\"minWidth\":30,\"width\":12.87},{\"name\":\"file\",\"minWidth\":30,\"width\":32.27},{\"name\":\"url\",\"minWidth\":30,\"width\":25},{\"name\":\"initiator\",\"minWidth\":30,\"width\":12.91},{\"name\":\"type\",\"minWidth\":30,\"width\":6.43},{\"name\":\"transferred\",\"minWidth\":30,\"width\":12.87},{\"name\":\"contentSize\",\"minWidth\":30,\"width\":6.45},{\"name\":\"waterfall\",\"minWidth\":150,\"width\":3.34}]";
              "devtools.netmonitor.msg.visibleColumns" = "[\"data\",\"time\"]";
              "devtools.toolbox.footer.height" = 526;
              "devtools.toolbox.host" = "window";
              "devtools.toolbox.previousHost" = "bottom";
              "devtools.toolbox.selectedTool" = "netmonitor";
              "devtools.toolsidebar-height.inspector" = 350;
              "devtools.toolsidebar-width.inspector" = 700;
              "devtools.toolsidebar-width.inspector.splitsidebar" = 350;
              "distribution.iniFile.exists.appversion" = "1.15.3b";
              "distribution.iniFile.exists.value" = false;
              "doh-rollout.disable-heuristics" = true;
              "doh-rollout.doneFirstRun" = true;
              "doh-rollout.home-region" = "US";
              "dom.forms.autocomplete.formautofill" = true;
              "dom.push.userAgentID" = "ba1bbab49186456ea45e64ebd078169c";
              "dom.security.https_only_mode_ever_enabled" = true;
              "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
              "extensions.blocklist.pingCountVersion" = -1;
              "extensions.colorway-builtin-themes-cleanup" = 1;
              "extensions.databaseSchema" = 37;
              "extensions.formautofill.addresses.enabled" = false;
              "extensions.formautofill.creditCards.enabled" = false;
              "extensions.getAddons.cache.lastUpdate" = 1746477777;
              "extensions.getAddons.databaseSchema" = 6;
              "extensions.lastAppBuildId" = "20250902101725";
              "extensions.lastAppVersion" = "1.15.3b";
              "extensions.lastPlatformVersion" = "142.0.1";
              "extensions.pendingOperations" = false;
              "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
              "extensions.quarantinedDomains.list" =
                "autoatendimento.bb.com.br,ibpf.sicredi.com.br,ibpj.sicredi.com.br,internetbanking.caixa.gov.br,www.ib12.bradesco.com.br,www2.bancobrasil.com.br";
              "extensions.signatureCheckpoint" = 1;
              "extensions.systemAddonSet" =
                "{\"schema\":1,\"directory\":\"{a22354ed-f17e-40cb-9862-19488d0ef9d0}\",\"addons\":{}}";
              "extensions.ui.dictionary.hidden" = true;
              "extensions.ui.extension.hidden" = false;
              "extensions.ui.lastCategory" = "addons://list/extension";
              "extensions.ui.locale.hidden" = true;
              "extensions.ui.mlmodel.hidden" = true;
              "extensions.ui.sitepermission.hidden" = true;
              "extensions.webcompat.enable_shims" = true;
              "extensions.webcompat.perform_injections" = true;
              "extensions.webcompat.perform_ua_overrides" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.@testpilot-containers" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.CookieAutoDelete@kennydo.com" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.cookie.block.extension@gmail.com" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.info@virustotal.com" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.jid1-BoFifL9Vbdl2zQ@jetpack" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.jordanlinkwarden@gmail.com" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.plasma-browser-integration@kde.org" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.screenshots@mozilla.org" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.skipredirect@sblask" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.smart-referer@meh.paranoid.pk" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.tab-stash@condordes.net" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.treestyletab@piro.sakura.ne.jp" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net" = true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{446900e4-71c2-419f-a6a7-df9c091e268b}" =
                true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{74145f27-f039-47ce-a470-a662b129930a}" =
                true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{762f9885-5a13-4abd-9c77-433dcd38b8fd}" =
                true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{7fc8ef53-24ec-4205-87a4-1e745953bb0d}" =
                true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{acf82b50-48cf-4dd4-8059-5c949e754a65}" =
                true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{b86e4813-687a-43e6-ab65-0bde4ab75758}" =
                true;
              "extensions.webextensions.ExtensionStorageIDB.migrated.{c607c8df-14a7-4f28-894f-29e8722976af}" =
                true;
              "extensions.webextensions.uuids" =
                "{\"formautofill@mozilla.org\":\"c2360c03-8bb3-4005-b73d-3be3c8f11e8b\",\"pictureinpicture@mozilla.org\":\"1e3ce02d-24ca-403e-987c-c5a491d1f567\",\"screenshots@mozilla.org\":\"4ad1a4d9-492e-4f77-9b1c-268dd136e489\",\"webcompat-reporter@mozilla.org\":\"05b686c8-b45c-4344-acb6-016381ccb28c\",\"webcompat@mozilla.org\":\"9a310967-e580-48bf-b3e8-4eafebbc122d\",\"firefox-compact-dark@mozilla.org\":\"f190c72a-6467-4d28-bc8c-b00f54cbfd22\",\"addons-search-detection@mozilla.com\":\"23e10c52-42ff-4699-93d5-eef4cec2f59f\",\"{b86e4813-687a-43e6-ab65-0bde4ab75758}\":\"a55512b7-e110-4cb9-809f-10a1b407c1ef\",\"notes@mozilla.com\":\"f66762af-000a-4326-adbc-de09588c9243\",\"smart-referer@meh.paranoid.pk\":\"c4f27a2b-db87-43b5-9bc4-e15ca4f7ee5a\",\"{7fc8ef53-24ec-4205-87a4-1e745953bb0d}\":\"0a4d9ede-c590-4e43-a2b4-b0d3b85ff955\",\"treestyletab@piro.sakura.ne.jp\":\"7d0d867a-9590-4895-af3d-04aeefc8f726\",\"{762f9885-5a13-4abd-9c77-433dcd38b8fd}\":\"f9062e84-107a-4922-b227-80c44b26587f\",\"{c607c8df-14a7-4f28-894f-29e8722976af}\":\"dbe3e7b6-cb81-414d-b5ae-11dbd3ba8f42\",\"plasma-browser-integration@kde.org\":\"3cddeb08-2798-481b-90bb-f351800aa6eb\",\"{acf82b50-48cf-4dd4-8059-5c949e754a65}\":\"661491ab-5ae1-4ee2-b68d-4a733dbef284\",\"info@virustotal.com\":\"dfa0cfcf-5c6d-460c-ad9f-dee84127b7af\",\"skipredirect@sblask\":\"537f77b8-61c4-47e6-a3af-ab54b657a5ce\",\"{e1c38463-46f4-46c7-bc71-1b82125a8fc4}\":\"290fd05d-dc40-461b-9c11-33ae9f237254\",\"CookieAutoDelete@kennydo.com\":\"ada9a9ba-96c8-4b6f-bb93-f06b51f855f2\",\"tab-stash@condordes.net\":\"dd5ca9f9-8982-467a-ae37-7d0defc5a3ca\",\"@vivaldi-fox\":\"0d0ef3e1-accb-4e54-8b66-4117cca425d6\",\"{74145f27-f039-47ce-a470-a662b129930a}\":\"a5ab7118-dd5b-4f24-98ee-d35c5e31de46\",\"{446900e4-71c2-419f-a6a7-df9c091e268b}\":\"d12a31e2-8f52-4d6a-bc88-fa9b6ac05a1b\",\"uBlock0@raymondhill.net\":\"f5c7b259-0a84-4ae1-ab71-4e4b49313e3f\",\"@testpilot-containers\":\"09f0ef75-ba13-4792-b05a-2a71be84e1d4\",\"jordanlinkwarden@gmail.com\":\"a86605f3-7cc4-4acf-a996-bb2e3e778ccd\",\"addon@darkreader.org\":\"9e411d1c-c9e5-41da-82f5-65561b67bc8d\",\"jid1-BoFifL9Vbdl2zQ@jetpack\":\"793e5da0-ac24-4e4e-883c-30704b16e416\",\"cookie.block.extension@gmail.com\":\"00b40997-6fa5-498a-870e-d72300b721c4\",\"hotfix-intermediate-2018@mozilla.com\":\"4a6258a4-b24b-48e1-b8ad-d0f40ea3d485\",\"newtab@mozilla.org\":\"55269e70-1b37-4e58-89e3-2b04a70f55cc\"}";
              "gecko.handlerService.defaultHandlersVersion" = 1;
              "general.autoScroll" = true;
              "general.useragent.override" =
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0; rv:139.359.237) Gecko/20100101 Firefox/139.359.237";
              "gfx.blacklist.accelerated-canvas2d.failureid" = "FEATURE_FAILURE_DL_BLOCKLIST_NO_ID";
              "identity.fxaccounts.account.device.name" = "axiom’s Zen Browser on Virgo";
              "identity.fxaccounts.account.telemetry.sanitized_uid" = "c6d59900742620c30d0bd826cf178deb";
              "identity.fxaccounts.commands.missed.last_fetch" = 1757128217;
              "identity.fxaccounts.lastSignedInUserHash" = "gEYmfyCIqeUuFUIfZLJyJiCZijsu8bQNEokrGxKBALY=";
              "idle.lastDailyNotification" = 1757126572;
              "layout.css.prefers-color-scheme.content-override" = 0;
              "media.autoplay.default" = 0;
              "media.gmp-gmpopenh264.abi" = "x86_64-gcc3";
              "media.gmp-gmpopenh264.hashValue" =
                "f5246bf14d038adf4ce0c4360262ab722bc3de4220f047c3d542b4c564074b4877dc8659e3125c5171c749e7ce93f20cc63777eb5e1539e960670cbc5f30ac85";
              "media.gmp-gmpopenh264.lastDownload" = 1742530815;
              "media.gmp-gmpopenh264.lastInstallStart" = 1742530815;
              "media.gmp-gmpopenh264.lastUpdate" = 1742530815;
              "media.gmp-gmpopenh264.version" = "2.6.0";
              "media.gmp-manager.buildID" = "20250902101725";
              "media.gmp-manager.lastCheck" = 1757190323;
              "media.gmp-manager.lastEmptyCheck" = 1757190323;
              "media.gmp-widevinecdm.abi" = "x86_64-gcc3";
              "media.gmp-widevinecdm.hashValue" =
                "f12ff815141099000ef7027b406260f0a515c544209b9fe8125ea5f4ddbf58601d30222ac41a013eb0a43da76ba70414a4ad16617d9f219f19cdfc7794d9bc94";
              "media.gmp-widevinecdm.lastDownload" = 1742530816;
              "media.gmp-widevinecdm.lastInstallStart" = 1742530815;
              "media.gmp-widevinecdm.lastUpdate" = 1742530816;
              "media.gmp-widevinecdm.version" = "4.10.2891.0";
              "media.gmp.storage.version.observed" = 1;
              "media.videocontrols.picture-in-picture.video-toggle.first-seen-secs" = 1732335108;
              "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
              "mod.superpins.essentials.grid-count" = "1";
              "mod.superpins.pins.grid-count" = "1";
              "network.cookie.CHIPS.lastMigrateDatabase" = 2;
              "network.dns.disablePrefetch" = true;
              "network.http.speculative-parallel-limit" = 0;
              "network.predictor.enabled" = false;
              "network.prefetch-next" = false;
              "network.trr.mode" = 5;
              "nimbus.migrations.after-remote-settings-update" = 0;
              "nimbus.migrations.after-store-initialized" = 2;
              "nimbus.migrations.init-started" = 0;
              "nimbus.profileId" = "92e46997-ff5e-4eeb-b61e-81ef70ee2a75";
              "pdfjs.enableAltText" = true;
              "pdfjs.enableAltTextForEnglish" = true;
              "pdfjs.enabledCache.state" = true;
              "pdfjs.migrationVersion" = 2;
              "places.database.lastMaintenance" = 1757040172;
              "pref.downloads.disable_button.edit_actions" = false;
              "pref.privacy.disable_button.cookie_exceptions" = false;
              "print_printer" = "Mozilla Save to PDF";
              "privacy.bounceTrackingProtection.hasMigratedUserActivationData" = true;
              "privacy.clearHistory.siteSettings" = true;
              "privacy.clearOnShutdown.cookies" = false;
              "privacy.clearOnShutdown.sessions" = false;
              "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
              "privacy.clearOnShutdown_v2.formdata" = true;
              "privacy.globalprivacycontrol.was_ever_enabled" = true;
              "privacy.history.custom" = true;
              "privacy.purge_trackers.date_in_cookie_database" = "0";
              "privacy.sanitize.clearOnShutdown.hasMigratedToNewPrefs3" = true;
              "privacy.sanitize.cpd.hasMigratedToNewPrefs2" = true;
              "privacy.sanitize.pending" =
                "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"formdata\",\"browsingHistoryAndDownloads\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]";
              "privacy.sanitize.sanitizeOnShutdown" = true;
              "privacy.trackingprotection.allow_list.baseline.enabled" = false;
              "privacy.trackingprotection.allow_list.convenience.enabled" = false;
              "privacy.trackingprotection.allow_list.hasMigratedCategoryPrefs" = true;
              "privacy.userContext.extension" = "@testpilot-containers";
              "security.disable_button.openCertManager" = false;
              "security.disable_button.openDeviceManager" = false;
              "services.settings.blocklists.addons-bloomfilters.last_check" = 1757192693;
              "services.settings.blocklists.gfx.last_check" = 1757192693;
              "services.settings.clock_skew_seconds" = -2653;
              "services.settings.last_etag" = "\"1757183782205\"";
              "services.settings.last_update_seconds" = 1757192693;
              "services.settings.main.addons-manager-settings.last_check" = 1757192693;
              "services.settings.main.anti-tracking-url-decoration.last_check" = 1757192693;
              "services.settings.main.bounce-tracking-protection-exceptions.last_check" = 1757192693;
              "services.settings.main.cfr.last_check" = 1757192693;
              "services.settings.main.cookie-banner-rules-list.last_check" = 1757192693;
              "services.settings.main.devtools-compatibility-browsers.last_check" = 1757192693;
              "services.settings.main.devtools-devices.last_check" = 1757192693;
              "services.settings.main.doh-config.last_check" = 1757192693;
              "services.settings.main.doh-providers.last_check" = 1757192693;
              "services.settings.main.fingerprinting-protection-overrides.last_check" = 1757192693;
              "services.settings.main.hijack-blocklists.last_check" = 1757192693;
              "services.settings.main.language-dictionaries.last_check" = 1757192693;
              "services.settings.main.message-groups.last_check" = 1757192693;
              "services.settings.main.moz-essential-domain-fallbacks.last_check" = 1757192693;
              "services.settings.main.newtab-wallpapers-v2.last_check" = 1757192693;
              "services.settings.main.nimbus-desktop-experiments.last_check" = 1757192693;
              "services.settings.main.nimbus-secure-experiments.last_check" = 1757192693;
              "services.settings.main.normandy-recipes-capabilities.last_check" = 1757192693;
              "services.settings.main.partitioning-exempt-urls.last_check" = 1757192693;
              "services.settings.main.password-recipes.last_check" = 1757192693;
              "services.settings.main.password-rules.last_check" = 1757192693;
              "services.settings.main.public-suffix-list.last_check" = 1757192693;
              "services.settings.main.query-stripping.last_check" = 1757192693;
              "services.settings.main.remote-permissions.last_check" = 1757192693;
              "services.settings.main.search-categorization.last_check" = 1757192693;
              "services.settings.main.search-config-icons.last_check" = 1757192693;
              "services.settings.main.search-config-overrides-v2.last_check" = 1757192693;
              "services.settings.main.search-config-v2.last_check" = 1757192693;
              "services.settings.main.search-default-override-allowlist.last_check" = 1757192693;
              "services.settings.main.search-telemetry-v2.last_check" = 1757192693;
              "services.settings.main.sites-classification.last_check" = 1757192693;
              "services.settings.main.third-party-cookie-blocking-exempt-urls.last_check" = 1757192693;
              "services.settings.main.tippytop.last_check" = 1757192693;
              "services.settings.main.top-sites.last_check" = 1757192693;
              "services.settings.main.tracking-protection-lists.last_check" = 1757192693;
              "services.settings.main.translations-models.last_check" = 1757192693;
              "services.settings.main.translations-wasm.last_check" = 1757192693;
              "services.settings.main.url-classifier-exceptions.last_check" = 1757192693;
              "services.settings.main.url-classifier-skip-urls.last_check" = 1757192693;
              "services.settings.main.url-parser-default-unknown-schemes-interventions.last_check" = 1757192693;
              "services.settings.main.urlbar-persisted-search-terms.last_check" = 1757192693;
              "services.settings.main.websites-with-shared-credential-backends.last_check" = 1757192693;
              "services.settings.security-state.cert-revocations.last_check" = 1757128739;
              "services.settings.security-state.intermediates.last_check" = 1757128739;
              "services.settings.security-state.onecrl.last_check" = 1757128739;
              "services.sync.addons.lastSync" = "1754499246.63";
              "services.sync.addons.syncID" = "iusZtxXkVSIo";
              "services.sync.addresses.lastSync" = "0";
              "services.sync.client.GUID" = "OxTxpB00dXE_";
              "services.sync.client.syncID" = "kL2qczmPQsBF";
              "services.sync.clients.devices.desktop" = 1;
              "services.sync.clients.devices.mobile" = 0;
              "services.sync.clients.lastRecordUpload" = 1757124615;
              "services.sync.clients.lastSync" = "0";
              "services.sync.clients.syncID" = "GtogapQMxI0S";
              "services.sync.creditcards.lastSync" = "0";
              "services.sync.declinedEngines" = "passwords,addresses,creditcards";
              "services.sync.engine.addresses.available" = true;
              "services.sync.engine.passwords" = false;
              "services.sync.engine.prefs.modified" = false;
              "services.sync.engine.workspaces" = true;
              "services.sync.forms.lastSync" = "1733072872.86";
              "services.sync.forms.syncID" = "92WhX5AIAkSB";
              "services.sync.globalScore" = 0;
              "services.sync.lastPing" = 1757131818;
              "services.sync.lastversion" = "1.134.0";
              "services.sync.nextSync" = 1757193634;
              "services.sync.prefs.lastSync" = "1757124615.89";
              "services.sync.prefs.sync-seen.app.shield.optoutstudies.enabled" = true;
              "services.sync.prefs.sync-seen.browser.contentblocking.category" = true;
              "services.sync.prefs.sync-seen.browser.ctrlTab.sortByRecentlyUsed" = true;
              "services.sync.prefs.sync-seen.browser.discovery.enabled" = true;
              "services.sync.prefs.sync-seen.browser.firefox-view.feature-tour" = true;
              "services.sync.prefs.sync-seen.browser.formfill.enable" = true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
                true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
                true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.feeds.section.topstories" = true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.feeds.topsites" = true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.section.highlights.includePocket" =
                true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.showSponsored" = true;
              "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.showSponsoredTopSites" = true;
              "services.sync.prefs.sync-seen.browser.newtabpage.pinned" = true;
              "services.sync.prefs.sync-seen.browser.safebrowsing.downloads.enabled" = true;
              "services.sync.prefs.sync-seen.browser.safebrowsing.downloads.remote.block_potentially_unwanted" =
                true;
              "services.sync.prefs.sync-seen.browser.safebrowsing.malware.enabled" = true;
              "services.sync.prefs.sync-seen.browser.safebrowsing.phishing.enabled" = true;
              "services.sync.prefs.sync-seen.browser.startup.homepage" = true;
              "services.sync.prefs.sync-seen.browser.startup.page" = true;
              "services.sync.prefs.sync-seen.browser.urlbar.suggest.bookmark" = true;
              "services.sync.prefs.sync-seen.browser.urlbar.suggest.history" = true;
              "services.sync.prefs.sync-seen.browser.urlbar.suggest.openpage" = true;
              "services.sync.prefs.sync-seen.browser.urlbar.suggest.topsites" = true;
              "services.sync.prefs.sync-seen.dom.security.https_only_mode" = true;
              "services.sync.prefs.sync-seen.dom.security.https_only_mode_ever_enabled" = true;
              "services.sync.prefs.sync-seen.extensions.activeThemeID" = true;
              "services.sync.prefs.sync-seen.general.autoScroll" = true;
              "services.sync.prefs.sync-seen.media.autoplay.default" = true;
              "services.sync.prefs.sync-seen.media.eme.enabled" = true;
              "services.sync.prefs.sync-seen.pref.downloads.disable_button.edit_actions" = true;
              "services.sync.prefs.sync-seen.pref.privacy.disable_button.cookie_exceptions" = true;
              "services.sync.prefs.sync-seen.privacy.clearOnShutdown.cookies" = true;
              "services.sync.prefs.sync-seen.privacy.clearOnShutdown.sessions" = true;
              "services.sync.prefs.sync-seen.privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
              "services.sync.prefs.sync-seen.privacy.clearOnShutdown_v2.formdata" = true;
              "services.sync.prefs.sync-seen.privacy.globalprivacycontrol.enabled" = true;
              "services.sync.prefs.sync-seen.privacy.sanitize.sanitizeOnShutdown" = true;
              "services.sync.prefs.sync-seen.privacy.trackingprotection.enabled" = true;
              "services.sync.prefs.sync-seen.privacy.userContext.enabled" = true;
              "services.sync.prefs.sync-seen.signon.autofillForms" = true;
              "services.sync.prefs.sync-seen.signon.generation.enabled" = true;
              "services.sync.prefs.sync-seen.signon.management.page.breach-alerts.enabled" = true;
              "services.sync.prefs.sync-seen.signon.rememberSignons" = true;
              "services.sync.prefs.syncID" = "lDUVmZeJ1dWw";
              "services.sync.syncInterval" = 3600000;
              "services.sync.syncThreshold" = 1000;
              "services.sync.username" = "atomic.axioms.sm+firefox@gmail.com";
              "services.sync.workspaces.lastSync" = "1752520937.96";
              "services.sync.workspaces.syncID" = "nOF-kgfv4vFi";
              "sidebar.backupState" =
                "{\"command\":\"\",\"panelOpen\":false,\"launcherExpanded\":false,\"launcherVisible\":false}";
              "sidebar.old-sidebar.has-used" = true;
              "sidebar.visibility" = "hide-sidebar";
              "signon.autofillForms" = false;
              "signon.generation.enabled" = false;
              "signon.management.page.breach-alerts.enabled" = false;
              "signon.rememberSignons" = false;
              "storage.vacuum.last.content-prefs.sqlite" = 1755386955;
              "storage.vacuum.last.index" = 2;
              "storage.vacuum.last.places.sqlite" = 1755120045;
              "theme.no_gaps.border" = true;
              "theme.no_gaps.rounded_corners" = false;
              "theme.no_gaps.split.border" = true;
              "theme.no_gaps.split.enabled" = false;
              "theme.no_gaps.split.rounded_corners" = true;
              "toolkit.profiles.storeID" = "0598f586";
              "toolkit.startup.last_success" = 1757190033;
              "toolkit.telemetry.cachedClientID" = "990c00fa-22ed-4e6f-94be-e7a04313ad1b";
              "toolkit.telemetry.cachedProfileGroupID" = "438b64fb-e3e0-405f-8dd9-790d4ac73f66";
              "toolkit.telemetry.reportingpolicy.firstRun" = false;
              "uc.erics-zen-ui-tweak-box.exit-button-padding-right.enabled" = false;
              "uc.erics-zen-ui-tweak-box.floating-url-bar-tweaks.enabled" = false;
              "uc.erics-zen-ui-tweak-box.fun-colors.enabled" = false;
              "uc.erics-zen-ui-tweak-box.new-tab-button-text.enabled" = false;
              "uc.erics-zen-ui-tweak-box.new-tab-separator-when-no-unpinned-tabs.enabled" = false;
              "uc.erics-zen-ui-tweak-box.page-canvas-shadows.enabled" = false;
              "uc.erics-zen-ui-tweak-box.pinned-tabs-layout.enabled" = false;
              "uc.erics-zen-ui-tweak-box.remove-url-bar-border.enabled" = false;
              "uc.erics-zen-ui-tweak-box.tab-bar-top-padding.enabled" = false;
              "uc.erics-zen-ui-tweak-box.tab-button-tweaks.enabled" = false;
              "uc.erics-zen-ui-tweak-box.toolbar-button-tweaks.enabled" = false;
              "uc.erics-zen-ui-tweak-box.url-bar-tweaks.enabled" = false;
              "uc.erics-zen-ui-tweak-box.workspace-button-tweaks.enabled" = false;
              "uc.essentials.gap" = "Normal";
              "uc.essentials.width" = "Normal";
              "uc.pins.bg" = true;
              "uc.private-browsing-top-bar.border-style" = "default";
              "uc.private-browsing-top-bar.color" = "pink";
              "uc.private-browsing-top-bar.highlighting-style" = "gradient";
              "uc.tabs.custom_color_hex" = "#ffffff";
              "uc.tabs.dim_unloaded" = false;
              "uc.tabs.preferred_color" = "primary";
              "uc.tabs.show-separator" = "pinned-shown";
              "uc.urlbar.blur-intensity" = "Subtle";
              "uc.urlbar.border" = true;
              "uc.urlbar.border-radius" = true;
              "uc.urlbar.custom-bg-color" = "#312B3B";
              "uc.urlbar.custom-bg-color.mode" = "AlwaysColor";
              "uc.urlbar.icon.bookmark.removed" = true;
              "uc.urlbar.icon.pip.removed" = true;
              "uc.urlbar.icon.reader-mode.removed" = true;
              "uc.urlbar.icon.show-on-hover" = true;
              "uc.urlbar.icon.split-view.removed" = true;
              "uc.urlbar.icon.zoom.removed" = true;
              "uc.urlbar.move-icon-into" = false;
              "uc.urltext.center" = "";
              "zen.keyboard.shortcuts.version" = 9;
              "zen.migration.version" = 5;
              "zen.mods.last-update" = 1757007676;
              "zen.mods.milestone" = "1.15.3b";
              "zen.splitView.change-on-hover" = true;
              "zen.theme.accent-color" = "#d4bbff";
              "zen.theme.color-prefs.colorful" = true;
              "zen.theme.color-prefs.use-workspace-colors" = false;
              "zen.theme.gradient-legacy-version" = 1;
              "zen.themes.disable-all" = false;
              "zen.themes.updated-value-observer" = true;
              "zen.ui.migration.version" = 3;
              "zen.updates.last-build-id" = "20250902101725";
              "zen.urlbar.replace-newtab" = false;
              "zen.view.compact.should-enable-at-startup" = false;
              "zen.welcome-screen.seen" = true;
              "zen.welcomeScreen.seen" = true;
              "zen.workspaces.active" = "b5127d48-7434-472b-954b-c0baf9d207bd";
              "zen.workspaces.separate-essentials" = false;
              "zen.workspaces.show-workspace-indicator" = false;
            };
          };
        */
      };
    };
}
