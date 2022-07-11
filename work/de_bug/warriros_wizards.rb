# We started writing an RPG game, but we already run into an error message. Find the problem and fix it.

# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge(character_classes[input])

puts 'Your character stats:'
puts player

=begin

When we get user input, it is always a String. Our character_classes hash, however, uses symbols as keys (recall that { warrior: some_value } is syntactic sugar for { :warrior => some_value }). So we first need to convert the input String into a symbol, by means of String#to_sym.

Next, Hash#merge returns a new hash, so when the expression player.merge character_classes[input.to_sym] is evaluated, this does not mutate player but instead creates a new hash, which we neither use nor assign to a variable. 

So, in order to update the player hash, we have to either use its mutating sibling Hash#merge! or re-assign player to the newly created hash as in the shown solution.


= end