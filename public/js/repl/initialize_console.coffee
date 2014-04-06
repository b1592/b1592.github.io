window.jqconsole = $('#console').jqconsole("SHALL WE PLAY A GAME?\n", '> ')

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
