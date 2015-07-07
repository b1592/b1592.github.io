puts "Wat is je naam?"
naam = gets.chomp

correct_ingevoerd = false

while correct_ingevoerd == false
  puts "Ben je man of vrouw?"
  geslacht = gets.chomp
  if geslacht == "man"
    puts "Hallo, meneer #{naam}!"
    correct_ingevoerd = true
  elsif geslacht == "vrouw"
    puts "Hallo, mevrouw #{naam}!"
    correct_ingevoerd = true
  end
end
