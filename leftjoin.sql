 select amt,custname,branch
 from join.loan LEFT JOIN join.borrower 
 ON
 loan.loanno=borrower.loanno;