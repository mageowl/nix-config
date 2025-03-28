{
  mkMonitor = { name, resolution ? "preferred", position ? "0x0", scale ? 1 }: {
    _type = "hyprlandMonitor";
    inherit name resolution position scale;
  };
}
