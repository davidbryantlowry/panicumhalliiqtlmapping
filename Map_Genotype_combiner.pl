------------------------------------------------------------------------
Author: David Lowry
Email: davidbryantlowry@gmail.com

#This script combines a genetic map with
#the genotypes for that genetic map
------------------------------------------------------------------------

#!/usr/bin/perl

use warnings;
use strict;

my @map_rows;
my @map_array;
my @geno_rows;
my @geno_array;
my $length1;
my $counter1;
my $length2;
my $counter2;


my $file1 = $ARGV[0];
open(MAP, $file1);

my $file2 = $ARGV[1];
open(GENO, $file2);

#Read lines of map file into an array
while (<MAP>){
	chomp;
	@map_rows = split('\,');
	$length1 = scalar @map_rows;
	push(@map_array, [@map_rows]);
	$counter1++;
	}
	
#Read lines of genotype file into an array
while (<GENO>){
	chomp;
	@geno_rows = split('\,');
	$length2 = scalar @geno_rows;
	push(@geno_array, [@geno_rows]);
	$counter2++;
	}	

#Print out the top row

print "Marker\,Lg\,pos\,";

for (my $x=1; $x < $length2-1; ++$x){
	print "$geno_array[0][$x]\,";
	}

print "$geno_array[0][$length2-1]\n";
	

#Print out the rest of the file
for (my $x=1; $x < $counter1; ++$x){
	for (my $y=1; $y < $counter2; ++$y){
		if("$map_array[$x][0]" eq "$geno_array[$y][0]"){
			print "$map_array[$x][0]\,$map_array[$x][1]\,$map_array[$x][2]\,";
			for (my $i=1; $i < $length2-1; ++$i){
				print "$geno_array[$y][$i]\,";
				}			
			print "$geno_array[$y][$length2-1]\n";
		}else{
			next;
		}
	}
}

