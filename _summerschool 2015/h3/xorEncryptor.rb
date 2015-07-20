# Het is handig om hier uit te leggen wat XOR-encryptie precies is.
# Dan is het algoritme makkelijker te volgen.

def xorDecryptor(key, message)

  # Ik zou in plaats van een lege lijst, met een lege string beginnen,
  # en hem encoded_message noemen, in plaats van endstring.
  # Dan doe je:
  #
  # encoded_message += value 
  #
  # in plaats van:
  #
  # endstring.push(value)
  #
  # Dan hoef je aan het eind niet endstring.join te doen, want het is al een
  # string.
  endstring = []
  # Misschien characters noemen, omdat het niet alleen letters kunnen zijn?
  letters = message.split("")
  # Bij nader inzien is 'position' een betere naam dan 'index'. (Had ik bedacht, weet ik :P)
  index = 0
  key_size = key.size
  # betere naam: key_characters
  sep_key = key.split("")

  for letter in letters
    index = index % key_size
    # Ik zou hier zelf doen:
    #
    # encrypted_character = (sep_key[index].ord ^ letter.ord).chr
    # endstring.push(encrypted_character)
    #
    # Dat is korter. Value is een iets te algemene naam.
    value = sep_key[index].ord ^ letter.ord
    value = value.chr
    endstring.push(value)
    index += 1
  end

  return endstring.join("")

end


key = gets.chomp
message = gets.chomp

result = xorDecryptor(key, message)

puts result

file = File.open("result.txt", "w")
file.write(result)
file.close
