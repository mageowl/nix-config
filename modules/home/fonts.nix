{ config, ... }:
let opts = config.opts;
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ opts.theme.fonts.monospace ];
      sansSerif = [ opts.theme.fonts.sansSerif ];
      serif = [ opts.theme.fonts.serif ];
      emoji = [ opts.theme.fonts.emoji ];
    };
  };
}
