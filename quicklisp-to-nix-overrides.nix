{ pkgs }:

{
  cl-readline = x: { propagatedBuildInputs = [ pkgs.readline ]; };
}
