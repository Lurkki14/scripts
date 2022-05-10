#/usr/bin/env

nix-shell -E "
	#{ nixpkgs ? import <nixpkgs> {} }:
	let
	  fromNixpkgsCommit = commit: fetchTarball (\"https://github.com/NixOS/nixpkgs/archive/\" + commit + \".tar.gz\");
  	  unstablePkgs = import (fromNixpkgsCommit \"c473cc8714710179df205b153f4e9fa007107ff9\") {};
	in
	with unstablePkgs; mkShell {
	  buildInputs = [ $* ];
	}
"

