puts "wat is jouw naam?"
naam = gets.chomp
puts "wat is jouw geslacht?"
geslacht = gets.chomp

if geslacht == "man"
	puts "hallo meneer #{naam}"
elsif geslacht == "vrouw"
	puts "hallo mevrouw #{naam}"
else
	puts "sorry, wat is jouw geslacht?"
	while geslacht != "man" && geslacht != "vrouw"
		puts "sorry wat is jouw geslacht"
		geslacht = gets.chomp
	end
	if geslacht == "man"
		puts "hallo meneer #{naam}"
	else
		puts "hallo mevrouw #{naam}"
	end
end
