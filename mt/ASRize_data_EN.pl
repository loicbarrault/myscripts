#!/usr/bin/perl

use strict;
use utf8;
use Lingua::EN::Numbers qw(num2en num2en_ordinal);

use open ':encoding(utf8)';
binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");

my @lines = ();
@lines=<>;

print STDERR "Transforming numbers in letters...\n";
foreach (@lines) {
	chomp;
	
	$_ =~ s/([0-9]+)\s{1,2}(?=\d{3,3}([^0-9]|$))/$1/g;
	$_ =~ s/([0-9]+,[0-9]+)/ @{[num2en($&)]} /g; # Transform numbers in letters (roughly)
	$_ =~ s/([0-9]+\.[0-9]+)/ @{[num2en($&)]} /g;
	$_ =~ s/([0-9]+)/ @{[num2en($&)]} /g;
 	$_ =~ s/\b([0-9]+)th\b/@{[num2en_ordinal($&)]}/g;
}	

print STDERR "Removing punct and all...\n";
foreach (@lines) {
	
	
	# Remove punct
    #$_ =~ tr/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëēìíîïñòóôõöùúûüýÿ/AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeeiiiinooooouuuuyy/;
	$_ =~ tr/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëēìíîïñòóôõöùúûüýÿ/AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeeiiiinooooouuuuyy/;
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
	$_ =~ s/_/ /g;
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
    $_ =~ s/’/'/g;
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
	$_ =~ s/º/ degrees /g;
	$_ =~ s/²/ square /g;
	$_ =~ s/%/ percent /g;
	$_ =~ s/£/ pound /g;
	$_ =~ s/\$/ dollar /g;
	$_ =~ s/€/ euro /g;
	$_ =~ s/¥/ yen /g;
	$_ =~ s/=/ equal /g;
	$_ =~ s/@/ at /g;
	$_ =~ s/\+/ plus /g;
	$_ =~ s/÷/ divided by /g;
	$_ =~ s/×/ by /g;
	$_ =~ s/#/ /g;
	$_ =~ s/\*/ /g;
	$_ =~ s/ & / /g;
	#$_ =~ s/;/ /g;
	#$_ =~ s/ &(\s|$)/ /g;
	#$_ =~ s/ ;(\s|$) / /g;
	$_ =~ s/(^|\s)'(\s|$)/ /g;
	$_ =~ s/\[/ /g;
	$_ =~ s/\]/ /g;
	$_ =~ s/{/ /g;
	$_ =~ s/}/ /g;
	$_ =~ s/¦/ /g;
	$_ =~ s/\// /g;
	$_ =~ s/\\/ /g;
	$_ =~ s/\x{a9}/ /g;
	$_ =~ s/\x{ab}/ /g;
	$_ =~ s/\x{b0}/ degrees /g;
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

#print STDERR "Splitting compound words...\n";
#foreach (@lines) {
    # Split compound words
    #$_ =~ s/(^|\s)([a-z]+)(\-|\.|,)([a-z]*)(\s|$)/ $1 $2 /g; #this break URLs
    #$_ =~ s/(^|\s)([a-z]+)(\-|\.|,)([a-z]+)(\-|\.|,)([a-z]*)(\s|$)/ $1 $2 $3 /g; # same here
#}

print STDERR "Removing HTML entities...\n";
foreach (@lines) {

	$_ =~ s/(^|\s)\&quot;(\s|$)/ /g;
	$_ =~ s/(^|\s)\&quot;(\s|$)/ /g;

	$_ =~ s/(^|\s)can \&apos;t(\s|$)/ can't /g;
	$_ =~ s/(^|\s)could \&apos;ve(\s|$)/ could've /g;
	$_ =~ s/(^|\s)couldn \&apos;t(\s|$)/ couldn't /g;
	$_ =~ s/(^|\s)would \&apos;ve(\s|$)/ would've /g;
	$_ =~ s/(^|\s)wouldn \&apos;t(\s|$)/ wouldn't /g;
	$_ =~ s/(^|\s)should \&apos;ve(\s|$)/ should've /g;
	$_ =~ s/(^|\s)shouldn \&apos;t(\s|$)/ shouldn't /g;
	$_ =~ s/(^|\s)needn \&apos;t(\s|$)/ needn't /g;
	$_ =~ s/(^|\s)mustn \&apos;t(\s|$)/ mustn't /g;
	$_ =~ s/(^|\s)mightn \&apos;t(\s|$)/ mightn't /g;
	$_ =~ s/(^|\s)oughtn \&apos;t(\s|$)/ oughtn't /g;

	$_ =~ s/(^|\s)hasn \&apos;t(\s|$)/ hasn't /g;
	$_ =~ s/(^|\s)haven \&apos;t(\s|$)/ haven't /g;
	$_ =~ s/(^|\s)hadn \&apos;t(\s|$)/ hadn't /g;
	$_ =~ s/(^|\s)isn \&apos;t(\s|$)/ isn't /g;
	$_ =~ s/(^|\s)ain \&apos;t(\s|$)/ ain't /g;
	$_ =~ s/(^|\s)aren \&apos;t(\s|$)/ aren't /g;
	$_ =~ s/(^|\s)wasn \&apos;t(\s|$)/ wasn't /g;
	$_ =~ s/(^|\s)weren \&apos;t(\s|$)/ weren't /g;
	$_ =~ s/(^|\s)doesn \&apos;t(\s|$)/ doesn't /g;
	$_ =~ s/(^|\s)don \&apos;t(\s|$)/ don't /g;
	$_ =~ s/(^|\s)don \&apos;ts(\s|$)/ don'ts /g;
	$_ =~ s/(^|\s)won \&apos;t(\s|$)/ won't /g;
	$_ =~ s/(^|\s)didn \&apos;t(\s|$)/ didn't /g;
	
	$_ =~ s/(^|\s)i \&apos;m(\s|$)/ i'm /g;
	$_ =~ s/(^|\s)i \&apos;d(\s|$)/ i'd /g;
	$_ =~ s/(^|\s)i \&apos;ve(\s|$)/ i've /g;
	$_ =~ s/(^|\s)i \&apos;ll(\s|$)/ i'll /g;
	
	$_ =~ s/(^|\s)you \&apos;re(\s|$)/ you're /g;
	$_ =~ s/(^|\s)you \&apos;re(\s|$)/ you're /g;
	$_ =~ s/(^|\s)you \&apos;d(\s|$)/ you'd /g;
	$_ =~ s/(^|\s)you \&apos;ve(\s|$)/ you've /g;
	$_ =~ s/(^|\s)you \&apos;ll(\s|$)/ you'll /g;
	
	$_ =~ s/(^|\s)it \&apos;d(\s|$)/ it'd /g;
	$_ =~ s/(^|\s)it \&apos;ll(\s|$)/ it'll /g;
	$_ =~ s/(^|\s)she \&apos;d(\s|$)/ she'd /g;
	$_ =~ s/(^|\s)she \&apos;ll(\s|$)/ she'll /g;
	$_ =~ s/(^|\s)he \&apos;d(\s|$)/ he'd /g;
	$_ =~ s/(^|\s)he \&apos;ll(\s|$)/ he'll /g;
	
	$_ =~ s/(^|\s)we \&apos;re(\s|$)/ we're /g;
	$_ =~ s/(^|\s)we \&apos;d(\s|$)/ we'd /g;
	$_ =~ s/(^|\s)we \&apos;ve(\s|$)/ we've /g;
	$_ =~ s/(^|\s)we \&apos;ll(\s|$)/ we'll /g;
	
	$_ =~ s/(^|\s)they \&apos;re(\s|$)/ they're /g;
	$_ =~ s/(^|\s)they \&apos;d(\s|$)/ they'd /g;
	$_ =~ s/(^|\s)they \&apos;ve(\s|$)/ they've /g;
	$_ =~ s/(^|\s)they \&apos;ll(\s|$)/ they'll /g;
	
	$_ =~ s/(^|\s)how \&apos;re(\s|$)/ how're /g;
	$_ =~ s/(^|\s)who \&apos;re(\s|$)/ who're /g;
	$_ =~ s/(^|\s)who \&apos;ve(\s|$)/ who've /g;
	$_ =~ s/(^|\s)who \&apos;d(\s|$)/ who'd /g;
	$_ =~ s/(^|\s)who \&apos;ll(\s|$)/ who'll /g;
	$_ =~ s/(^|\s)what \&apos;ve(\s|$)/ what've /g;
	$_ =~ s/(^|\s)what \&apos;d(\s|$)/ what'd /g;
	$_ =~ s/(^|\s)what \&apos;ll(\s|$)/ what'll /g;
	$_ =~ s/(^|\s)there \&apos;re(\s|$)/ there're /g;
	$_ =~ s/(^|\s)there \&apos;d(\s|$)/ there'd /g;
	$_ =~ s/(^|\s)there \&apos;ve(\s|$)/ there've /g;
	$_ =~ s/(^|\s)there \&apos;ll(\s|$)/ there'll /g;
	$_ =~ s/(^|\s)that \&apos;ll(\s|$)/ that'll /g;
	$_ =~ s/(^|\s)o \&apos;clock(\s|$)/ o'clock /g;
	$_ =~ s/(^|\s)d \&apos;oeuvres(\s|$)/ d' oeuvres /g;
	$_ =~ s/(^|\s)d \&apos;ivoire(\s|$)/ d' ivoire /g;
#	$_ =~ s/(^|\s)o \&apos;shea(\s|$)/ o' shea /g;
#	$_ =~ s/(^|\s)o \&apos;conner(\s|$)/ o' conner /g;
#	$_ =~ s/(^|\s)o \&apos;reilly(\s|$)/ o' reilly /g;
#	$_ =~ s/(^|\s)o \&apos;grady(\s|$)/ o' grady /g;
#	$_ =~ s/(^|\s)o \&apos;neill(\s|$)/ o' neill /g;
	$_ =~ s/(^|\s)o \&apos;(\S+)(\s|$)/ o' $2 /g; # names like o'reilly o'grady
	$_ =~ s/(^|\s)ma \&apos;am(\s|$)/ ma'am /g;
	$_ =~ s/(^|\s)l \&apos;aquila(\s|$)/ l 'aquila /g;
	$_ =~ s/(^|\s)y \&apos;all(\s|$)/ y'all /g;
	$_ =~ s/(^|\s)c \&apos;mon(\s|$)/ c'mon /g;

	$_ =~ s/ \&apos;s / 's /g;
	$_ =~ s/ \&apos;d / 'd /g;
	$_ =~ s/ \&apos; / ' /g;
	$_ =~ s/\&apos;/'/g;

	$_ =~ s/\&amp;/and/g;
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

