{
  enable = true;
  settings = {
    editor = {
      line-number = "relative";
      cursor-shape.insert = "bar";
      color-modes = true;
      bufferline = "always";
      bufferline-directories = "smart";

      end-of-line-diagnostics = "hint";
      inline-diagnostics.cursor-line = "hint";

      indent-guides.render = true;
      # lsp.display-inlay-hints = true;
    };
    keys = {
      insert = {
        C-h = "move_char_left";
        C-j = "move_visual_line_down";
        C-k = "move_visual_line_up";
        C-l = "move_char_right";
        C-ret = "open_below";
        C-S-ret = "open_above";
        C-space = "code_action";
      };
      normal = {
        C-del = [":sh rm %{buffer_name}" ":buffer-close"];
        space.i = ":toggle lsp.display-inlay-hints";
      };
    };
  };
  languages = [
    {
      name = "nix";
      formatter = {
        command = "alejandra";
        args = [
          "-q"
          "-"
        ];
      };
      auto-format = true;
    }
    {
      name = "markdown";
      soft-wrap.enable = true;
    }
    {
      name = "typescript";
      roots = ["deno.json" "deno.jsonc" "package.json"];
      language-servers = ["deno-lsp"];
      auto-format = true;
    }
    {
      name = "lua";
      auto-format = true;
    }
  ];
  lsp.deno-lsp = {
    command = "deno";
    args = ["lsp"];
    config.deno = {
      enable = true;
      unstable = true;
      suggest.imports.hosts = {"https://deno.land" = true;};

      inlayHints.parameterNames.enabled = "all";
      inlayHints.parameterTypes.enabled = true;
      inlayHints.variableTypes.enabled = true;
      inlayHints.propertyDeclarationTypes.enabled = true;
      inlayHints.functionLikeReturnTypes.enabled = true;
      inlayHints.enumMemberValues.enabled = true;
    };
  };
}
