use v6.c;

use AI::NLP::Vector;
use AI::NLP::Matrix;

### Single Hidden Layer Backpropagation Neural Network

class AI::NLP::BPPNet {

	has $!input;
	has $!hidden;
	has $!output;

	has $!W1; 
	has $!W2; 

	has $!learning-rate;

	submethod BUILD(:$in, :$hn, :$on) {
		self.input = AI::NLP::Vector.new($in);	
		self.hidden = AI::NLP::Vector.new($hn);	
		self.output = AI::NLP::Vector.new($on);

		self.W1 = AI::NLP::Matrix.new($hn, $in);	
		self.W2 = AI::NLP::Matrix.new($on, $hn);

		self.learning-rate = 0.5;	
	}

	multi method forwardPass($inputv) {
		self.input = $inputv;

		my $activationv1 = AI::NLP::Vector.new(self.hidden.getSize);
		loop (my $i = 0; $i < self.hidden.getSize; $i++) { ## hidden size
			$activationv1[$i] = self.input.sumMembers;
		}
		$activationv1 = $activationv1.getSigmoidf;

		self.hidden = self.W1.multiplyByVector($activationv1);

		my $activationv2 = AI::NLP::Vector.new(self.output.getSize);
		loop (my $j = 0; $j < self.output.getSize; $j++) { ## output size
			$activationv2[$j] = self.hidden.sumMembers;
		}
		$activationv2 = $activationv2.getSigmoidf;

		my $outputv = self.W2.multiplyByVector($activationv2);
			
		self.output = $outputv;
	}

	multi method backwardPass() {

	}
}
