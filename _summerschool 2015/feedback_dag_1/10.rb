puts "Hallo!"

puts "Hoe heet je?"

naam = gets.chomp

typefout = true
while typefout
  puts "Ben je een man of vrouw, #{naam}?"

  geslacht = gets.chomp

  if geslacht == "man"
    puts "Hallo meneer #{naam}!"
    typefout = false
  elsif geslacht == "vrouw"
    puts "Hallo mevrouw #{naam}!"
    typefout = false
  end
end
