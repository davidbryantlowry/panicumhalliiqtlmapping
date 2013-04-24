
------------------------------------------------------------------------
Author: David Lowry
Email: davidbryantlowry@gmail.com

#This file takes phenotype data
#and combines it with genotype file in order
#to make new rQTL file.
------------------------------------------------------------------------

#!/usr/bin/perl

use warnings;
use strict;

my @geno_rows;
my @geno_array;
my @quan_rows;
my @quan_array;
my $counter1;
my $counter2;
my $counter3;
my $counter4;

my $file1 = $ARGV[0];
open(GENO, $file1);

my $file2 = $ARGV[1];
open(QUAN, $file2);

#Read lines of genotype file into an array
while (<GENO>){
	chomp;
	@geno_rows = split(',');
	$counter1 = scalar @geno_rows;
	push(@geno_array, [@geno_rows]);
	$counter4++;
	}
	
#Read lines of the phenotype file into an array
while (<QUAN>){
	chomp;
	@quan_rows = split(',');
	$counter2 = scalar @quan_rows; 
	push(@quan_array, [@quan_rows]);
	$counter3++;
	}

#Correct for missing data	
#$counter2 = 25;

#print out the top row of the file

for (my $i=0; $i < $counter2; ++$i){
			print "$quan_array[0][$i]\,";
	}

			
for (my $j=0; $j < $counter1-1; ++$j){
			print "$geno_array[0][$j]\,";
	}
print "$geno_array[0][$counter1-1]\n";

#Print second row of file
for (my $i=0; $i < $counter2; ++$i){
			print "\,";	
	}
				
for (my $j=0; $j < $counter1-1; ++$j){
			print "$geno_array[1][$j]\,";
	}
print "$geno_array[1][$counter1-1]\n";

#Print third row of file

for (my $i=0; $i < $counter2; ++$i){
			print "\,";	
	}
	
for (my $j=0; $j < $counter1-1; ++$j){
			print "$geno_array[2][$j]\,";
	}
print "$geno_array[2][$counter1-1]\n";

#print out rest of file using nested loops

for (my $x=0; $x < $counter3; ++$x){
	for (my $y=0; $y < $counter4; ++$y){
		if ($quan_array[$x][0] eq $geno_array[$y][0]){
			for (my $i=0; $i < $counter2; ++$i){
				print "$quan_array[$x][$i]\,";
			}
			for (my $j=0; $j < $counter1-1; ++$j){
				print "$geno_array[$y][$j]\,";
			}
				print "$geno_array[$y][$counter1-1]\n";
			}
			
		}
	}

