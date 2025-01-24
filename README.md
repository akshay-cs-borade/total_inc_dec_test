Here's a sample `README.md` file for the repository:

```markdown
# Total Increasing and Decreasing Numbers

This Ruby on Rails service calculates the total number of **increasing** or **decreasing numbers** below 10<sup>x</sup>. The service uses efficient combinatorial logic to compute the result without brute force, making it scalable for large values of `x`.

---

## Problem Statement

Let's define increasing numbers as the numbers whose digits, read from left to right, are never less than
the previous ones: 234559 is an example of increasing number.
Conversely, decreasing numbers have all the digits read from left to right so that no digits is bigger than
the previous one: 97732 is an example of decreasing number.
You do not need to be the next Gauss to figure that all numbers with 1 or 2 digits are either increasing or
decreasing: 00, 01, 02, ..., 98, 99 are all belonging to one of this categories (if not both, like 22 or 55):
101 is indeed the first number which does NOT fall into either of the categories. Same goes for all the
numbers up to 109, while 110 is again a decreasing number.
Now your task is rather easy to declare (a bit less to perform): you have to build a function to return the
total occurrences of all the increasing or decreasing numbers below 10 raised to the xth power (x will
always be >= 0).
To give you a starting point, there are a grand total of increasing and decreasing numbers as shown in
the table:

| Exponent `x` | Total Increasing or Decreasing Numbers |
|--------------|----------------------------------------|
| 0            | 1                                      |
| 1            | 10                                     |
| 2            | 100                                    |
| 3            | 475                                    |
| 4            | 1675                                   |
| 5            | 4954                                   |
| 6            | 12952                                  |

This means that your function will have to behave like this:
total_inc_dec(0)==1
total_inc_dec(1)==10
total_inc_dec(2)==100
total_inc_dec(3)==475
total_inc_dec(4)==1675
total_inc_dec(5)==4954
total_inc_dec(6)==12952

### Tips: 
Efficiency and trying to figure out how it works are essential: with a brute force approach, some
tests with larger numbers may take more than the total computing power currently on Earth to be
finished in the short allotted time.

To make it even clearer, the increasing or decreasing numbers between in the range 101-200 are: [110,
111, 112, 113, 114, 115, 116, 117, 118, 119, 122, 123, 124, 125, 126, 127, 128, 129, 133, 134, 135, 136,
137, 138, 139, 144, 145, 146, 147, 148, 149, 155, 156, 157, 158, 159, 166, 167, 168, 169, 177, 178, 179,
188, 189, 199, 200], that is 47 of them. In the following range, 201-300, there are 41 of them and so on,
getting rarer and rarer.

---
### Key Observations:
- All numbers with 1 or 2 digits are either increasing or decreasing.
- Numbers that are both increasing and decreasing consist of repeated digits (e.g., `111`, `222`).
- The challenge is to compute the total count of increasing or decreasing numbers below 10<sup>x</sup>, efficiently.


## Approach and Solution

This approach is used because it is both mathematically precise and computationally efficient for solving the problem of counting increasing and decreasing numbers below \(10^x\). Let me explain why this approach is ideal:

---

### 1. **Mathematical Rigor**:
   - The problem naturally lends itself to combinatorial reasoning. Increasing and decreasing numbers can be described in terms of combinations (choosing digits with repetition in a constrained order).
   - The **binomial coefficient** is the standard way to compute combinations and is perfectly suited for this task:
     - **Increasing Numbers**: Choosing digits with repetition in non-decreasing order translates directly into \(C(x+9, x)\).
     - **Decreasing Numbers**: Similarly, the inclusion of leading zeros fits into \(C(x+10, x)\).

---

### 2. **Efficiency**:
   - **Iterative Binomial Calculation**:
     - Computing binomial coefficients iteratively avoids the inefficiencies and potential overflow of direct factorial-based computation.
     - By using the property \(C(n, k) = C(n, n-k)\), the computation is minimized by selecting the smaller \(k\).
   - **Avoiding Over-Counting**:
     - Subtracting the duplicates (constant numbers) ensures that the result is accurate while keeping the calculation simple.

---

### 3. **Scalability**:
   - This approach scales well for reasonable values of \(x\) (e.g., \(x \leq 100\)).
   - Even for higher values, the computational complexity is manageable due to the iterative nature of the binomial coefficient calculation and the avoidance of expensive operations like factorials.

---

### 4. **Elegance**:
   - The approach avoids brute force enumeration of all possible numbers, which would be infeasible for large \(x\).
   - By directly leveraging combinatorial properties, the solution is clean, compact, and easy to understand for anyone familiar with basic combinatorics.

---

### Alternative Approaches and Their Downsides:
1. **Enumerative Approach**:
   - Enumerating all numbers below \(10^x\) and checking their properties (increasing or decreasing) is conceptually simple but computationally impractical for large \(x\), as the number of numbers grows exponentially.

2. **Dynamic Programming**:
   - A DP approach could potentially count numbers based on transitions between digits, but it would introduce unnecessary complexity and overhead compared to the mathematical simplicity of combinatorics.

3. **Precomputation**:
   - Precomputing results for fixed \(x\) might be fast but is inflexible for varying input values. It also requires storage space and only shifts the computational burden upfront.

---

### Why This Approach is Optimal:
This approach strikes the right balance between:
- **Mathematical soundness**: It directly leverages the properties of combinations.
- **Efficiency**: No redundant calculations or brute force enumeration.
- **Scalability**: It works well for a range of input values without significant overhead.

Would you like me to explore an alternative approach or provide deeper insights into the reasoning?

---

## Requirements

- Ruby `3.0.0`
- Rails `7.1.5`

---

## Installation and Setup

1. Clone the repository:
   ```
   git clone https://github.com/akshay-cs-borade/total_inc_dec_test.git
   cd total_inc_dec_test
   bundle install
   ```

2. Run RSpec for testing:
   ```
   rspec
   ```

---

## Usage

To use the `TotalIncDecService`, initialize it with the exponent `x` and call the `call` method:

```ruby
service = TotalIncDecService.new(4)
result = service.call
puts "Total increasing or decreasing numbers below 10^4: #{result}"
```
---

## Reference
- [total_inc_dec_service.rb](https://github.com/akshay-cs-borade/total_inc_dec_test/blob/main/app/services/total_inc_dec_service.rb)
- [total_inc_dec_service_spec.rb](https://github.com/akshay-cs-borade/total_inc_dec_test/blob/main/spec/services/total_inc_dec_service_spec.rb)