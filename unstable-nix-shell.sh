#/usr/bin/env

nix-shell -E "
	#{ nixpkgs ? import <nixpkgs> {} }:
	let
	  fromNixpkgsCommit = commit: fetchTarball (\"https://github.com/NixOS/nixpkgs/archive/\" + commit + \".tar.gz\");
  	  unstablePkgs = import (fromNixpkgsCommit \"79dd82eadd34300b04d1363be6a2ab84670ac0cb\") {};
	in
	with unstablePkgs; mkShell {
	  buildInputs = [ $* ];
	}
"

