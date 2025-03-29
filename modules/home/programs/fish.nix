{ config, lib, ... }: {
	home.shell.enableFishIntegration = true;

	programs.fish = {
		enable = true;

		functions = {
			fish_command_not_found = ''
				echo "Unknown command '$argv[0]'".
			'';
			fish_prompt = ''
				set color (set_color 93cee9)

				set cwd (prompt_pwd | string split "/")
				if set -q cwd[-2]
					set cwd[-2] "$cwd[-2]/"
				end
				
				echo -n "$color󰉋$(set_color normal)$(set_color -i) $cwd[-2]$color$cwd[-1]$(set_color normal) ) "
			'';
			fish_right_prompt = ''
				fish_git_prompt | string replace ')' "" | string replace '(' '( 󰘬 '
			'';
			fish_title = ''
				set command fish
				if set -q argv[1]
					set command (string split " " $argv[1])
				end
				set cmd_name $command[1]
				
				set icon 󰈺
				switch $cmd_name
					case nv
						set icon 
					case nvim
						set icon 
					case cat
						set icon 󰄛
					case sleep
						set icon 󰒲
					case npm
						set icon 
					case live-server
						set icon 
					case cargo
						set icon 
				end
				
				if test (count $command) = 1
					set command[2] (prompt_pwd)
				end
				
				echo $icon $command
			'';
		};
	};
}
