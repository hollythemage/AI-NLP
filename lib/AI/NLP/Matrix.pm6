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

		loop (my $j = 0; $j < self.getRowSize; $j++) {
			my $sum = 0.0;
			loop (my $i = 0; $i < $v.getSize(); $i++) {

				$sum += self.ml[$i][$j] * $v.get($i);	
					
			}
			$returnv.put($j, $sum);
		}

		return $returnv;
	}

	method multiplyByMatrix($m) {

		my $returnm = AI::NLP::Matrix.new($m.getRowSize, $m.getColSize);


		loop (my $k = 0; $k < self.getRowSize; $k++) {
		my $tempv = AI::NLP::Vector.new(self.getRowSize);
		loop (my $j = 0; $j < self.getRowSize; $j++) {
			my $sum = 0.0;
			my @l = ();
			loop (my $i = 0; $i < $m.getColSize; $i++) {

				$sum += self.ml[$i][$j] * $m.get($j, $i);	
					
			}
			$tempv.put($j, $sum);
		}
		$returnm.putAll($k, $tempv);
		}

		return $returnm;
	}

	method getRowSize() { return self.ml[0].elems; }
	method getColSize() { return self.ml.elems; }

	method get($rowindex, $colindex) {
		return self.ml[$rowindex][$colindex];
	}

	method put($rowindex, $colindex, $value) {
		self.ml[$rowindex][$colindex] = $value;
	}

	method putAll($rownumber, $v) {
		loop (my $i = 0; $i < $v.getSize; $i++) {
			self.ml[$rownumber][$i] = $v.get($i);
		}
	}

}
