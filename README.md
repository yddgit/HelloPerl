Learn Perl
==========

1. Store your Perl scripts anywhere you like in the project.
For example, in subdirectory bin or cgi-bin.

	工程根目录里存放perl脚本

2. To import from a package, use it, rather than require it.
For example, use Foo::Bar; rather than require ’../lib/Foo/Bar.pm’;

	导入模块使用use，不要使用require

3. Keep your own modules in dedicated subtrees of your project.

	将自定义模块放在工程的专用子目录下

4. For example, create a subdirectory lib as the root of the subtree
containing all *.pm files. Note that you can have more than
one such subtree. For example, you could also create test/lib
to store modules that are only imported by test scripts.

	如：创建一个lib子目录，将所有的*.pm文件存放在这个目录。将所有的测试脚本存入在test/lib目录下

5. Add the root directories of your subtrees to the @INC path(see [?title]).
For example, add the entries lib and test/lib there.

	将工程根目录加入到@INC路径里

6. Map package names to paths in the subtree (and vice versa).
For example, store code for the package Foo::Bar in file lib/Foo/Bar.pm
and ensure that lib/Foo/Baz.pm contains only package Foo::Baz.

	将包名和目录路径对应起来，如：Foo::Bar存放到lib/Foo/Bar.pm，lib/Foo/Baz.pm只有Foo::Baz包