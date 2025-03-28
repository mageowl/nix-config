{ pkgs, ... }: {
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [ jetbrains-mono google-fonts ];
}
