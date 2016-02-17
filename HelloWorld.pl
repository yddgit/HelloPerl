#!perl.exe -w
# HelloWorld.pl: a script to learn perl.
# by yang.dongdong 2015-11-12 10:41:03

# 以上：
# 第一行表示执行脚本时运行哪一个应用程序，-w 标志表示打开警告标志
# 第二行程序及其目的
# 第三行作者信息

####################################################

# 1. 标量（scalar）
my $var1 = 12;			#整数
my $var2 = 3.1415926;	#浮点数
my $var3 = "Hello\n";	#双引号内字符串可以通过\转义
my $var4 = 'World\n';	#单引号内\n不代表换行
my $var5 = $var3.$var4;	#.拼接操作符
my $var6 = $var4 x 3;	#x重复操作符
print($var1, " | ", $var2, " | ", $var3, " | ", $var4, " | ", $var5, " | ", $var6, "\n");
# 未定义标量undef
print $var1."\n" if defined $var1;
undef $var1;
print $var1."\n" if defined $var1;
print "\n\n";

####################################################

# 2. 数组（Arrays）
my @array = ("a", "b", "c", "d");	#数组
# 数组可以当做堆栈来处理，支持pop/push/shift/unshift
# pop/push对数组尾部进行处理，shift/unshift对数组头部进行处理
# pop弹出数组的最后一个元素, push添加元素
print($array[1], ",", pop(@array), ",", push(@array, "e"), ",", shift(@array), ",", unshift(@array, "f"), "\n");
print(@array, " ", scalar @array, "\n");
print "\n\n";

####################################################

# 3. 哈希，也称关联数组
my %hash = ("key1" => "23", "name" => "yang", "age" => "26");
# keys: 返回hash的键列表 my @keylist = keys %hash
# values: 返回值列表 my @valuelist = values %hash
# each: 用两个元素的列表返回键值对
while(($key, $value) = each %hash) {
	print "$key=>$value\n";
}
print "\n\n";

####################################################

# 4. 控制结构

# if语句
my $bool = 1;

if($bool == 1) {
	print "IF STATEMENT\n";
}

if($bool == 0) {
	print "IF STATEMENT\n";
} else {
	print "ELSE STATEMENT\n";
}

if($bool == 2) {
	print "IF STATEMENT\n";
} elsif($bool == 1) {
	print "ELSE IF STATEMENT\n";
} else {
	print "ELSE STATEMENT\n";
}

# unless语句
# unless 和 if 不同之处在于当条件表达式的值为假的时候才执行，同时 unless 后面还能跟 else 语句
my $mon = "January";

unless($mon =~ /^Feb/) {
	print "This month has at least thirty days.\n";
} else {
	print "Do you see what's going on here?\n"
}

# for循环
my $i = 0;

for($i = 0; $i < 5; $i++) {
	print $i." ";
} print "\n";

foreach $j (@array) {
	print $j." ";
} print "\n";

foreach (1..3) {
	# do something 3 times, $_ will be set to current number.
	print $_;
} print "\n";

foreach(1..2, 11..12) {
	# do someting 4 times, $_ will be set to current number.
	print $_;
} print "\n";

foreach my $c (0..1) {
	# do something twice, $c will be 0, then 1.
	print $c;
} print "\n";

foreach my $i (0..13) {
	next unless $i%5;		# next if this number is a multiple of 5
	print "$i is not a multiple of 5...\n";
	next unless $i%7;		# next if this number is a multiple of 7
	print "$i is not a multiple of 7...\n";
	next unless $i%12;		# next if this number is a multiple of 12
	# $i is now not a multiple of 12, 5, or 7
	print "$i is a lucky, lucky number to have met you...\n";
}

foreach (map{$_ *= 2} 0..3) { # 使用map对每个元素进行操作
	print "Even number: $_\n";
}

for (1..100) { # 输出1-100以1、2、7结尾的数字
	if( $_ =~ /.*[1|2|7]$/) {
		print $_." ";
	}
} print "\n";

# while循环
my $k = 0;

while($k++ < 5) {
	print $k." ";
} print "\n";

# do-while循环

do {
	print $k." ";
} while($k-- > 0);
print "\n";

# until循环
# until 与 while 结构相似，区别在于 unitl 会在条件为假的时候重复执行

