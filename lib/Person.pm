#!perl.exe
package Person;
use strict;
# new()方法是对象的构造函数，是创建该类的对象实例必须被调用的，它返回该对象的引用
# 将类名与引用相结合称为"bless"一个对象，其语法为：bless YeReference [,classname]
# YeReference是被bless对象的引用，classname是指定对象获取方法的包名，缺省为当前包名
# 也可以通过函数bless来声明一个构造函数
sub new {
	my $class = shift();
	print("CLASS = $class\n");
	my $self = {};
	$self->{"name"} = shift();
	$self->{"sex"} = shift();
	bless $self, $class;
	return $self;
}
# perl类中的方法就是perl的子函数，规定第一个参数为对象或者被引用的包，分为静态方法和虚方法。

# 虚方法通常首先把第一个参数shift到变量self或this中，然后将该值作普通的引用使用。
# 一是通过对象引用（虚方法），一是直接使用类名（表态方法）
sub getContractList {
	return "Get Contract List.\n";
}

# perl支持重载，当两个不同的类中含有相同的方法名称的时候，可以用::操作符指定使用哪个类中的方法
# $mess = Qava::grind("whole", "lotta", "bags");
# Qava::grind($mess, "whole", "lotta", "bags");
# 由于perl采用了简单的、基于引用的垃圾回收系统，当某对象最后一个应用释放到内存池时，就自动销毁
# 因此一般不需要定义类的析构函数

# perl通过数据@ISA支持继承
# 详见： Person::Employee

# 父类中的方法，子类中重载的方法见：Employee.pm
sub getFirstName {
	my($self) = @_;
	print "This is Person class function\n";
	return $self->{"name"};
}

1;