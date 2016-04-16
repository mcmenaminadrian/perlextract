#!/usr/local/bin/perl -w

use strict;
use warnings;


my $number_args = $#ARGV + 1;
if ($number_args != 2) {
	die "\nUSAGE: You must specify an input and an output file.\n";
}
my $input_file = $ARGV[0];
my $output_file = $ARGV[1];

open (my $infh, "<", $input_file)
	or die "File $input_file cannot be read.\n";
open (my $outfh, ">", $output_file)
	or die "File $output_file cannot be written.\n";

my $count = 0;
print $outfh "count, cycles\n";
while (my $input_row = <$infh>) {
	if ($input_row =~ m/complete/) {
		$count++;
		my @all_numbs = $input_row =~ /(\d+)/g;
		print $outfh "$count, $all_numbs[2]\n";
	}
}
