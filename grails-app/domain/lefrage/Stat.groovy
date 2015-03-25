package lefrage


class Stat {

	float mean, deviation, max, min

	int sales
		
	float calcMean(prices) { 
		def n = prices.size()
		prices.sum() / n
	}

	float calcDeviation(prices) {
		def pricesSquared = prices.collect { it**2 }
		sqrt( calcMean(pricesSquared) - calcMean(prices)**2 )
	}

	float calcMax() {
		prices.max()
	}

	float calcMin() {
		prices.min()
	}

    static constraints = {
    	
    }

}
