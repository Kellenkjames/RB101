# Create a hash that contains the following data and assign it to a variable named car.

#using symbols 
car = { 
  type:       'sedan', 
  color:      'blue', 
  mileage:  80_000 
}

puts car

=begin

Discussion: 

# Older Syntax: { :number => 1 }

Symbols are faster and use less memory than Strings, so are preferred as Hash keys. 

Note - Symbols and Strings aren't the same when compared. 

:color == 'color' # false

=end 
