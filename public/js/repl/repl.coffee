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

inputCallback = (callback) ->
    window.jqconsole.Input (result) =>
      try
        callback result
        # @$this.trigger 'input', [result]
      catch e
        @ErrorCallback e
    # @$this.trigger 'input_request', [callback]
    return undefined

resultCallback = (result) ->
  console.log("ruby result: #{result}")

this.jsrepl = new JSREPL({  
  input: inputCallback,
  result: resultCallback
});  

initializeRepl = ->

  jqconsole.Write("done.\n")

  output = (string) ->
    jqconsole.Write("#{string}", "repl-output")

  error = (string) ->
    jqconsole.Write("#{string}", "repl-error")

  result = (string) ->
    jqconsole.Write(" => #{string}\n", "repl-result")

  outputLesson = (string) ->
    jqconsole.Write("#{string}\n", "repl-lesson")


  promptHandler = (input) ->
    rubyHandler.Eval(input)
    startPrompt()

  startPrompt = ->
    # Start prompt with history enabled
    jqconsole.Prompt(true, promptHandler)

  startPrompt()


$(".jqconsole").click(->

  unless Ruby?
    jqconsole.Write("Loading...")
    jQuery.ajax({url: "/public/js/repl/ruby.js", dataType: 'script', success: initializeRepl, cache: true})
)
