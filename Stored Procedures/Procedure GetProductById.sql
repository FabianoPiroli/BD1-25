DELIMITER $$

CREATE PROCEDURE `GetProductById`(
	IN pProductId INT,
    OUT pProductLevel VARCHAR(20)
    )
BEGIN

	DECLARE VALOR DECIMAL (10,2) DEFAULT 0;
    
    SELECT COUNT(*)
    INTO VALOR
    FROM PRODUTO AS P
    WHERE P.COD_PRODUTO = pProductId;
    
    IF( VALOR >= 5 AND VALOR <= 10 ) THEN
		SET pProductLevel = 'CRÍTICO';
	ELSEIF( VALOR > 10 AND VALOR <=20 ) THEN
		SET pProductLevel = 'PREOCUPANTE';
	ELSEIF( VALOR > 20 ) THEN 
		SET pProductLevel = 'TA SUAVE';
	ELSE
		SET pProductLevel = 'FUJA';
	END IF;
END$$
	