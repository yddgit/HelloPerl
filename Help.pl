#!perl.exe
use strict;
use warnings;

print 'Help：'."\n";
print '方法参数为@_'."\n";
print '方法第一个参数为$_[0]'."\n";
print 'Map循环时，当前元素为$_'."\n";

use Data::Dumper;
use Win32::OLE;
use Win32::OLE::Const '.*Excel';
my @libs = Win32::OLE::Const->EnumTypeLibs(\&callback);
sub callback {
	if($_[1] =~ /.*Excel.*/) {
		print $_[1]."\n";
	}
}
