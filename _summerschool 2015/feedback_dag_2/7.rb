counter = 2
priem = true
numpriems = 0
getal = 1

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

  if priem == true
    numpriems += 1
  end

  getal = getal + 1
  counter = 2
  priem = true
end


# puts resultaat
puts getal - 1
