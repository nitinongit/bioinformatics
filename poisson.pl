#!/usr/bin/perl
# poisson.pl by Pete Swetits
# calculates the probability that a specific base was sequenced correctly
# parameters: [coverage] [y]
use strict; use warnings;

die "usage: poisson.pl <C, y>\n" unless @ARGV == 1; #check if 

my ($c, $y) = @ARGV; #c = coverage, y = # times specific base has been sequenced

#find y! using stirling's approximation
my $y_factorial = 
	2.71828 **
	((0.5 * log(2 * 3.14159265358979)) 
	+ ($y + 0.5) * log($y) 
	- $y + 1 / (12 * $y) 
	- 1 / (360 * ($y ** 3))); 

$y_factorial = int($y_factorial + 0.5);

#find probability of y
my $e = 2.71828; #Euler's number
my $p_y = ($c ** $y) / ($y_factorial * ($e ** $c));

print "Probability = ", $p_y, "\n";
