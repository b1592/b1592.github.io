puts "Geef me een zin"
woord = gets.chomp

puts "Geef de verplaatsing"
verplaatsing = gets.chomp.to_i

# TODO: characters betere naam
gesplitst = woord.split("")

geheimtaal = ""

# TODO: waarom gesplitst? Het is toch een character?
def shift(gesplitst, verplaatsing)

  alfabet = ("a".."z").to_a
  h_alfabet = ("A".."Z").to_a
  getallen = ("0".."9").to_a


    # TODO: deze variabelenamen kunnen beter.

    if alfabet.include?(gesplitst)
        nieuw_getal = alfabet.index(gesplitst) + verplaatsing
        # TODO: deze operatie doe je nu drie keer, kan ook in één keer aan het eind.
        # TODO: kan ook in één keer: (alfabet.index(gesplitst) + verplaatsing) % 26
        nieuw_getal = nieuw_getal % 26
        nieuwe_letter = alfabet[nieuw_getal]
    elsif h_alfabet.include?(gesplitst)
        h_nieuw_getal = h_alfabet.index(gesplitst) + verplaatsing
        h_nieuw_getal = h_nieuw_getal % 26
        h_nieuwe_letter = h_alfabet[h_nieuw_getal]
    elsif getallen.include?(gesplitst)
        g_nieuw_getal = getallen.index(gesplitst) + verplaatsing
        g_nieuw_getal = g_nieuw_getal % 26
        n_getal = getallen[g_nieuw_getal]
    else
        return " "
    end
end

for letter in gesplitst
  geheimtaal += shift(letter, verplaatsing)
end

puts "De zin in geheimtaal is:", geheimtaal
