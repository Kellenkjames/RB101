=begin

"RUBY CODING TIPS"

* Naming Things 
Choose descriptive variable and method names (based on the information they store). You don't want to hardcode possible response values into the variable name because of future uncertainty. 

p = gets.chomp 
play_again = gets.chomp

* Naming Conventions
When naming things, follow Ruby conventions. Use snake_case when naming everything, except classes which are CamelCase or constants, which are all UPPERCASE. 

Using Rubocop on your code will help catch some of these issues as well. 

* Mutating Constants
Another common type of mistake is that people tend to change values of constants. For example: 

CARDS = [1, 2, 3]

Because CARDS is a constant, do not add or remove values from this array. CONSTANTS should be immutable. 

* Methods
Make sure the method does "one" thing, and that its responsibility is very limited. This implies indirectly that your methods should be short (around 10 lines or so). If it's more than 15 lines long, it would probably be better to split it to 2 or 3 mthods. 

* Guidelines on how to write good methods: 

- Don't display something to the output and return a meaningful value. Since Ruby always returns a value, the key here is that the return value shouldn't be the intent of the method. 

- Decide whether the method should return a value with no side effects or perform side effects with no return value. A side effect would be something like a mutation or transformation !

- In Ruby, we would not say return_total, it would be just total - returning a value is implied. Further, we would not expect a total method to have side effects or print a value out. 

Ex) def total(cards) # [1, 2, 3]
end 
#* => Integer

From the name "total" you know this method should return an integer (the value of total). If instead this method mutates cards, it then becomes confusing. 

* Methods should be at the same level of abstraction
Usually, methods take some input and return an output. When working with a method, you should be able to mentally extract the method from the larger program, and just work with the method in isolation. 

You should be able to feed this method inputs, and expect it to give some outputs. When you have a method like this, you can use it without thinking about its implementation.

* If the methods in your program are correctly compartmentalized, it makes programming much easier, especially on larger programs. That is why when you read good code, the methods are all at the same layer of abstraction. 

For example, given the four methods below, which one stands out? 
- deal()
- hit()
- stay()
- iterate_through_cards()

The last one, iterate_through_cards, is not at the same abstraction level as the other methods. 

* Method names should reflect mutation

def update_total(total, cards)
end 
#* total is changed

When we see a method called update_total, we assume that the parameter passed in to it will be mutated. 

* Use naming conventions, even in your own code, to signify which types of methods mutate vs which methods return values. 

Your goal should be to build small methods that are like LEGO blocks: they should be stand-alone pieces of functionality that you can use to piece together larger structures.

* Displaying Output
Sometimes, you'll have methods that only display things. For example: 

def welcome
  puts "welcome"
end

This should be:

def print_welcome
  puts "Welcome"
end 

* Remember that code not only has to work properly, but must also be read easily - both by others as well as your future self. 

* Misc Tips:

- Don't prematurely exit the program. All your methods should be at the same mental scope and not just randomly exit the program. Your program should probably only have one exit point. 

- Watch your indentation. 2 spaces, not tabs. 

- Name your methods from the perspective of using them later. 

- Know when to use a "do/while" vs a "while" loop (all loops are infinte until we break out of them)

loop do 
  puts "Continue? (y/n)"
  answer = gets.chomp
  break if answer.downcase == 'n'
end 

* Truthiness
Why do we say "truthiness" instead of just true or false? The reason is because in Ruby, like most programming languages, more than just true evaluates to true in a conditional i.e. strings, integers, objects, etc. 

* In Ruby, everything is truthy except nil and false. 

if user_input == true

# could be just 

if user_input 

* Dangerous Bug

if some_variable = 2
  puts "some_variable is 2"
else 
  puts "some_variable is not 2"
end 


=end 