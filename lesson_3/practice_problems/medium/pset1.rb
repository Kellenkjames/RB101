#* Practice Problems: Medium 1

# Question 1: "ASCII Art" Write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right: 

10.times { |number| puts (" " * number) + 'The Flinstones Rock!' }

# ----------------------------------------------------------------

# Question 2: The result of the following statement will be an error: 

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this: This will raise an error TypeError: no implicit conversion of Integer into String because (40+2) results in an integer and it is being concatenated to a string.

#* One possible way to fix: String interpolation 
puts "the value of 40 + 2 is #{40 + 2}"

#* Second possible solution: Use .to_s method 
puts "the value of 40 + 2 is " + (40 + 2).to_s

# ----------------------------------------------------------------

# Question 3: Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0 
    divisor -= 1
  end
  factors
end

puts factors(20)

# Bonus 1: What is the purpose of the number % divisor == 0 
#* Allows you to determine if the result of the division is an integer number (no remainder)

# Bonus 2: What is the purpose of the second-to-last-line 
#* This is what is the 'actual' return value from the method. Recall that without an explicit return statement in the code, the return value of the method is the last statement execuited. If we removed this line, the code would execute, but the return value of the method would be nil. 

# ----------------------------------------------------------------

# Question 4: Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Answer: Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called 'buffer' will be modified and will end up being changed after rolling_buffer1 returns. 

#* That is, the caller will have the input array that they pass in be different once the call returns (mutates the caller)

#  In the other implementation, rolling_buffer2 will not alter the caller's input argument. 

# ----------------------------------------------------------------

# Question 5: Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

# limit = 15 (before)

def fib(first_num, second_num, limit = 15)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit = 15)
puts "result is #{result}"

#* Answer: The problem is that limit is outside of the scope of the method definition. Method definitions have their own block scopes. To fix the issue, you can:

# 1. Pass limit as an additional argument to the definition of fib && pass it when you call fib

#2. Move the limit variable inside the fib definition  

# ----------------------------------------------------------------

# Question 6: What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # 34  

# ----------------------------------------------------------------

# Question 7: One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

puts mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not? 

#* Answer: Yes 

=begin

# Explanation 

Remember that in Ruby, what gets passed to a method isn't the value of the object. Under the hood, Ruby passes the object_id of each argument to the method. 

The method stores these object_id's internally in locally scoped (private to the method) variables (named per the method definition's parameter list).

Spot's demo_hash is pointing to the 'munsters' hash on line 119. In this case, the program does not create a new hash for the result -- it just uses the existing hash as-is. 

#* The actual hash object that is being messed with inside of the method IS the munsters hash. 

=end 