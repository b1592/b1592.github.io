# Werkt, maar is nog niet geoptimaliseerd. 1000 gaat nog goed maar bij 10.000 duurt het erg lang.

puts "What prime number do you want to know?"
asked = gets.to_i

primes = 0

counter = 1
while primes < asked
  counter += 1

  number = 1
  while number < counter
    number += 1
    if counter % number == 0
      break
    end
  end
  if counter == number
    primes += 1
  end

end

puts "The prime you asked for is #{counter}."
