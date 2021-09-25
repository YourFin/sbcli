{ pkgs ? import <nixpkgs> { } }:

with pkgs;

callPackage (import ./sbcli.nix) { inherit stdenv pkgs; }
