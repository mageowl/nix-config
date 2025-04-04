util: {
  col.foreground = util.hex "cdd6f4";
  col.foregroundDim = util.hex "7f849c";
  col.accent1 = util.hex "f9a9d9";
  col.accent2 = util.hex "f9a9d9";
  backgroundOpacity = 0.6;
  borders = {
    opacity.inactive = 0.2;
    opacity.active = 0.6;
    width = 2;
  };

  rounding.big = 10;
  rounding.small = 6;
  padding.big = 24;
  padding.medium = 16;
  padding.small = 8;

  fonts = {
    default = "monospace";
    monospace = {
      family = "JetBrains Mono";
      features = ["ss02" "cv14" "cv18" "cv20"];
    };
    sansSerif.family = "Radio Canada Big";
    kerning = 3;
  };
}
