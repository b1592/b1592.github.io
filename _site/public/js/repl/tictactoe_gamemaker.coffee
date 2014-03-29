TOKENS = 
  "0": " "
  "1": "X"
  "-1": "O"

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

promptHandler = (input) ->
  move = parseInt(input, 10)
  tictactoe.occupy(move)
  computerMove()
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

  


