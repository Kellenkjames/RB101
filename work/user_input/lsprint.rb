# Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

output_lines = nil 
loop do 
  puts ">> How many output lines do you want? Enter a number >= 3:"
  output_lines = gets.to_i
  break if output_lines >= 3
  puts ">> That's not enough lines."
end 

while output_lines > 0 
  puts "Launch School is the best!"
  output_lines -= 1
end 
