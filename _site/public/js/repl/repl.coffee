
# $(function() {
#   // Creating the console.
#   var header = 'Welcome to JQConsole!\n' +
#                'Use jqconsole.Write() to write and ' +
#                'jqconsole.Input() to read.\n';
#   window.jqconsole = $('#console').jqconsole(header, 'JS> ');

#   // Abort prompt on Ctrl+Z.
#   jqconsole.RegisterShortcut('Z', function() {
#     jqconsole.AbortPrompt();
#     handler();
#   });
#   // Move to line start Ctrl+A.
#   jqconsole.RegisterShortcut('A', function() {
#     jqconsole.MoveToStart();
#     handler();
#   });
#   // Move to line end Ctrl+E.
#   jqconsole.RegisterShortcut('E', function() {
#     jqconsole.MoveToEnd();
#     handler();
#   });
#   jqconsole.RegisterMatching('{', '}', 'brace');
#   jqconsole.RegisterMatching('(', ')', 'paran');
#   jqconsole.RegisterMatching('[', ']', 'bracket');

#   // Initialize Ruby engine
#   var input = null;
#   var output = function(byte_value) { debugger; jqconsole.Write('==> ' + String.fromCharCode(byte_value) + '\n'); };
#   var error = function(byte_value) { debugger; jqconsole.Write('==> ' + String.fromCharCode(byte_value) + '\n'); };
#   Ruby.initialize(input, output, error);

#   // Handle a command.
#   var handler = function(command) {
#     if (command) {
#       try {
#         jqconsole.Write('==> ' + Ruby.stringify(Ruby.eval(command)) + '\n');
#       } catch(e) {
#         jqconsole.Write('==> ' + e.to_s + '\n');
#       }
#     }

#     jqconsole.Prompt(true, handler// , function(command) {
#       // Continue line if can't compile the command.
#       // try {
#       //   Function(command);
#       // } catch (e) {
#       //   if (/[\[\{\(]$/.test(command)) {
#       //     return 1;
#       //   } else {
#       //     return 0;
#       //   }
#       // }
#       // return false;}
#       );
#   };

#   // Initiate the first prompt.
#   handler();
#   });

`
window.jqconsole = $('#console').jqconsole("Click to load interactive Ruby session.\n", '> ');

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

that = this
jqcons = ""


loadRest = ->
  console.log("Hallo vanuit de focus")
  console.log(this)

  jqconsole.Write("done.\n")

  output = (string) ->
    jqconsole.Write("> #{string}", "repl-output")
    return undefined

  error = (string) ->
    jqconsole.Write("> #{string}", "repl-error")
    return undefined

  result = (string) ->
    jqconsole.Write("> #{string}\n", "repl-result")
    return undefined

  engine = Ruby

  console.log(engine)

  rubyHandler = new RubyHandler(output, result, error, engine)
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
    jQuery.ajax({url: "/public/js/repl/ruby.closure.js", dataType: 'script', success: loadRest, cache: true})
)
