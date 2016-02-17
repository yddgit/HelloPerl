#!perl.exe
use strict;
use warnings;
use utf8;
use Spreadsheet::ParseExcel;

# 文件乱码和"Wide character in print at ..."问题
binmode(STDIN , ':encoding(utf8)');
binmode(STDOUT, ':encoding(utf8)');
binmode(STDERR, ':encoding(utf8)');

my $parser = new Spreadsheet::ParseExcel;

# 从命令行获取文件名参数
# die "You must provide a filename to $0 to be parsed as an Excel file"
# unless @ARGV;

my $workbook = $parser->Parse( "parse.xls" );
my ( $row, $col, $worksheet, $cell );
print "FILE  :", $workbook->{"File"},       "\n";
print "COUNT :", $workbook->{"SheetCount"}, "\n";
print ("AUTHOR:", $workbook->{"Author"},     "\n") if defined $workbook->{"Author"};

for ( my $sheet = 0 ; $sheet < $workbook->{"SheetCount"} ; $sheet++ ) {
	
	$worksheet = $workbook->{"Worksheet"}[$sheet];
	print ("---------SHEET:", $worksheet->{"Name"}, "\n");

	for ( my $row = $worksheet->{"MinRow"} ;
		defined $worksheet->{"MaxRow"} && $row <= $worksheet->{"MaxRow"} ;
		$row++ ) {

		for ( my $col = $worksheet->{"MinCol"} ;
			defined $worksheet->{"MaxCol"} && $col <= $worksheet->{"MaxCol"} ;
			$col++ ) {
			$cell = $worksheet->{"Cells"}[$row][$col];
			print ($cell->Value, ",") if ($cell);
		}
		print "\n";
	}
}
