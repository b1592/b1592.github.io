def unShift(letter, number_of_places)

     letters = ("a".."z").to_a
    the_letter_number = letters.index(letter)
    count = the_letter_number + number_of_places
    shifted_letter = letters[count]
    return shifted_letter
  end
