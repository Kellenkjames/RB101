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

- Can confirm / refute assumptions 
- Help to answer questions about implicit requirements 
- Act as assertions which help to codify the rules and boundaries 

## D: Data Structures 

- Help reason with data logically 
- Help interact with data at implementation level 
- Think in terms of data structure is part of problem solving process 
- Data structures are closely linked to algorithm 
  - Set of steps from input to output 
    - Involves structuring data in a certain way 

## A: Algorithms 
## C: Implementing a solution in Code

## Sum Even Number Rows 

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row. 

**Rules/Requirements**
- Sequence of even integers 
- Sequence begins with two 
- Integers are consecutive 
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
# 4, 6 
# 8, 10, 12
# 14, 16, 18, 20

- How do we create the structure? 

**Examples**

row number: 1 ==> sum of integers in row: 2
row number: 2 ==> sum of integers in row: 10
row number: 4 ==> sum of integers in row: 68

2 --> 2 
4, 6 -- 10
14, 16, 18, 20 --> 68

**Data Structure**

# 2
# 4, 6 
# 8, 10, 12
# 14, 16, 18, 20

- Overall structure represents sequence as a whole
- Individual rows within overall structure 
- Individual rows in a set order in context of sequence 
- Individual rows contain integers 
- Can assume that integers are in a set order in the context of the sequence 

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ....
]