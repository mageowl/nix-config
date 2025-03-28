{ lib, ... }: {
  hyprlandMonitor = lib.mkOptionType {
    name = "Hyprland monitor";
    check = lib.isType "hyprlandMonitor";
  };
}
