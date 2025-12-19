{
  pkgs,
  inputs,
  ...
}: let
  secrets = inputs.secrets.general;
in {
  home.packages = [
    # (pkgs.writeScriptBin
    #   "repo"
    #   (let
    #     codebergUsername = "mageowl";
    #   in ''
    #     #!/usr/bin/env nu

    #     # Create and clone repositories from Codeberg.
    #     #
    #     # Currently logged in as ${codebergUsername}.
    #     def main [] {
    #       print "Logged in as ${codebergUsername}. --help for more info."
    #     }

    #     # Clone a repository
    #     def "main clone" [
    #       name: string # Name of repository, with an option owner.
    #       directory?: path # Optional output directory.
    #     ] {
    #       let owner = if ($name | str contains "/") { "" } else { "${codebergUsername}" }
    #       git clone https://codeberg.org/$owner/$name $directory
    #     }
    #   ''))
  ];
}
