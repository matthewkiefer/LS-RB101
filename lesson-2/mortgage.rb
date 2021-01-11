# mortgage.rb

=begin

Problem
Examples
Data structures
Algorithm (flow chart?)
Code

Greet the user

LOOP # whole thing
  Collect the information: loan amount, APR, loan duration 
    -Verify (loop?)
  Calculate
    -convert first (or under verify)
  Send info to user
  Ask about again or end

  START
  SET variables: loan_amount, APR, loan_duration, mortgage

  LOOP
    PRINT Ask for loan_amount in dollars
    GET loan
    CHECK loan is valid int or float
      -call method
      IF valid, 
        SET loan_amount = loan
        break
      ELSE ask again
  END

  LOOP
    PRINT Ask for APR in % (ex 5% APR)
    GET APR
    CHECK for valid int or float
        -call method
      IF valid, 
        SET monthly_rate = (APR*.01) / 12
        break
      ELSE ask again
  END

  LOOP
    PRINT Ask for loan duration in years
    GET loan_years
    CHECK loan_years (int or float)
    if valid, 
      SET loan_duration = loan_years * 12
      BREAK
    ELSE ask again
  END
  
  SET mortgage = formula
  PRINT mortgage
  PRINT Again?
  GET input (y/n)
  If y
    Do nothing so loop returns to top
  Else BREAK
  END

PRINT farewell
END


=end
