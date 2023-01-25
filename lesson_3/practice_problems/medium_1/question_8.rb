# Question 8

# Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game: it returns the winning fist or, in the case of a tie, the fist that both players played.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# paper

=begin

Steps:

1. Outermost call is evaluated by determining the result of:
rps(rps("rock", "paper"), rps("rock", "scissors")) versus rock

2. Need to evaluate the two separate results of
rps("rock", "paper") and rps("rock", "scissors")

3. Combine the above by calling rps on their individual results
=> paper
=> rock

4. rps("paper", "rock") => "paper"

5. rps("paper", "rock") => "paper"

paper

=end
