#!/bin/sh

git clone https://github.com/tagomoris/xbuild.git
cd xbuild
for FILE in $(ls *-install)
do
	perl -i -pe 's{git://}{https://}' $FILE
done
cd ..
xbuild/perl-install 5.18.2 ~/local/perl-5.18
xbuild/ruby-install 2.1.1 ~/local/ruby-2.1
