#!/usr/bin/env perl

# STDIN: NIST SGM Format text file
# STDOUT: raw text file 

while (<>) {
    if (m/^<seg.*?>\s*(.*?)\s*<\/seg>\s*\n/){
        print "$1\n";
    }
#    elsif (not m/^\s*</){
#	print ;
#    }
}
