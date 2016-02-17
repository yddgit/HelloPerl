#!perl.exe
package AppConfig;
use strict;
use warnings;

sub new {
	my $class = shift();
	print("CLASS = $class\n");
	my $self = {};
	bless $self, $class;
	return $self;
}

sub define {
	print($_[1], ",", $_[2], ",", $_[3], ",", $_[4], "\n");
}

sub file {
	print "Loaded configure file: ".$_[1]."\n";
}

1;