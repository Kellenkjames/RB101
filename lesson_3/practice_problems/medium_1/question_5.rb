# Question 5

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

=begin

* This is a local variable scope issue. The `limit` variable is initialized outside of the method (in the main scope). Methods have self-contained inner scope and cannot access variables initialized in the outer scope; unless the object is passed in as an argument to the method.

How would you fix this so that it works?

* Option 1:
  - Pass `limit` in as the third argument to the method call

* Option 2:
  - Move `limit` into the inner scope of the method 

=end


