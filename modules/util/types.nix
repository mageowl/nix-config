{ lib, ... }: {
  hyprlandMonitor = lib.mkOptionType {
    name = "Hyprland monitor";
    check = lib.isType "hyprlandMonitor";
  };
	color = lib.mkOptionType {
		name = "Color";
		check = lib.isType "color";
	};
}
