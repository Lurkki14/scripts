#/usr/bin/env sh

nix-shell -p  "haskellPackages.ghcWithPackages (pkgs: with pkgs; [ haskell-language-server $* ] )"
