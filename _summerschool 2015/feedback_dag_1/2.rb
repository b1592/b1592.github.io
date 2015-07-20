puts "Hallo!"
puts "Wat is je naam?"

naam = gets.chomp

puts "Ben je een man of een vrouw?"

geslacht = gets.chomp

while geslacht != "man" && geslacht != "vrouw"
  puts "Heb je het wel goed gespeld? Ben je nou een man of een vrouw?"
  geslacht = gets.chomp
end

if geslacht == "vrouw"
  puts "Hallo, mevrouw #{naam}!"
elsif geslacht == "man"
  puts "Hallo, meneer #{naam}!"
end
