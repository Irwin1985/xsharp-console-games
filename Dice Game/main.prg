USING System


PROCEDURE Start
	LOCAL lnPlayerPoints := 0 AS INT
	LOCAL lnRivalPoints := 0 AS INT
	
	? "Dice Game"
	?
	?"In this game you and a computer Rival will play 10 rounds"
	?"where you will each roll a 6-slices dice, and the player"
	?"with the highest dice value will win the round. The player"
	?"who wins the most rounds wins the game. Good luck!"
	?
	?"Press any key to start..."
	Console.ReadKey(.T.)
	?
	?
	FOR VAR i:=1 TO 10
		?i"Round {i}"
		LOCAL lnRivalRandomNum := Random{}:Next(1, 7) AS INT
		?i"Rival rolled a {lnRivalRandomNum}"
		?"Press any key to roll the dice..."
		console.ReadKey(.t.)
		?
		LOCAL lnPlayerRandomNum := Random{}:Next(1, 7) AS INT
		?i"You rolled a {lnPlayerRandomNum}"
		IF lnPlayerRandomNum > lnRivalRandomNum
			lnPlayerPoints++
			?"You won this round."
		ELSEIF lnRivalRandomNum > lnPlayerRandomNum
			lnRivalPoints++
			?"The rival won this round."      
		ELSE
			?"This round is a draw!"
		ENDIF
		?i"The score is now - You: {lnPlayerPoints}. Rival: {lnRivalPoints}."
		?"Press any key to continue..."
		console.ReadKey(.t.)
		?
		?
	END FOR
	?"Game over."
	?i"The score is now - You: {lnPlayerPoints}. Rival: {lnRivalPoints}."	
	IF lnPlayerPoints > lnRivalPoints
		? "You won!"
	ELSEIF lnRivalPoints > lnPlayerPoints 
		? "You lost!"
	ELSE
		? "This game is a draw."
	ENDIF
	?"Press any key to exit..."
	console.ReadKey(.t.)
END PROC
