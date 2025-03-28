{ lib, ... }: {
	hex = hex:
		if (builtins.stringLength hex) == 3 then 
			let
				r = lib.charAt 1 hex;
				g = lib.charAt 2 hex;
				b = lib.charAt 3 hex;
				rr = r + r;
				gg = g + g;
				bb = b + b;
			in {
				_type = "color";
				hex = "#${rr}${gg}${bb}";
				r = lib.fromHexString rr;
				g = lib.fromHexString gg;
				b = lib.fromHexString bb;
			}
		else {
			_type = "color";
			inherit hex;
			r = builtins.substring 1 3 hex |> lib.fromHexString;
			g = builtins.substring 3 5 hex |> lib.fromHexString;
			b = builtins.substring 5 7 hex |> lib.fromHexString;
		};
	rgb = r: g: b: {
		_type = "color";
		inherit r g b;
		hex = builtins.map lib.toHexString [ r g b ] |> builtins.concatStringsSep "";
	};
}
