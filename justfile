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
	nom build .#nixosConfigurations.{{host}}.config.system.build.toplevel --out-link /tmp/nixos-configuration
	nvd diff /run/current-system /tmp/nixos-configuration
	sudo nixos-rebuild --flake .#{{host}} boot

copy $host:
	rsync -ax --delete --rsync-path="sudo rsync" ./ {{host}}:/etc/nixos/
