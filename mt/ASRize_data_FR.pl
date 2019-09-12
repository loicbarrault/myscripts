#!/usr/bin/perl

use strict;
use utf8;
use Lingua::FR::Numbers qw(num2fr num2fr_ordinal);

use open ':encoding(utf8)';
binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");

my @lines = ();
@lines=<>;

print STDERR "Transforming numbers in letters...\n";
foreach (@lines) {
	chomp;
	$_ =~ s/([0-9]+)\s{1,2}(?=\d{3,3}([^0-9]|$))/$1/g;
	$_ =~ s/([0-9]+,[0-9]+)/ @{[num2fr($&)]} /g; # Transform numbers in letters (roughly)
	$_ =~ s/([0-9]+\.[0-9]+)/ @{[num2fr($&)]} /g;
	$_ =~ s/([0-9]+)/ @{[num2fr($&)]} /g;
 	$_ =~ s/\b([0-9]+)th\b/@{[num2fr_ordinal($&)]}/g;
}	

print STDERR "Removing punct and all...\n";
foreach (@lines) {
	# Remove punct
	#$_ =~ tr/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëēìíîïñòóôõöùúûüýÿ/AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeeiiiinooooouuuuyy/;
	$_ =~ s/\./ /g;
	$_ =~ s/·/ /g;
	$_ =~ s/■/ /g;
	$_ =~ s/●/ /g;
	#$_ =~ s/\-/ /g;
	$_ =~ s/—/ /g;
	$_ =~ s/−/ /g;
	$_ =~ s/❏/ /g;
	$_ =~ s/›/ /g;
	$_ =~ s/∗/ /g;
	$_ =~ s/○/ /g;
	$_ =~ s// /g;
	$_ =~ s/◆/ /g;
	$_ =~ s/►/ /g;
	$_ =~ s/_/ /g; #need to keep _ for SYSTRAN entities
	$_ =~ s/¯/ /g;
	$_ =~ s/˜/ /g;
	$_ =~ s/†/ /g;
	$_ =~ s/,/ /g;
	$_ =~ s/\?/ /g;
	$_ =~ s/!/ /g;
	$_ =~ s/¡/ /g;
	$_ =~ s/>/ /g;
	$_ =~ s/</ /g;
	$_ =~ s/«/ /g;
	$_ =~ s/»/ /g;
	$_ =~ s/--/ /g;
	$_ =~ s/"/ /g;
	$_ =~ s/~/ /g;
	$_ =~ s/ ' / /g;
	$_ =~ s/´/ /g;
	$_ =~ s/‘/ /g;
	$_ =~ s/ˆ/ /g;
	$_ =~ s/\(/ /g;
	$_ =~ s/\^/ /g;
	$_ =~ s/\)/ /g;
	$_ =~ s/\|/ /g;
	$_ =~ s/:/ /g;
	$_ =~ s/§/ /g;
	$_ =~ s/¶/ /g;
	$_ =~ s/¤/ /g;
	$_ =~ s/∆/ /g;
	$_ =~ s/√/ /g;
	$_ =~ s/←/ /g;
	$_ =~ s/→/ /g;
	$_ =~ s/↑/ /g;
	$_ =~ s/↓/ /g;
	$_ =~ s/↔/ /g;
	$_ =~ s/®/ /g;
	$_ =~ s/©/ /g;
	$_ =~ s/º/ degrés /g;
	$_ =~ s/²/ carré /g;
	$_ =~ s/%/ pourcent /g;
	$_ =~ s/£/ livre /g;
	$_ =~ s/\$/ dollar /g;
	$_ =~ s/€/ euro /g;
	$_ =~ s/¥/ yen /g;
	$_ =~ s/=/ égal /g;
	#$_ =~ s/@/ chez /g;
	$_ =~ s/\+/ plus /g;
	$_ =~ s/÷/ divisé par /g;
	$_ =~ s/×/ fois /g;
	$_ =~ s/#/ /g;
	$_ =~ s/\*/ /g;
	#$_ =~ s/&/ /g; # need to keep & for html entitites
	#$_ =~ s/;/ /g;
	$_ =~ s/ & / /g; # need to keep & for html entitites
	$_ =~ s/ ; / /g;
	$_ =~ s/(^|\s)'(\s|$)/ /g;
	$_ =~ s/\[/ /g;
	$_ =~ s/\]/ /g;
	$_ =~ s/{/ /g;
	$_ =~ s/}/ /g;
	$_ =~ s/¦/ /g;
	$_ =~ s/\// /g;
	$_ =~ s/\\/ /g;
	$_ =~ s/ uvre / œuvre /g;
	$_ =~ s/ vux / vœux /g;
	$_ =~ s/\x{0153}/oe/g;
	$_ =~ s/\x{a9}/ /g;
	$_ =~ s/\x{ab}/ /g;
	$_ =~ s/\x{b0}/ degrés /g;
	$_ =~ s/\x{2013}/ /g;
	$_ =~ s/\x{2019}/ /g;
	$_ =~ s/\x{2022}/ /g;
	$_ =~ s/\x{2026}/ /g;
	$_ =~ s/\x{2109}/ /g;
	$_ =~ s/\x{2122}/ /g;
	$_ =~ s/\x{25e6}/ /g;
	$_ =~ s/\x{266a}/ /g;
	$_ =~ s/\x{266b}/ /g;
	$_ =~ s/\x{f0a7}/ /g;
}

print STDERR "Lowercasing data...\n";
foreach (@lines) {
	# Lowcase data
	$_ = lc($_);
}

print STDERR "Splitting compound words...\n";
foreach (@lines) {
	# Split compound words
	$_ =~ s/(^|\s)([a-z]+)(\-|\.|,)([a-z]*)(\s|$)/ $1 $2 /g;
	$_ =~ s/(^|\s)([a-z]+)(\-|\.|,)([a-z]+)(\-|\.|,)([a-z]*)(\s|$)/ $1 $2 $3 /g;
}

print STDERR "Removing extra spaces...\n";
foreach (@lines) {
	$_ =~ s/\s+/ /g; # Remove extra spaces
	$_ =~ s/^\s//g; # Remove leading spaces
	$_ =~ s/\s$//g; # Remove trailing spaces
}

print STDERR "Writing output...\n";
foreach (@lines) {
	print STDOUT "$_\n";
}


