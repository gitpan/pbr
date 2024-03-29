# $Id: Makefile.PL,v 1.4 2004/10/27 03:03:21 danboo Exp $
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	no warnings;
	
	*ExtUtils::MM_Any::test_via_harness = sub
		{
		my($self, $perl, $tests) = @_;
	
		return qq|	$perl "-MTest::Manifest" | .
			qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
			qq|'\$(INST_ARCHLIB)')"\n|;
		};
	}

my $script_name = "pbr";

WriteMakefile(
		'NAME'      => $script_name,
        'VERSION'   => '0.12',

		'EXE_FILES' =>  [ $script_name ],
            
		'PREREQ_PM' => {
                },

		'MAN1PODS'  => {
			$script_name => "\$(INST_MAN1DIR)/$script_name.1",
			},

		clean => { FILES => "*.bak $script_name-*" },
		);
        
1;
