#!/usr/bin/perl -w

use strict;
use Getopt::Long;

my $_HELP=0;
my $LOW_VERB=0;
my $VERB=0;

my $HYP;
my @REF;
my @REF_FILES;

my %_CONFIG = (	
'ref' => \@REF_FILES,  
'low' => \$LOW_VERB,
'verbose' => \$VERB,
'help' => \$_HELP
); 


######################## Parsing parameters with GetOptions
$_HELP = 1 unless GetOptions(\%_CONFIG, 'ref|r=s@', 'low', 'verbose', 'help');

my $HYP_FILE = $ARGV[0];

if($#ARGV < 0){
    print STDERR "Not enough arguments ...\n";
    $_HELP = 1;
}

#my $i = 0;
#foreach my $arg (@ARGV){
#    print STDERR "ARGV[$i]: $ARGV[$i]\n";
#    $i++;
#}

if ($_HELP == 1) {
  print STDERR "usage: multi-bleu.pl 'hypothesis' -r 'ref1' -r 'ref2' ...\n";
  exit(1);
}

# load HYP and REFS
&load_hyp($HYP_FILE, \$HYP);
foreach my $rf (@REF_FILES) {
    print STDERR "loading $rf...\n" if ($VERB);
    &add_to_ref($rf,\@REF);
}

if ($VERB == 1){
    print STDERR "HYP: ##$HYP##\n";
    foreach my $r (@REF){
        print STDERR "REF: ##$r##\n";
    }
}

my(@CORRECT,@TOTAL,$length_translation,$length_reference);
$TOTAL[1] = 0;
for(my $n=2;$n<=4;$n++) {
    $CORRECT[1] = 0;
}

#chop $HYP;
    my @WORD = split(/\s+/, $HYP);
    #print STDERR "SENT WORDS:>".join(" ", @WORD)."<   LENGTH=$#WORD+1\n";
    my %REF_NGRAM = ();
    my $length_translation_this_sentence = scalar(@WORD);
    my ($closest_diff,$closest_length) = (9999,9999);
    foreach my $reference (@REF) {
#      print "$s $_ <=> $reference\n";
        my @WORD = split(/\s+/,$reference);
        #print STDERR "REF WORDS:>".join(" ", @WORD)."<\n";
        my $length = scalar(@WORD);
        my $diff = abs($length_translation_this_sentence-$length);
        if ($diff < $closest_diff) {
            $closest_diff = $diff;
            $closest_length = $length;
	    # print STDERR "$s: closest diff ".abs($length_translation_this_sentence-$length)." = abs($length_translation_this_sentence-$length), setting len: $closest_length\n";
        } elsif ($diff == $closest_diff) {
                $closest_length = $length if $length < $closest_length;
                # from two references with the same closeness to me
            # take the *shorter* into account, not the "first" one.
        }
        for(my $n=1;$n<=4;$n++) {
            my %REF_NGRAM_N = ();
            for(my $start=0;$start<=$#WORD-($n-1);$start++) {
                my $ngram = "$n";
                for(my $w=0;$w<$n;$w++) {
                    $ngram .= " ".$WORD[$start+$w];
                }
                    $REF_NGRAM_N{$ngram}++;
                }
                foreach my $ngram (keys %REF_NGRAM_N) {
                if (!defined($REF_NGRAM{$ngram}) || 
                    $REF_NGRAM{$ngram} < $REF_NGRAM_N{$ngram}) {
                        $REF_NGRAM{$ngram} = $REF_NGRAM_N{$ngram};
                        #print "$ngram: REF_NGRAM{$ngram} = $REF_NGRAM{$ngram}<BR>\n";
                }
            }
        }
    }
    $length_translation += $length_translation_this_sentence;
    $length_reference += $closest_length;
    for(my $n=1;$n<=4;$n++) {
        my %T_NGRAM = ();
        for(my $start=0;$start<=$#WORD-($n-1);$start++) {
            my $ngram = "$n";
            for(my $w=0;$w<$n;$w++) {
                $ngram .= " ".$WORD[$start+$w];
            }
            #print STDERR "NGRAM -------------> $ngram\n";
            $T_NGRAM{$ngram}++;
        }
        foreach my $ngram (keys %T_NGRAM) {
            #print STDERR " -- NGRAM: >$ngram<\n" unless $n!=1;
            $ngram =~ /^(\d+) /;
            my $n = $1;
            # my $corr = 0;
            #print "$ngram e $ngram $T_NGRAM{$ngram}<BR>\n";
            $TOTAL[$n] += $T_NGRAM{$ngram};
            if (defined($REF_NGRAM{$ngram})) {
                if ($REF_NGRAM{$ngram} >= $T_NGRAM{$ngram}) {
                    $CORRECT[$n] += $T_NGRAM{$ngram};
                    # $corr =  $T_NGRAM{$ngram};
                    #print "$ngram e correct1 $T_NGRAM{$ngram}<BR>\n";
                } else {
                    $CORRECT[$n] += $REF_NGRAM{$ngram};
                    # $corr =  $REF_NGRAM{$ngram};
                    #print "$ngram e correct2 $REF_NGRAM{$ngram}<BR>\n";
                }
            }
            # $REF_NGRAM{$ngram} = 0 if !defined $REF_NGRAM{$ngram};
            # print STDERR "$ngram: {$s, $REF_NGRAM{$ngram}, $T_NGRAM{$ngram}, $corr}\n"
        }
    }

