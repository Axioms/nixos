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

      programs.firefox = {
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
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
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

        profiles.default = {
          settings = {
            "accessibility.typeaheadfind.flashBar" = 0;
            "app.normandy.first_run" = false;
            "app.normandy.migrationsApplied" = 12;
            "app.normandy.user_id" = "092d7478-9677-4236-a15f-0ee335d3501f";
            "app.update.lastUpdateTime.addon-background-update-timer" = 1757195784;
            "app.update.lastUpdateTime.browser-cleanup-thumbnails" = 1757195784;
            "app.update.lastUpdateTime.recipe-client-addon-run" = 1757195784;
            "app.update.lastUpdateTime.region-update-timer" = 1757195784;
            "app.update.lastUpdateTime.rs-experiment-loader-timer" = 1757195755;
            "app.update.lastUpdateTime.services-settings-poll-changes" = 1757195784;
            "app.update.lastUpdateTime.suggest-ingest" = 1757195784;
            "app.update.lastUpdateTime.telemetry_modules_ping" = 1750475524;
            "app.update.lastUpdateTime.xpi-signature-verification" = 1757195784;
            "browser.bookmarks.addedImportButton" = true;
            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.contentblocking.category" = "standard";
            "browser.contextual-services.contextId" = "45424917-d447-4fb4-8c22-f4e024d70309";
            "browser.contextual-services.contextId.timestamp-in-seconds" = 1755465158;
            "browser.download.panel.shown" = true;
            "browser.download.viewableInternally.typeWasRegistered.avif" = true;
            "browser.download.viewableInternally.typeWasRegistered.webp" = true;
            "browser.engagement.fxa-toolbar-menu-button.has-used" = true;
            "browser.engagement.sidebar-button.has-used" = true;
            "browser.laterrun.bookkeeping.profileCreationTime" = 1739323456;
            "browser.laterrun.bookkeeping.sessionCount" = 1;
            "browser.migration.version" = 158;
            "browser.ml.chat.nimbus" =
              "simplified-chatbot-onboarding-short-copy-1-step-rollout:treatment-c-short-copy-1-step";
            "browser.ml.linkPreview.enabled" = true;
            "browser.ml.linkPreview.nimbus" = "link-previews-mvp:long-press-preview";
            "browser.ml.linkPreview.onboardingTimes" = "1751474343106,1752652708331";
            "browser.ml.linkPreview.shift" = false;
            "browser.newtabpage.activity-stream.discoverystream.merino-feed-experiment" = true;
            "browser.newtabpage.activity-stream.discoverystream.publisherFavicon.enabled" = true;
            "browser.newtabpage.activity-stream.discoverystream.refinedCardsLayout.enabled" = true;
            "browser.newtabpage.activity-stream.discoverystream.sections.customizeMenuPanel.enabled" = true;
            "browser.newtabpage.activity-stream.discoverystream.sections.enabled" = true;
            "browser.newtabpage.activity-stream.discoverystream.sections.interestPicker.visibleSections" =
              "top_stories_section,arts,education-science,tv,food,government,health,sports,education,nhl,business,tech,movies,nba,music,nfl,mlb,soccer";
            "browser.newtabpage.activity-stream.discoverystream.sections.personalization.enabled" = true;
            "browser.newtabpage.activity-stream.impressionId" = "{8da0e47b-f540-46b0-b7ce-337c27ab1677}";
            "browser.newtabpage.storageVersion" = 1;
            "browser.pageActions.persistedActions" =
              "{\"ids\":[\"bookmark\"],\"idsInUrlbar\":[\"bookmark\"],\"idsInUrlbarPreProton\":[],\"version\":1}";
            "browser.pagethumbnails.storage_version" = 3;
            "browser.proton.toolbar.version" = 3;
            "browser.region.update.updated" = 1757195784;
            "browser.rights.3.shown" = true;
            "browser.safebrowsing.provider.google4.lastupdatetime" = "1757195758683";
            "browser.safebrowsing.provider.google4.nextupdatetime" = "1757197579683";
            "browser.safebrowsing.provider.mozilla.lastupdatetime" = "1757195758803";
            "browser.safebrowsing.provider.mozilla.nextupdatetime" = "1757217358803";
            "browser.search.region" = "US";
            "browser.search.serpEventTelemetryCategorization.regionEnabled" = true;
            "browser.search.totalSearches" = 18;
            "browser.sessionstore.upgradeBackup.latestBuildID" = "20250807161057";
            "browser.shopping.experience2023.active" = false;
            "browser.shopping.experience2023.autoActivateCount" = 2;
            "browser.shopping.experience2023.firstImpressionTime" = 1743825213;
            "browser.shopping.experience2023.lastAutoActivate" = 1741635576;
            "browser.shopping.experience2023.optedIn" = 1;
            "browser.shopping.experience2023.sidebarWidth" = 320;
            "browser.shopping.experience2023.survey.hasSeen" = true;
            "browser.shopping.experience2023.survey.optedInTime" = 1743825215;
            "browser.shopping.experience2023.survey.pdpVisits" = 5;
            "browser.startup.couldRestoreSession.count" = 2;
            "browser.startup.homepage_override.buildID" = "20250827105350";
            "browser.startup.homepage_override.mstone" = "142.0.1";
            "browser.startup.lastColdStartupCheck" = 1757195755;
            "browser.termsofuse.prefMigrationCheck" = true;
            "browser.toolbarbuttons.introduced.sidebar-button" = true;
            "browser.topsites.contile.cacheValidFor" = 10800;
            "browser.topsites.contile.lastFetch" = 1757195755;
            "browser.uiCustomization.state" =
              "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"sidebar-button\",\"back-button\",\"forward-button\",\"stop-reload-button\",\"vertical-spacer\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"fxa-toolbar-menu-button\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"firefox-view-button\",\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"vertical-tabs\":[],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"screenshot-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"vertical-tabs\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\"],\"currentVersion\":23,\"newElementCount\":2}";
            "browser.urlbar.placeholderName" = "Google";
            "browser.urlbar.placeholderName.private" = "Google";
            "browser.urlbar.quicksuggest.dynamicSuggestionTypes" = "vpn";
            "browser.urlbar.quicksuggest.migrationVersion" = 2;
            "browser.urlbar.quicksuggest.scenario" = "offline";
            "browser.urlbar.tipShownCount.searchTip_onboard" = 4;
            "captchadetection.hasUnsubmittedData" = false;
            "captchadetection.lastSubmission" = 1744661;
            "datareporting.dau.cachedUsageProfileGroupID" = "ae37f118-115f-474b-91b3-30af5dd47cba";
            "datareporting.dau.cachedUsageProfileID" = "afd068fd-4b09-4233-80ae-788a9054ff20";
            "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
            "datareporting.policy.dataSubmissionPolicyNotifiedTime" = "1739323457098";
            "devtools.everOpened" = true;
            "devtools.netmonitor.columnsData" =
              "[{\"name\":\"override\",\"minWidth\":20,\"width\":2},{\"name\":\"status\",\"minWidth\":30,\"width\":5.72},{\"name\":\"method\",\"minWidth\":30,\"width\":5.72},{\"name\":\"domain\",\"minWidth\":30,\"width\":11.43},{\"name\":\"file\",\"minWidth\":30,\"width\":28.57},{\"name\":\"url\",\"minWidth\":30,\"width\":25},{\"name\":\"initiator\",\"minWidth\":30,\"width\":11.43},{\"name\":\"type\",\"minWidth\":30,\"width\":5.72},{\"name\":\"transferred\",\"minWidth\":30,\"width\":11.43},{\"name\":\"contentSize\",\"minWidth\":30,\"width\":5.72},{\"name\":\"waterfall\",\"minWidth\":150,\"width\":14.29}]";
            "devtools.netmonitor.msg.visibleColumns" = "[\"data\",\"time\"]";
            "devtools.toolbox.footer.height" = 623;
            "devtools.toolbox.host" = "window";
            "devtools.toolbox.previousHost" = "bottom";
            "devtools.toolbox.selectedTool" = "netmonitor";
            "devtools.toolsidebar-height.inspector" = 350;
            "devtools.toolsidebar-width.inspector" = 700;
            "devtools.toolsidebar-width.inspector.splitsidebar" = 350;
            "distribution.archlinux.bookmarksProcessed" = true;
            "distribution.iniFile.exists.appversion" = "142.0.1";
            "distribution.iniFile.exists.value" = true;
            "doh-rollout.doneFirstRun" = true;
            "doh-rollout.home-region" = "US";
            "doh-rollout.mode" = 2;
            "doh-rollout.self-enabled" = true;
            "doh-rollout.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
            "dom.forms.autocomplete.formautofill" = true;
            "dom.push.userAgentID" = "67af2d4986e5446c82fc370fe7423c8c";
            "extensions.activeThemeID" = "default-theme@mozilla.org";
            "extensions.blocklist.pingCountVersion" = -1;
            "extensions.colorway-builtin-themes-cleanup" = 1;
            "extensions.databaseSchema" = 37;
            "extensions.getAddons.cache.lastUpdate" = 1757195784;
            "extensions.getAddons.databaseSchema" = 6;
            "extensions.lastAppBuildId" = "20250827105350";
            "extensions.lastAppVersion" = "142.0.1";
            "extensions.lastPlatformVersion" = "142.0.1";
            "extensions.pendingOperations" = false;
            "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
            "extensions.quarantinedDomains.list" =
              "autoatendimento.bb.com.br,ibpf.sicredi.com.br,ibpj.sicredi.com.br,internetbanking.caixa.gov.br,www.ib12.bradesco.com.br,www2.bancobrasil.com.br";
            "extensions.signatureCheckpoint" = 1;
            "extensions.systemAddonSet" =
              "{\"schema\":1,\"directory\":\"{6266f522-7faf-48dd-813a-dbff32ee7b88}\",\"addons\":{}}";
            "extensions.ui.dictionary.hidden" = true;
            "extensions.ui.lastCategory" = "addons://discover/";
            "extensions.ui.locale.hidden" = true;
            "extensions.ui.sitepermission.hidden" = true;
            "extensions.webcompat.enable_shims" = true;
            "extensions.webcompat.perform_injections" = true;
            "extensions.webcompat.perform_ua_overrides" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.screenshots@mozilla.org" = true;
            "extensions.webextensions.uuids" =
              "{\"formautofill@mozilla.org\":\"333d2529-c0e4-4409-8db7-46b312c233cd\",\"pictureinpicture@mozilla.org\":\"cca4d2e1-e534-4e9c-a396-8d5158ecdac5\",\"screenshots@mozilla.org\":\"64e32e6c-0fd8-4b55-ab4f-c1614c3ebc7a\",\"webcompat-reporter@mozilla.org\":\"42059750-8dfd-4c72-a133-27bc5c7798a3\",\"webcompat@mozilla.org\":\"9a310967-e580-48bf-b3e8-4eafebbc122d\",\"default-theme@mozilla.org\":\"0623dc86-827c-44c9-a369-c38129073783\",\"addons-search-detection@mozilla.com\":\"d378011f-f337-447e-997c-87f4d8324169\",\"hotfix-intermediate-2018@mozilla.com\":\"e0ee9f24-4be3-4bed-8d77-e57a71988f22\",\"uBlock0@raymondhill.net\":\"59f354a9-e67d-4a5e-85c3-65871b292401\",\"newtab@mozilla.org\":\"388c77c8-d47d-4aac-ae6d-8846c5dcadca\"}";
            "gecko.handlerService.defaultHandlersVersion" = 1;
            "idle.lastDailyNotification" = 1753037013;
            "media.gmp-gmpopenh264.abi" = "x86_64-gcc3";
            "media.gmp-gmpopenh264.hashValue" =
              "f5246bf14d038adf4ce0c4360262ab722bc3de4220f047c3d542b4c564074b4877dc8659e3125c5171c749e7ce93f20cc63777eb5e1539e960670cbc5f30ac85";
            "media.gmp-gmpopenh264.lastDownload" = 1742607915;
            "media.gmp-gmpopenh264.lastInstallStart" = 1742607915;
            "media.gmp-gmpopenh264.lastUpdate" = 1742607915;
            "media.gmp-gmpopenh264.version" = "2.6.0";
            "media.gmp-manager.buildID" = "20250707235753";
            "media.gmp-manager.lastCheck" = 1753036973;
            "media.gmp-manager.lastEmptyCheck" = 1753036973;
            "media.gmp.storage.version.observed" = 1;
            "media.videocontrols.picture-in-picture.video-toggle.first-seen-secs" = 1743457485;
            "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
            "network.cookie.CHIPS.lastMigrateDatabase" = 2;
            "nimbus.migrations.after-remote-settings-update" = 0;
            "nimbus.migrations.after-store-initialized" = 2;
            "nimbus.migrations.init-started" = 0;
            "nimbus.profileId" = "3ab6fecd-de00-4dab-8223-a4890c715eaf";
            "nimbus.syncdatastore.pocketNewtab" =
              "{\"slug\":\"new-tab-ml-sections\",\"branch\":{\"slug\":\"treatment\",\"ratio\":1,\"feature\":{\"value\":null,\"enabled\":true,\"featureId\":\"pocketNewtab\"},\"features\":null,\"firefoxLabsTitle\":null},\"active\":true,\"source\":\"rs-loader\",\"userFacingName\":\"New Tab ML sections\",\"userFacingDescription\":\"New Tab shows more relevant stories, from a wider variety of categories.\",\"lastSeen\":\"2025-08-17T21:12:39.782Z\",\"featureIds\":[\"newTabSectionsExperiment\",\"newtabPublisherFavicons\",\"newtabRefinedCardsLayout\",\"pocketNewtab\"],\"isRollout\":false,\"prefs\":[{\"name\":\"browser.newtabpage.activity-stream.discoverystream.publisherFavicon.enabled\",\"branch\":\"user\",\"featureId\":\"newtabPublisherFavicons\",\"variable\":\"enabled\",\"originalValue\":null},{\"name\":\"browser.newtabpage.activity-stream.discoverystream.refinedCardsLayout.enabled\",\"branch\":\"user\",\"featureId\":\"newtabRefinedCardsLayout\",\"variable\":\"enabled\",\"originalValue\":null},{\"name\":\"browser.newtabpage.activity-stream.discoverystream.sections.enabled\",\"branch\":\"user\",\"featureId\":\"newTabSectionsExperiment\",\"variable\":\"sectionsEnabled\",\"originalValue\":null},{\"name\":\"browser.newtabpage.activity-stream.discoverystream.sections.personalization.enabled\",\"branch\":\"user\",\"featureId\":\"newTabSectionsExperiment\",\"variable\":\"sectionsPersonalization\",\"originalValue\":null},{\"name\":\"browser.newtabpage.activity-stream.discoverystream.sections.customizeMenuPanel.enabled\",\"branch\":\"user\",\"featureId\":\"newTabSectionsExperiment\",\"variable\":\"sectionsCustomizeMenuPanel\",\"originalValue\":null},{\"name\":\"browser.newtabpage.activity-stream.discoverystream.merino-feed-experiment\",\"branch\":\"user\",\"featureId\":\"pocketNewtab\",\"variable\":\"merinoFeedExperiment\",\"originalValue\":null}],\"isFirefoxLabsOptIn\":false,\"firefoxLabsTitle\":null,\"firefoxLabsDescription\":null,\"firefoxLabsDescriptionLinks\":null,\"firefoxLabsGroup\":null,\"requiresRestart\":false}";
            "nimbus.syncdatastore.pocketNewtab.merinoFeedExperiment" = true;
            "nimbus.syncdefaultsstore.upgradeDialog" =
              "{\"slug\":\"upgrade-spotlight-rollout\",\"branch\":{\"slug\":\"treatment\",\"ratio\":1,\"feature\":{\"value\":null,\"enabled\":true,\"featureId\":\"upgradeDialog\"},\"features\":null},\"active\":true,\"experimentType\":\"rollout\",\"source\":\"rs-loader\",\"userFacingName\":\"Upgrade Spotlight Rollout\",\"userFacingDescription\":\"Experimenting on onboarding content when you upgrade Firefox.\",\"lastSeen\":\"2025-02-12T01:24:17.393Z\",\"featureIds\":[\"upgradeDialog\"],\"prefs\":[],\"isRollout\":true}";
            "nimbus.syncdefaultsstore.upgradeDialog.enabled" = false;
            "pdfjs.enabledCache.state" = true;
            "pdfjs.migrationVersion" = 2;
            "places.database.lastMaintenance" = 1752652677;
            "print_printer" = "Mozilla Save to PDF";
            "privacy.bounceTrackingProtection.hasMigratedUserActivationData" = true;
            "privacy.clearOnShutdown_v2.formdata" = true;
            "privacy.purge_trackers.date_in_cookie_database" = "0";
            "privacy.purge_trackers.last_purge" = "1753037013461";
            "privacy.sanitize.clearOnShutdown.hasMigratedToNewPrefs3" = true;
            "privacy.sanitize.pending" = "[{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]";
            "privacy.trackingprotection.allow_list.hasMigratedCategoryPrefs" = true;
            "services.settings.blocklists.addons-bloomfilters.last_check" = 1757198801;
            "services.settings.blocklists.gfx.last_check" = 1757198801;
            "services.settings.clock_skew_seconds" = -3018;
            "services.settings.last_etag" = "\"1757183782205\"";
            "services.settings.last_update_seconds" = 1757198801;
            "services.settings.main.addons-manager-settings.last_check" = 1757198801;
            "services.settings.main.anti-tracking-url-decoration.last_check" = 1757198801;
            "services.settings.main.bounce-tracking-protection-exceptions.last_check" = 1757198801;
            "services.settings.main.cfr.last_check" = 1757198801;
            "services.settings.main.cookie-banner-rules-list.last_check" = 1757198801;
            "services.settings.main.devtools-compatibility-browsers.last_check" = 1757198801;
            "services.settings.main.devtools-devices.last_check" = 1757198801;
            "services.settings.main.doh-config.last_check" = 1757198801;
            "services.settings.main.doh-providers.last_check" = 1757198801;
            "services.settings.main.fingerprinting-protection-overrides.last_check" = 1757198801;
            "services.settings.main.fxmonitor-breaches.last_check" = 1757198801;
            "services.settings.main.fxrelay-allowlist.last_check" = 1757198801;
            "services.settings.main.hijack-blocklists.last_check" = 1757198801;
            "services.settings.main.language-dictionaries.last_check" = 1757198801;
            "services.settings.main.message-groups.last_check" = 1757198801;
            "services.settings.main.moz-essential-domain-fallbacks.last_check" = 1757198801;
            "services.settings.main.newtab-wallpapers-v2.last_check" = 1757198801;
            "services.settings.main.nimbus-desktop-experiments.last_check" = 1757198801;
            "services.settings.main.nimbus-secure-experiments.last_check" = 1757198801;
            "services.settings.main.normandy-recipes-capabilities.last_check" = 1757198801;
            "services.settings.main.partitioning-exempt-urls.last_check" = 1757198801;
            "services.settings.main.password-recipes.last_check" = 1757198801;
            "services.settings.main.password-rules.last_check" = 1757198801;
            "services.settings.main.personality-provider-models.last_check" = 1757198801;
            "services.settings.main.personality-provider-recipe.last_check" = 1757198801;
            "services.settings.main.query-stripping.last_check" = 1757198801;
            "services.settings.main.remote-permissions.last_check" = 1757198801;
            "services.settings.main.search-categorization.last_check" = 1757198801;
            "services.settings.main.search-config-icons.last_check" = 1757198801;
            "services.settings.main.search-config-overrides-v2.last_check" = 1757198801;
            "services.settings.main.search-config-v2.last_check" = 1757198801;
            "services.settings.main.search-default-override-allowlist.last_check" = 1757198801;
            "services.settings.main.search-telemetry-v2.last_check" = 1757198801;
            "services.settings.main.sites-classification.last_check" = 1757198801;
            "services.settings.main.third-party-cookie-blocking-exempt-urls.last_check" = 1757198801;
            "services.settings.main.tippytop.last_check" = 1757198801;
            "services.settings.main.top-sites.last_check" = 1757198801;
            "services.settings.main.tracking-protection-lists.last_check" = 1757198801;
            "services.settings.main.translations-models.last_check" = 1757198801;
            "services.settings.main.translations-wasm.last_check" = 1757198801;
            "services.settings.main.url-classifier-exceptions.last_check" = 1757198801;
            "services.settings.main.url-classifier-skip-urls.last_check" = 1757198801;
            "services.settings.main.url-parser-default-unknown-schemes-interventions.last_check" = 1757198801;
            "services.settings.main.urlbar-persisted-search-terms.last_check" = 1757198801;
            "services.settings.main.websites-with-shared-credential-backends.last_check" = 1757198801;
            "services.settings.security-state.cert-revocations.last_check" = 1751089683;
            "services.settings.security-state.intermediates.last_check" = 1751089683;
            "services.settings.security-state.onecrl.last_check" = 1751089683;
            "services.sync.clients.lastSync" = "0";
            "services.sync.declinedEngines" = "";
            "services.sync.engine.addresses.available" = true;
            "services.sync.globalScore" = 0;
            "services.sync.nextSync" = 0;
            "sidebar.backupState" =
              "{\"panelOpen\":false,\"launcherWidth\":53,\"launcherExpanded\":false,\"launcherVisible\":true,\"pinnedTabsHeight\":0,\"collapsedPinnedTabsHeight\":0}";
            "sidebar.main.tools" = "aichat,syncedtabs,history,bookmarks";
            "sidebar.new-sidebar.has-used" = true;
            "sidebar.nimbus" = "upgraded-sidebar-138-broad-rollout:rollout-treatment";
            "sidebar.revamp" = true;
            "sidebar.visibility" = "hide-sidebar";
            "signon.firefoxRelay.showToAllBrowsers" = true;
            "storage.vacuum.last.content-prefs.sqlite" = 1753037013;
            "storage.vacuum.last.index" = 1;
            "storage.vacuum.last.places.sqlite" = 1752652677;
            "toolkit.profiles.storeID" = "449bf2a5";
            "toolkit.startup.last_success" = 1757195753;
            "toolkit.telemetry.cachedClientID" = "a5c51b82-cae5-4683-8746-ebafedb1fd39";
            "toolkit.telemetry.cachedProfileGroupID" = "a4792ff0-aa78-48fe-b0d5-ed99e89bd165";
            "toolkit.telemetry.previousBuildID" = "20250827105350";
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "trailhead.firstrun.didSeeAboutWelcome" = true;
          };
        };
      };

    };
}
