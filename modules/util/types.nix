{ lib, ... }: {
  hyprlandMonitor = lib.mkOptionType {
    name = "Hyprland monitor";
    check = lib.isType "hyprlandMonitor";
  };
  hyprlandAnimation = lib.mkOptionType {
    name = "Hyprland animation";
    check = lib.isType "hyprlandAnimation";
  };
	color = lib.mkOptionType {
		name = "Color";
		check = lib.isType "color";
	};
}
