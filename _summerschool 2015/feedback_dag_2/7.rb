counter = 2
priem = true
numpriems = 0
getal = 1

# Net zolang iets doen tot 1000 priemgetallen
while numpriems <= 1000
  # Check of getal een priemgetal is
  #puts getal
    while counter < getal
      if getal % counter == 0
        priem = false
        break
      end
      counter = counter + 1
    end
  # Als het priemgetal is zet ik priemgetal +1
  #puts priem
  if priem == true
    numpriems += 1
  end
  # Getal + 1
  getal = getal + 1
  counter = 2
  priem = true
end


# puts resultaat
puts getal - 1
