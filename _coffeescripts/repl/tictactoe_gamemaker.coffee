TOKENS = 
  "0": " "
  "-1": "X"
  "1": "O"

drawBoard = (board) ->
  board = (TOKENS[position] for position in board)
  jqconsole.Write(
    [
      [" #{board[0]} | #{board[1]} | #{board[2]} \t 0 | 1 | 2 "],
      [" #{board[3]} | #{board[4]} | #{board[5]} \t 3 | 4 | 5 "],
      [" #{board[6]} | #{board[7]} | #{board[8]} \t 6 | 7 | 8 "]
    ].join("\n---|---|---\t---|---|---\n") + "\n"
  )

computerMove = ->
  tictactoe.occupy( tictactoe.alphaBetaSearch().pop() )

valid = (move) ->
  move in tictactoe.getFreePositions()

announceResult = ->
  if tictactoe.winner(1)
    jqconsole.Write("You won!")
  else if tictactoe.loser(1)
    jqconsole.Write("You lost.")
  else
    jqconsole.Write("Draw.")

gameOver = ->
  tictactoe.terminalTest() or tictactoe.winner(1) or tictactoe.loser(1)

promptHandler = (input) ->
  jqconsole.Clear()
  move = parseInt(input, 10)

  if valid(move)
    tictactoe.occupy(move)
    computerMove()
  else
    jqconsole.Write("That's an illegal move. Try again.\n")

  if gameOver()
    announceResult()

  drawBoard( tictactoe.board() )
  startPrompt()

startPrompt = ->
  # Start prompt with history enabled
  jqconsole.Prompt(true, promptHandler)


drawBoard( window.tictactoe.board() )
jqconsole.Write("NUMBER OF PLAYERS?")
jqconsole.Input( (input) ->
  console.log("number of players: #{input}")
)

startPrompt()

  


