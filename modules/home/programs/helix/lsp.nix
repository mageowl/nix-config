{
  pkgs,
  inputs,
  const,
  ...
}: {
  home.packages = with pkgs; [
    inputs.nil_ls.packages.${const.system}.default
    alejandra
    typescript-language-server
    vscode-langservers-extracted
    marksman
  ];
}
