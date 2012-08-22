# Print all the chars in the file as a hex byte with a newline,
#	as $readmemh() wants.
# - Jack Carrozzo <jack@crepinc.com> 2012-08-22

#!/usr/sbin/perl -w
use strict;

if ($#ARGV!=1) {
	print "Usage: $0 <bf script to convert> <output memlist file>\n";
	exit(1);
}

my $bffile=$ARGV[0];
my $memfile=$ARGV[1];

open(BFFILE,'<',$bffile) or die "Error opening $bffile: $!\n";
open(MEMFILE,'>',$memfile) or die "Error opening $memfile: $!\n";

my $in=join("",<BFFILE>);

my $i;
# copy the whole thing, line breaks and comments if they
#	exits; unrecognized opcodes are ignored as spec'd
for ($i=0;$i<=(length($in)-1);$i++) {
	printf(MEMFILE "%x\n",ord(substr($in,$i,1)));
}

print "Wrote $memfile.\n";
