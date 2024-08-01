USING System

PROCEDURE Start
	TRY
		LOCAL laArray := <TUPLE<char, STRING>>{;
											TUPLE<char,STRING>{'A', "Alpha"},;
											tuple<char,STRING>{'B', "Bravo"},;
											tuple<char,STRING>{'C', "Charlie"},;
											tuple<char,STRING>{'D', "Delta"},;
											tuple<char,STRING>{'E', "Echo"},;
											tuple<char,STRING>{'F', "Foxtrot"},;
											tuple<char,STRING>{'G', "Golf"},;
											tuple<char,STRING>{'H', "Hotel"},;
											tuple<char,STRING>{'I', "India"},;
											tuple<char,STRING>{'J', "Juliett"},;
											tuple<char,STRING>{'K', "Kilo"},;
											tuple<char,STRING>{'L', "Lima"},;
											tuple<char,STRING>{'M', "Mike"},;
											tuple<char,STRING>{'N', "November"},;
											tuple<char,STRING>{'O', "Oscar"},;
											tuple<char,STRING>{'P', "Papa"},;
											tuple<char,STRING>{'Q', "Quebec"},;
											tuple<char,STRING>{'R', "Romeo"},;
											tuple<char,STRING>{'S', "Sierra"},;
											tuple<char,STRING>{'T', "Tango"},;
											tuple<char,STRING>{'U', "Uniform"},;
											tuple<char,STRING>{'V', "Victor"},;
											tuple<char,STRING>{'W', "Whiskey"},;
											tuple<char,STRING>{'X', "X-ray"},;
											tuple<char,STRING>{'Y', "Yankee"},;
											tuple<char,STRING>{'Z', "Zulu"};
											} AS TUPLE<char, STRING>[]
		DO WHILE TRUE
			Console.Clear()
			LOCAL loPrompt := System.Text.StringBuilder{} AS System.Text.StringBuilder
			loPrompt:AppendLine()
			loPrompt:AppendLine("Flash Cards")
			loPrompt:AppendLine()
			loPrompt:AppendLine("in this game you will be doing flash card exercises")
			loPrompt:AppendLine("to help you memorize the NATO phonetic alphabet. The")
			loPrompt:AppendLine("NATO phonetic alphabet IS commonly used during radio")
			loPrompt:AppendLine("communication IN aviation. Each flash card will have")
			loPrompt:AppendLine("a letter FROM the English alphabet and you need TO")
			loPrompt:AppendLine("provide the corresponding code WORD FOR that letter.")
	        loPrompt:AppendLine()
			loPrompt:AppendLine("|  NATO phonetic alphabet code words")
			loPrompt:AppendLine("|")
			loPrompt:AppendLine("|  A -> Alpha      B -> Bravo       C -> Charlie    D -> Delta")
			loPrompt:AppendLine("|  E -> Echo       F -> Foxtrot     G -> Golf       H -> Hotel")
			loPrompt:AppendLine("|  I -> India      J -> Juliett     K -> Kilo       L -> Lima")
			loPrompt:AppendLine("|  M -> Mike       N -> November    O -> Oscar      P -> Papa")
			loPrompt:AppendLine("|  Q -> Quebec     R -> Romeo       S -> Sierra     T -> Tango")
			loPrompt:AppendLine("|  U -> Uniform    V -> Victor      W -> Whiskey    X -> X-ray")
			loPrompt:AppendLine("|  Y -> Yankee     Z -> Zulu")
			loPrompt:AppendLine()
			loPrompt:AppendLine("Press [enter] TO continue or [escape] TO quit...")
			?loPrompt:ToString()
			DO WHILE .t.
				LOCAL loKey := Console.ReadKey(.t.):Key AS ConsoleKey
				IF loKey == ConsoleKey.Enter
					EXIT
				ELSEIF loKey == ConsoleKey.Escape
					Console.Clear()
					?"Flash Cards was closed." 
					RETURN
				ENDIF
			ENDDO
			LOCAL lbReturnToMainMenu := FALSE AS LOGIC
			DO WHILE !lbReturnToMainMenu
				LOCAL lnIndex := System.Random{}:Next(1, laArray.length) AS INT
				console.Clear()
				?
				?" What is the NATO phonetic alphabet code word for..."
				?
				?i"{laArray[lnIndex].Item1}?"
				LOCAL lcInput := Console.ReadLine() AS STRING
				?
				IF lcInput:Trim():Equals(laArray[lnIndex].Item2, System.StringComparison.CurrentCultureIgnoreCase)
					?"  Correct! :)"
				ELSE 
					?i"  Incorrect! :( {laArray[lnIndex].Item2}"
				ENDIF
				?"  Press [enter] to continue or [escape] to return to main menu..."
				DO WHILE TRUE
					LOCAL loKey := Console.ReadKey(TRUE):Key AS ConsoleKey
					IF loKey == ConsoleKey.Enter
						EXIT
					ELSEIF loKey == ConsoleKey.Escape
						lbReturnToMainMenu := TRUE
						EXIT
					ENDIF									
				ENDDO
			ENDDO
		ENDDO
	CATCH TO loEx AS Exception
		?loEx.Message
	END TRY
END PROC
