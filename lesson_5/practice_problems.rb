#* Practice Problems: Sorting, Nested Collections and Working with Blocks 

# Problem 1: How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end 
# => ["11", "10", "9", "8", "7"]

# ------------------------------------------------

# Problem 2: How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end 
# => [
# {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
# {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"},
# {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"},
# {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
# ]

# ------------------------------------------------

# Problem 3: For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3] 
# => 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0] 
# => 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]
# => 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]
# => 'g' 

hsh2 = { 
  first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0} 
}
hsh2[:third].key(0)

# ------------------------------------------------

# Problem 4: For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4

arr1 = arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
# => [1, [2, 4], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
# =>[{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4]

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2] = 4
# => {first: [1, 2, [4]]}

hsh2 = 
{ ['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5 }
hsh2[['a']]
# => { ['a'] => {a: ['1', :two, 4], b: 4}, 'b' => 5 }

# ------------------------------------------------

# Problem 5: Given this nested Hash: figure out the total age of just the male members of the family. 

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end 
total_male_age # => 444

# ------------------------------------------------

# Problem 6: Given this previously seen family hash, print out the name, age and gender of each family member: (Name) is a (age)-year-old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "(#{name}) is a (#{details["age"]})-year-old (#{details[("gender")]})."
end

# ------------------------------------------------

# Problem 7: What would be the final values of a and b? Try to work this out without running the code. 

a = 2
b = [5, 8]
arr = [a, b] 
# => [2, [5, 8]]

arr[0] += 2 
arr[1][0] -= a

a     # => 2
b     # => [3, 8]
arr   # => [4, [3, 8]]

# ------------------------------------------------

# Problem 8: Using the each method, write some code to output all of the vowels from the strings. 

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)

hsh.each do |_, value|
  value.each do |string|
    string.chars do |char|
      puts char if vowels.include?(char)
    end
  end
end

# ------------------------------------------------

# Problem 9: Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end 
end 
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]

# ------------------------------------------------

# Problem 10: Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hsh = {}
  hsh.each do |key, value|
    incremented_hsh[key] = value + 1
  end 
  incremented_hsh
end 

# ------------------------------------------------

# Problem 11: Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_array|
  sub_array.select do |number| 
    number % 3 == 0 
  end 
end

# ------------------------------------------------

# Problem 12: Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |sub_arr| 
  hsh[sub_arr[0]] = sub_arr[1]
end 
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# ------------------------------------------------

# Problem 13: Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort_by do |sub_arr| 
  sub_arr.select do |num|
    num.odd? 
  end
end 

#       [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

# By performing selection on the sub-arrays that we are comparing, we can compare them based on the value of the odd integers alone. 

# ------------------------------------------------

# Problem 14: Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, details| 
  colors_of_fruits = nil 
  sizes_of_vegetables = nil 

  if details[:type] == 'fruit'
    details[:colors].each do |color|
      colors_of_fruits = color.capitalize!
    end 
  elsif details[:type] == 'vegetable'
    sizes_of_vegetables = details[:size].upcase! 
  end 
end 

# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]