# In the code below, boolean is randomly assigned as true or false.

boolean = [true, false].sample

puts boolean
boolean ? puts("I'm true!") : puts("I'm false!")

=begin

NOTES 

The ternary operator is most useful when there are simple conditions with only two possible outcomes. It essentially reads like this: 

<condition> ? <result if true> : <result if false>

=end


