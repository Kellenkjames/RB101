# Walk-through: Calculator 

=begin 

  Requirements:

  Build a command line calculator program that does the following:
    - asks for two numbers
    - asks for the type of operation to perform: add, subtract, multiply or divide
    - displays the result 

    Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp()

=end

Kernel.puts("Welcome to Calculator!")

Kernel.puts("Please enter the first number.")
number1 = Kernel.gets().chomp()

Kernel.puts("Please enter the second number.")
number2 = Kernel.gets().chomp()

Kernel.puts("What type of operation to perform: 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end 

Kernel.puts("The result is #{result}")




