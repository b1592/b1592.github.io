puts "Hallo"
puts "Wat is jouw naam?"
naam = gets.chomp
schoen = false
while schoen == false

  puts "Dag #{naam}, ben jij een man of een vrouw?"
  geslacht = gets.chomp
  if geslacht == "vrouw"
    puts "Dag, mevrouw #{naam}."
    schoen = true
  elsif geslacht == "man"
    puts "Dag, meneer #{naam}"
    schoen = true
  end

end
