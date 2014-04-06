class this.Lesson
  constructor: (@questions) ->
    @_index = 0
    @isDone = false

  currentQuestion: ->
    @questions[@_index]

  next: ->
    @isDone = true if @questions.length == @_index + 1
    @_index += 1 unless @isDone
    