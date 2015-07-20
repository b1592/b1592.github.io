puts "Wat is je naam?"

naam = gets.chomp

puts "Hallo #{naam}!"

puts "Ben je een man of een vrouw?"

geslacht = gets.chomp

if geslacht == "man"
  puts "Hallo, meneer #{naam}!"
elsif geslacht == "vrouw"
  puts "Hallo, mevrouw #{naam}!"
else
  geslacht = "error"
end

while geslacht == "error"
geslacht = gets.chomp
  if geslacht == "man"
    puts "Hallo, meneer #{naam}!"
  elsif geslacht == "vrouw"
    puts "Hallo, mevrouw #{naam}!"
  else
    geslacht = "error"
  end
end
