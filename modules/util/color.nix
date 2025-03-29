{ lib, ... }: 
let
	charAt = i: str: builtins.substring i 1 str;
in {
	hex = hex:
		if (builtins.stringLength hex) == 3 then 
			let
				r = charAt 0 hex;
				g = charAt 1 hex;
				b = charAt 2 hex;
				rr = r + r;
				gg = g + g;
				bb = b + b;
			in {
				_type = "color";
				hex = "${rr}${gg}${bb}";
				r = lib.fromHexString rr;
				g = lib.fromHexString gg;
				b = lib.fromHexString bb;
			}
		else {
			_type = "color";
			inherit hex;
			r = builtins.substring 0 2 hex |> lib.fromHexString;
			g = builtins.substring 2 2 hex |> lib.fromHexString;
			b = builtins.substring 4 2 hex |> lib.fromHexString;
		};
	rgb = r: g: b: {
		_type = "color";
		inherit r g b;
		hex = builtins.map lib.toHexString [ r g b ] |> builtins.concatStringsSep "";
	};
}
