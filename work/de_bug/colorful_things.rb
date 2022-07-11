# The following code throws an error. Find out what is wrong and think about how you would fix it.

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  # break if i > colors.length
  break if i > things.length - 1 || i > colors.length - 1 # in case we don't know which is shorter 

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

=begin

Discussion:

The above solution uses the length of the shorter things array to determine whether to break from the loop or not, and stops as soon as i has a value greater than the last array index.


=end 