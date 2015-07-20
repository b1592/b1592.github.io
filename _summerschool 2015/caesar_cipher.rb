
def shift(letter, number_of_places)
  alfabet = ("a".."z").to_a
  index = alfabet.index(letter)
  new_index = (index + number_of_places) % 26

  return alfabet[new_index]
end

def encrypt(text, number_of_places)
  letters = text.split("")

  encrypted_text = ""

  for letter in letters
    encrypted_text = encrypted_text + shift(letter, number_of_places)
  end

  return encrypted_text
end

def decrypt(text, number_of_places)
  encrypt(text, -number_of_places)
end
