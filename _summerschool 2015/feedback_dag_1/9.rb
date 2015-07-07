puts "Hello, wat is uw naam"
naam = gets.chomp
puts "Bent u een man of een vrouw?"
gender = gets.chomp

if gender == "man" || gender == "vrouw"
  puts "Hallo #{gender} #{naam}!"
else
  counter = 0
  while counter == 0
    puts "Bent u een man of een vrouw? Check uw spelling!"
    gender = gets.chomp
    if gender == "man" || gender == "vrouw"
      puts "Hallo #{gender} #{naam}!"
      counter = 1
    else
      counter = 0
    end
  end
end
