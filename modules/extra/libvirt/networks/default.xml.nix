_:
# xml
''
  <network>
    <name>default</name>
    <uuid>552ce7d8-59e2-424c-b598-e9509bd87308</uuid>
    <forward mode="nat">
      <nat>
        <port start="1024" end="65535"/>
      </nat>
    </forward>
    <bridge name="virbr0" stp="on" delay="0"/>
    <mac address="52:54:00:71:1c:72"/>
    <domain name="default" localOnly="yes"/>
    <dns>
      <host ip="192.168.122.1">
        <hostname>gateway</hostname>
      </host>
    </dns>
    <ip address="192.168.122.1" netmask="255.255.255.0" localPtr="yes">
      <dhcp>
        <range start="192.168.122.2" end="192.168.122.254"/>
      </dhcp>
    </ip>
  </network>
''
