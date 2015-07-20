puts "Hallo, wat is je naam?"
naam = gets.chomp
puts "Bent u een man of een vrouw?"
geslacht = gets.chomp

while geslacht != 'man' && geslacht != 'vrouw'
  puts "Hallo #{naam}, bent u een vrouw of een man?"
  geslacht = gets.chomp
  if geslacht == "man"
    puts "Hallo, meneer #{naam}!"
  elsif geslacht == 'vrouw'
      puts "Hallo, mevrouw #{naam}!"
  else
    puts "Dat snap ik niet, wat is uw #{geslacht}?"
  end
end
