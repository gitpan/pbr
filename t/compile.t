# $Id: compile.t,v 1.2 2004/10/24 14:34:53 danboo Exp $

use Test::More tests => 1;

my $file = "blib/script/pbr";

print "bail out! Script file is missing!" unless -e $file;

my $output = `perl -c $file 2>&1`;

print "bail out! Script file is missing!" unless
	like( $output, qr/syntax OK$/, 'script compiles' );
