{
  lib,
  config,
  namespace,
  ...
}
: let
  inherit (lib) mkOption types;
in {
  options.${namespace}.users = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        fullName = mkOption {
          type = types.str;
        };

        email = mkOption {
          type = types.str;
        };
      };
    });
    default = {};
  };
}
