# $Id: prereq.t,v 1.2 2004/10/24 14:34:53 danboo Exp $
use Test::More;
eval "use Test::Prereq";
plan skip_all => "Test::Prereq required to test dependencies" if $@;
prereq_ok();
