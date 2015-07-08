puts "Welk priemgetal wil je weten?"
hoeveelste = gets.to_i

aantalpriemgetallen = 0

counter = 1
while aantalpriemgetallen < hoeveelste
  counter += 1

  nummer = 1
  while nummer < counter
  nummer += 1
    if counter % nummer == 0
      break
    end
  end
  if counter == nummer
      aantalpriemgetallen += 1
    end
end

puts "Het getal is #{counter}"
