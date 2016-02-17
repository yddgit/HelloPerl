#!perl.exe
package Barebones::Animal;
use strict;
use warnings;
use Barebones;					# the parent class 父类
our @ISA = qw(Barebones);		# announce we're a child of Barebones 继承Barebones类

# note that @ISA was left as a global default variable,
# and "use stritc" comes after its declaration.
# That's the esaiest way to do it.
# @ISA是一个全局变量

# new() method
sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = $class->SUPER::new();	# use the parent's new() method
	bless $self, $class;				# and bless an anonymous hash
}

my $b = Barebones->new();
my $a = Barebones::Animal->new();
1;
