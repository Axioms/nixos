# vim: set ft=make :

update:
  nix flake update

check:
  nix flake check

fmt:
	nix fmt .

lint host=shell("hostname"): fmt
	statix check

build host=shell("hostname"): lint
	nom build .#nixosConfigurations.{{host}}.config.system.build.toplevel --out-link /tmp/nixos-configuration

test host=shell("hostname"): (build host)
	sudo /tmp/nixos-configuration/dry-activate

diff host=shell("hostname"): (test host)
	nvd diff /run/current-system /tmp/nixos-configuration

apply host=shell("hostname"): (diff host)
	sudo nixos-rebuild --flake .#{{host}} boot

applynow host=shell("hostname"): (diff host)
	sudo nixos-rebuild --flake .#{{host}} switch


copy host=shell("hostname"):
	rsync -ax --delete --rsync-path="sudo rsync" ./ {{host}}:/etc/nixos/
