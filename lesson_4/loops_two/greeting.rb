#* Greeting 

# Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2
count = 0

while count < number_of_greetings
  greeting
  number_of_greetings -= 1
end 
