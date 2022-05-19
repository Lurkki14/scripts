#/usr/bin/env

nix-shell -E "
	#{ nixpkgs ? import <nixpkgs> {} }:
	let
	  fromNixpkgsCommit = commit: fetchTarball (\"https://github.com/NixOS/nixpkgs/archive/\" + commit + \".tar.gz\");
  	  unstablePkgs = import (fromNixpkgsCommit \"52dc75a4fee3fdbcb792cb6fba009876b912bfe0\") {};
	in
	with unstablePkgs; mkShell {
	  buildInputs = [ $* ];
	}
"

