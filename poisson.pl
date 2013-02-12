#!/usr/bin/perl
# poisson.pl by Pete Swetits
# calculates the probability of k, p(k), given k and lambda
# parameters: [lambda] [k]
use strict; use warnings;

my ($l, $k) = @ARGV;

#find k! using stirling's approximation
my $k_factorial = 
	2.71828 **
	((0.5 * log(2 * 3.14159265358979)) 
	+ ($k + 0.5) * log($k) 
	- $k + 1 / (12 * $k) 
	- 1 / (360 * ($k ** 3))); 

$k_factorial = int($k_factorial + 0.5);

#find probability of k
my $e = 2.71828; #Euler's number
my $p_k = ($l ** $k) / ($k_factorial * ($e ** $l));

print "The probability of k is ", $p_k, ".\n";
