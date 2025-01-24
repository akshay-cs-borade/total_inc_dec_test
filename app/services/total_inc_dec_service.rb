# This service calculates the total number of increasing or decreasing numbers
# below 10^x. Increasing numbers have digits in non-decreasing order, while
# decreasing numbers have digits in non-increasing order.

class TotalIncDecService
  # Initializes the service with the input exponent `x`.
  # @param [Integer] x - The exponent for 10^x.
  attr_accessor :x
  
  def initialize(x)
    @x = x
  end

  # Calculates the total number of increasing or decreasing numbers of length `x`
  def call
    # Calculate the number of increasing numbers (choosing x digits from 0-9 with repetition)
    increasing = binomial(x + 9, x)
    
    # Calculate the number of decreasing numbers (choosing x digits from 0-9, including a leading zero with repetition)
    decreasing = binomial(x + 10, x)
    
    # Remove duplicates (constant numbers like 111, 222... are double-counted)
    duplicates = 10 * x + 1

    # Total count of increasing or decreasing numbers
    increasing + decreasing - duplicates
  end

  # Computes the binomial coefficient C(n, k) = n! / (k! * (n-k)!)
  # Iterative approach for better performance and avoiding stack overflow
  def binomial(n, k)
    return 1 if k == 0 || k == n # Base cases: C(n, 0) = 1 and C(n, n) = 1

    # Optimization: C(n, k) = C(n, n-k), so use the smaller k for fewer iterations
    k = [k, n - k].min
    
    result = 1
    (1..k).each do |i|
      # Compute iteratively: result = result * (n - i + 1) / i
      result = result * (n - i + 1) / i
    end
    result
  end
end
