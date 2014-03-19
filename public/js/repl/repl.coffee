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

# blinkCursor = ->
#   $(".jqconsole-cursor").animate({opacity:0}, 800)
#   $(".jqconsole-cursor").animate({opacity:1}, 800)

blinkCursor = ->
  cursor = $(".jqconsole-cursor")
  if cursor.css("opacity") == "1"
    cursor.css( {"opacity": 0} )
  else  
    cursor.css( {'opacity' : 1} )

setInterval(blinkCursor, 650);

initializeRepl = ->

  jqconsole.Write("done.\n")

  output = (string) ->
    jqconsole.Write("#{string}", "repl-output")
    return undefined

  error = (string) ->
    jqconsole.Write("#{string}", "repl-error")
    return undefined

  result = (string) ->
    jqconsole.Write(" => #{string}\n", "repl-result")
    return undefined

  outputLesson = (string) ->
    jqconsole.Write("#{string}\n", "repl-lesson")
    return undefined

  outputHandlers =
    output: output
    error: error
    result: result
    lesson: outputLesson

  engine = Ruby

  rubyHandler = new RubyHandler(outputHandlers, engine, window.lesson)

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
