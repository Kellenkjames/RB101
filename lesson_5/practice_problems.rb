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

arr1 = 
['a', 'b', 
  ['c', 
    ['d', 'e', 'f', 'g']
  ]
]
arr1[2][1][3] # => 'g'




