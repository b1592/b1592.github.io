window.jqconsole = $('#console').jqconsole("CLICK TO START LESSON.\n", '> ')

jqconsole.RegisterMatching('{', '}', 'brace')
jqconsole.RegisterMatching('(', ')', 'paran')
jqconsole.RegisterMatching('[', ']', 'bracket')

blinkCursor = ->
  cursor = $(".jqconsole-cursor")
  if cursor.css("opacity") == "1"
    cursor.css( {"opacity": 0} )
  else  
    cursor.css( {'opacity' : 1} )

setInterval(blinkCursor, 650);
