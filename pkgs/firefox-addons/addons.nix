{ buildFirefoxXpiAddon, fetchurl, lib }:
  {
    "url-in-title" = buildFirefoxXpiAddon {
      pname = "url-in-title";
      version = "1.0";
      addonId = "{45cf9154-a39d-4c84-93e7-840362a3d8d0}";
      url = "https://addons.mozilla.org/firefox/downloads/file/786424/url_in_title-1.0-an+fx.xpi";
      sha256 = "0lmn7blv6p2sfwh9c1byfycx9qdk2mc24838jig23rvbakyn5gka";
      meta = {
        homepage = "https://github.com/M-Gregoire/Firefox-AddUrlToWindowsTitle";
        description = "Port of https://addons.mozilla.org/fr/firefox/addon/add-url-to-window-title/";
        license = lib.licenses.asl20;
        platforms = lib.platforms.all;
      };
    };
  }
