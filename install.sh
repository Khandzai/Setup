#Update
sudo apt update 
#Install Kvm
sudo apt install qemu-kvm -y
#Install Win
wget -O win10.iso "https://software.download.prss.microsoft.com/dbazure/Win10_22H2_English_x64v1.iso?t=9e893be0-b530-439e-b190-1f097b3863fb&P1=1733140294&P2=601&P3=2&P4=VHAMXxOf2X7teGKZzTOZ3%2bv4Q7xUUNAmU4cJQvMJo3mJmEIrEnwaw763Disf7uF7Y33nTfWqDvf%2fA91RTl8Fe%2fyP%2bkmmO7EWwVnB3U16J1iCMrSenInAtF0R18tKHJLNibTSN6CAT4fEFxebIK5B1xNMhrkmC6EGUNeLkdzDpzz5ZfnLpSCbgOI2v8MT7IM2lDXK22tlg6O0WNUzbtf9aPWLPyLEL2xSfIvGjtm60NQ%2f2UjYMWjFGjZBjbsTpMOyApuyVOzXt9ScbNUhcmDEx%2fS%2fdOy3VfyVopTs1DLBh9u24GYArPD6fzygqXAXDenVROwJyhoP%2feVuYHU%2b8M0uwQ%3d%3d"
#Install Driver
wget -O driver.iso "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.262-2/virtio-win-0.1.262.iso"
#Run KVM
sudo kvm -cpu host,+topoext,hv_relaxed,hv_spinlocks=0x1fff,hv-passthrough,+pae,+nx,kvm=on,+svm -smp 4,cores=4 -M q35,usb=on -device usb-tablet -m 8G -device virtio-balloon-pci -vga virtio -net nic,netdev=n0,model=virtio-net-pci -netdev user,id=n0,hostfwd=tcp::3389-:3389 -boot c -device virtio-serial-pci -device virtio-rng-pci -enable-kvm -drive file=/dev/sdc,format=raw,if=none,id=nvme0 -device nvme,drive=nvme0,serial=deadbeaf1,num_queues=8 -monitor stdio -drive if=pflash,format=raw,readonly=off,file=/usr/share/ovmf/OVMF.fd -uuid e47ddb84-fb4d-46f9-b531-14bb15156336 -vnc :0 -drive file=driver.iso,media=cdrom -drive file=win10.iso,media=cdrom
#novnc
git clone https://github.com/novnc/noVNC.git
#login novnc
noVNC/utils/novnc_proxy
