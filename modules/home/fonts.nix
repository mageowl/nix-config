{ config, ... }:
let opts = config.opts;
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ opts.theme.fonts.monospace.family ];
      sansSerif = [ opts.theme.fonts.sansSerif.family ];
      serif = [ opts.theme.fonts.serif.family ];
      emoji = [ opts.theme.fonts.emoji.family ];
    };
  };
}
