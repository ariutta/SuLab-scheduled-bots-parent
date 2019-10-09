{ pkgs, python }:

let
  removeDependencies = names: deps:
    with builtins; with pkgs.lib;
      filter
      (drv: all
        (suf:
          ! hasSuffix ("-" + suf)
          (parseDrvName drv.name).name
        )
        names
      )
      deps;
  in

  self: super: {

    "shexjsg" = python.overrideDerivation super."shexjsg" (old: {
      patchPhase = ''
        substituteInPlace requirements.txt --replace \
        "pyshexc==0.5.4" ""

        substituteInPlace Pipfile --replace \
        'PyShExC = ">=0.5.1"' ""
      '';
      buildInputs = [self."pbr"] ++ old.buildInputs;
      propagatedBuildInputs =
        removeDependencies [
          "pyshexc"
        ] old.propagatedBuildInputs;
    });

    ShExJSG = self.shexjsg;

    "pyshex" = python.overrideDerivation super."pyshex" (old: {
      buildInputs = [self."pbr"] ++ old.buildInputs;
    });

    "pyshexc" = python.overrideDerivation super."pyshexc" (old: {
      patchPhase = ''
        substituteInPlace setup.py --replace \
        "'ShExJSG>=0.5.6'," ""
      '';
      propagatedBuildInputs =
        removeDependencies [
          "shexjsg"
        ] old.propagatedBuildInputs;
    });

    "sparql-slurper" = python.overrideDerivation super."sparql-slurper" (old: {
      buildInputs = [self."pbr"] ++ old.buildInputs;
    });

  }
