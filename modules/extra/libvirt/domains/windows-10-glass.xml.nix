{
  pkgs,
  config,
  OVMFFull,
  ...
}:
let
in
# xml
''
  <domain xmlns:qemu="http://libvirt.org/schemas/domain/qemu/1.0" type="kvm">
    <name>windows-10-glass</name>
    <uuid>66ec900b-4a8f-4bd3-9096-425459466631</uuid>
    <metadata>
      <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
        <libosinfo:os id="http://microsoft.com/win/10"/>
      </libosinfo:libosinfo>
    </metadata>
    <memory unit="KiB">33554432</memory>
    <currentMemory unit="KiB">33554432</currentMemory>
    <vcpu placement="static">16</vcpu>
    <sysinfo type="smbios">
      <bios>
        <entry name="vendor">American Megatrends Inc.</entry>
        <entry name="version">1003</entry>
        <entry name="date">01/17/2025</entry>
      </bios>
      <system>
        <entry name="manufacturer">ASUS</entry>
        <entry name="product">ROG STRIX X870E-E GAMING WIFI</entry>
        <entry name="version">Rev 1.xx</entry>
      </system>
      <baseBoard>
        <entry name="manufacturer">ASUSTeK COMPUTER INC.</entry>
        <entry name="product">ROG STRIX X870E-E GAMING WIFI</entry>
        <entry name="version">Rev 1.xx</entry>
        <entry name="serial">250250830900022</entry>
      </baseBoard>
    </sysinfo>
    <os firmware="efi">
      <type arch="x86_64" machine="pc-q35-10.1">hvm</type>
      <firmware>
        <feature enabled="no" name="enrolled-keys"/>
        <feature enabled="yes" name="secure-boot"/>
      </firmware>
      <loader readonly="yes" secure="yes" type="pflash" format="raw">${config.virtualisation.libvirtd.qemu.package}/share/qemu/edk2-x86_64-secure-code.fd</loader>
      <nvram template="${config.virtualisation.libvirtd.qemu.package}/share/qemu/edk2-i386-vars.fd" templateFormat="raw" format="raw">/var/lib/libvirt/qemu/nvram/windows11-no-pass_VARS.fd</nvram>
      <bootmenu enable="no"/>
      <smbios mode="sysinfo"/>
    </os>
    <features>
      <acpi/>
      <apic/>
      <hyperv mode="custom">
        <relaxed state="on"/>
        <vapic state="on"/>
        <spinlocks state="on" retries="8191"/>
        <vpindex state="on"/>
        <runtime state="on"/>
        <synic state="on"/>
        <stimer state="on"/>
        <reset state="on"/>
        <vendor_id state="on" value="1234567890ab"/>
        <frequencies state="on"/>
        <tlbflush state="on"/>
      </hyperv>
      <kvm>
        <hidden state="on"/>
      </kvm>
      <vmport state="off"/>
      <smm state="on"/>
    </features>
    <cpu mode="host-passthrough" check="none" migratable="on">
      <topology sockets="1" dies="1" clusters="1" cores="8" threads="2"/>
    </cpu>
    <clock offset="utc">
      <timer name="rtc" tickpolicy="catchup" track="guest"/>
      <timer name="pit" tickpolicy="delay"/>
      <timer name="hpet" present="no"/>
      <timer name="hypervclock" present="yes"/>
    </clock>
    <on_poweroff>destroy</on_poweroff>
    <on_reboot>restart</on_reboot>
    <on_crash>destroy</on_crash>
    <pm>
      <suspend-to-mem enabled="no"/>
      <suspend-to-disk enabled="no"/>
    </pm>
    <devices>
      <emulator>/run/libvirt/nix-emulators/qemu-system-x86_64</emulator>
      <disk type="file" device="cdrom">
        <driver name="qemu" type="raw"/>
        <source file="/mnt/data/ISOs/OS/virtio-win-0.1.266.iso"/>
        <target dev="sda" bus="sata"/>
        <readonly/>
        <boot order="1"/>
        <address type="drive" controller="0" bus="0" target="0" unit="0"/>
      </disk>
      <controller type="usb" index="0" model="qemu-xhci" ports="15">
        <address type="pci" domain="0x0000" bus="0x03" slot="0x00" function="0x0"/>
      </controller>
      <controller type="pci" index="0" model="pcie-root"/>
      <controller type="pci" index="1" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="1" port="0x10"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x0" multifunction="on"/>
      </controller>
      <controller type="pci" index="2" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="2" port="0x11"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x1"/>
      </controller>
      <controller type="pci" index="3" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="3" port="0x12"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x2"/>
      </controller>
      <controller type="pci" index="4" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="4" port="0x13"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x3"/>
      </controller>
      <controller type="pci" index="5" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="5" port="0x14"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x4"/>
      </controller>
      <controller type="pci" index="6" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="6" port="0x15"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x5"/>
      </controller>
      <controller type="pci" index="7" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="7" port="0x16"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x6"/>
      </controller>
      <controller type="pci" index="8" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="8" port="0x17"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x7"/>
      </controller>
      <controller type="pci" index="9" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="9" port="0x18"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x0" multifunction="on"/>
      </controller>
      <controller type="pci" index="10" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="10" port="0x19"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x1"/>
      </controller>
      <controller type="pci" index="11" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="11" port="0x1a"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x2"/>
      </controller>
      <controller type="pci" index="12" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="12" port="0x1b"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x3"/>
      </controller>
      <controller type="pci" index="13" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="13" port="0x1c"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x4"/>
      </controller>
      <controller type="pci" index="14" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="14" port="0x1d"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x5"/>
      </controller>
      <controller type="pci" index="15" model="pcie-root-port">
        <model name="pcie-root-port"/>
        <target chassis="15" port="0x1e"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x6"/>
      </controller>
      <controller type="pci" index="16" model="pcie-to-pci-bridge">
        <model name="pcie-pci-bridge"/>
        <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
      </controller>
      <controller type="virtio-serial" index="0">
        <address type="pci" domain="0x0000" bus="0x04" slot="0x00" function="0x0"/>
      </controller>
      <controller type="sata" index="0">
        <address type="pci" domain="0x0000" bus="0x00" slot="0x1f" function="0x2"/>
      </controller>
      <interface type="network">
        <mac address="52:54:00:ea:70:a0"/>
        <source network="default"/>
        <model type="virtio"/>
        <link state="up"/>
        <address type="pci" domain="0x0000" bus="0x02" slot="0x00" function="0x0"/>
      </interface>
      <channel type="spicevmc">
        <target type="virtio" name="com.redhat.spice.0"/>
        <address type="virtio-serial" controller="0" bus="0" port="1"/>
      </channel>
      <input type="mouse" bus="ps2"/>
      <input type="keyboard" bus="ps2"/>
      <tpm model="tpm-crb">
        <backend type="emulator" version="2.0">
          <profile name="default-v1"/>
        </backend>
      </tpm>
      <graphics type="spice" port="5902" autoport="no">
        <listen type="address"/>
        <image compression="off"/>
        <gl enable="no"/>
      </graphics>
      <sound model="ich9">
        <audio id="1"/>
        <address type="pci" domain="0x0000" bus="0x00" slot="0x1b" function="0x0"/>
      </sound>
      <audio id="1" type="spice"/>
      <video>
        <model type="none"/>
      </video>
      <hostdev mode="subsystem" type="pci" managed="yes">
        <source>
          <address domain="0x0000" bus="0x04" slot="0x00" function="0x0"/>
        </source>
        <address type="pci" domain="0x0000" bus="0x06" slot="0x00" function="0x0"/>
      </hostdev>
      <hostdev mode="subsystem" type="pci" managed="yes">
        <source>
          <address domain="0x0000" bus="0x0b" slot="0x00" function="0x0"/>
        </source>
        <address type="pci" domain="0x0000" bus="0x08" slot="0x00" function="0x0"/>
      </hostdev>
      <hostdev mode="subsystem" type="pci" managed="yes">
        <source>
          <address domain="0x0000" bus="0x0e" slot="0x00" function="0x0"/>
        </source>
        <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
      </hostdev>
      <hostdev mode="subsystem" type="pci" managed="yes">
        <source>
          <address domain="0x0000" bus="0x0e" slot="0x00" function="0x1"/>
        </source>
        <address type="pci" domain="0x0000" bus="0x07" slot="0x00" function="0x0"/>
      </hostdev>
      <redirdev bus="usb" type="spicevmc">
        <address type="usb" bus="0" port="1"/>
      </redirdev>
      <redirdev bus="usb" type="spicevmc">
        <address type="usb" bus="0" port="2"/>
      </redirdev>
      <watchdog model="itco" action="reset"/>
      <memballoon model="none"/>
      <rng model="virtio">
        <backend model="random">/dev/urandom</backend>
        <address type="pci" domain="0x0000" bus="0x09" slot="0x00" function="0x0"/>
      </rng>
    </devices>
   <qemu:commandline>
     <qemu:arg value="-device"/>
     <qemu:arg value="{'driver':'ivshmem-plain','id':'shmem0','memdev':'looking-glass'}"/>
     <qemu:arg value="-object"/>
     <qemu:arg value="{'qom-type':'memory-backend-file','id':'looking-glass','mem-path':'/dev/kvmfr0','size':268435456,'share':true}"/>
   </qemu:commandline>
  </domain>
''
