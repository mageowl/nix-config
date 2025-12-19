{lib, ...}: {
  options.opts.widgets = {
    enable = lib.mkEnableOption "AGS widgets";
    iconSize = lib.mkOption {
      description = "Icon size to use for widgets.";
      default = 16;
      example = 16;
      type = lib.types.int;
    };
    lowBattery = lib.mkOption {
      description = "Percentage of battery that should cause low battery notifications.";
      default = null;
      example = 10;
      type = lib.types.nullOr lib.types.int;
    };
    visualizer = {
      enable = lib.mkEnableOption "Cava visualizer widget";
      bars = lib.mkOption {
        description = "Number of bars to display";
        default = 20;
        example = 20;
        type = lib.types.int;
      };
    };
  };
}