until($k++ > 5) {
	print $k." ";
} print "\n";

print "\n\n";

####################################################

# 5. 函数

sub myFunction {
	# 所有参数自动存储在@_中，其中第一个参数为$_[0]
	print(@_, "\n");
	# 使用return语句显示返回，如无return，默认返回最后一次运算结果
	return 0;
}
# 调用：&functionName(arg1, arg2, ...), 如果声明在前，可省略"&"
&myFunction(1, 2.3, "four"); # 传递引用，在参数前加入\表示为引用

sub chomp {
	print "It is my chomp\n";
}
# 如果用户定义的子过程与内置函数重名，则不能省略"&"
&chomp();

####################################################

# 6. 模块
# 定义语法： package mypack;
# 导入模块： use ModuleName;
# 取消导入： no ModuleName;

####################################################

# 7. OOP

# 创建perl类和对象, 详见：lib/Person.pm
use Person;
use Person::Employee;
$object = Person::Employee->new("Jimmy", "Male", 345);
print $object->{"name"}.",".$object->{"sex"}."\n";
print $object->getContractList();
print $object->getFirstName()."\n";			#子类方法直接调用
print $object->Person::getFirstName()."\n";	#调用父类方法

####################################################

# 8. 正则表达式有三种形式：

# - 匹配：m/<regexp>/，可简写为/<regexp>;/，略去m
# - 替换：s/<pattern>/<replacement>/，可简写为/<pattern>/<replacement>/，略去s
# - 转换：tr/<charClass>/<substituteClass>/，这种形式包含一系列的字符<charClass>同时把它们替换为<substituteClass>

# perl常用的匹配模式
print "bac" =~ /b.c/;		# .			匹配除换行符以外的所有字符
print "bc" =~ /b?c/;		# x?		匹配0次或一次x字符串
print "bbc" =~ /b*c/;		# x*		匹配0次或多次x字符串，但匹配可能的最少次数
print "bc" =~ /b+c/;		# x+		匹配1次或多次x字符串，但匹配可能的最少次数
print "bgdc" =~ /b.*c/;		# .*		匹配0次或一次任何字符
print "bgc" =~ /b.+c/;		# .+		匹配1次或多次任何字符
print "bbbbbc" =~ /b{5}c/;	# {m}		匹配刚好是m个的指定字符串
print "bb" =~ /b{1,2}/;		# {m,n}		匹配m个以上n个以下的指定字符串
print "bbb" =~ /b{2,}/;		# {m,}		匹配m个以上的指定字符串
print "bdc" =~ /b[d]c/;		# []		匹配符合[]内的字符
print "bAc" =~ /b[^d]c/;	# [^]		匹配不符合[]内的字符
print "b1c" =~ /b[0-9]c/;	# [0-9]		匹配所有数字字符
print "bac" =~ /b[a-z]c/;	# [a-z]		匹配所有小写字母字符
print "perldoc" =~ /^perl/;	# ^			匹配开头的字符
print "docperl" =~ /perl$/;	# $			匹配结尾的字符
print "b1c" =~ /b\dc/;		# \d		匹配一个数字的字符，和[0-9]语法一样
print "bAc" =~ /b\Dc/;		# \D		匹配非数字，其他同\d
print "b1c" =~ /b\wc/;		# \w		英文字母或数字的字符串，和[a-zA-Z0-9]语法一样
print "b c" =~ /b\Wc/;		# \W		非英文字母或数字的字符串，和[^a-zA-Z0-9]语法一样
print "b c" =~ /b\sc/;		# \s		空格，和[\n\t\r\f]语法一样
print "bac" =~ /b\Sc/;		# \S		非空格，和[^\n\t\r\f]语法一样
print "bc" =~ /\bbc\b/;		# \b		匹配以英文字母，数字为边界的字符串，\bbc\b不匹配bca
print "sand" =~ /sa\B/;		# \B		匹配不以英文字母，数字为边界的字符串，sa\B不匹配Melissa
print "a" =~ /a|b|c/;		# a|b|c		匹配符合a字符或是b字符或是c字符的字符串，abc匹配含有abc的字符串
print "b4c" =~ /b(\d)c/;	# (pattern)	这个符号会记住所找寻到的字符串，第一个()内找到的字符串存入$1或\1，第二个对应$2或\2，依此类推
print "\n";

