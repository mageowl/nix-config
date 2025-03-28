{ lib, ... }: {
  options.opts.widgets = { enable = lib.mkEnableOption "AGS widgets"; };
}
