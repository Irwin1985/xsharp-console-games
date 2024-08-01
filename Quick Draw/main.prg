USING System
USING System.Diagnostics


PROCEDURE Start
	LOCAL lcMenu AS STRING
	TEXT TO lcMenu

	  Quick Draw

	  Face your opponent and wait FOR the signal. Once the
	  signal IS given, shoot your opponent by pressing [space]
	  before they shoot you. It's all about your reaction time.

	  Choose Your Opponent:
	  [1] Easy....1000 milliseconds
	  [2] Medium...500 milliseconds
	  [3] Hard.....250 milliseconds
	  [4] Harder...125 milliseconds
	  [escape] give up
	ENDTEXT

	LOCAL lcWait AS STRING
	TEXT TO lcWait
	
	  Quick Draw
	                                                        
	                                                        
	                                                        
	              _O                          O_            
	             |/|_          wait          _|\|           
	             /\                            /\           
	            /  |                          |  \          
	  ------------------------------------------------------
	ENDTEXT

	LOCAL lcFire AS STRING
	TEXT TO lcFire    

	  Quick Draw
	                                                        
	                         ********                       
	                         * FIRE *                       
	              _O         ********         O_            
	             |/|_                        _|\|           
	             /\          spacebar          /\           
	            /  |                          |  \          
	  ------------------------------------------------------
	ENDTEXT

	LOCAL lcLoseTooSlow AS STRING
	TEXT TO lcLoseTooSlow

	  Quick Draw
	                                                        
	                                                        
	                                                        
	                                        > +__O          
	           //            Too Slow           / \         
	          O/__/\         You Lose          /\           
	               \                          |  \          
	  ------------------------------------------------------
	ENDTEXT

	LOCAL lcLoseTooFast AS STRING
	TEXT TO lcLoseTooFast
	  Quick Draw
	                                                        
	                                                        
	                                                        
	                         Too Fast       > +__O          
	           //           You Missed          / \         
	          O/__/\         You Lose          /\           
	               \                          |  \          
	  ------------------------------------------------------
	ENDTEXT

	LOCAL lcWin AS STRING
	TEXT TO lcWin
	  Quick Draw
	                                                        
	                                                        
	                                                        
	            O__+ <                                      
	           / \                               \\         
	             /\          You Win          /\__\O        
	            /  |                          /             
	  ------------------------------------------------------
	ENDTEXT

	
	TRY
		DO WHILE TRUE
			Console.Clear()
			?lcMenu
			LOCAL loRequiredReactionTime := NULL AS TimeSpan?
			DO WHILE loRequiredReactionTime == NULL
				Console.CursorVisible := FALSE
				LOCAL loKey := Console.ReadKey(TRUE):Key AS ConsoleKey
				DO CASE
				CASE loKey == ConsoleKey.D1 .or. loKey == ConsoleKey.NumPad1
					loRequiredReactionTime := TimeSpan.FromMilliseconds(1000)
				CASE loKey == ConsoleKey.D2 .or. loKey == ConsoleKey.NumPad2
					loRequiredReactionTime := TimeSpan.FromMilliseconds(0500)
				CASE loKey == ConsoleKey.D3 .or. loKey == ConsoleKey.NumPad3
					loRequiredReactionTime := TimeSpan.FromMilliseconds(0250)
				CASE loKey == ConsoleKey.D4 .or. loKey == ConsoleKey.NumPad4
					loRequiredReactionTime := TimeSpan.FromMilliseconds(0125)
				CASE loKey == ConsoleKey.Escape
					RETURN
				ENDCASE
			ENDDO
			console.Clear()
			LOCAL loSignal := TimeSpan.FromMilliseconds(Random{}:Next(5000, 25000)) AS TimeSpan
			?lcWait
			LOCAL loStopWatch := StopWatch{} AS Stopwatch
			loStopWatch:Restart()
			LOCAL lbTooFast := FALSE AS LOGIC
			DO WHILE loStopWatch:Elapsed < loSignal .and. !lbTooFast
				IF Console.KeyAvailable .and. Console.ReadKey(TRUE):Key == ConsoleKey.Spacebar
					lbTooFast := TRUE
				ENDIF
			ENDDO
			console.Clear()
			console.CursorVisible := FALSE
			?lcFire
			loStopWatch:Restart()
			
			LOCAL lbTooSlow := TRUE AS LOGIC
			LOCAL loReactionTime := NULL AS TimeSpan?
			WHILE !lbTooFast .and. loStopWatch:Elapsed < loRequiredReactionTime .and. lbTooSlow
				IF Console.KeyAvailable .and. console.ReadKey(TRUE):Key == ConsoleKey.Spacebar
					lbTooSlow := FALSE
					loReactionTime := loStopWatch:Elapsed
				ENDIF
			ENDDO
			console.Clear()
			IF lbTooFast
				?lcLoseTooFast
			ELSEIF lbTooSlow
				?lcLoseTooSlow
			ELSE 
				?i"{lcWin}{Environment.NewLine} Reaction Time: {loReactionTime:TotalMilliseconds} milliseconds."
			ENDIF
			?"	Play Again [enter] or quit [escape]?"
			console.CursorVisible := FALSE 
			LOCAL loKey2 := Console.ReadKey(TRUE):Key AS ConsoleKey
			IF loKey2 == ConsoleKey.Enter
				LOOP
			ELSEIF loKey2 == ConsoleKey.Escape
				RETURN
			ENDIF
		ENDDO
	CATCH TO loEx
		?loEx.Message
	FINALLY
		console.Clear()
		console.CursorVisible := TRUE
		?"Quick Draw was closed."
	END TRY
	
	
END PROC
