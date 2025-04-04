{
  pkgs,
  inputs,
  const,
  ...
}: {
  home.packages = [
    inputs.nil_ls.packages.${const.system}.default
    pkgs.alejandra
    pkgs.typescript-language-server
  ];
}
