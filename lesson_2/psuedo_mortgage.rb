=begin

Basic pseudo-code

Get the following pieces of information from the user:
 *- what is the loan amount? (must be a valid int)
  - keep asking until input is a valid integer 
  - save to loan_amount variable 
  *- what is the Annual Percentage Rate (APR) (must be a valid int or floating point number)
    - keep asking until input is a valid int or floating point number 
    - Convert to monthly interest rate 
    - save to montly_interest_rate variable 
  *- what is the loan duration (months) (must be a valid int)
      - if the duration is less than 1 month, keep asking for a valid integer
      - otherwise, save to loan_months variable

After information has been collected use formula to calculate payment 
m = p * (j / (1 - (1 + j)**(-n)))

Hints: 
- FIgure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?

- If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate.

- Be careful about the loan duration -- are you working with months or years? Choose variable names carefully to assist in remembering.

=end