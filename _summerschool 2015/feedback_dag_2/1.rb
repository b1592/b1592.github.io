puts "Fill in a number:"

number = gets.chomp.to_i

deler = 1
prime = true
while deler < number - 1
  deler = deler + 1
  if number % deler == 0
    prime = false
  end
end

if prime 
  puts "#{number} is a prime number!"
else
  puts "#{number} is not a prime number!"
end
