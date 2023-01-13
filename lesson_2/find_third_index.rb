# A method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

def find_third_index(string, character)
  counter = 0
  arr = []
  
  occurrences = string.count "#{character}"
  
  if counter < string.size && occurrences >= 3
    loop do
      counter += 1
      if string[counter] == character
        arr << counter
        break if counter > 3
      end
    end
  else
    nil
  end
  
  arr.last
end

find_third_index('axbxcdxex', 'x')
# => 6
