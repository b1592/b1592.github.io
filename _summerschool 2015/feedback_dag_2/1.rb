puts "Fill in a number:"

number = gets.chomp.to_i


counter = 1
prime = true
while counter < number - 1
  counter = counter + 1
  if number % counter == 0
    prime = false
  end
end

if prime == true
  puts "#{number} is a prime number!"
else
  puts "#{number} is not a prime number!"
end
