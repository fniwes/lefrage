package lefrage


class Stat {
	Date date
	float mean, deviation, max, min
	int sales
		
	float calcMean(prices) { 
		def n = prices.size()
		mean = prices.sum() / n
		mean
	}

	float calcDeviation(prices) {
		def pricesSquared = prices.collect { it**2 }
		deviation = sqrt( calcMean(pricesSquared) - calcMean(prices)**2 )
		deviation
	}

	float calcMax(prices) {
		max = prices.max()
		max
	}

	float calcMin(prices) {
		min = prices.min()
		min
	}

    static constraints = {
    	mean nullable:true
    	deviation nullable:true
    	max nullable:true
    	min nullable:true
    	sales nullable:true
    }

}
