puts "Voer een getal in om te controleren of het een priemgetal is"
getal = gets.to_i

counter = 2

correct = true
while counter < getal
  if getal % counter == 0
    correct = false
  end
  counter = counter + 1
end

puts "#{getal} is geen priemgetal."

if correct == true
  puts "#{getal} is een priemgetal."
end
