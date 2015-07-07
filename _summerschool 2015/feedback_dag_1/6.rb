puts "Hallo, wat is je naam?"
naam = gets.chomp

correct = false
while correct == false
  puts "Ben je een man of een vrouw?"
  geslacht = gets.chomp
  if geslacht == "man"
    puts "Hallo meneer #{naam}"
    correct = true
  elsif geslacht == "vrouw"
    puts "Hallo mevrouw #{naam}"
    correct = true
  end
end
