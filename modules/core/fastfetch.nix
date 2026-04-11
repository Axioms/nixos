_:

{

  home-manager.users.axiom = _: {

    programs.fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https=//github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        logo = {
          padding = {
            top = 15;
          };
          type = "small";
        };
        general = {
          thread = true;
        };
        display = {
          separator = " ";
          bar = {
            char = {
              elapsed = "=";
            };
            charTotal = "-";
            width = 13;
          };
          percent = {
            type = 11;
          };
        };
        modules = [
          {
            key = "╭───────────╮";
            type = "custom";
          }
          {
            key = "│ {#31} User    {#keys}│";
            type = "title";
            format = "{6}{7}{8}";
          }
          {
            type = "os";
            key = "│ {#33} OS      {#keys}│";
            format = "{pretty-name} {variant}";
          }
          {
            type = "kernel";
            key = "│ {#34} Kernel  {#keys}│";
            format = "{release}";
          }
          {
            type = "uptime";
            key = "│ {#35} Uptime  {#keys}│";
          }
          {
            type = "loadavg";
            key = "│ {#36} Load    {#keys}│";
          }
          {
            type = "processes";
            key = "│ {#37} PS      {#keys}│";
          }
          {
            type = "packages";
            key = "│ {#31} Package {#keys}│";
          }
          {
            type = "shell";
            key = "│ {#32} Shell   {#keys}│";
            format = "{pretty-name}";
          }
          {
            type = "editor";
            key = "│ {#33}󰙏 Editor  {#keys}│";
            format = "{2}";
          }
          {
            key = "├───────────┤";
            type = "custom";
          }
          {
            type = "cpu";
            key = "│ {#34} CPU     {#keys}│";
            showPeCoreCount = true;
            temp = true;
            format = "{1} {3}({4}) {6}/{7} {8}";
          }
          {
            type = "cpuusage";
            percent = {
              green = 70;
              yellow = 80;
            };
            key = "│ {#35}󰻠 Avg     {#keys}│";
            format = "{6} {1}";
          }
          {
            type = "cpuusage";
            key = "│ {#35}󰻠 Max     {#keys}│";
            format = "{7} {2}";
          }
          {
            type = "cpuusage";
            key = "│ {#35}󰻠 Min     {#keys}│";
            format = "{8} {4}";
          }
          {
            type = "gpu";
            key = "│ {#36} GPU     {#keys}│";
            driverSpecific = true;
            temp = true;
          }
          {
            key = "├───────────┤";
            type = "custom";
          }
          {
            type = "memory";
            key = "│ {#37} Memory  {#keys}│";
          }
          {
            type = "swap";
            key = "│ {#31}󰾴 Swap    {#keys}│";
          }
          {
            type = "disk";
            key = "│ {#32}󰉉 Root   {#keys} │";
            folders = "/";
            format = "{13} {1}/{2} ({3})";
          }
          {
            type = "disk";
            key = "│ {#32}󰉉 Home   {#keys} │";
            folders = "/home";
            format = "{13} {1}/{2} ({3})";
          }
          {
            type = "disk";
            key = "│ {#32}󰉉 Backup {#keys} │";
            folders = "/mnt/backup";
            format = "{13} {1}/{2} ({3})";
          }
          {
            type = "disk";
            key = "│ {#32}󰉉 data   {#keys} │";
            folders = "/mnt/data";
            format = "{13} {1}/{2} ({3})";
          }
          {
            type = "disk";
            key = "│ {#32}󰉉 libvirt {#keys}│";
            folders = "/mnt/libvirt";
            format = "{13} {1}/{2} ({3})";
          }
          {
            type = "disk";
            key = "│ {#32}󰉉 dnu    {#keys} │";
            folders = "/mnt/dnu";
            format = "{13} {1}/{2} ({3})";
          }
          {
            key = "├───────────┤";
            type = "custom";
          }
          {
            type = "weather";
            key = "│ {#33}󰖕 Weather{#keys} │";
            timeout = 500;
            format = "{1}";
          }
          {
            type = "media";
            key = "│ {#34} Media  {#keys} │";
            format = "{1} ({5})";
          }
          {
            type = "localip";
            key = "│ {#35}󰈀 Network{#keys} │";
            format = "{1} ({4})";
            showIpv6 = true;
            showMac = false;
            showSpeed = false;
            showMtu = false;
            showLoop = true;
            showFlags = false;
            showAllIps = true;
            compact = true;
          }
          {
            type = "dns";
            key = "│ {#36} DNS    {#keys} │";
          }
          {
            type = "wifi";
            key = "│ {#37}󰖩 Wifi   {#keys} │";
          }
          {
            type = "datetime";
            key = "│ {#31} Date   {#keys} │";
            format = "{13}:{18}:{20}{21} {22}  {4}/{11}/{2}";
          }
          {
            type = "command";
            key = "│ {#32} Users  {#keys} │";
            shell = "/bin/sh";
            text = "users | wc -w";
            format = "{1} users logged in";
          }
          {
            type = "netio";
            key = "│ {#32}󰓢 Net I/O{#keys} │";
            format = "{1} {2}";
          }
          {
            type = "command";
            key = "│ {#33} Updates{#keys} │";
            shell = "/bin/sh";
            text = ''git -C "/home/nix/nixos" fetch & git -C "/home/nix/nixos" rev-list --count HEAD..origin/main'';
            format = "{1} Update(s) available";
          }
          {
            key = "╰───────────╯";
            type = "custom";
          }
          {
            type = "custom";
            key = "{#keys}";
            format = " {#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39}       {#38}  {#37}  {#36}  {#35}  {#34}  {#33}  {#32}  {#31}  {#90}";
          }
        ];
      };

    };
  };
}
