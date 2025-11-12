{ config, lib, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];

  config = lib.mkIf config.defaultPkgs.enable {
    programs.zen-browser = {
      enable = true;
      policies = let
          mkLockedAttrs = builtins.mapAttrs (_: value: {
            Value = value;
            Status = "locked";
          });

          mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

          mkExtensionEntry = {
            id,
            pinned ? false,
          }: let
              base = {
                install_url = mkPluginUrl id;
                install_mode = "force_installed";
              };
            in
              if pinned
              then base // { default_area = "navbar"; }
              else base;

          mkExtensionSettings = builtins.mapAttrs (_: entry: 
            if builtins.isAttrs entry
            then entry
            else mkExtensionEntry {id = entry;});
        in {
          AutofillAddressEnabled = true;
          AutofillCreditCardEnabled = false;
          Bookmark = [ # Make this in preferences so it appears in the toolbar
            {
              Title = "OpenAI";
              URL = "https://openai.com/";
              Folder = "AI";
            }
            {
              Title = "Grok";
              URL = "https://grok.com/";
              Folder = "AI";
            }
            {
              Title = "Claude";
              URL = "https://claude.ai/";
              Folder = "AI";
            }

            {
              Title = "Apps";
              URL = "https://apps.ccsdut.net";
              Folder = "School";
            }
            {
              Title = "Canvas";
              URL = "https://ccsdut.instructure.com/";
              Folder = "School";
            }
            {
              Title = "Powerschool";
              URL = "https://powerschool.ccsdut.org/";
              Folder = "School";
            }
            
            {
              Title = "Nix Search";
              URL = "https://search.nixos.org/";
              Folder = "Programming";
            }
            {
              Title = "Github";
              URL = "https://github.com/";
              Folder = "Programmin";
            }
          ];
          Cookies = "reject-trackers";
          DisableAppUpdate = true;
          DisableFeedbackCommands = true;
          DisableFirefoxStudies = true;
          DisablePoket = true;
          DisableTelemetry = true;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          ExtensionSettings = mkExtensionSettings {
            "uBlock0@raymondhill.net" = mkExtensionEntry {
              id = "ublock-origin";
              pinned = true;
            };
          };
          GenerativeAI = "Enabled";
          PromptForDownloadLocation = true;
          Preferences = mkLockedAttrs {
            browser.tabs = {
              warnOnClose = false;
              hoverPreview.enabled = true;
            };
            privacy.resistFingerprinting = true;
          };
          SearchEngines.Default = "DuckDuckGo";
          SkipTermsOfUse = true;
        };
      };
  };
}
