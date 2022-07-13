# The P.E.D.A.C Process 

## P: Understanding the Problem 

- Establish the rules / define the boundaries of the problem:
  - Assess available information 
  - Restate explicit requirements 
  - Identify Implicit requirements 
- Spend enough time. Don't rush this step.  

**General Example**

Given a string, produce a new string with every other word removed. 

- Explicit requirements: 
  - Input: string 
  - Output: new string 
  - Remove every other word from input string 

- Questions: 
  - What do we mean by every other word? 
  - How do we define a word in this context? 
    - Words are delimited by spaces 

## E: Examples and Test Cases 
## D: Data Structures 
## A: Algorithms 
## C: Implementing a solution in Code

## Sum Even Number Rows 

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row. 

**Further Clarification**
- Sequence of integers 
- Sequence begins with two 
- Integers are consecutive (even)
- Sequence is grouped in to rows 
- Each row incrementally larger: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row 
  - Row 1 has 1 element #
  - Row 2 has 2 elements ##
  - Row 3 has 3 elements ###
- Input: a single integer 
  - Identifies a 'row', which is a subset of a sequence of integers 
- Output: a single integer 
  - The sum of the integers in the row identified by the input integer 

- Sequence: 
2, 4, 6, 8, 19, 12, 14, 16, 18, ...

# 2
# 4, 6 => If the input integer is '2' we know we have to return sum of elements of this row (10)
# 8, 10, 12 => If the input integer is '3' we know we have to return sum of elements of this row (30)
# 14, 16, 18, 20

- How do we create the structure? 