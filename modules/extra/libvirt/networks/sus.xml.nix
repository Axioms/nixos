_:
# xml
''
  <network>
    <name>sus</name>
    <uuid>4077bf69-d4cc-44b3-b33d-33cf643994bd</uuid>
    <forward mode="nat"/>
    <bridge name="virbr1" stp="on" delay="0"/>
    <mac address="52:54:00:bf:1c:2a"/>
    <domain name="sus"/>
    <ip address="192.168.100.1" netmask="255.255.255.0">
      <dhcp>
        <range start="192.168.100.128" end="192.168.100.254"/>
      </dhcp>
    </ip>
  </network>
''
