require_relative "unShift.rb"

def scrabbleEncryptor(message)

    points = {
    'a'=> 1, 'b'=> 3, 'c'=> 3, 'd'=> 2, 'e'=> 1, 'f'=> 4, 'g'=> 2, 'h'=>
   4, 'i'=> 1, 'j'=> 8, 'k'=> 5, 'l'=> 1, 'm'=> 3, 'n'=> 1, 'o'=> 1, 'p'=> 3,
   'q'=> 10, 'r'=> 1, 's'=> 1, 't'=> 1, 'u'=> 1, 'v'=> 4, 'w'=> 4, 'x'=> 8, 'y'=>
   4, 'z'=> 10
   }

   encrypted = []
   letters = message.split("")

   #Initialize the Jump Distance variable wich keeps the
   #jump distance from iteration to iteration
   jump_dis = 0


   for letter in letters
     if letter != " "

       #Encrypting letter with the current encryption rate
       encrypted_letter = unShift(letter, jump_dis)

       #Updating encryption rate and putting encrypted letters in the array
       encrypted.push(encrypted_letter)
       jump_dis = -points[letter]

     else

     encrypted.push(letter)

    end
   end
   return encrypted.join("")

 end



 puts "What do you want to Encrypt? Spacing: Allowed. Punctuation: Not Allowed."
 message = gets.chomp
 result = scrabbleEncryptor(message)

 puts result
