use v6.c;

class AI::NLP::Vector {

	has @!vl;

	submethod BUILD(:$nrows) {
	      loop (my $i = 0; $i < $nrows; $i++) {
	      	push(self.vl, 1e6.rand);
		}	
	}

	method multiplyByVector($v) {
	      my $returnvalue = 0.0;
	      loop (my $i = 0; $i < $v.getSize; $i++) {
		$returnvalue += self.vl[$i] * $v.get($i);
	      }

		return $returnvalue;
	}

	method addVector($v) {
	      my $returnv = AI::NLP::Vector.new($v.getSize);;
	      loop (my $i = 0; $i < $v.getSize; $i++) {
		$returnv.put($i, self.vl[$i] + $v.get($i));
	      }

	      return $returnv;
	}

	method getSize() { return self.vl.elems; }
	method put($idx, $value) {
		self.vl[$idx] = $value;
	}
	method get($idx) {
		return self.vl[$idx];
	}

	method getSigmoidf() {
		my $returnv = AI::NLP::Vector.new(self.getSize);
	      	loop (my $i = 0; $i < self.getSize; $i++) {
			$returnv.put(self.sigmoid(self.get($i)));
		}

		return $returnv;
	}

	method sigmoid($value) {
		return 1 / (1 - exp($value));
	}
}
