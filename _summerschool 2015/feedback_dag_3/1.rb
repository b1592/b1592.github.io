# ENCRYPTION/DECRYPTION

# Shifts each letter for encryption and decryption. When n is negative, shifts back.
# N determines the number of places that the letters should be shifted.

# TODO: wat zijn l en n? Leest moeilijk.
# Beter: character, number_of_places
# Variabelenamen zo veel mogelijk uitschrijven.
def shift(l, n)
    l.downcase!
    alpha = "abcdefghijklmnopqrstuvwxyz"
    # TODO: Kan makkelijker:
    # return (alpha.index(l) + n) % 26
    if alpha.index(l)+n > 25
        return alpha[(alpha.index(l)+n)%25-1]
    else
        return alpha[alpha.index(l)+n]
    end
end

# Creates an encryption hash with the shift function.
def encryption_hash(n)
    # TODO: ("a".."z").to_a
    alpha_array = "abcdefghijklmnopqrstuvwxyz".split(//)
    enc_array = Array.new
    for l in alpha_array
        enc_array.push(shift(l, n))
    end
    enc_hash = Hash.new
    c = 0
    # TODO: Arrghhhh, wat doen al die kleine lettertjes??
    for l in alpha_array
        enc_hash[l] = enc_array[c]
        c+=1
    end
    return enc_hash
end

# Applies the enc_hash to the encrypted text. Returns the encrypted text.
def encrypt(tekst, n)
    letters = tekst.split(//)
    # Array that remembers the indexes of the capitalised letters as a sequence of ints.
    caps = Array.new
    for l in letters
        if l == l.upcase
            caps.push(letters.index(l))
            # also makes upcase letters downcase after adding the index to the case-array.
            l.replace(l.downcase)
        end
    end
    # Application of enc_hash to unencrypted text.
    enc_hash = encryption_hash(n)
    for l in letters
        if enc_hash.has_key?(l)
            l.replace(enc_hash[l])
        end
    end
    # Application of caps array to encrypted text.
    for n in caps
        letters[n].replace(letters[n].upcase)
    end
    return letters.join()
end


# Takes the enc_hash and switches the keys and values to create the dec_hash.
# Applies the dec_hash to the encrypted text.
# Returns the decrypted text.
def decrypt(tekst, n)
    letters = tekst.split(//)
    # Array that remembers the indexes of the capitalised letters as a sequence of ints.
    caps = Array.new
    for l in letters
        if l == l.upcase
            caps.push(letters.index(l))
            # Makes upcase letters downcase after adding them to the case-array.
            l.replace(l.downcase)
        end
    end
    # Application of dec_hash to encrypted text.
    dec_hash = encryption_hash(n).invert
    for l in letters
        if dec_hash.has_key?(l)
            l.replace(dec_hash[l])
        end
    end
    # Application of caps array to encrypted text.
    for n in caps
        letters[n].replace(letters[n].upcase)
    end
    return letters.join()
end
