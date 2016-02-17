#!perl.exe
package Barebones;
use strict;
use warnings;

# 可以在本文件所在目录执行如下命令测试该代码：
# On linux
# perl -I. -MBarebones -e 'my $b = Barebones->new()'
# On windows
# perl -I. -MBarebones -e "my $b = Barebones->new()"
# 以上命令表示：将当前目录加入库路径，使用Barebones模块，然后创建一个新的Barebones对象

# 如果调用Barebones::new()而不是Barebones->new()，类名将不会传递到new()，new()将只是普通的函数 

my $count = 0;				# how many objects

# 添加成员数据$count和方法count()，使用如下命令测试该代码：
# On linux
# perl -I. -MBarebones -e 'my $b = Barebones->new(); Barebones->new(); print $b->count;'
# On Windows
# perl -I. -MBarebones -e "my $b = Barebones->new(); Barebones->new(); print $b->count;"
# 以上命令得到2这个结果，构造器被调用两次，修改了$count，$count被限制在Barebones包的作用域，而不是
# 每个Barebones对象的作用域。每个对象的引用是传递给调用方法的第一个参数。

# 几个特殊的方法：
# DESTROY()是对象的析构器，一般不要使用
# AUTOLOAD()是用来允许动态方法名称的catch all方法

# this class takes no constructor parameters
sub new {
	my $classname = shift;	# we know our class name
	print $classname."\n";
	$count ++;				# remember how many objects
	bless {}, $classname;	# and bless an anonymous hash
}

sub count {
	my $self = shift;		# this is the object itself
	return $count;
}

1;
