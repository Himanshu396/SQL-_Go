DELIMITER $$  
CREATE FUNCTION loan_branch(  
    amt int  
)   
RETURNS VARCHAR(20)  
DETERMINISTIC  
BEGIN  
    DECLARE loan_branch VARCHAR(20);  
    IF amt > 40 THEN  
        SET loan_branch = 'b5';  
    ELSEIF (amt <= 40 AND   
            amt >= 30) THEN  
        SET loan_branch = 'b7';  
    ELSEIF amt < 10 THEN  
        SET loan_branch = 'b9';  
    END IF;  
    -- return the loan branch  
    RETURN (loan_branch);  
END$$  
DELIMITER;  

/ *SELECT branch,amt  
FROM join.loan ORDER BY amt; */