# vim: set ft=make :

update:
  nix flake update

check:
  nix flake check

fmt:
	nix fmt .

test $host:
	nixos-rebuild dry-activate --flake .#{{host}}

apply $host:
	nixos-rebuild switch --flake .#{{host}}

copy $host:
	rsync -ax --delete --rsync-path="sudo rsync" ./ {{host}}:/etc/nixos/
