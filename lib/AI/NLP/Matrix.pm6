use v6.c;

use AI::NLP::Vector;

class AI::NLP::Matrix {

	has @!ml;

	submethod BUILD(:$nrows, :$ncols) {
	      loop (my $j = 0; $j < $nrows; $j++) {
		      push (self.ml, ());
	      	loop (my $i = 0; $i < $ncols; $i++) {
	      		push(self.ml[$j], 1e6.rand);
			}	
		} 
	}

	method multiplyByVector($v) {

		my $returnv = AI::NLP::Vector.new($v.getSize());

		loop (my $j = 0; $j < self.ml[0].elems; $j++) {
			my $sum = 0.0;
			loop (my $i = 0; $i < $v.getSize(); $i++) {

				$sum += self.ml[$i][$j] * $v.get($i);	
					
			}
			$returnv.put($j, $sum);
		}

		return $returnv;
	}
}
