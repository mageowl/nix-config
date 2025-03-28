{ config, ... }:
let opts = config.opts;
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ opts.fonts.monospace ];
      sansSerif = [ opts.fonts.sansSerif ];
      serif = [ opts.fonts.serif ];
      emoji = [ opts.fonts.emoji ];
    };
  };
}
