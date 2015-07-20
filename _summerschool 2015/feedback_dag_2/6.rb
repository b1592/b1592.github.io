#####
# Code waarbij wordt gecheckt of 'getal' een priemgetal is ...
puts "Voer een getal in:"
getal = gets.chomp.to_i

priemgetal = true
deler = 1

while priemgetal && getal => deler
  deler = deler + 1
  if getal % deler == 0
    priemgetal = false
  end
end

if priemgetal == false || getal == 1
  puts "#{getal} is geen priemgetal."
elsif priemgetal
  puts "#{getal} is een priemgetal."
end
