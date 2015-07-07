puts "Hallo!"

puts "Wat is je naam?"

naam = gets.chomp

puts "Hallo #{naam}!"

correct = false
while correct == false
  puts "Wat is je geslacht?"

  geslacht = gets.chomp

  # zet correct = true als het een man of vrouw is
  if geslacht == "man"
    puts "Hallo meneer #{naam}!"
    correct = true
  elsif geslacht == "vrouw"
    puts "Hallo mevrouw #{naam}!"
    correct = true
  end

end
