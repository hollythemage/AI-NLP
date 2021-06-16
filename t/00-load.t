use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

my $num-tests = 2;

plan $num-tests;
 
# .... tests 
#  

use-ok "AI::NLP::Matrix";
use-ok "AI::NLP::Vector";

done-testing;  # optional with 'plan' 