####################################################

# 9. 多线程

# 对于线程的执行控制有两种方式，一种是join()，一种是detach()。
# 所谓join()就是在主线程中等待子线程的执行返回值，然后再继续执行后续代码。在调用线程join()方法之前，子线程与主线程的执行是分开的。
# 而detach()则是告诉解释器主线程不关心子线程的执行结果，所以该子线程在完成任务之后就自动退出，同时释放自己所占有的资源，而不用主线程再操心。

# perl默认任何数据结构都不是共享的，任何新创建的线程都有当前数据的私有拷贝，如要共享数据，必须使用threads::shared进行显示声明

# 同时perl线程还支持锁机制，可以使用lock方法实现线程间共享数据的锁机制。
# Perl中的Thread::Semaphore包为线程提供了信号量的支持，Thread：：Queue
# 包为线程提供了线程安全的队列支持。

# 方式1：

use threads;
sub say_hello {
	printf("Hello Thread! @_.\n");
	return (rand(10));
}
my $t1 = threads->create(\&say_hello, "param1", "param2");
$t1->detach();

# 方式2

my $t2 = async{
	printf("Hello Thread!\n");
};
$t2->detach();

# 使用threads::shared声明线程共享的数据
my $share_var		:shared = 0;	# use :share tag to define
my @share_array		:shared = ();	# use :share tag to define
my %share_hash = ();
#share(%share_hash);					# use share() function to define

####################################################

# Perl的一些编程实践

# 一、方法注释根据代码量的多少，对代码功能进行说明：

# Comment Style 1:
#
# function: do_hosts
#
# purpose: to process every host in the /etc/hosts table and see if it
# resolves to a valid IP
#
# solution: read the list of hosts as keys in a hash, then go through
# the list of keys (hosts) and store the IP address for each host as
# the value for that key, or undef() if it doesn't resolve properly.
# Return a reference to the hash, or undef if the /etc/hosts file was
# not accessible.

# Comment Style 2:
#
# function: do_hosts:  process every host in the /etc/hosts table and see if it
# resolves to a valid IP; return a reference to the hash (key=host,
# value=IP or undef), or undef if the /etc/hosts file was not accessible.

# Comment Style 3:
#
# do_hosts: returns a ref to hash of hosts (key=host, value=IP/undef)
# from /etc/hosts

####################################################

# 二、在 Perl 中，初始化节应该由下列部分组成（最好按该顺序）：
# - 模块和编译指示
# - 常量
# - BEGIN/END/INIT/CHECK 子例程
# - 初始化代码

#############################

# 1. 模块和编译指示

# use关键字命令解释器装入模块或打开编译指示，如：use utf8告诉解释器要准备好UTF-8编码的数据文件和流
use Data::Dumper;		# for debugging printouts
use strict;				# be strict - pragma for the interpreter
use POSIX;				# use the POSIX functions
use warnings;

#############################

# 2. 常量

use constant ALPHA => 1; # alpha code
use constant BETA  => 2; # beta code
use constant GAMMA => 3; # gamma code
use constant USER  => 4; # user ID offset
use constant GROUP => 5; # grouop ID offset
use constant DEPT  => 6; # dept ID offset

#############################

# 3. BEGIN/END/INIT/CHECK子例程

# BEGIN： executed at startup, assigns 'root' to the USER environment variable
BEGIN {
	$ENV{USER} = 'root';
}

#############################

# 4. 初始化代码

# 初始化代码打开自动刷新显示，然后告诉 Data::Dumper模块产生可读的输出，最后创建 AppConfig 配置

$| = 1;								# auto-flush the output
$Data::Dumper::Terse = 1;			# produce human-readable Data::Dumper output

# define the configuration variables

use AppConfig;
my $config = AppConfig -> new();
$config -> define (
	# list of undo commands
	'UNDO'		=> {"ARGCOUNT" => "ARGCOUNT_LIST" },
	# file to log data
	'LOG_FILE'	=> {"ARGCOUNT" => "ARGCOUNT_ONE" }
);
$config -> file('hello.conf');	# load the hello configuration file

#############################

