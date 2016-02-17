#!perl.exe
package Person::Employee;
use Person;
use strict;

# 当子类继承父类的时候，继承了父类的所有方法，但子类也可以覆盖父类的方法
our @ISA = qw(Person); # inherits from Person

# Override helper function
sub getFirstName {
	my($self) = @_;
	# This is child class function.
	print "This is Employee class function\n";
	return $self->{"name"};
}

1;