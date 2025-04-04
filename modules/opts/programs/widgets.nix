{lib, ...}: {
  options.opts.widgets = {
    enable = lib.mkEnableOption "AGS widgets";
    iconSize = lib.mkOption {
      description = "Icon size to use for widgets.";
      default = 16;
      example = 16;
      type = lib.types.int;
    };
  };
}
