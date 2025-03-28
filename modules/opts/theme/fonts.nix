{ lib, ... }:
let
  mkFontOption = { default, example, kind }:
    lib.mkOption {
      description = "Default ${kind} font.";
      inherit default example;
      type = lib.types.str;
    };
in {
  options.opts.theme.fonts = {
    monospace = mkFontOption {
      kind = "monospace";
      default = "Roboto Mono";
      example = "JetBrains Mono";
    };
    sansSerif = mkFontOption {
      kind = "sans serif";
      default = "Noto Sans";
      example = "Space Grotesk";
    };
    serif = mkFontOption {
      kind = "serif";
      default = "Noto Serif";
      example = "Roboto Serif";
    };
    emoji = mkFontOption {
      kind = "emoji";
      default = "Noto Color Emoji";
      example = "Noto Emoji";
    };
  };
}
