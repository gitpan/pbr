# $Id: pod.t,v 1.2 2004/10/24 14:34:53 danboo Exp $
use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();
