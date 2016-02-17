#!perl.exe
# note: the following code will generate warnings with the -w switch, 
# and won't even compile with "use strict".  It is meant to demonstrate
# package and lexical variables.  You should always "use strict".
# pay attention to every line!
# this is a global package variable; you shouldn't have any with "use strict"
# it is implicitly in the package called "main" 

$global_sound = "
";                                        # main包内的变量

package Cow;                              # the Cow package starts here
# this is a package variable, accessible from any other package as $Cow::sound
$sound = "moo";                           # Cow包内的$sound

# this is a lexical variable, accessible anywhere in this file
my $extra_sound = "stampede";             # 文件作用域内的变量

package Pig;                              # the Pig package starts, Cow ends
# this is a package variable, accessible from any other package as $Pig::sound
$Pig::sound = "oink";                     # Pig包内的$sound

$::global_sound = "pigs do it better";    # another "main" package variable
# we're back to the default (main) package

package main;
$::sound = "ah";                          # main包内的sound
print "Cows go: ", $Cow::sound;           # prints "moo"
print "\nPigs go: ", $Pig::sound;         # prints "oink"
print "\nExtra sound: ", $extra_sound;    # prints "stampede"
print "\nWhat's this I hear: ", $sound;   # $main::sound is undefined!
print "\nEveryone says: ", $global_sound; # prints "pigs do it better"

