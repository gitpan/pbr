# $Id: pbr.t,v 1.2 2004/10/25 02:17:44 danboo Exp $

use Test::More 'no_plan';
use File::Copy;
use File::Path;

my $script     = "blib/script/pbr";
my @test_files = qw( t/123.txt t/abc123.txt t/potato.txt );

my %args = (
   "'\$_=uc'"     => [ qw( t/123.TXT t/ABC123.TXT t/POTATO.TXT ) ],
   "-wD '\$_=uc'" => [ qw( T/123.TXT T/ABC123.TXT T/POTATO.TXT ) ],
   "-c  '\$_=uc'" => [ qw( t/123.txt t/abc123.txt t/potato.txt t/123.TXT t/ABC123.TXT t/POTATO.TXT ) ],
   "-Dd tmp '\$_=uc'" => [ qw( tmp/123.TXT tmp/ABC123.TXT tmp/POTATO.TXT ) ],
   "-wDd tmp '\$_=uc'" => [ qw( tmp/123.TXT tmp/ABC123.TXT tmp/POTATO.TXT ) ],
);

for my $args (keys %args)
   {

   ## create the files to rename
   for my $file (@test_files)
      {
      open(TMP_FILE, ">$file") || die $!;
      close TMP_FILE;
      }

   system "$script $args @test_files";

   ok(!$?, "$0: $args");

   for my $out_file (@{ $args{$args} })
      {
      ok(-e $out_file, "$0: $args ($out_file)");
      unlink $out_file;
      }

   }
