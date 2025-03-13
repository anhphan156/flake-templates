_: prev: {
  gdb = prev.symlinkJoin {
    name = "gdb";
    paths = [prev.gdb];
    nativeBuildInputs = [prev.makeWrapper];
    postBuild = let
      gdb-dashboard = prev.stdenvNoCC.mkDerivation {
        name = "gdb-dashboard";
        src = prev.fetchFromGitHub {
          owner = "cyrus-and";
          repo = "gdb-dashboard";
          rev = "616ed5100d3588bb70e3b86737ac0609ce0635cc";
          sha256 = "sha256-xoBkAFwkbaAsvgPwGwe1JxE1C8gPR6GP1iXeNKK5Z70=";
        };
        installPhase = ''
          cp .gdbinit $out
        '';
      };
    in ''
      wrapProgram $out/bin/gdb \
        --add-flags '-x' \
        --add-flags '${gdb-dashboard}'
    '';
  };
}
