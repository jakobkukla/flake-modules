{
  description = "Personal flake-parts modules";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    git-hooks-nix.url = "github:cachix/git-hooks.nix";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        (flake-parts.lib.importAndPublish "devshell" ./modules/devshell.nix)
        (flake-parts.lib.importAndPublish "formatter" ./modules/formatter.nix)
      ];

      systems = ["x86_64-linux" "aarch64-linux"];
    };
}
