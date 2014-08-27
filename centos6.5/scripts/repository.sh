#!/bin/sh
sudo rpm -i http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo rpm -i http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi

for TARGET in remi rpmforge
do
	sudo perl -i -pe 's/enabled(\s*)=(\s*)1/enabled\g{1}=\g{2}0/' /etc/yum.repos.d/${TARGET}.repo
done
sudo yum clean metadata
