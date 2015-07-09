woord = File.read('secret.txt')

puts "Voer een getal in (het antwoord is 13)."

number_of_places = gets.chomp.to_i

# TODO: punctuation.include?(character)
# Of zelfs:
#   ALPHABET = ("a".."z").to_a
#   CAPITAL_ALPHABET = ("A".."Z").to_a
#   PUNCTUATION = [" ", ",", "."]
#
# Als constantes buiten de functie.
def shift(letter, number_of_places)
  alphabet = ("a".."z").to_a
  capitalalphabet = ("A".."Z").to_a
  if letter == ' '
    shifted_letter = ' '
  elsif letter == ","
    shifted_letter = ","
  elsif letter == "."
    shifted_letter = "."
  # TODO: capitalalphabet.include?(letter)
  elsif ("A".."Z").to_a.include?(letter)
    shifted_letter_number = (capitalalphabet.index(letter) - number_of_places) % 26
    shifted_letter = capitalalphabet[shifted_letter_number]
  else
    shifted_letter_number = (alphabet.index(letter) - number_of_places) % 26
    shifted_letter = alphabet[shifted_letter_number]
  end
  return shifted_letter
end

# TODO: nieuwe_letters een string
# en dan nieuwe_string += new_letter
def decrypt(woord, number_of_places)
  letters = woord.split(//)
  nieuweletters = []
  for letter in letters
    newletter = shift(letter, number_of_places)
    nieuweletters.push(newletter)
  end
  encryptedword = nieuweletters.join
  return encryptedword
end


# TODO: handige manier van encrypt.
# Dan hoef je ook geen nieuwe shift functie te schrijven.

def encrypt(text, number_of_places)
  return decrypt(text, -number_of_places)
end

puts decrypt(woord, number_of_places)
