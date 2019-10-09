# generated using pypi2nix tool (version: 2.0.0)
# See more at: https://github.com/nix-community/pypi2nix
#
# COMMAND:
#   pypi2nix -s pbr -e sparql-slurper -e ShExJSG -e PyShEx -e pandas -e tqdm -e wikidataintegrator
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = args: pythonPackages.buildPythonPackage (args // {
        nativeBuildInputs = (args.nativeBuildInputs or []) ++ args.buildInputs;
      });
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "antlr4-python3-runtime" = python.mkDerivation {
      name = "antlr4-python3-runtime-4.7.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/29/14/8ac135ec7cc9db3f768e2d032776718c6b23f74e63543f0974b4873500b2/antlr4-python3-runtime-4.7.2.tar.gz";
        sha256 = "168cdcec8fb9152e84a87ca6fd261b3d54c8f6358f42ab3b813b14a7193bb50b";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.antlr.org";
        license = licenses.bsdOriginal;
        description = "ANTLR 4.7.2 runtime for Python 3.6.3";
      };
    };

    "certifi" = python.mkDerivation {
      name = "certifi-2018.11.29";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/55/54/3ce77783acba5979ce16674fc98b1920d00b01d337cfaaf5db22543505ed/certifi-2018.11.29.tar.gz";
        sha256 = "47f9c83ef4c0c621eaef743f133f09fa8a74a9b75f037e8624f83bd1b6626cb7";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://certifi.io/";
        license = licenses.mpl20;
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };

    "cfgraph" = python.mkDerivation {
      name = "cfgraph-0.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/cb/51/3e7e021920cfe2f7d18b672642e13f7dc4f53545d530b52ee6533b6681ca/CFGraph-0.2.1.tar.gz";
        sha256 = "b57fe7044a10b8ff65aa3a8a8ddc7d4cd77bf511b42e57289cd52cbc29f8fe74";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."rdflib"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/hsolbrig/CFGraph";
        license = licenses.asl20;
        description = "rdflib collections flattening graph";
      };
    };

    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz";
        sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl3;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.8";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz";
        sha256 = "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "isodate" = python.mkDerivation {
      name = "isodate-0.6.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b1/80/fb8c13a4cd38eb5021dc3741a9e588e4d1de88d895c1910c6fc8a08b7a70/isodate-0.6.0.tar.gz";
        sha256 = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gweis/isodate/";
        license = licenses.bsdOriginal;
        description = "An ISO 8601 date/time/duration parser and formatter";
      };
    };

    "jsonasobj" = python.mkDerivation {
      name = "jsonasobj-1.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/0a/a0/f9951b7ce18718282a00b302f469d6638b25e650783ea416c946355daa3f/jsonasobj-1.2.1.tar.gz";
        sha256 = "1ef4ee4752f2cbda6f166949d5ed75547e2a16acf007370898f42c37e6f048fa";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/hsolbrig/jsonasobj";
        license = licenses.asl20;
        description = "JSON as python objects";
      };
    };

    "mwoauth" = python.mkDerivation {
      name = "mwoauth-0.3.5";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/6e/99/0aeb23bc33268c45bca91fcd315c775955cde8b37ae014347dc1b0cb4f85/mwoauth-0.3.5.tar.gz";
        sha256 = "c7e4c56561a280e14ca4cc20b79ba4a9dd4ec752ff4c797cf29dad4460fb7832";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."oauthlib"
        self."pyjwt"
        self."requests"
        self."requests-oauthlib"
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/mediawiki-utilities/python-mwoauth";
        license = licenses.mit;
        description = "A generic MediaWiki OAuth handshake helper.";
      };
    };

    "numpy" = python.mkDerivation {
      name = "numpy-1.17.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ac/36/325b27ef698684c38b1fe2e546e2e7ef9cecd7037bcdb35c87efec4356af/numpy-1.17.2.zip";
        sha256 = "73615d3edc84dd7c4aeb212fa3748fb83217e00d201875a47327f55363cef2df";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.numpy.org";
        license = licenses.bsdOriginal;
        description = "NumPy is the fundamental package for array computing with Python.";
      };
    };

    "oauthlib" = python.mkDerivation {
      name = "oauthlib-3.1.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fc/c7/829c73c64d3749da7811c06319458e47f3461944da9d98bb4df1cb1598c2/oauthlib-3.1.0.tar.gz";
        sha256 = "bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/oauthlib/oauthlib";
        license = licenses.bsdOriginal;
        description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
      };
    };

    "pandas" = python.mkDerivation {
      name = "pandas-0.25.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/07/cf/1b6917426a9a16fd79d56385d0d907f344188558337d6b81196792f857e9/pandas-0.25.1.tar.gz";
        sha256 = "cb2e197b7b0687becb026b84d3c242482f20cbb29a9981e43604eb67576da9f6";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."numpy"
        self."python-dateutil"
        self."pytz"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pandas.pydata.org";
        license = licenses.bsdOriginal;
        description = "Powerful data structures for data analysis, time series, and statistics";
      };
    };

    "pbr" = python.mkDerivation {
      name = "pbr-5.4.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/99/f1/7807d3409c79905a907f1c616d910c921b2a8e73c17b2969930318f44777/pbr-5.4.3.tar.gz";
        sha256 = "2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/pbr/latest/";
        license = "UNKNOWN";
        description = "Python Build Reasonableness";
      };
    };

    "pyjsg" = python.mkDerivation {
      name = "pyjsg-0.9.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/7c/1a/2eee37b6732b329fa107799d312d20034f0cb4f56ce119d9527d08f18094/PyJSG-0.9.0.tar.gz";
        sha256 = "00c3ec2420bef54653c129c7ae6a133125f3b7aa02f8dca06097e8b83519edfe";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."antlr4-python3-runtime"
        self."jsonasobj"
        self."requests"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/hsolbrig/pyjsg";
        license = licenses.asl20;
        description = "\"PyJSG - Python JSON Schema Grammar bindings";
      };
    };

    "pyjwt" = python.mkDerivation {
      name = "pyjwt-1.7.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/2f/38/ff37a24c0243c5f45f5798bd120c0f873eeed073994133c084e1cf13b95c/PyJWT-1.7.1.tar.gz";
        sha256 = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/jpadilla/pyjwt";
        license = licenses.mit;
        description = "JSON Web Token implementation in Python";
      };
    };

    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.3.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b9/b8/6b32b3e84014148dcd60dd05795e35c2e7f4b72f918616c61fdce83d27fc/pyparsing-2.3.1.tar.gz";
        sha256 = "66c9268862641abcac4a96ba74506e594c884e3f57690a696d21ad8210ed667a";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyparsing/pyparsing/";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };

    "pyshex" = python.mkDerivation {
      name = "pyshex-0.7.12";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/2d/a3/66717aa071acfce46e54c94946628618713a4fc81fe5915d643e89dc9110/PyShEx-0.7.12.tar.gz";
        sha256 = "ed5c069bbfff24c642c1dc3dd0ebea6b181975e013d00a1c1311a26837c2315c";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."cfgraph"
        self."pyshexc"
        self."rdflib"
        self."rdflib-jsonld"
        self."requests"
        self."shexjsg"
        self."sparql-slurper"
        self."sparqlwrapper"
        self."urllib3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/hsolbrig/PyShEx";
        license = licenses.asl20;
        description = "Python ShEx Implementation";
      };
    };

    "pyshexc" = python.mkDerivation {
      name = "pyshexc-0.5.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/3f/fb/6821c616b671152c4d461af33d25efc02befd3d9212428c09116142399a7/PyShExC-0.5.4.tar.gz";
        sha256 = "345a19d6969755f93143c6201b9d1c36bd76f25c304932942c02be7012abd043";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."antlr4-python3-runtime"
        self."jsonasobj"
        self."pyjsg"
        self."rdflib"
        self."rdflib-jsonld"
        self."requests"
        self."shexjsg"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/shexSpec/grammar/parsers/python";
        license = licenses.asl20;
        description = "\"PyShExC - a Python ShExC parser";
      };
    };

    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.8.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c/python-dateutil-2.8.0.tar.gz";
        sha256 = "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [
        self."setuptools-scm"
      ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = "Dual License";
        description = "Extensions to the standard Python datetime module";
      };
    };

    "pytz" = python.mkDerivation {
      name = "pytz-2019.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/82/c3/534ddba230bd4fbbd3b7a3d35f3341d014cca213f369a9940925e7e5f691/pytz-2019.3.tar.gz";
        sha256 = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };

    "rdflib" = python.mkDerivation {
      name = "rdflib-4.2.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/c5/77/1fa0f4cffd5faad496b1344ab665902bb2609f56e0fb19bcf80cff485da0/rdflib-4.2.2.tar.gz";
        sha256 = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."isodate"
        self."pyparsing"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/RDFLib/rdflib";
        license = "https://raw.github.com/RDFLib/rdflib/master/LICENSE";
        description = "RDFLib is a Python library for working with RDF, a simple yet powerful language for representing information.";
      };
    };

    "rdflib-jsonld" = python.mkDerivation {
      name = "rdflib-jsonld-0.4.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ba/48/edaad22fc9de34500699f0c7fc9124385dd425fd18857244f126a6f7df66/rdflib-jsonld-0.4.0.tar.gz";
        sha256 = "144774786a2fc7de09b24a9309cbcccc78bc48b152536d2ea1c1df2ad715bc2d";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."rdflib"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/RDFLib/rdflib-jsonld";
        license = licenses.bsdOriginal;
        description = "rdflib extension adding JSON-LD parser and serializer";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.21.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/52/2c/514e4ac25da2b08ca5a464c50463682126385c4272c18193876e91f4bc38/requests-2.21.0.tar.gz";
        sha256 = "502a824f31acdacb3a35b6690b5fbf0bc41d63a24a45c4004352b0242707598e";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."certifi"
        self."chardet"
        self."idna"
        self."urllib3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "requests-oauthlib" = python.mkDerivation {
      name = "requests-oauthlib-1.2.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/de/a2/f55312dfe2f7a344d0d4044fdfae12ac8a24169dc668bd55f72b27090c32/requests-oauthlib-1.2.0.tar.gz";
        sha256 = "bd6533330e8748e94bf0b214775fed487d309b8b8fe823dc45641ebcd9a32f57";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."oauthlib"
        self."requests"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/requests/requests-oauthlib";
        license = "ISC";
        description = "OAuthlib authentication support for Requests.";
      };
    };

    "setuptools-scm" = python.mkDerivation {
      name = "setuptools-scm-3.3.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/83/44/53cad68ce686585d12222e6769682c4bdb9686808d2739671f9175e2938b/setuptools_scm-3.3.3.tar.gz";
        sha256 = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools_scm/";
        license = licenses.mit;
        description = "the blessed package to manage your versions by scm tags";
      };
    };

    "shexjsg" = python.mkDerivation {
      name = "shexjsg-0.6.5";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/48/de/f36f67d6d65a7406fc57df5bbc7c26ff56467b9ff403d88be6e9622956fb/ShExJSG-0.6.5.tar.gz";
        sha256 = "ef0daf86dd463adcbd82083cbb03ad15bace4cc9af501b84c7892459a84ec6da";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."antlr4-python3-runtime"
        self."certifi"
        self."chardet"
        self."idna"
        self."isodate"
        self."jsonasobj"
        self."pyjsg"
        self."pyparsing"
        self."pyshexc"
        self."rdflib"
        self."rdflib-jsonld"
        self."requests"
        self."six"
        self."urllib3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/hsolbrig/ShExJSG";
        license = "CC0 1.0 Universal";
        description = "ShExJSG - Astract Syntax Tree for the ShEx 2.0 language";
      };
    };

    "simplejson" = python.mkDerivation {
      name = "simplejson-3.16.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/e3/24/c35fb1c1c315fc0fffe61ea00d3f88e85469004713dab488dee4f35b0aff/simplejson-3.16.0.tar.gz";
        sha256 = "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/simplejson/simplejson";
        license = licenses.mit;
        description = "Simple, fast, extensible JSON encoder/decoder for Python";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.12.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz";
        sha256 = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benjaminp/six";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

    "sparql-slurper" = python.mkDerivation {
      name = "sparql-slurper-0.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/85/8d/f4b56822876056a01ec742a5b4393c3b3986bac2c89321d0a1e6d619bfdd/sparql_slurper-0.2.1.tar.gz";
        sha256 = "32ebe214b6acfe48acfef5c1e2afb1cf26595015d18256fa73781cf2a1f62470";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."isodate"
        self."pyparsing"
        self."rdflib"
        self."six"
        self."sparqlwrapper"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/hsolbrig/sparql_slurper";
        license = licenses.asl20;
        description = "SPARQL Slurper for rdflib";
      };
    };

    "sparqlwrapper" = python.mkDerivation {
      name = "sparqlwrapper-1.8.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/5d/91/f7feb99adae08869f7f0900f81f658040c532d38c616f524a9e51795f63d/SPARQLWrapper-1.8.2.tar.gz";
        sha256 = "7f4c8d38ea1bfcffbc358c9a05de35a3fd7152cc3e8ea57963ee7a0a242f7a5e";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."rdflib"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://rdflib.github.io/sparqlwrapper";
        license = "W3C SOFTWARE NOTICE AND LICENSE";
        description = "SPARQL Endpoint interface to Python";
      };
    };

    "tqdm" = python.mkDerivation {
      name = "tqdm-4.36.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/80/b3/6ca4806441b730782fc4613c6aa2070412295c5521f33ae151988e448929/tqdm-4.36.1.tar.gz";
        sha256 = "abc25d0ce2397d070ef07d8c7e706aede7920da163c64997585d42d3537ece3d";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tqdm/tqdm";
        license = "MPLv2.0, MIT Licences";
        description = "Fast, Extensible Progress Meter";
      };
    };

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.24.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz";
        sha256 = "de9529817c93f27c8ccbfead6985011db27bd0ddfcdb2d86f3f663385c6a9c22";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };

    "wikidataintegrator" = python.mkDerivation {
      name = "wikidataintegrator-0.4.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/a4/4a/bfac10031ee728718826e265abe2c8211ccf3b543a3e7cc904bf9d5398ef/wikidataintegrator-0.4.2.tar.gz";
        sha256 = "9e962bac36610c0789c2efabcdaab48754658aa1aed86d16ad99f5d87da22549";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."jsonasobj"
        self."mwoauth"
        self."oauthlib"
        self."pyshex"
        self."python-dateutil"
        self."requests"
        self."shexjsg"
        self."simplejson"
        self."sparql-slurper"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/sulab/WikidataIntegrator";
        license = licenses.mit;
        description = "Python package for reading and writing to/from Wikidata";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
    
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )