this.lesson = new Lesson([
  new Question(
    {
      description: "Ruby kan ook rekenen. Typ maar eens 3 + 4.",
      answer: /^-?\d+\s*\+\s*-?\d+\s*$/,
      possible_errors: {
        min: /^\d+\s*-\s*\d+\s*$/
      },
      error_messages: {
        min: "Inderdaad, Ruby kan ook getallen van elkaar aftrekken! Typ je toch even 3 + 4?",
        default: "Dat is niet goed. Tel je twee getallen op?"
      }
  }),
  new Question(
    {
      description: "Heel goed. Wat dacht je van 5 * 8?",
      answer: /^-?\d+\s*\*\s*-?\d+\s*$/,
      possible_errors: {
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik je * (een sterretje)?"
      }
  }),
  new Question(
    {
      description: "* (sterretje) betekent 'keer'. Wat denk je dat 2 ** 4 doet?",
      answer: /^-?\d+\s*\*\*\s*-?\d+\s*$/,
      possible_errors: {
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik je **?"
      }
  }),
  new Question(
    {
      description: "** is machtsverheffen. Nu gaan we aan Ruby vragen of een uitspraak 'waar' of 'niet waar' is. Typ eens 3 < 5 (drie is kleiner dan 5.)",
      answer: /^3\s*<\s*5\s*$/,
      possible_errors: {
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik < ('kleiner dan'.)"
      }
  }),
  new Question(
    {
      description: "true!. Typ nu eens 1 + 1 == 3.",
      answer: /^1\s*\+\s*1\s*==\s*3\s*$/,
      possible_errors: {
        enkele_is: /^1\s*\+\s*1\s*=\s*3\s*$/
      },
      error_messages: {
        enkele_is: 'Gebruik een dubbel is-teken! Een enkel is-teken wordt gebruikt voor het toewijzen van een variabele (bijvoorbeeld naam = "Henk"). Om te kijken of een uitspraak true of false is heb je == nodig. Ruby snapt het niet, zie je? Typ 1 + 1 == 3.'
        default: "Dat is niet goed. Typ je 1 + 1 == 3?"
      }
  }),
  new Question(
    {
      description: "1 + 1 is natuurlijk geen 3, dus Ruby geeft false. Typ nu eens 5 != 10 (vijf is niet gelijk aan tien.)",
      answer: /^-?\d+\s*!=\s*-?\d+\s*$/,
      possible_errors: {
        
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik je != (is niet gelijk aan?)"
      }
  }),
])