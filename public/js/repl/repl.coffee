`
window.jqconsole = $('#console').jqconsole("SHALL WE PLAY A GAME?\n", '> ');

jqconsole.RegisterShortcut('Z', function() {
  jqconsole.AbortPrompt();
  handler();
});

// Move to line start Ctrl+A.
jqconsole.RegisterShortcut('A', function() {
  jqconsole.MoveToStart();
  handler();
});

// Move to line end Ctrl+E.
jqconsole.RegisterShortcut('E', function() {
  jqconsole.MoveToEnd();
  handler();
});

jqconsole.RegisterMatching('{', '}', 'brace');
jqconsole.RegisterMatching('(', ')', 'paran');
jqconsole.RegisterMatching('[', ']', 'bracket');
`

blinkCursor = ->
  cursor = $(".jqconsole-cursor")
  if cursor.css("opacity") == "1"
    cursor.css( {"opacity": 0} )
  else  
    cursor.css( {'opacity' : 1} )

setInterval(blinkCursor, 650);  

initializeRepl = ->

  inputCallback = (callback) ->
      window.jqconsole.Input (result) =>
        try
          callback result
        catch e
          @ErrorCallback e
      return undefined

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
    jqconsole.Write("done.\n"))

  promptHandler = (input) ->    
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
