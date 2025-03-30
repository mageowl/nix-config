{ config, ... }:
let opts = config.opts;
in {
	home.shell.enableFishIntegration = true;

	programs.fish = {
		enable = true;

		interactiveShellInit = ''
			set -g __fish_git_prompt_char_dirtystate 󰝒
			set -g __fish_git_prompt_char_stagedstate 
			set -g __fish_git_prompt_char_suffix " "
			set -g __fish_git_prompt_color_dirtystate yellow
			set -g __fish_git_prompt_color_prefix \x2dd
			set -g __fish_git_prompt_color_stagedstate green
			set -g __fish_git_prompt_showdirtystate 1
			set -g fish_prompt_pwd_dir_length 0
		'' + (import ./colors.nix opts
			|> builtins.mapAttrs (name: col: "set -g fish_color_${name} ${col}")
			|> builtins.attrValues
			|> builtins.concatStringsSep "\n");

		functions = {
			fish_command_not_found = ''
				echo "Unknown command '$argv[0]'".
			'';
			fish_prompt = ''
        set cwd (prompt_pwd | string split "/")
        if set -q cwd[-2]
        	set cwd[-2] "$cwd[-2]/"
        end

        echo -n "$(set_color 93cee9)󰉋$(set_color normal)$(set_color -i) $cwd[-2]$(set_color 93cee9)$cwd[-1]$(set_color normal) ) "
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
					case nv nvim vi
						set icon 
					case hx
						set icon 
					case cat
						set icon 󰄛
					case bat
						set icon 󰭟
					case sleep
						set icon 󰒲
					case npm node
						set icon 
					case live-server
						set icon 
					case cargo rustc
						set icon 
					case nh nix nixos-rebuild home-manager nix-shell
						set icon 
				end
				
				if test (count $command) = 1
					set command[2] (prompt_pwd)
				end
				
				echo $icon $command
			'';
		} // opts.fish.functions;
	};
}
