# Question 2

=begin

# Describe the difference between ! and ? in Ruby

`!` or `?` at the end of the method means it's actually part of the method name, not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation.

=end

#_____________________________________________________

# Explain what would happen in the following scenarios:

=begin

* 1. what is != and where you should you use it? 

!= means "not equals"

Is used when evaluating a conditional expression -- one obj is "not equal" to another obj

Ex) (a !=b) is true

#_____________________________________________________

* 2. put ! before something, like !user_name

!<some object> Is used to turn any object into the opposite of their boolean equivalent

Ex) (!user_name) is false

#_____________________________________________________

* 3. put ! after something, like words.uniq!

words.uniq!

In this case, the ! after .uniq would indicate the method is destructive and will mutate the calling object but in other cases; it would depend on the method implementation

#_____________________________________________________

* 4. put ? before something 

? : is the ternary operator for if...else

Ex) testing ? puts("nice work") : puts("try again")

#_____________________________________________________

* 5. put ? after something

This means it's part of the method name -- we don't know what it's doing, it would depend on the method implementation

#_____________________________________________________

* 6. put !! before something, like !!user_name

!!<some object> is used to turn any object into their boolean equivalent

For example, turning a integer object into it's boolean equivalent

Ex) !!2023 => true

=end

#_____________________________________________________