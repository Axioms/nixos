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
	nixos-rebuild build --flake .#{{host}}
	nvd diff /run/current-system $(nix eval ".#nixosConfigurations.{{host}}.config.system.build.toplevel" --raw)
	nixos-rebuild switch --flake .#{{host}}
	rm result

copy $host:
	rsync -ax --delete --rsync-path="sudo rsync" ./ {{host}}:/etc/nixos/
