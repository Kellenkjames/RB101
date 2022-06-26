=begin

* Given N collections of numbers provided by user, take the largest number out of each collection and display it. 

START 

SET large_numbers = []
SET keep_going = true

WHILE keep_going == true 
  GET "enter a collection"
  SET collection
  * SET largest_number = SUBPROCESS "extract the largest one from that collection"
  large_numbers.push(largest_number)
  GET "enter another collection?"
  IF "yes"
    keep_going = true 
  ELSE 
    keep_going = false
  IF keep_going == false 
    exit the loop 

  PRINT large_numbers 

END 

Note: Our confidence in long psuedo-code cannot be very good. Extracting to sub-processes helps us focus on a well defined narrowly scoped set of pseudo-code. 

* Additional: As you use pseudo-code and flowcharts to help you dissect the logic of a problem, you'll be constantly trying to figure out how detailed the chart and words should be, and what can be extracted to sub-processes - this is exactly what a programmer should be thinking about when designing the solution to a problem. You won't get it right the first time. 

=end 