my $brevity_penalty = 1;
my $bleu = 0;

my $real_n = 4;

my @bleu=();

for(my $n=2;$n<=4;$n++) {
    if (! defined ($TOTAL[$n])){
       #print STDERR "no $n-grams in ref\n";
       $TOTAL[$n] = -1;
    } else {
       #print STDERR "ADD 1 to $n-grams\n";
       $TOTAL[$n]++;
    }
    $CORRECT[$n]++;
}

for(my $n=1;$n<=4;$n++) {
    # if (defined ($TOTAL[$n])){
    #$bleu[$n]=($TOTAL[$n])?$CORRECT[$n]/$TOTAL[$n]:0;
    if ($TOTAL[$n] != -1){
        $bleu[$n]=$CORRECT[$n]/$TOTAL[$n];
        #print STDERR "CORRECT[$n]:$CORRECT[$n] TOTAL[$n]:$TOTAL[$n]\n";
        if($real_n != 4){
            print STDERR "WEIRD: higher order n-grams detected while lower-order ngrams were not in the sentence";
        }
  }else{
      #$bleu[$n]=0;
      #$bleu[$n] = 1
      $real_n--;
  }
}

if ($length_reference==0){
  #printf "BLEU = 0, 0/0/0/0 (BP=0, ratio=0, hyp_len=0, ref_len=0)\n";
  exit(1);
}

if ($length_translation<$length_reference) {
  $brevity_penalty = exp(1-$length_reference/$length_translation);
  #print STDERR "BP = $brevity_penalty = 1-$length_reference/$length_translation\n";
}

my $counts = my_log( $bleu[1] );
$counts += my_log( $bleu[2] ) unless ( $TOTAL[2] == -1);
$counts += my_log( $bleu[3] ) unless ( $TOTAL[3] == -1);
$counts += my_log( $bleu[4] ) unless ( $TOTAL[4] == -1);


$bleu = $brevity_penalty * exp( $counts / $real_n );


#$bleu = $brevity_penalty * exp((my_log( $bleu[1] ) +
#				my_log( $bleu[2] ) +
#				my_log( $bleu[3] ) +
#				my_log( $bleu[4] ) ) / 4) ;

if($LOW_VERB){
    printf "%.2f\n",
    100*$bleu,
} else {
    printf "BLEU = %.2f, %.1f", 100*$bleu, 100*$bleu[1];

    if($TOTAL[2] != -1) { printf "/%.1f", 100*$bleu[2]; } else { printf "/NA"; }
    if($TOTAL[3] != -1) { printf "/%.1f", 100*$bleu[3]; } else { printf "/NA"; }
    if($TOTAL[4] != -1) { printf "/%.1f", 100*$bleu[4]; } else { printf "/NA"; }
    #printf "/%.1f", 100*$bleu[3],
    #printf "/%.1f", 100*$bleu[4];

    printf " (BP=%.3f, ratio=%.3f, hyp_len=%d, ref_len=%d)\n",
    $brevity_penalty,
    $length_translation / $length_reference,
    $length_translation,
    $length_reference;
}



sub my_log {
  return -9999999999 unless $_[0];
  return log($_[0]);
}

sub add_to_ref {
    my ($file,$REF) = @_;
    open(REF,$file) or die "Can't read $file";
    while(<REF>) {
	chop;
	push @{$REF}, $_;
    }
    close(REF);
}

sub load_hyp{
    my ($file,$HYP) = @_;
    open(HYP,$file) or die "Can't read $file";
    while(<HYP>) {
	chop;
	$$HYP = $_;
    }
    close(HYP);
}
