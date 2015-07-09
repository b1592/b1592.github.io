def priem?(n)
  mogelijke_deler = 2

  while mogelijke_deler * mogelijke_deler <= n
    if n % mogelijke_deler == 0
      return false
    end

    mogelijke_deler += 1
  end

  return true
end

aantal_priemgetallen = 1000
# 2 is een priemgetal, maar we checken alleen oneven getallen.
aantal_gevonden = 1
kandidaat = 3

while aantal_gevonden < aantal_priemgetallen
  if priem?(kandidaat)
    aantal_gevonden = aantal_gevonden + 1
  end

  kandidaat = kandidaat + 2
end

puts kandidaat - 2
