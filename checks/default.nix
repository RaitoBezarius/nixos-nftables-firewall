system:
flakes@{ nixpkgs, ... }:

let

  lib = nixpkgs.lib.extend (import ./utils.nix system nixpkgs) // { inherit flakes; };

in with lib; {
  tests = run-tests {

    testChains = import ./testChains.nix lib;

    testEmpty = import ./testEmpty.nix lib;

    testWebserver = import ./testWebserver.nix lib;

  };
}