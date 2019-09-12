#!/usr/bin/perl

use Getopt::Std;
use Getopt::Long;

my $opt_i;
my $opt_d;
my $opt_s;
my $opt_t;
my $opt_ty;
my $opt_sys;

GetOptions('id=s', \$opt_i, 'doc=s', \$opt_d, 'src=s', \$opt_s, 'trg=s', \$opt_t, 'type=s', \$opt_ty, 'sysid=s', \$opt_sys);

my $type = defined($opt_ty) ? $opt_ty : "srcset";
my $id = defined($opt_i) ? $opt_i : "set";
my $doc = defined($opt_d) ? $opt_d : "document";
my $src = defined($opt_s) ? $opt_s : "source";
my $trg = defined($opt_t) ? $opt_t : "target";
my $sysid = defined($opt_sys) ? $opt_sys : "systemX";

print '<'.$type.' setid="'.$id.'" srclang="'.$src.'" trglang="'.$trg.'">'."\n";
print '<DOC sysid="'.$sysid.'" docid="'.$doc.'">'."\n";

my $id = 1;

while( <> )
{
	chomp;
	print '<seg id=';
	printf( "%03d>", $id++ );
	print;
	print '</seg>'."\n";
}

print '</DOC>'."\n";
print '</'.$type.'>'."\n";
