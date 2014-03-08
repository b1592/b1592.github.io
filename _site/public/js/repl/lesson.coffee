class this.Lesson
  constructor: (@questions) ->
    @_index = 0

  currentQuestion: ->
    @questions[@_index]

  next: ->
    @_index += 1 unless @isDone()

  isDone: ->
    @questions.length == @_index + 1

module.exports = this.Lesson
