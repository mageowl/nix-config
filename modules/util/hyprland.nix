{
  mkMonitor = { name, resolution ? "preferred", position ? "0x0", scale ? 1 }: {
    _type = "hyprlandMonitor";
    inherit name resolution position scale;
  };
  mkAnimation = { enable ? true, duration, curve ? "default", style ? null }: {
    _type = "hyprlandAnimation";
    inherit enable duration curve style;
  };
}
