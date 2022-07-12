#* Introduction to PEDAC process

# The PEDAC process is one approach to solving programming problems. Its primary goal is to help you identify and avoid pitfalls that you may encounter when you don't code with intent. 

=begin

* Introduction 

P - [Understand the] Problem 

E - Examples / Test cases 

D - Data Structure 

A - Algorithm

C - Code 

=end 

# --------------------------------------

#* P - [Understand the] Problem 

=begin 

Understanding the problem has three steps: 

1. Read the problem description. 
2. Check the test cases, if any. 
3. If any part of the problem is unclear, ask the interviewer or problem requester to clarify the matter. 

=end 

# --------------------------------------

#* Walk through this process for the problem given below:

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

#* Test Cases:
# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# --------------------------------------

# After reading this problem, some items may need clarification: 

#* 1. What is a palindrome? 

# You might ask the interviewer to tell you what a palindrome is, and the interviewer would tell you that it is a word that reads the same forwards and backward.

#* 2. Should the words in the string remain the same if they already use uppercase? 

# Here, you can check the test cases. In the fourth test case, the word LOVE already uses uppercase, and it remains uppercase in the solution. 

#* 3. How should I deal with empty strings provided as input? 

# The test cases frequently answer this question. In this case, test case number 3 provides the answer. This is an implicit requirement that we can infer from the test cases. 

# Implicit meaning (nothing extra needs to be done to handle empty strings)

#* 4. Can I assume that all inputs are strings? 

# Test cases don't show any non-string inputs, so you should ask whether the inputs can contain non-string values, and what you should do with them. In this problem, we won't worry about non-string values. 

#* 5. Should I consider letter case when deciding whether a word is a palindrome? 

# Again, test cases don't show any appropriate examples. The interviewer might tell you that the palindrome words should be case sensitive: 'mom' is a palindrome, 'Mom' is not.

#! 6. Do I need to return the same string object or an entirely new string? 
# This question is one of the most important and most overlooked that you can ask. Typically, while solving problems, students make certain assumptions. One assumption might be that they need to return the same string object. Students often start solving the problem without checking whether the assumption is correct. For this reason, the student might end up losing 10-15 minutes struggling with the wrong problem. In this problem, you should return an entirely new string.

#* 7. Always verify your assumptions either by looking at the test cases or by asking the interviewer. 

# Some assumptions, like whether we should treat strings as case-sensitive or not, can be verified either by looking at the problem description, if that is mentioned there, or by checking the test cases. If you can't determine the answer with the test cases or problem description, you should ask the interviewer to clarify this for you.

# --------------------------------------

# To conclude this part of the PEDAC process, you need to write down what the inputs and outputs for the problem are. You should also describe the rules you must follow. The rules should encapsulate all the explicit and implicit requirements in the problem. So you should identify what the explicit requirements are, write them down, and then repeat the process for the implicit requirements:

=begin

* input: string 
* output: string (not the same object)
* rules: 
        * Explicit Requirements:
        - every palindrome in the string must be converted to uppercase. (Reminder: a palindrome is a word that reads the same forwards and backward).
        - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.) 

        * Implicit Requirements:
        - the returned string shouldn't be the same string object.
        - if the string is an empty string, the result should be an empty string 

=end 

# --------------------------------------

#* Data Structure / Algorithm 

# Data structures influence your algorithm, and for that reason, these two steps are often paired. Deciding what data structure to use is generally easy for students: use cases for arrays and objects, for instance, are generally easy to identify 

# However, designing the right algorithm is far more challenging. 

#* The biggest problem that students have when writing algorithms is providing sufficient detail.

# --------------------------------------

#* Try to work through the "understand the problem" part of this problem on your own

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# --------------------------------------

# After reading this problem, some items may need clarification:

#* 1. What is a substring? 

#* 2. What is a palindrome? 

#* 3. Will inputs always be strings? 

#*4. What does it mean to treat palindrome words case-sensitively?


#* Write down the inputs / outputs to the problem: 

=begin

          * input: string 
          * output: an array of substrings 
          * rules: 
                    * Explicit requirements:
                    - return only substrings which are palindromes. 
                    - palindrome words should be case sensitive, meaning "abBA"
                    is not a palindrome.

                      * Implicit requirements: 
                      - the returned string shouldn't be the same string object
                      - if the string doesn't have any palindromes, the result should be an empty arr
                      - if the string is an empty string, the result should be an empty array  

=end 