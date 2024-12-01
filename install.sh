#Update
sudo apt update 
#Install Kvm
sudo apt install qemu-kvm -y
#Install Win
wget -O win11.iso "https://computernewb.com/isos/windows/Win11_23H2_English_x64v2.iso"
#Install Driver
wget -O driver.iso "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.262-2/virtio-win-0.1.262.iso"
#novnc
git clone https://github.com/novnc/noVNC.git
#login novnc
noVNC/utils/novnc_proxy
#Run KVM
sudo kvm -cpu host,+topoext,hv_relaxed,hv_spinlocks=0x1fff,hv-passthrough,+pae,+nx,kvm=on,+svm -smp 4,cores=4 -M q35,usb=on -device usb-tablet -m 8G -device virtio-balloon-pci -vga virtio -net nic,netdev=n0,model=virtio-net-pci -netdev user,id=n0,hostfwd=tcp::3389-:3389 -boot c -device virtio-serial-pci -device virtio-rng-pci -enable-kvm -drive file=/dev/sdc,format=raw,if=none,id=nvme0 -device nvme,drive=nvme0,serial=deadbeaf1,num_queues=8 -monitor stdio -drive if=pflash,format=raw,readonly=off,file=/usr/share/ovmf/OVMF.fd -uuid e47ddb84-fb4d-46f9-b531-14bb15156336 -vnc :0 -drive file=driver.iso,media=cdrom -drive file=win11.iso,media=cdrom
