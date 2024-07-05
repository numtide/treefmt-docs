{
  pname,
  pkgs,
  flake,
  ...
}:
pkgs.buildNpmPackage {
  name = pname;

  src = "${flake}/docs";
  npmDepsHash = "sha256-EqIhdfQ5pUpNPJ3NWCz2DoG+4gNPsgnUFQEC7oLvUls=";

  # we have to use a custom build phase because vitepress is doing something funky with the ttty
  buildPhase = ''
    cat | npm run build 2>&1 | cat
  '';

  installPhase = ''
    runHook preInstall
    cp -rv .vitepress/dist/ $out
    runHook postInstall
  '';
}
