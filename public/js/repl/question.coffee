class this.Question
  constructor: (params) ->
    @description = params.description
    @_answer = params.answer
    @_possible_errors = params.possible_errors
    @_error_messages = params.error_messages

  evaluate: (command) ->
    @isRightAnswer = @_answer.test(command)
    @_assignErrorMessage(command) unless @isRightAnswer

  _assignErrorMessage: (command) ->
    @error_message = null
    for error, pattern of @_possible_errors
      if pattern.test(command)
        @error_message = @_error_messages[error]
    @error_message = @_error_messages["default"] unless @error_message
