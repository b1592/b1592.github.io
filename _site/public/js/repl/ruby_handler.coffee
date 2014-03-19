class this.RubyHandler
  constructor: (outputHandlers, @engine, @lesson) ->
    @result = outputHandlers.result
    @output = outputHandlers.output
    @error = outputHandlers.error
    @output_lesson = outputHandlers.lesson
    @error_buffer = @output_buffer = @input_buffer = []

    @count = 0

    bufferOutput = (chr) =>
      if chr? then @output_buffer.push( String.fromCharCode(chr) )
    bufferError = (chr) =>
      if chr? then @error_buffer.push( String.fromCharCode (chr) )

    # inputHandler = =>
    #   window.jqconsole.Input( (input) ->
    #     @input_buffer = char.charCodeAt() for char in input
    #     window.jqconsole.Write(input + "\n")
    #     window.jqconsole.Prompt()
    #   )
    #   @count += 1
    #   console.log(@input_buffer[0])
    #   return if @count < 10 then "123" else null

    inputHandler = ->
      console.log("Hallo")
      null

    @engine.initialize inputHandler, bufferOutput, bufferError
    @output_lesson(@lesson.currentQuestion().description) if @lesson?

  Eval: (command) ->
    @error_buffer = @output_buffer = @input_buffer = []
    @count = 0

    try
      result = @engine.eval command
      if @output_buffer.length
        @output( @output_buffer.join("") )
      @result @engine.stringify result
    catch e
      if typeof e isnt 'number'
        @error 'Internal error: ' + e
      else if @error_buffer.length
        @error @error_buffer.join ''
      else
        @error 'Unknown error.\n'

    if @lesson?
      @lesson.currentQuestion().evaluate(command)
      if @lesson.currentQuestion().isRightAnswer
        @lesson.next()
        @output_lesson (@lesson.currentQuestion().description) unless @lesson.isDone
      else
        @output_lesson (@lesson.currentQuestion().error_message) unless @lesson.isDone
  
  RawEval: (command) -> @Eval(command)

  GetNextLineIndent: (command) ->
    # A very primitive depth balance estimator.
    levels = 0
    parens = 0
    braces = 0
    brackets = 0
    last_line_changes = 0
    for line in command.split '\n'
      last_line_changes = 0
      for token in (line.match(TOKENS) or [])
        if token in BLOCK_OPENERS
          levels++
          last_line_changes++
        else if token is '('
          parens++
          last_line_changes++
        else if token is '{'
          braces++
          last_line_changes++
        else if token is '['
          brackets++
          last_line_changes++
        else if token is 'end'
          levels--
          last_line_changes--
        else if token is ')'
          parens--
          last_line_changes--
        else if token is ']'
          braces--
          last_line_changes--
        else if token is '}'
          brackets--
          last_line_changes--

        if levels < 0 or parens < 0 or braces < 0 or brackets < 0
          return false

    if levels > 0 or parens > 0 or braces > 0 or brackets > 0
      return if last_line_changes > 0 then 1 else 0
    else
      return false

BLOCK_OPENERS = [
  "begin"
  "module"
  "def"
  "class"
  "if"
  "unless"
  "case"
  "for"
  "while"
  "until"
  "do"
]

TOKENS = ///
  \s+
 |\d+(?:\.\d*)?
 |"(?:[^"]|\\.)*"
 |'(?:[^']|\\.)*'
 |/(?:[^/]|\\.)*/
 |[-+/*]
 |[<>=]=?
 |:?[a-z@$][\w?!]*
 |[{}()\[\]]
 |[^\w\s]+
///ig
