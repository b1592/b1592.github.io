def shift(letter, number_of_places)


     letters = ("a".."z").to_a
    the_letter_number = letters.index(letter)
    count = the_letter_number + number_of_places
    count = count % 26
    shifted_letter = letters[count]
    return shifted_letter
  end
