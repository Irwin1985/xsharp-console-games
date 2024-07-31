USING System

GLOBAL lnGuessedNumber := Random{}:Next(1, 100) AS INT

PROCEDURE Start
	DO WHILE .T.
		?"Guess a number (1-100): "
		LOCAL lnInput AS INT
		IF Int32.TryParse(Console.ReadLine(), OUT lnInput)
			IF lnInput == lnGuessedNumber
				? "You guessed it!"				
				EXIT
			ENDIF
			DO CASE
			CASE lnInput < lnGuessedNumber
				? "Incorrect. Too low"
			CASE lnInput > lnGuessedNumber
				? "Incorrect. Too high"
			ENDCASE
		ELSE
			? "Invalid number"
		ENDIF
	ENDDO			
END PROC
