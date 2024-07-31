USING System
USING STATIC Move

GLOBAL lnWins := 0 AS INT
GLOBAL lnDraws := 0 AS INT
GLOBAL lnLosses := 0 AS INT

ENUM Move
	Rock
	Paper
	Scissors
END ENUM


PROCEDURE Start
	DO WHILE .T.
		Console.Clear()
		?"Rock, Paper, Scissors"
		?
		? "Choose [r]ock, [p]aper, [s]cissors, or [e]xit:"
		LOCAL lnPlayerMove AS Move
		SWITCH Console.ReadLine()
		CASE "r"
		CASE "rock"
			lnPlayerMove := Rock
		CASE "p"
		CASE "paper"
			lnPlayerMove := Paper
		CASE "s"
		CASE "scissors"
			lnPlayerMove := Scissors
		CASE "e"
		CASE "exit"
			RETURN
		OTHERWISE
			? "Invalid input. Try again..."
			LOOP
		END SWITCH
		
		LOCAL lnComputerMove := (Move)Random{}:Next(3) AS Move
		?i"The computer chose {lnComputerMove}."
		DO CASE
		CASE (lnPlayerMove == Rock .and. lnComputerMove == Paper) .or. (lnPlayerMove == Paper .and. lnComputerMove == Scissors) .or. (lnPlayerMove == Scissors .and. lnComputerMove == Rock)
			?"You lose"
			lnLosses++
		CASE (lnPlayerMove == Rock .and. lnComputerMove == Scissors) .or. (lnPlayerMove == Paper .and. lnComputerMove == Rock) .or. (lnPlayerMove == Scissors .and. lnComputerMove == Paper)
			?"You win"
			lnWins++
		OTHERWISE
			?"This game was a draw"
			lnDraws++
		ENDCASE
		?i"Score: {lnWins} wins, {lnLosses} losses, {lnDraws} draws"
		?"Press Enter to continue..."
		Console.ReadLine()		
	ENDDO
	
	
END PROC
