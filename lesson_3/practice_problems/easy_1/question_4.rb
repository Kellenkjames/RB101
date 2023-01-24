# Question 4

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)         # numbers i now [1, 3, 4, 5]

numbers.delete(1)             # numbers i now [2, 3, 4, 5]

=begin

Explanation:

* delete_at (index) deletes and returns the deleted_object at the specified index

* delete(obj) deletes and returns the the deleted_object

=end