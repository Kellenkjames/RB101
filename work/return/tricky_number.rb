# What will the following code print? Why? Don't run it until you've attempted to answer.

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

# Answer: 1

=begin

If true will be evaluated every time. The assignment to "number" is actually quite useless because we don't use it anywhere else.

However, variable assignment still returns the value that was "assigned" to the variable.

It works the same as if the assignment wasn't even there

=end