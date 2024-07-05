{
  pkgs,
  perSystem,
  ...
}:
perSystem.devshell.mkShell {
  packages = pkgs.lib.mkMerge [
    (with pkgs; [
      nodejs
    ])
  ];

  commands = [
    {
      name = "serve";
      help = "serve docs for local development";
      command = "cd $PRJ_ROOT/docs && npm ci && npm run dev";
    }
    {
      name = "build";
      help = "create a production build of docs";
      command = "cd $PRJ_ROOT/docs && npm ci && npm run build";
    }
    {
      name = "preview";
      help = "preview a production build of docs";
      command = "cd $PRJ_ROOT/docs && npm ci && npm run preview";
    }
  ];
}
