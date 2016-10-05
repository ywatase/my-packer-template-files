# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
if [[ "$VBOX_VERSION" = "" ]] ; then
	exit
fi
if ! [[ "$RUN_VIRTUALBOX_SHELL" = "yes" ]] ; then
	exit
fi
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

