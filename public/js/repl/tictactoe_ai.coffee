Array::count = (item) ->
  count = 0
  count++ for c in this when c is item
  return count

$ = jQuery

this.tictactoe = do ($) ->
  # board locations are referenced like this:
  #[0,1,2
  # 3,4,5
  # 6,7,8]

  config = {
    rows: 3
    cols: 3
    numToWin: 3
    ply: 4
  }

  players = {
    cross:  -1
    naughts: 1
  }

  board = [0, 0, 0, 0, 0, 0, 0, 0, 0]

  # function toMove
  #
  # determines whose turn it is to move
  # input: a tic-tac-toe board
  # output: returns 1 for noughts (O) and -1 for crosses (X)

  toMove = (boardState = board) ->
    player = [0, 0]
    for state in boardState
      if state is players.naughts
        player[0]++
      else if state is players.cross
        player[1]++
    return if player[0] <= player[1] then players.naughts else players.cross

  # function occupy
  #
  # places the current player's piece into `location`
  # input: a location
  # output: returns true if player is able to move there, otherwise false

  occupy = (location) ->
    if (getFreePositions().indexOf(location) isnt -1)
      board[location] = toMove()
      return true
    else
      return false

  # function clear
  #
  # resets the internal board
  # input: none
  # output: none

  clear = () ->
    board = [0,0,0,0,0,0,0,0,0]

  # function isBoard
  #
  # basic check to see if input is a tic-tac-toe board
  # input: a board
  # output: true if input is a board, false if its not

  isBoard = (board) ->
    board.length is 9 and board?

  # function getFreePositions
  #
  # returns positions available given the tic-tac-toe board, boardState
  # input: a tic-tac-toe board (boardState)
  # output: an array of open positions

  getFreePositions = (boardState = board) ->
    moves = (idx for move, idx in boardState when move is 0)

  # function terminalTest
  #
  # returns true if no more moves can be made
  # input: boardState (optional, otherwise returns internal board)
  # output: true if no more moves can be made

  terminalTest = (boardState = board) ->
    getFreePositions(boardState).length is 0

  # function endState
  #
  # returns true if the board is at an end state, either through a winner
  # or because we have no moves left or the depth amount for the ai has
  # been reached

  # input: boardState (optional, otherwise returns internal board),
  #        player
  # output: true if no more moves can be made

  endState = (boardSt = board, player) ->
    terminalTest(boardSt) or winner(boardSt, player) or loser(boardSt, player)


  # function winner
  #
  # determines if player is a winner based on board
  # input: boardState (optional, otherwise returns internal board), player
  # output: true if player has won

  winner = (boardState, player) ->
    if not player?
      player = boardState
      boardState = board

    result = winnerWhere(boardState, player)
    result[0] isnt -1 and result[1] isnt -1

  # function loser
  #
  # determines if player is a loser based on board
  # input: boardState (optional, otherwise returns internal board), player
  # output: true if player has lost

  loser = (boardState = board, player) ->
    winner(boardState, -player)

  # function winnerWhere
  #
  # returns the location of the start/end of the winning line.
  # e.g. a win on the first column for player will return [0,6],
  # a win on the first row for player will return [0,2]
  #
  # input: boardState (optional, otherwise returns internal board), player
  # output: 2 element array containing the starting location and ending
  #         location of the win
  #         returns [-1,-1] if not found

  winnerWhere = (boardState = board, player) ->
    if not player?
      player = boardState
      boardState = board
    r = 0
    while (r < config.rows)
      sliceStart = r * config.rows
      sliceEnd = sliceStart + config.rows
      if boardState.slice(sliceStart, sliceEnd).count(player) is config.numToWin
        return [r * config.rows,(r * config.rows)+config.rows - 1]
      r++

    c = 0
    while (c < config.cols)
      iters = 0
      csub = c
      col = []
      while (csub < boardState.length and iters < config.numToWin)
        col.push( boardState[csub] )
        iters++
        csub += config.cols
      if (col.count(player) is config.numToWin)
        return [c, c+(config.cols * (config.numToWin - 1))]
      c++

    # written this way so it can handle any sized tictactoe configuration and
    # how many you need to win assuming its just a basic 3x3 box, this will
    # still just run row * col times

    rowsPlusOne = config.rows + 1
    colsMinusOne = config.cols - 1
    numToWin = config.numToWin
    for dc1 in [0..(config.rows - numToWin)]
      for dr1 in [0..(config.cols - numToWin)]
        diag1 = []
        diag2 = []
        rowByTotalCols = dr1 * config.cols

        for dsub in [0..numToWin-1]
          diag1.push(boardState[rowByTotalCols + (dsub * rowsPlusOne)])
          diag2.push(boardState[rowByTotalCols + 2 + (dsub * colsMinusOne)])
        if diag1.count(player) is numToWin
          return [rowByTotalCols + (0 * rowsPlusOne)
                , rowByTotalCols + ((numToWin - 1) * rowsPlusOne)]
        if diag2.count(player) is numToWin
          return [rowByTotalCols + 2 + (0 * colsMinusOne)
                , rowByTotalCols + 2 + ((numToWin - 1) * colsMinusOne)]
    return [-1, -1]

  # function utility
  #
  # returns the value of the current board, boardState for the player
  # input: a boardState (optional, otherwise internal board is used, a player
  # output: the value of the board

  utility = (boardState, player) ->

    if not player?
      player = boardState
      boardState = board

    score = 0
    markScore = [0, 1, 10, 1000]
    diag1 = [ boardState[0], boardState[4], boardState[8] ]
    diag2 = [ boardState[2], boardState[4], boardState[6] ]

    r = 0
    while r < config.rows
      row = boardState.slice(r * 3,(r * 3) + 3)
      if (row.count(player) > 0 and row.count(-player) is 0)
        score += markScore[row.count(player)]
      else if (row.count(-player) > 0 and row.count(player) is 0)
        score -= markScore[row.count(-player)]

      col = [ boardState[r],boardState[r + 3],boardState[r + 6] ]
      if (col.count(player) > 0 and col.count(-player) is 0)
        score += markScore[col.count(player)]
      else if (col.count(-player) > 0 and col.count(player) is 0)
        score -= markScore[col.count(-player)]
      if (diag1.count(player) > 0 and diag1.count(-player) is 0)
        score += markScore[diag1.count(player)]
      else if (diag1.count(-player) > 0 and diag1.count(player) is 0)
        score -= markScore[diag1.count(-player)]
      if (diag2.count(player) > 0 and diag2.count(-player) is 0)
        score += markScore[diag2.count(player)]
      else if (diag2.count(-player) > 0 and diag2.count(player) is 0)
        score -= markScore[diag2.count(-player)]
      r++
    return score

  # function chooseRandom
  #
  # random decision maker for ai, randomly places a piece in an available slot
  # input: board, player
  # output: returns an array containing 3 things: [player, value of this move,
  # which location to place piece]

  chooseRandom = (state, player) ->
    possMoves = getFreePositions(state)
    result = possMoves[Math.floor(possMoves.length * Math.random())]
    return [player, 1, result]

  # function alphaBetaSearch
  #
  # minimax alpha beta pruning decision maker. places a piece where it feels
  # will give it high utility/heuristic values
  # input: board, player
  # output: returns an array containing 3 things: [player, value of this move,
  # which location to place piece]

  alphaBetaSearch = (state = board) ->
    player = toMove()
    biggestValue = -Infinity
    possMoves = getFreePositions(state)
    newBoard = state.slice(0)

    for tryMove in possMoves
      newBoard[tryMove] = player

      if (winner(newBoard, player))
        return [player, 1000, tryMove]
      if (loser(newBoard, player))
        return [player, -1000, tryMove]

      abs = -negaMax(newBoard, config.ply, -Infinity, Infinity, -player)

      if (abs > biggestValue)
        biggestValue = abs
        result = tryMove
      newBoard[tryMove] = 0

    return [player, biggestValue, result]

  # function negaMax
  #
  # returns the value of the successors to 'state', part of alphaBetaSearch
  #
  # input: boardState, current depth, the alpha/beta values, the player
  # currently playing at this state
  #
  # output: the value of state's successors based on utility()

  negaMax = (state, depth, alpha, beta, player) ->
    if (endState(state, player) or depth is 0)
      return utility(state, player)

    possMoves = getFreePositions(state)
    newBoard = state.slice(0)

    for tryMove in possMoves
      newBoard[tryMove] = player
      val = -negaMax(newBoard, depth - 1, -beta, -alpha, -player)
      return val if (val >= beta)
      alpha = Math.max(val, alpha)
      newBoard[tryMove] = 0
    return alpha

  # function maxValue
  #
  # returns the max value the successors to 'state', part of alphaBetaSearch
  # input: boardState, current depth, the alpha/beta values, the player
  #        currently playing at this depth, the original player we are
  #        evaluating for
  # output: the maximum value of state's successors based on utility()

  maxValue = (state, depth, alpha, beta, player, firstPlayer) ->
    if (endState(state, player) or depth is 0)
      return utility(state, firstPlayer)
    v = -Infinity
    possMoves = getFreePositions(state)
    newBoard = state.slice(0)

    for tryMove in possMoves
      newBoard[tryMove] = player
      minVal =  minValue(newBoard, depth-1, alpha, beta, -player, firstPlayer)
      v = Math.min(v, minVal)
      return v if (v >= beta)
      alpha = Math.max(v, alpha)
    return v

  # function minValue
  #
  # returns the min value the successors to 'state', part of alphaBetaSearch
  # input: boardState, current depth, the alpha/beta values, the player
  #        currently playing at this depth, the original player we are
  #        evaluating for
  # output: the minimum value of state's successors based on utility()

  minValue = (state, depth, alpha, beta, player, firstPlayer) ->
    if (endState(state, player) or depth is 0)
      return utility(state, firstPlayer)
    v = Infinity
    passMoves = getFreePositions(state)
    newBoard = state.slice(0)

    for tryMove in possMoves
      newBoard[tryMove] = player
      maxVal = maxValue(newBoard, depth - 1, alpha, beta, -player, firstPlayer)
      v = Math.min(v, maxVal)
      return v if (v <= alpha)
      beta = Math.min(beta, v)
    return v

  return {
    board: -> board
    config: -> config

    toMove: toMove
    occupy: occupy
    clear: clear

    isBoard: isBoard
    getFreePositions: getFreePositions
    terminalTest: terminalTest

    winner: winner
    loser: loser
    winnerWhere: winnerWhere

    utility: utility
    chooseRandom: chooseRandom
    alphaBetaSearch: alphaBetaSearch

    maxValue: maxValue
    minValue: minValue
  }