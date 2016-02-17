#!perl.exe
package Util::String;
use strict;
use warnings;

# 去掉左边空白字符
sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s }
# 去掉右边空白字符
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s }
# 去掉首尾空白字符
sub trim  { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s }

1;