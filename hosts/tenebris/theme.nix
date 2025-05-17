util: {
  col = rec {
    # https://mageowl.dev/nya

    background = util.hex "0b0614";
    foreground = util.hex "ddd3f5";
    foregroundDim = util.hex "c5a6fc";
    accent1 = brightWhite;
    accent2 = magenta;

    black = util.hex "1c122d";
    red = util.hex "d8787a";
    green = util.hex "6aab66";
    yellow = util.hex "ce8545";
    blue = util.hex "7b94e2";
    magenta = util.hex "b681ca";
    cyan = util.hex "00b0a3";
    white = util.hex "68528e";
    brightBlack = util.hex "3f2c5e";
    brightRed = util.hex "ffb4b5";
    brightGreen = util.hex "bedb93";
    brightYellow = util.hex "eacb81";
    brightBlue = util.hex "bcdff5";
    brightMagenta = util.hex "f8b6ec";
    brightCyan = util.hex "9cdfc7";
    brightWhite = util.hex "c5a6fc";
  };
  backgroundOpacity = 0.9;
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