# 5. 注释常规代码

print Dumper \%ENV;					#print the full ENV hash
# get the environment variable names that begin with USER
my @user_vars = grep(/^USER/, keys %ENV);
# print the values in all the variables that begin with USER, using a hash slice
print Dumper @ENV{@user_vars};
print "Done\n";						#print "done" message
#TODO: find better method of sorting variables
#TODO: use Data::Dumper with variable names

#############################

# 6. 注释循环和条件语句

# go through all the numbers between 2 and 200, and print a message
# for each one
foreach my $counter (1 .. 5) {
	print "Whoa, the counter is $counter!\n";
}

#############################

# 7. 注释程序的最终阶段

# delete old files, warn if they can't be removed
my @myfiles = ();
foreach (@myfiles) {
	unlink $_ or warn "Couldn't remove $_: $!";
}
print "HelloWorld.pl is done!\n";		# tell the user we're done
#exit;									# exit peacefully

#############################

# 8. 编写程序的POD文档和帮助

# Plain old documentation(POD) 是将perl脚本文档放入脚本本身的一种方法
# POD与各种手册格式化程序兼容，因此可以从同一个文档生成一个纯文本文件，Unix风格的帮助手册页和专业的LaTeX文件。
# POD文档中应该出现：
#  NAME,SYNOPSIS,DESCRIPTION,OPTIONS,RETURN VALUE,ERRORS,DIAGNOSTICS,ENVIRONMENT
#  FILES,EXAMPLES,CAVEATS/WARNINGS,BUGS,RESTRICTIONS,NOTES,SEE ALSO,AUTHORS,HISTORY

# 对于-h开关，若只想要选项的摘要和列表，可以编写使用-h开关的单独帮助处理程序

sub print_help {
	# print the help itself
	print <<EOHIPPUS;
This is help for the HelloWorld.pl program. You can pass options to HelloWorld.pl as command-line arguments. For example:
  HelloWorld.pl -h
  HelloWorld.pl -show suspects
List of options:
  -h        print this help
  -show     show the suspects, victims, or detectives. (all of them if no second argument is specified)
  -quiet    print no information other than the killer's name
EOHIPPUS
	#exit;	# do nothing else, just exit quietly
}
# show help information
&print_help();

#############################

# 9. 从标准输入获取数据

#my $readLine = <STDIN>;
#if($readLine =~ /^hello.*/) {
#	print $readLine;
#}

#############################

# 10. map()函数

my @p = (1,2,3,4);
# map {BLOCK GOES HERE} LIST;
map {$_++} @p; print(@p);	# increment every element of @p
# map EXPRESSION, LIST;
map -f, @p; print(@p);		# file test every element of @p

# 通常foreach()循环性能优于map()，但map()可以简化代码结构。
# map()可能通过更改$_变量在遍历数组元素时修改数组元素（$_是列表的当前元素）

# foreach() vs. map()

# "normal" (procedural) way
foreach(sort keys %ENV) { print "$_ => $ENV{$_}\n"; }
# FP way
map { print "$_ => $ENV{$_}\n"; } sort keys %ENV;

# 用map()实时修改列表

# 如下，数据@users只包含用户名，但在应用map()之后，该数组却包含具有键-值对的散列引用
# these are the users
my @users = ('joe', 'ted', 'larry');
# and this is an on-the-fly substitution of user names with hash references
map { $_ = { $_ => length }; } @users;
# @users is now ({'joe'=>3},{'ted'=>3},{'larry'=>5})
print Dumper @users;

# 如下，从文件路径创建每个文件的name、size、mtime项的映射，并使用Data::Dumper打印清单
use File::stat;
my @files = (
	'lib/Person/Employee.pm',
	'lib/AppConfig.pm',
	'lib/Person.pm',
	'HelloWorld.pl'
);
print Dumper
	map {
		my $sb = stat $_;
		$_ = (defined $sb) ? {
			name => $_,
			size => $sb->size(),
			mtime=> $sb->mtime()
		} : undef;
	} @files;

#############################

# 11. grep()函数

# grep {BLOCK GOES HERE} LIST;
print grep {$_ > 3} @p;		# only accept numbers more than 1
print "\n";
#grep {$_++} @p;			# please don't do this
# grep EXPRESSION, LIST;
grep /hi/, @p;				# only accept matching elements
grep !/hi/, @p;				# do not accept matching elements

