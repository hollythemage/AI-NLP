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

	submethod BUILD(:$in, :$hn, :$on) {
		self.input = AI::NLP::Vector.new($in);	
		self.hidden = AI::NLP::Vector.new($hn);	
		self.output = AI::NLP::Vector.new($on);

		self.W1 = AI::NLP::Matrix.new($hn, $in);	
		self.W2 = AI::NLP::Matrix.new($on, $hn);	
	}

	multi method forwardPass($inputv) {
		self.input = $inputv;

		my $activationv1 = self.input.getSigmoidf;
		my $hiddenv = self.W1.multiplyByVector($activationv1);
		my $activationv2 = $hiddenv.getSigmoidf;

		my $outputv = self.W2.multiplyByVector($activationv2);
			
		self.output = $outputv;
	}

	multi method backwardPass() {

	}
}
