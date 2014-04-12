jqconsole.Write("CLICK TO START LESSON.\n")

initializeRepl = ->

  inputCallback = (callback) ->
      jqconsole.Input (result) =>
        try
          callback result
        catch e
          @ErrorCallback e

  outputCallback = (string) ->
    jqconsole.Write("#{string}", "repl-output")

  resultCallback = (string) ->
    jqconsole.Write(" => #{string}\n", "repl-result")

  errorCallback = (string) ->
    jqconsole.Write("#{string}", "repl-error")    

  this.jsrepl = new JSREPL({  
    input: inputCallback,
    output: outputCallback
    result: resultCallback
    error: errorCallback
  });

  jsrepl.loadLanguage("ruby", ->
    jqconsole.Write("done.\n")
    if lesson?
      jqconsole.Write(lesson.currentQuestion().description + "\n", "repl-lesson")
  )

  promptHandler = (input) ->
    if lesson? && !lesson.isDone
      question = lesson.currentQuestion()
      question.evaluate(input)
      if question.isRightAnswer
        lesson.next()
        jqconsole.Write(lesson.currentQuestion().description + "\n", "repl-lesson") unless lesson.isDone
      else
        jqconsole.Write(question.error_message + "\n", "repl-lesson")

    jsrepl.eval(input)
    startPrompt()

  multiLineHandler = (command) ->
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
      if last_line_changes > 0
        return 1
      else if last_line_changes < 0
        return -1
      else
        return 0
    else
      return false

  startPrompt = ->
    # Start prompt with history enabled
    jqconsole.Prompt(true, promptHandler, multiLineHandler)

  startPrompt()


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

$(".jqconsole").click(->
  unless jsrepl?
    jqconsole.Write("Loading...")
    initializeRepl()
)