# grep()中，$_成为当前正在检查的元素的别名，不要修改传递到grep()的列表中的元素，
# 那是map()做的事，使用grep()进行字符串匹配查找，用map()进行映射

# 使用grep()进行快速过滤会很方便，但foreach仍然具有更好的性能

# 如下，使用grep()过滤出奇数
my @num = (1,2,3,4);
my @results;
# the procedural approach
foreach(@num) {
	push @results, $_
	unless $_%2;
} print @results."\n";
# using grep - FP approach
@results = grep { !($_ % 2) } @num;
print @results."\n";

# 如下，使用grep()获得目录中的所有文件名
opendir(DIR, ".") || die "can't opendir: $!";	# get the directory handle
my @f = grep { /^[^\.]/ && -f } readdir(DIR);	# filter only files into @f
print Dumper @f;

# 如下，使用grep()获得所有运行中的perl进程
use Win32::Process::Info qw{NT};
my $pi = Win32::Process::Info -> new (undef, 'NT');
$pi->Set(elapsed_in_seconds => 0);		# In clocks, not seconds.
my @pids = $pi->ListPids();				# Get all known PIDs
my @info = $pi->GetProcInfo();			# Get the max
#my %subs = $pi->Subprocesses();		# Figure out subprocess relationships.
@info = grep {
	defined $_->{Name} && $_->{Name} =~ /^perl/
} $pi->GetProcInfo();					# All processes with 'perl' in name.
print Dumper @info;

#############################

# 12. 用map排序:Schwartzian和Guttman-Roseler变换

# sort()采用一个代码块并使用它来为所有元素排序，必须编写比较函数.
# sort()默认对列表中所有标量进行简单的字符串比较
my @oldlist = (3,5,1,2,9,6,4,10);
my @newlist = sort @oldlist;			# sort @oldlist alphabetically
print(@newlist, "\n");

# 对数字使用sort()
@oldlist = (1,2,5,200,'010');
@newlist = sort {$a <=> $b} @oldlist;	# sort @oldlist numerically，<=>cmp操作符参见: perldoc perlop
print(@newlist, "\n");
@newlist = reverse @newlist;			# reverse the list
print(@newlist, "\n");

# 按Hash成员进行排序
# create a list with two hash references
@oldlist = ({name=>"joe"}, {name=>"moe"});
# sort oldlist by value of the "name" key
@newlist = sort { $a->{name} cmp $b->{name}} @oldlist;
print Dumper @newlist;
# 以上排序过程若比较逻辑复杂，数据量巨大，则不容易实现，且容易出错

# Schwartzian变换
# create a list with some string
@oldlist = ('5 eagles', '10 hawks', '2 bulls', '8 cows');
# sort @oldlist by the first word in each string, numerically
@newlist = map(
	# 取出排序后的value
	$_->[1],
	sort(
		# 根据key排序
		{$a->[0] <=> $b->[0]}
		# 创建key,value临时列表
		map(
			[(split)[0], $_],
			@oldlist
		)
	)
);
print Dumper @newlist;
# 以上变换从内往外分析，选将@oldlist转换成一个： key(split后的第一个值),value(字符串本身)临时列表
# 然后对转换后的列表根据key排序，再对排序后的列表进行map转换，取出value，即是排序后的数组
# 所有中间过程中产生的数组均为临时列表，不更改@oldlist

#############################

# 13. Perl中的OOP

# 详见
# - Package.pl
# - lib/Barebones.pm
# - lib/Barebones/Animal.pm

# h2xs工具
# h2xs -A -n Module
# 以上命令执行后，将生成一个名为“Module”、且里面全是有用文件的框架目录。这些文件是： 
# - Module.pm ，模块本身，带有已经编写好的框架文档。 
# - Module.xs ，用于将您的模块与 C 代码链接。（有关详细信息，请运行“ perldoc perlxs ”。） 
# - MANIFEST ，用于打包的文件列表。 
# - test.pl ，框架测试脚本。 
# - Changes ，对该模块所做更改的日志。 
# - Makefile.PL ，makefile 生成器（用“ perl Makefile.PL ”运行它。） 