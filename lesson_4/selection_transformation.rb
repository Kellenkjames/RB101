#* Selection and Transformation

# Selection and transformation both utilize the basics of looping: a loop, a counter, a way to retreive the current value, and a way to exit the loop. 

# In addition, selection and transformation require some criteria; selection uses this criteria to determine which elements are selected, while transformation uses this criteria to determine how to perform the transformation. 

#----------------------------------------------

#* Looping to Select and Transform

alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do 
  current_char = alphabet[counter]
  
  if current_char == 'g'
    selected_chars << current_char # appends current_char into the selected_chars string 
  end 
  
  counter += 1
  break if counter == alphabet.size
end 

puts selected_chars # => "g"

# The 'if' condition is what determines which values are selected and which ones are ignored; this is the selection criteria. The rest of the code is just your basic loop iterating code.
