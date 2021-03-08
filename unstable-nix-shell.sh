#/usr/bin/env

nix-shell -E "
	#{ nixpkgs ? import <nixpkgs> {} }:
	let
	  fromNixpkgsCommit = commit: fetchTarball (\"https://github.com/NixOS/nixpkgs/archive/\" + commit + \".tar.gz\");
  	  unstablePkgs = import (fromNixpkgsCommit \"15a64b2facc1b91f4361bdd101576e8886ef834b\") {};
	in
	with unstablePkgs; mkShell {
	  buildInputs = [ $* ];
	}
"

