{
  ...
}:
let
in
# xml
''
  <network>
    <name>Host Only</name>
    <uuid>0beb8a8b-2238-49a1-b5b3-84e8f2ac4e79</uuid>
    <bridge name="virbr2" stp="on" delay="0"/>
    <mac address="52:54:00:2f:3b:e0"/>
    <domain name="Host Only" localOnly="yes"/>
    <dns>
      <host ip="192.168.16.1">
        <hostname>gateway</hostname>
      </host>
    </dns>
    <ip address="192.168.16.1" netmask="255.255.255.0" localPtr="yes">
      <dhcp>
        <host mac="52:54:00:4f:52:0f" ip="192.168.16.2"/>
      </dhcp>
    </ip>
  </network>
''
