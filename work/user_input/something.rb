# Write a program that asks the user whether they want the program to print "something", then print it if the user enters y. Otherwise, print nothing.

puts ">> Do you want me to print something? (y/n)"
option = gets.chomp.downcase

puts "something" if option == "y"

# Why do we get a newline character when we type in "y" --> "y/n" ??  its because we have to hit the enter or return key to get the program to recongize our user input. This is why we use .chomp  

